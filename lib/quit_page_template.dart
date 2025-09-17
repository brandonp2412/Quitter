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
import 'package:share_plus/share_plus.dart';

class QuitPageTemplate extends StatefulWidget {
  final String title;
  final String storageKey;
  final List<QuitMilestone> milestones;
  final String Function(int currentDay) headerTextStartedBuilder;
  final String headerTextNotStarted;
  final String Function(int currentDay) headerSubtitleStartedBuilder;
  final String headerSubtitleNotStarted;
  final String? infoBoxMessage;
  final String? shareTitle;
  final bool initialStarted;
  final List<int> customDaysAchieved;
  final String? quitDateOverride;
  final Function(DateTime)? onQuitDateChanged;
  final Function(int days)? onResetPressed;

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
    this.shareTitle,
    required this.initialStarted,
    this.customDaysAchieved = const [],
    this.quitDateOverride,
    this.onQuitDateChanged,
    this.onResetPressed,
  });

  @override
  State<QuitPageTemplate> createState() => _QuitPageTemplateState();
}

class _QuitPageTemplateState extends State<QuitPageTemplate> {
  bool showConfetti = false;
  final TextEditingController controller = TextEditingController();
  final FocusNode _textNode = FocusNode();
  ScrollController _scroll = ScrollController();
  late int _day;

