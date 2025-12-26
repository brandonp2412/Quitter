import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class HeroinPage extends StatelessWidget {
  final bool started;
  const HeroinPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.heroinMilestone1Title,
        description: l10n.heroinMilestone1Description,
        reference: "Oxford Treatment - Heroin Withdrawal Timeline",
        link: "https://oxfordtreatment.com/substance-abuse/heroin/withdrawal/",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.heroinMilestone3Title,
        description: l10n.heroinMilestone3Description,
        reference: "Liberty House Recovery - Heroin Detox Timeline",
        link: "https://libertyhouserecoverycenter.com/heroin-detox-timeline/",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.heroinMilestone7Title,
        description: l10n.heroinMilestone7Description,
        reference: "American Addiction Centers - Heroin Withdrawal",
        link:
            "https://americanaddictioncenters.org/opioids/heroin/withdrawal-detox",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.heroinMilestone30Title,
        description: l10n.heroinMilestone30Description,
        reference: "Fusion Recovery - Physical Health Improvements",
        link:
            "https://fusionrecovery.com/how-long-does-heroin-addiction-treatment-take-a-timeline-for-recovery/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.heroinMilestone90Title,
        description: l10n.heroinMilestone90Description,
        reference: "PubMed - Immune Function Recovery in Heroin Users",
        link: "https://pubmed.ncbi.nlm.nih.gov/26789146/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.heroinMilestone180Title,
        description: l10n.heroinMilestone180Description,
        reference: "Foundations Group - Brain Recovery Timeline",
        link:
            "https://www.foundationsgrouprecoverycenters.com/blog/how-long-does-your-brain-take-to-recover-from-drugs/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.heroinMilestone365Title,
        description: l10n.heroinMilestone365Description,
        reference: "FHE Health - Brain Healing from Heroin",
        link: "https://fherehab.com/learning/heroin-affects-brain",
      ),
      QuitMilestone(
        day: 540,
        title: l10n.heroinMilestone540Title,
        description: l10n.heroinMilestone540Description,
        reference: "Excel Treatment Center - Brain Recovery Timeline",
        link:
            "https://exceltreatmentcenter.com/brain-rewiring-and-healing-during-addiction-recovery/",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.heroinMilestone730Title,
        description: l10n.heroinMilestone730Description,
        reference: "Recovery Research Institute - Brain Recovery",
        link: "https://www.recoveryanswers.org/recovery-101/brain-in-recovery/",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.heroinPageTitle,
      storageKey: 'heroin',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.heroinHeaderStarted,
      headerNotStarted: l10n.heroinHeaderNotStarted,
      subtitleStarted: l10n.heroinSubtitleStarted,
      subtitleNotStarted: l10n.heroinSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
