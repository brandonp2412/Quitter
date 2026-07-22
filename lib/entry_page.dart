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
        link: "https://store.samhsa.gov/sites/default/files/sma14-4859.pdf",
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
        reference: "NCBI - Post-Acute Alcohol Withdrawal Research (Illustrative)",
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