  @override
  void initState() {
    super.initState();
    _initializeCurrentDay();
    _updateControllerText();
    _initScrollController();
    _textNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _textNode.removeListener(_onFocusChanged);
    _textNode.dispose();
    controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_textNode.hasFocus) {
      final parsed = int.tryParse(controller.text);
      if (parsed != null && parsed != _day) {
        _updateQuitDateFromDay(parsed);
      } else if (parsed == null && _day != 1) {
        _updateQuitDateFromDay(1);
      }

      _updateControllerText();
    }
  }

  @override
  void didUpdateWidget(covariant QuitPageTemplate oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.quitDateOverride != oldWidget.quitDateOverride) {
      if (!_textNode.hasFocus) {
        _initializeCurrentDay();
        _updateControllerText();
      }
    }
  }

  void _initializeCurrentDay() {
    final addictions = context.read<AddictionProvider>();
    final quitOn =
        widget.quitDateOverride ?? addictions.getAddiction(widget.storageKey);

    if (quitOn == null || !widget.initialStarted) {
      _day = 1;
    } else {
      _day = daysCeil(quitOn);
    }
  }

  void _updateControllerText() {
    if (controller.text != _day.toString()) {
      controller.text = _day.toString();
    }
  }

  void _initScrollController() {
    final addictions = context.read<AddictionProvider>();
    final quitOn =
        widget.quitDateOverride ?? addictions.getAddiction(widget.storageKey);

    if (quitOn != null && widget.initialStarted) {
      final currentDayFromQuitOn = daysCeil(quitOn);
      final index = widget.milestones.indexWhere(
        (m) => currentDayFromQuitOn < m.day,
      );
      final targetIndex = index == -1 ? widget.milestones.length - 1 : index;
      _scroll = ScrollController(initialScrollOffset: targetIndex * 270 - 230);
    }
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
      showConfetti = true;
    });

    final day = int.tryParse(controller.text) ?? 0;
    final date = DateTime.now().subtract(Duration(days: day));

    if (widget.onQuitDateChanged != null) {
      widget.onQuitDateChanged!(date);
    } else {
      addictions.setAddiction(widget.storageKey, date.toIso8601String());
    }

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          showConfetti = false;
        });
      }
    });
  }

  void _updateQuitDateFromDay(int day) async {
    final addictions = context.read<AddictionProvider>();
    final quitOn = DateTime.now().subtract(Duration(days: day));

    if (widget.onQuitDateChanged != null) {
      widget.onQuitDateChanged!(quitOn);
    } else {
      addictions.setAddiction(widget.storageKey, quitOn.toIso8601String());
    }

    final index = widget.milestones.indexWhere((m) => day < m.day);
    final targetIndex = index == -1 ? widget.milestones.length - 1 : index;

    _scroll.animateTo(
      targetIndex * 150.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onShare(int day) {
    if (widget.shareTitle != null && widget.shareTitle!.isNotEmpty) {
      SharePlus.instance.share(
        ShareParams(
          text:
              "I'm $day day${day > 1 ? 's' : ''} clean from ${widget.shareTitle}!",
        ),
      );
      return;
    }

    SharePlus.instance.share(
      ShareParams(
        text:
            "I'm $day day${day > 1 ? 's' : ''} clean from ${widget.storageKey.replaceAll('_', ' ')}!",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = context.watch<SettingsProvider>();
    final addictions = context.watch<AddictionProvider>();
    final quit =
        widget.quitDateOverride ?? addictions.getAddiction(widget.storageKey);

    int displayCurrentDay = _day;

    Widget? fab;
    if (quit == null) {
      fab = FloatingActionButton.extended(
        key: const ValueKey('start_fab'),
        onPressed: _handleStartPressed,
        label: const Text("Start"),
        icon: const Icon(Icons.rocket_launch),
      );
    } else if (controller.text != '1') {
      fab = FloatingActionButton.extended(
        onPressed: () async {
          if (widget.onResetPressed != null) {
            widget.onResetPressed!(displayCurrentDay);
          } else {
            addictions.resetAddiction(widget.storageKey, displayCurrentDay);
          }

          setState(() {
            _day = 1;
            controller.text = '1';
          });

          final settings = context.read<SettingsProvider>();
          if (settings.notifyRelapse == false) return;

          final message = getRelapseEncouragementMessage();
          toast(
            context,
            message,
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                addictions.setAddiction(widget.storageKey, quit);

                setState(() {
                  _day = daysCeil(quit);
                  controller.text = _day.toString();
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
      active: showConfetti,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => onShare(displayCurrentDay),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
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
                      quit != null
                          ? widget.headerTextStartedBuilder(displayCurrentDay)
                          : widget.headerTextNotStarted,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      quit != null
                          ? widget.headerSubtitleStartedBuilder(
                              displayCurrentDay,
                            )
                          : widget.headerSubtitleNotStarted,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: _textNode,
                            onTap: () => selectAll(controller),
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: '1',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Enter your current day',
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  final current = DateTime.now().subtract(
                                    Duration(days: _day),
                                  );
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: current,
                                    firstDate: DateTime(0),
                                    lastDate: DateTime.now(),
                                  );
                                  if (date == null) return;
                                  setState(() {
                                    _day = daysCeil(date.toIso8601String());
                                  });
                                  controller.text = _day.toString();

                                  if (widget.onQuitDateChanged != null) {
                                    widget.onQuitDateChanged!(date);
                                  } else {
                                    addictions.setAddiction(
                                      widget.storageKey,
                                      date.toIso8601String(),
                                    );
                                  }
                                },
                                icon: Icon(
                                  _day > 7
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
                            onChanged: (value) {
                              final parsed = int.tryParse(value);
                              setState(() {
                                _day = parsed ?? 1;
                              });
                            },
                            onSubmitted: (value) async {
                              final parsed = int.tryParse(value);
                              if (parsed != null) {
                                _updateQuitDateFromDay(parsed);
                              } else {
                                if (widget.onQuitDateChanged != null) {
                                  widget.onQuitDateChanged!(DateTime.now());
                                } else {
                                  addictions.setAddiction(
                                    widget.storageKey,
                                    null,
                                  );
                                }
                              }
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
                                  color:
                                      theme.appBarTheme.titleTextStyle?.color,
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
                  controller: _scroll,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: widget.milestones.length,
                  itemBuilder: (context, index) {
                    final milestone = widget.milestones[index];
                    final isCompleted = _day >= milestone.day;
                    final isNext =
                        !isCompleted &&
                        (index == 0 ||
                            _day >= widget.milestones[index - 1].day);

                    final allDaysAchieved = widget.customDaysAchieved.isNotEmpty
                        ? widget.customDaysAchieved
                        : addictions.getDays(widget.storageKey);

                    final List<int> milestoneDaysToMark = [];
                    for (int achievedDay in allDaysAchieved) {
                      int closestMilestoneDay = 0;
                      for (QuitMilestone m in widget.milestones) {
                        if (m.day <= achievedDay) {
                          closestMilestoneDay = m.day;
                        } else {
                          break;
                        }
                      }
                      if (closestMilestoneDay > 0) {
                        milestoneDaysToMark.add(closestMilestoneDay);
                      }
                    }

                    return TimelineTile(
                      milestone: milestone,
                      isCompleted: isCompleted,
                      isNext: isNext,
                      isLast: index == widget.milestones.length - 1,
                      daysAchieved: milestoneDaysToMark,
                    );
                  },
                ),
              ),
              SizedBox(height: 36),
            ],
          ),
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
