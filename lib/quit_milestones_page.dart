import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/confetti_widget.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';
import 'package:share_plus/share_plus.dart';

class QuitMilestonesPage extends StatefulWidget {
  final String title;
  final String storageKey;
  final List<QuitMilestone> milestones;
  final String headerStarted;
  final String headerNotStarted;
  final String subtitleStarted;
  final String subtitleNotStarted;
  final String? infoBoxMessage;
  final String? shareTitle;
  final bool initialStarted;
  final List<int> customDaysAchieved;
  final String? quitDateOverride;
  final Function(DateTime)? onQuitDateChanged;
  final Function(int days)? onResetPressed;

  const QuitMilestonesPage({
    super.key,
    required this.title,
    required this.storageKey,
    required this.milestones,
    required this.headerStarted,
    required this.headerNotStarted,
    required this.subtitleStarted,
    required this.subtitleNotStarted,
    this.infoBoxMessage,
    this.shareTitle,
    required this.initialStarted,
    this.customDaysAchieved = const [],
    this.quitDateOverride,
    this.onQuitDateChanged,
    this.onResetPressed,
  });

  @override
  State<QuitMilestonesPage> createState() => _QuitMilestonesPageState();
}

class _QuitMilestonesPageState extends State<QuitMilestonesPage> {
  bool showConfetti = false;
  bool started = false;
  ScrollController _scroll = ScrollController();
  final controller = TextEditingController();
  DateTime quitDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    final addictions = context.read<AddictionProvider>();
    var quitOn =
        widget.quitDateOverride ?? addictions.getAddiction(widget.storageKey);

    setState(() {
      if (quitOn != null) quitDate = DateTime.parse(quitOn);
      started = widget.initialStarted;
    });

    controller.text =
        '${DateFormat.yMMMd().format(quitDate)} (${daysCeil(quitDate.toIso8601String())} days)';

    if (started) {
      final currentDayFromQuitOn = daysCeil(quitDate.toIso8601String());
      final index = widget.milestones.indexWhere(
        (m) => currentDayFromQuitOn < m.day,
      );
      final targetIndex = index == -1 ? widget.milestones.length - 1 : index;
      _scroll = ScrollController(initialScrollOffset: targetIndex * 270 - 230);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _scroll.dispose();
    super.dispose();
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
      started = true;
    });

    if (widget.onQuitDateChanged != null) {
      widget.onQuitDateChanged!(quitDate);
    } else {
      addictions.setAddiction(widget.storageKey, quitDate.toIso8601String());
    }

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          showConfetti = false;
        });
      }
    });
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

  void pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: quitDate,
      firstDate: DateTime(0),
      lastDate: DateTime.now(),
    );
    if (date == null) return;
    setState(() {
      quitDate = date;
      started = true;
    });
    controller.text =
        '${DateFormat.yMMMd().format(quitDate)} (${daysCeil(quitDate.toIso8601String())} days)';

    if (!mounted) return;
    if (widget.onQuitDateChanged != null) {
      widget.onQuitDateChanged!(date);
    } else {
      final addictions = context.read<AddictionProvider>();
      addictions.setAddiction(widget.storageKey, date.toIso8601String());
      addictions.loadAddictions();
    }
  }

  void _showClearMilestoneBottomSheet(QuitMilestone milestone) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha((255 * 0.1).round()),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.clear_all,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Clear milestone for ${milestone.day} days?',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'This will clear all past times you achieved the ${milestone.day} day milestone.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withAlpha((255 * 0.7).round()),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        final allDaysAchieved =
                            widget.customDaysAchieved.isNotEmpty
                            ? widget.customDaysAchieved
                            : context.read<AddictionProvider>().getDays(
                                widget.storageKey,
                              );

                        final List<int> daysToClear = [];
                        for (int achievedDay in allDaysAchieved) {
                          int closestMilestoneDay = 0;
                          for (QuitMilestone m in widget.milestones) {
                            if (m.day <= achievedDay) {
                              closestMilestoneDay = m.day;
                            } else {
                              break;
                            }
                          }
                          if (closestMilestoneDay == milestone.day) {
                            daysToClear.add(achievedDay);
                          }
                        }

                        context.read<AddictionProvider>().clearMilestoneDays(
                          widget.storageKey,
                          daysToClear,
                        );
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Clear'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = context.watch<SettingsProvider>();
    final addictions = context.watch<AddictionProvider>();
    final days = daysCeil(quitDate.toIso8601String());

    Widget? fab;
    if (started == false) {
      fab = FloatingActionButton.extended(
        key: const ValueKey('start_fab'),
        onPressed: _handleStartPressed,
        label: const Text("Start"),
        icon: const Icon(Icons.rocket_launch),
      );
    } else {
      fab = FloatingActionButton.extended(
        onPressed: () async {
          if (widget.onResetPressed != null) {
            widget.onResetPressed!(days);
          } else {
            addictions.resetAddiction(widget.storageKey, days);
          }

          final quit = quitDate;
          setState(() {
            quitDate = DateTime.now();
          });

          controller.text =
              '${DateFormat.yMMMd().format(quitDate)} (${daysCeil(quitDate.toIso8601String())} days)';

          final settings = context.read<SettingsProvider>();
          if (settings.notifyRelapse == false) return;

          final message = getRelapseEncouragementMessage(context);
          toast(
            message,
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                addictions.setAddiction(
                  widget.storageKey,
                  quit.toIso8601String(),
                );

                setState(() {
                  quitDate = quit;
                });
                controller.text =
                    '${DateFormat.yMMMd().format(quitDate)} (${daysCeil(quitDate.toIso8601String())} days)';
                addictions.popDays(widget.storageKey);
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
              onPressed: () => onShare(days),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      started ? widget.headerStarted : widget.headerNotStarted,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      started
                          ? widget.subtitleStarted
                          : widget.subtitleNotStarted,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      readOnly: true,
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Quit date',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: days > 7
                              ? const Icon(Icons.calendar_month)
                              : const Icon(Icons.calendar_today),
                          onPressed: pickDate,
                        ),
                      ),
                      onTap: pickDate,
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
                    final isCompleted = days >= milestone.day;
                    final isNext =
                        !isCompleted &&
                        (index == 0 ||
                            days >= widget.milestones[index - 1].day);

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

                    return GestureDetector(
                      onLongPress: () =>
                          _showClearMilestoneBottomSheet(milestone),
                      child: TimelineTile(
                        milestone: milestone,
                        isCompleted: isCompleted,
                        isNext: isNext,
                        isLast: index == widget.milestones.length - 1,
                        daysAchieved: milestoneDaysToMark,
                      ),
                    );
                  },
                ),
              ),
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
