import 'package:flutter/material.dart';
import 'package:quitter/custom_quit_entry.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class CustomQuitPage extends StatelessWidget {
  final CustomQuitEntry entry;

  const CustomQuitPage({super.key, required this.entry});

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
    return QuitPageTemplate(
      title: entry.title,
      storageKey: entry.id,
      shareTitle: entry.title,
      milestones: _generateMilestones(),
      headerTextStartedBuilder: (currentDay) => '$currentDay Days',
      headerTextNotStarted: 'Not Started',
      headerSubtitleStartedBuilder: (currentDay) => 'You are doing great!',
      headerSubtitleNotStarted: 'Tap "Start" to begin your journey',
      initialStarted: entry.quitDate.isBefore(DateTime.now()),
      customDaysAchieved: entry.daysAchieved, // Pass custom days achieved
    );
  }
}
