import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/custom_quit_entry.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class CustomQuitPage extends StatefulWidget {
  final Entry entry;

  const CustomQuitPage({super.key, required this.entry});

  @override
  State<CustomQuitPage> createState() => _CustomQuitPageState();
}

class _CustomQuitPageState extends State<CustomQuitPage> {
  List<QuitMilestone> _generateMilestones() {
    List<QuitMilestone> miles = [];
    miles.add(
      const QuitMilestone(
        day: 1,
        title: 'First Day',
        description: 'You\'ve made it through your first day!',
        reference: 'Self-control is strength.',
        link: '',
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 7,
        title: 'One Week',
        description: 'A full week of progress!',
        reference: 'Consistency is key.',
        link: '',
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 30,
        title: 'One Month',
        description: 'One month strong!',
        reference: 'Building new habits.',
        link: '',
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 90,
        title: 'Three Months',
        description: 'Quarter of a year!',
        reference: 'Long-term commitment.',
        link: '',
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 180,
        title: 'Six Months',
        description: 'Half a year of freedom!',
        reference: 'Embrace the change.',
        link: '',
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 365,
        title: 'One Year',
        description: 'A full year of success!',
        reference: 'Celebrate your achievement.',
        link: '',
      ),
    );
    return miles;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AddictionProvider, Entry>(
      selector: (context, addictions) => addictions.entries.firstWhere(
        (e) => e.id == widget.entry.id,
        orElse: () => widget.entry,
      ),
      builder: (context, entry, child) {
        final addictions = context.read<AddictionProvider>();

        return QuitPageTemplate(
          title: entry.title,
          storageKey: entry.id,
          shareTitle: entry.title,
          milestones: _generateMilestones(),
          headerTextStartedBuilder: (day) => '$day Days',
          headerTextNotStarted: 'Not Started',
          headerSubtitleStartedBuilder: (day) => 'You are doing great!',
          headerSubtitleNotStarted: 'Tap "Start" to begin your journey',
          initialStarted: entry.quitDate.isBefore(DateTime.now()),
          customDaysAchieved: entry.daysAchieved,
          quitDateOverride: entry.quitDate.toIso8601String(),
          onQuitDateChanged: (date) async {
            final updated = entry.copyWith(quitDate: date);
            await addictions.updateEntry(updated);
          },
          onResetPressed: (days) async {
            await addictions.resetEntry(entry.id, days);
          },
        );
      },
    );
  }
}
