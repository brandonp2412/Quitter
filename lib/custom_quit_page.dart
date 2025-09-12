import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Added import
import 'package:quitter/addiction_provider.dart'; // Added import
import 'package:quitter/custom_quit_entry.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class CustomQuitPage extends StatefulWidget {
  final CustomQuitEntry entry;

  const CustomQuitPage({super.key, required this.entry});

  @override
  State<CustomQuitPage> createState() => _CustomQuitPageState();
}

class _CustomQuitPageState extends State<CustomQuitPage> {
  List<QuitMilestone> _generateMilestones() {
    List<QuitMilestone> milestones = [];
    // Example: Generate milestones for 1, 7, 30, 90, 180, 365 days
    // You can customize this logic based on desired milestones for custom entries
    milestones.add(
      const QuitMilestone(
        day: 1,
        title: 'First Day',
        description: 'You\'ve made it through your first day!',
        reference: 'Self-control is strength.',
        link: '',
      ),
    );
    milestones.add(
      const QuitMilestone(
        day: 7,
        title: 'One Week',
        description: 'A full week of progress!',
        reference: 'Consistency is key.',
        link: '',
      ),
    );
    milestones.add(
      const QuitMilestone(
        day: 30,
        title: 'One Month',
        description: 'One month strong!',
        reference: 'Building new habits.',
        link: '',
      ),
    );
    milestones.add(
      const QuitMilestone(
        day: 90,
        title: 'Three Months',
        description: 'Quarter of a year!',
        reference: 'Long-term commitment.',
        link: '',
      ),
    );
    milestones.add(
      const QuitMilestone(
        day: 180,
        title: 'Six Months',
        description: 'Half a year of freedom!',
        reference: 'Embrace the change.',
        link: '',
      ),
    );
    milestones.add(
      const QuitMilestone(
        day: 365,
        title: 'One Year',
        description: 'A full year of success!',
        reference: 'Celebrate your achievement.',
        link: '',
      ),
    );
    return milestones;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AddictionProvider, CustomQuitEntry>(
      selector: (context, addictions) => addictions.customEntries.firstWhere(
        (e) => e.id == widget.entry.id,
        orElse: () => widget.entry, // Fallback to initial entry if not found
      ),
      builder: (context, currentEntry, child) {
        final addictions = context
            .read<AddictionProvider>(); // Use read for actions

        return QuitPageTemplate(
          title: currentEntry.title,
          storageKey: currentEntry.id,
          shareTitle: currentEntry.title,
          milestones: _generateMilestones(),
          headerTextStartedBuilder: (currentDay) => '$currentDay Days',
          headerTextNotStarted: 'Not Started',
          headerSubtitleStartedBuilder: (currentDay) => 'You are doing great!',
          headerSubtitleNotStarted: 'Tap "Start" to begin your journey',
          initialStarted: currentEntry.quitDate.isBefore(DateTime.now()),
          customDaysAchieved: currentEntry.daysAchieved,
          quitDateOverride: currentEntry.quitDate.toIso8601String(),
          onQuitDateChanged: (newDate) async {
            final updatedEntry = currentEntry.copyWith(quitDate: newDate);
            await addictions.updateCustomEntry(updatedEntry);
          },
          onResetPressed: (days) async {
            await addictions.resetCustomEntry(currentEntry.id, days);
          },
        );
      },
    );
  }
}
