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
  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.customMilestone1Title,
        description: l10n.customMilestone1Description,
        reference: "SAMHSA - Treating Sleep Problems of People in Recovery",
        link: "https://library.samhsa.gov/sites/default/files/sma14-4859.pdf",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.customMilestone3Title,
        description: l10n.customMilestone3Description,
        reference: "NCBI - Withdrawal Syndromes Clinical Guidelines",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.customMilestone7Title,
        description: l10n.customMilestone7Description,
        reference: "NIDA - Treatment and Recovery (The Science of Addiction)",
        link:
            "https://nida.nih.gov/publications/drugs-brains-behavior-science-addiction/treatment-recovery",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.customMilestone14Title,
        description: l10n.customMilestone14Description,
        reference:
            "NCBI - Post-Acute Alcohol Withdrawal Research (Illustrative)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9798382/",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.customMilestone30Title,
        description: l10n.customMilestone30Description,
        reference: "NIDA - Drug Addiction Treatment",
        link: "https://nida.nih.gov/research-topics/treatment",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.customMilestone90Title,
        description: l10n.customMilestone90Description,
        reference:
            "Overview of NIDA's Principles of Effective Treatment (90-Day Threshold), PMC",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC2738623/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.customMilestone180Title,
        description: l10n.customMilestone180Description,
        reference: "NCBI - Clinical Guidelines for Withdrawal Management",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.customMilestone365Title,
        description: l10n.customMilestone365Description,
        reference: "PMC - Recovery Attempts and Successful Outcomes Study",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6602820/",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.customMilestone730Title,
        description: l10n.customMilestone730Description,
        reference: "PMC - Recovery Attempts and Successful Outcomes Study",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6602820/",
      ),
      QuitMilestone(
        day: 1095,
        title: l10n.customMilestone1095Title,
        description: l10n.customMilestone1095Description,
        reference: "NIDA - Drugs, Brains, and Behavior",
        link:
            "https://nida.nih.gov/publications/drugs-brains-behavior-science-addiction",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.customReferenceDay1095,
        referenceContent:
            "Three Years of Recovery: Deep Roots\n\n"
            "Source: NIDA, Drugs, Brains, and Behavior: The Science of Addiction\n\n"
            "NIDA describes substance use disorders as treatable and recovery as stopping drug use and resuming a productive life. It does not set a universal three-year biological recovery deadline across substances.\n\n"
            "Three years is a durable achievement in its own right. The routines, support, and choices that carried you here have had years to take root.",
      ),
      QuitMilestone(
        day: 1460,
        title: l10n.customMilestone1460Title,
        description: l10n.customMilestone1460Description,
        reference: "NIDA - Drugs, Brains, and Behavior",
        link:
            "https://nida.nih.gov/publications/drugs-brains-behavior-science-addiction",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.customReferenceDay1460,
        referenceContent:
            "Four Years of Recovery: Lasting Change\n\n"
            "Source: NIDA, Drugs, Brains, and Behavior: The Science of Addiction\n\n"
            "NIDA presents addiction as a treatable condition that can be managed successfully. It does not define a universal four-year health endpoint for every substance or person.\n\n"
            "Four years is lasting change made visible through consistency. Keep protecting the habits, relationships, and support that make recovery sustainable.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.customMilestone1825Title,
        description: l10n.customMilestone1825Description,
        reference: "NIDA - Drugs, Brains, and Behavior",
        link:
            "https://nida.nih.gov/publications/drugs-brains-behavior-science-addiction",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.customReferenceDay1825,
        referenceContent:
            "Five Years of Recovery: Half a Decade\n\n"
            "Source: NIDA, Drugs, Brains, and Behavior: The Science of Addiction\n\n"
            "NIDA supports evidence-based treatment and recovery but does not claim that every person reaches the same biological state at five years.\n\n"
            "Five years is half a decade of sustained progress. Celebrate the life, skills, and support network you have built and keep investing in what works.",
      ),
    ];
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
          milestones: _getMilestones(l10n),
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
