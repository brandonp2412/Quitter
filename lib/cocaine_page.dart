import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class CocainePage extends StatelessWidget {
  final bool started;
  const CocainePage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.cocaineMilestone1Title,
        description: l10n.cocaineMilestone1Description,
        reference: "Priory Group - Cocaine Withdrawal",
        link:
            "https://www.priorygroup.com/addiction-treatment/cocaine-addiction/cocaine-withdrawal",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.cocaineMilestone3Title,
        description: l10n.cocaineMilestone3Description,
        reference: "Cleveland Clinic - Cocaine Effects",
        link:
            "https://my.clevelandclinic.org/health/articles/4038-cocaine-crack",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.cocaineMilestone7Title,
        description: l10n.cocaineMilestone7Description,
        reference: "Addiction Center - Withdrawal and Detox",
        link:
            "https://www.addictioncenter.com/drugs/crack-cocaine/withdrawal-detox/",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.cocaineMilestone14Title,
        description: l10n.cocaineMilestone14Description,
        reference: "Oxford Treatment - Cocaine Withdrawal Timeline",
        link: "https://oxfordtreatment.com/substance-abuse/cocaine/withdrawal/",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.cocaineMilestone60Title,
        description: l10n.cocaineMilestone60Description,
        reference: "Guardian Recovery - Cocaine and Sleep",
        link:
            "https://www.guardianrecovery.com/addiction-treatment/cocaine-abuse-addiction/cocaine-sleep/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.cocaineMilestone90Title,
        description: l10n.cocaineMilestone90Description,
        reference: "Munster Behavioral Health - Brain Recovery Timeline",
        link:
            "https://munsterbehavioralhealth.com/how-long-to-rewire-brain-from-addiction/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.cocaineMilestone180Title,
        description: l10n.cocaineMilestone180Description,
        reference: "Recovery Research Institute - Brain Recovery from Cocaine",
        link:
            "https://www.recoveryanswers.org/research-post/brain-recovery-cocaine-use-disorder/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.cocaineMilestone365Title,
        description: l10n.cocaineMilestone365Description,
        reference: "FHE Health - Addiction Healing Timeline",
        link: "https://fherehab.com/learning/how-long-to-heal-addiction",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.cocaineMilestone730Title,
        description: l10n.cocaineMilestone730Description,
        reference: "PMC - Recovering from Cocaine: Clinical Investigations",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3935515/",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.cocainePageTitle,
      storageKey: 'cocaine',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.cocaineHeaderStarted,
      headerNotStarted: l10n.cocaineHeaderNotStarted,
      subtitleStarted: l10n.cocaineSubtitleStarted,
      subtitleNotStarted: l10n.cocaineSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
