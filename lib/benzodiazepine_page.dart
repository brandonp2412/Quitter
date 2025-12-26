import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class BenzodiazepinePage extends StatelessWidget {
  final bool started;
  const BenzodiazepinePage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 7,
        title: l10n.benzoMilestone7Title,
        description: l10n.benzoMilestone7Description,
        reference: "American Addiction Centers - Benzodiazepine Withdrawal",
        link:
            "https://americanaddictioncenters.org/benzodiazepine/length-of-withdrawal",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.benzoMilestone14Title,
        description: l10n.benzoMilestone14Description,
        reference: "Wikipedia - Benzodiazepine Withdrawal Syndrome",
        link:
            "https://en.wikipedia.org/wiki/Benzodiazepine_withdrawal_syndrome",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.benzoMilestone60Title,
        description: l10n.benzoMilestone60Description,
        reference: "PubMed - Chronic Benzodiazepine Usage and Withdrawal",
        link: "https://pubmed.ncbi.nlm.nih.gov/15003439/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.benzoMilestone90Title,
        description: l10n.benzoMilestone90Description,
        reference: "High Focus Centers - Benzodiazepine Withdrawal Timeline",
        link:
            "https://www.highfocuscenters.com/2024/07/03/benzodiazepine-withdrawal-duration-timeline-and-symptoms/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.benzoMilestone180Title,
        description: l10n.benzoMilestone180Description,
        reference: "PubMed - Lack of Cognitive Recovery Following Withdrawal",
        link: "https://pubmed.ncbi.nlm.nih.gov/8208885/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.benzoMilestone365Title,
        description: l10n.benzoMilestone365Description,
        reference: "Wikipedia - Effects of Long-term Benzodiazepine Use",
        link:
            "https://en.wikipedia.org/wiki/Effects_of_long-term_benzodiazepine_use",
      ),
      QuitMilestone(
        day: 540,
        title: l10n.benzoMilestone540Title,
        description: l10n.benzoMilestone540Description,
        reference: "Ardu Recovery - Brain Healing After Benzos",
        link: "https://www.ardurecoverycenter.com/brain-healing-after-benzos/",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.benzoMilestone730Title,
        description: l10n.benzoMilestone730Description,
        reference: "Psychiatric Medication Awareness Group - Recovery Tips",
        link: "https://psychmedaware.org/recovery_tips.html",
      ),
      QuitMilestone(
        day: 1095,
        title: l10n.benzoMilestone1095Title,
        description: l10n.benzoMilestone1095Description,
        reference: "Ardu Recovery - Brain Damage Recovery Timeline",
        link: "https://www.ardurecoverycenter.com/brain-healing-after-benzos/",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.benzoPageTitle,
      storageKey: 'benzos',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.benzoHeaderStarted,
      headerNotStarted: l10n.benzoHeaderNotStarted,
      subtitleStarted: l10n.benzoSubtitleStarted,
      subtitleNotStarted: l10n.benzoSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
