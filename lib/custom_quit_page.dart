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
        title: "Initial Recovery Phase Begins",
        description:
            "Your body starts the healing process! Within 24 hours of quitting, your system begins to clear toxins and adjust to functioning without addictive substances. Sleep disturbances are common but part of the recovery process.",
        reference: "SAMHSA - Treating Sleep Problems of People in Recovery",
        link: "https://store.samhsa.gov/sites/default/files/sma14-4859.pdf",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 3,
        title: "Withdrawal Symptoms Peak",
        description:
            "You're facing the storm head-on! Physical withdrawal symptoms typically peak around day 3 for many substances, including anxiety, mood swings, and physical discomfort. This means you're getting through the hardest part.",
        reference: "IKON Recovery - Nicotine Withdrawal Timeline Research",
        link:
            "https://www.ikonrecoverycenters.org/nicotine-withdrawal-timeline-what-to-expect/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 7,
        title: "Acute Withdrawal Phase Ending",
        description:
            "The worst is behind you! After one week, acute withdrawal symptoms begin to subside for most substances. Your body is adjusting to its new normal and starting to stabilize.",
        reference: "American Addiction Centers - Drug Withdrawal Timelines",
        link:
            "https://americanaddictioncenters.org/withdrawal-timelines-treatments",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 14,
        title: "Early Recovery Stabilization",
        description:
            "Your mind is clearing! Two weeks of sobriety often brings improved mental clarity and reduced cravings as your brain begins to adapt to functioning without addictive substances.",
        reference: "Hazelden Betty Ford - Post-Acute Withdrawal Research",
        link:
            "https://www.hazeldenbettyford.org/articles/post-acute-withdrawal-syndrome",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 30,
        title: "One Month Milestone",
        description:
            "A major victory! Thirty days of sobriety represents significant progress. Many people find that sleep patterns, mood, and energy levels continue to improve during this period.",
        reference: "Cleveland Clinic - Alcohol Withdrawal Recovery",
        link:
            "https://my.clevelandclinic.org/health/diseases/alcohol-withdrawal",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 90,
        title: "Three Month Recovery Milestone",
        description:
            "Your commitment is paying off! Three months of recovery represents a significant achievement. Post-acute withdrawal symptoms typically begin to fade, and many people report feeling more like themselves again.",
        reference: "The Recovery Village - Long-term Recovery Timeline",
        link:
            "https://www.therecoveryvillage.com/alcohol-abuse/how-long-alcohol-detox-take/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 180,
        title: "Six Month Recovery Achievement",
        description:
            "You're building lasting change! Six months of sobriety often brings continued improvements in physical health, emotional stability, and overall quality of life as your body continues healing.",
        reference: "NCBI - Clinical Guidelines for Withdrawal Management",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 365,
        title: "One Year of Recovery",
        description:
            "An incredible achievement! One year of sobriety represents a major life milestone. Many people experience significant improvements in physical health, relationships, and overall well-being by this point.",
        reference: "NCBI - Withdrawal Syndromes and Long-term Recovery",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 730,
        title: "Two Years of Sustained Recovery",
        description:
            "You've built a new life! Two years of recovery demonstrates remarkable resilience and commitment. Long-term sobriety often brings profound positive changes in all areas of life and significantly reduced risk of relapse.",
        reference: "Arrow Passage Recovery - Long-term Recovery Outcomes",
        link: "https://www.arrowpassage.com/withdrawal-timelines/",
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
