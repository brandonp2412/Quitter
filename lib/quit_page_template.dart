import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/confetti_widget.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';

class QuitPageTemplate extends StatefulWidget {
  final String title;
  final String storageKey;
  final List<QuitMilestone> milestones;
  final String Function(int currentDay) headerTextStartedBuilder;
  final String headerTextNotStarted;
  final String Function(int currentDay) headerSubtitleStartedBuilder;
  final String headerSubtitleNotStarted;
  final String? infoBoxMessage;
  final bool initialStarted;

  const QuitPageTemplate({
    super.key,
    required this.title,
    required this.storageKey,
    required this.milestones,
    required this.headerTextStartedBuilder,
    required this.headerTextNotStarted,
    required this.headerSubtitleStartedBuilder,
    required this.headerSubtitleNotStarted,
    this.infoBoxMessage,
    required this.initialStarted,
  });

  @override
  State<QuitPageTemplate> createState() => _QuitPageTemplateState();
}

class _QuitPageTemplateState extends State<QuitPageTemplate> {
  int currentDay = 1;
  late bool started;
  bool showConfetti = false;
  final controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    started = widget.initialStarted;
    if (!started) return;
    final addictions = context.read<AddictionProvider>();

    final quitOn = addictions.getAddiction(widget.storageKey);
    if (quitOn == null) return;

    setState(() {
      currentDay = daysCeil(quitOn);
      controller.text = currentDay.toString();
    });

    if (!_scrollController.hasClients) return;

    final index = widget.milestones.indexWhere((m) => currentDay < m.day);
    final targetIndex = index == -1 ? widget.milestones.length - 1 : index;
    _scrollController.jumpTo(targetIndex * 270 - 230);
  }

  void _handleStartPressed() async {
    final addictions = context.read<AddictionProvider>();
    if (!context.mounted) return;
    final settingsProvider = context.read<SettingsProvider>();
    if (settingsProvider.notifyEvery > 0 &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS)) {
      final permission = await Permission.notification.request();
      if (permission.isDenied && context.mounted) {
        settingsProvider.notifyEvery = 0;
      }
    }

    setState(() {
      currentDay = 1;
      started = true;
      showConfetti = true;
      controller.text = '1';
    });

    addictions.setAddiction(
      widget.storageKey,
      DateTime.now().toIso8601String(),
    );

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          showConfetti = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = context.watch<SettingsProvider>();
    final addictions = context.watch<AddictionProvider>();

    Widget? fab;
    if (!started) {
      fab = FloatingActionButton.extended(
        key: const ValueKey('start_fab'),
        onPressed: _handleStartPressed,
        label: const Text("Start"),
        icon: const Icon(Icons.rocket_launch),
      );
    } else {
      fab = FloatingActionButton.extended(
        onPressed: () async {
          final quit = addictions.getAddiction(widget.storageKey);
          addictions.setAddiction(
            widget.storageKey,
            DateTime.now().toIso8601String(),
          );

          setState(() {
            controller.text = '1';
          });

          final settings = context.read<SettingsProvider>();
          if (settings.notifyRelapse == false) return;

          final message = getRelapseEncouragementMessage();
          toast(
            context,
            message,
            SnackBarAction(
              label: 'Undo',
              onPressed: () {
                if (quit == null) return;
                addictions.setAddiction(widget.storageKey, quit);

                setState(() {
                  started = true;
                  currentDay = daysCeil(quit);
                  controller.text = currentDay.toString();
                });
              },
            ),
          );
        },
        label: const Text("Reset"),
        icon: const Icon(Icons.restart_alt),
      );
    }

    if (settings.showReset == false) fab = null;

    return ConfettiWidget(
      isActive: showConfetti,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    started
                        ? widget.headerTextStartedBuilder(currentDay)
                        : widget.headerTextNotStarted,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    started
                        ? widget.headerSubtitleStartedBuilder(currentDay)
                        : widget.headerSubtitleNotStarted,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onTap: () => selectAll(controller),
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: '1',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Enter your current day',
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final current = DateTime.now().subtract(
                                  Duration(days: currentDay),
                                );
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: current,
                                  firstDate: DateTime(0),
                                  lastDate: DateTime.now(),
                                );
                                if (date == null) return;
                                setState(() {
                                  currentDay = daysCeil(date.toIso8601String());
                                });
                                controller.text = currentDay.toString();

                                addictions.setAddiction(
                                  widget.storageKey,
                                  date.toIso8601String(),
                                );
                              },
                              icon: Icon(
                                currentDay > 7
                                    ? Icons.calendar_month
                                    : Icons.calendar_today,
                                color: theme.appBarTheme.iconTheme?.color,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: colorScheme.onSurface,
                                width: 2,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: theme.appBarTheme.titleTextStyle?.color,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) async {
                            final parsed = int.tryParse(value);
                            if (parsed != null)
                              setState(() {
                                currentDay = parsed;
                                started = true;
                              });
                            else
                              return setState(() {
                                currentDay = 1;
                                started = false;
                                addictions.setAddiction(
                                  widget.storageKey,
                                  null,
                                );
                              });

                            if (!context.mounted) return;
                            final settingsProvider = context
                                .read<SettingsProvider>();
                            if (settingsProvider.notifyEvery > 0) {
                              final permission = await Permission.notification
                                  .request();
                              if (permission.isDenied && context.mounted) {
                                settingsProvider.notifyEvery = 0;
                              }
                            }

                            final quitOn = DateTime.now().subtract(
                              Duration(days: currentDay),
                            );
                            addictions.setAddiction(
                              widget.storageKey,
                              quitOn.toIso8601String(),
                            );

                            final index = widget.milestones.indexWhere(
                              (m) => currentDay < m.day,
                            );
                            final targetIndex = index == -1
                                ? widget.milestones.length - 1
                                : index;

                            _scrollController.animateTo(
                              targetIndex * 150.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  if (widget.infoBoxMessage != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.appBarTheme.titleTextStyle?.color
                            ?.withAlpha((255 * 0.1).round()),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.health_and_safety,
                            size: 16,
                            color: theme.appBarTheme.titleTextStyle?.color,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.infoBoxMessage!,
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.appBarTheme.titleTextStyle?.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16.0),
                itemCount: widget.milestones.length,
                itemBuilder: (context, index) {
                  final milestone = widget.milestones[index];
                  final isCompleted = currentDay >= milestone.day;
                  final isNext =
                      !isCompleted &&
                      (index == 0 ||
                          currentDay >= widget.milestones[index - 1].day);

                  return TimelineTile(
                    milestone: milestone,
                    isCompleted: isCompleted,
                    isNext: isNext,
                    isLast: index == widget.milestones.length - 1,
                  );
                },
              ),
            ),
            SizedBox(height: 36),
          ],
        ),
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: fab,
        ),
      ),
    );
  }
}
