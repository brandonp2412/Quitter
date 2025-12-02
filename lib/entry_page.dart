import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class EntryPage extends StatefulWidget {
  final Entry entry;

  const EntryPage({super.key, required this.entry});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
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
        reference: "NCBI - Withdrawal Syndromes Clinical Guidelines",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 7,
        title: "Acute Withdrawal Phase Ending",
        description:
            "The worst is behind you! After one week, acute withdrawal symptoms begin to subside for most substances. Your body is adjusting to its new normal and starting to stabilize.",
        reference: "American Addiction Centers - General Withdrawal Management",
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
        reference: "NCBI - Post-Acute Withdrawal Research",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9798382/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 30,
        title: "One Month Milestone",
        description:
            "A major victory! Thirty days of sobriety represents significant progress. Many people find that sleep patterns, mood, and energy levels continue to improve during this period.",
        reference: "High Focus Centers - 30-Day Recovery Benefits Research",
        link:
            "https://pa.highfocuscenters.com/the-benefits-of-staying-30-60-and-90-days-sober-a-path-to-lasting-recovery/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 90,
        title: "Three Month Recovery Milestone",
        description:
            "Your commitment is paying off! Three months of recovery represents a significant achievement. Post-acute withdrawal symptoms typically begin to fade, and many people report feeling more like themselves again.",
        reference: "East Coast Recovery - 90-Day Sobriety Research",
        link:
            "https://eastcoastrecovery.com/what-happens-during-and-after-the-first-90-days-sober/",
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
        reference: "PMC - Recovery Attempts and Successful Outcomes Study",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6602820/",
      ),
    );

    miles.add(
      const QuitMilestone(
        day: 730,
        title: "Two Years of Sustained Recovery",
        description:
            "You've built a new life! Two years of recovery demonstrates remarkable resilience and commitment. Long-term sobriety often brings profound positive changes in all areas of life and significantly reduced risk of relapse.",
        reference: "Addiction Group - Long-term Sobriety Milestone Research",
        link: "https://www.addictiongroup.org/resources/sobriety-milestones/",
      ),
    );

    return miles;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Selector<AddictionProvider, Entry>(
      selector: (context, addictions) => addictions.entries.firstWhere(
        (e) => e.id == widget.entry.id,
        orElse: () => widget.entry,
      ),
      builder: (context, entry, child) {
        final addictions = context.read<AddictionProvider>();

        return QuitMilestonesPage(
          title: entry.title,
          storageKey: entry.id,
          shareTitle: entry.title,
          milestones: _generateMilestones(),
          headerStarted: l10n.entryPageHeaderStarted,
          headerNotStarted: l10n.entryPageHeaderNotStarted,
          subtitleStarted: l10n.entryPageSubtitleStarted,
          subtitleNotStarted: l10n.entryPageSubtitleNotStarted,
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
