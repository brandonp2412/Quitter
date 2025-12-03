import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class MarijuanaPage extends StatelessWidget {
  final bool started;

  const MarijuanaPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.marijuanaMilestone1Title,
        description: l10n.marijuanaMilestone1Description,
        reference: "Cleveland Clinic - Marijuana Withdrawal",
        link:
            "https://my.clevelandclinic.org/health/diseases/marijuana-weed-withdrawal",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.marijuanaMilestone3Title,
        description: l10n.marijuanaMilestone3Description,
        reference: "American Addiction Centers - Marijuana Withdrawal Timeline",
        link:
            "https://americanaddictioncenters.org/withdrawal-timelines-treatments/weed-marijuana",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.marijuanaMilestone7Title,
        description: l10n.marijuanaMilestone7Description,
        reference: "Medical News Today - Weed Withdrawal Symptoms",
        link: "https://www.medicalnewstoday.com/articles/324301",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.marijuanaMilestone14Title,
        description: l10n.marijuanaMilestone14Description,
        reference: "PubMed - Cannabis Withdrawal Time Course",
        link: "https://pubmed.ncbi.nlm.nih.gov/12943018/",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.marijuanaMilestone30Title,
        description: l10n.marijuanaMilestone30Description,
        reference: "Harvard Health - Effects of Marijuana on Memory",
        link:
            "https://www.health.harvard.edu/mind-and-mood/the-effects-of-marijuana-on-your-memory",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.marijuanaMilestone60Title,
        description: l10n.marijuanaMilestone60Description,
        reference: "NCBI - Impact of Abstinence on Cognition",
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7483189/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.marijuanaMilestone90Title,
        description: l10n.marijuanaMilestone90Description,
        reference: "NCBI - Clinical Management of Cannabis Withdrawal",
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9110555/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.marijuanaMilestone180Title,
        description: l10n.marijuanaMilestone180Description,
        reference: "NCBI - Cannabis Effects on Executive Function",
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3037578/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.marijuanaMilestone365Title,
        description: l10n.marijuanaMilestone365Description,
        reference: "NutritionFacts.org - Cannabis Brain Damage Reversible",
        link:
            "https://nutritionfacts.org/blog/cannabis-brain-damage-reversible-in-adults/",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.marijuanaPageTitle,
      storageKey: 'marijuana',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.marijuanaHeaderStarted,
      headerNotStarted: l10n.marijuanaHeaderNotStarted,
      subtitleStarted: l10n.marijuanaSubtitleStarted,
      subtitleNotStarted: l10n.marijuanaSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
