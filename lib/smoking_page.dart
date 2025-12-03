import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SmokingPage extends StatelessWidget {
  final bool started;

  const SmokingPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.smokingMilestone1Title,
        description: l10n.smokingMilestone1Description,
        reference: "NHS Better Health - Quit Smoking Timeline",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.smokingMilestone3Title,
        description: l10n.smokingMilestone3Description,
        reference:
            'McLaughlin, Ian, et al. "Nicotine withdrawal." Current Topics in Behavioral Neurosciences',
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.smokingMilestone7Title,
        description: l10n.smokingMilestone7Description,
        reference: "NHS Better Health - Quit Smoking Benefits",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.smokingMilestone14Title,
        description: l10n.smokingMilestone14Description,
        reference: "Medical News Today - Timeline After Quitting Smoking",
        link: "https://www.medicalnewstoday.com/articles/317956",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.smokingMilestone30Title,
        description: l10n.smokingMilestone30Description,
        reference: "PMC - Smoking Cessation for People with COPD",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6400424/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.smokingMilestone90Title,
        description: l10n.smokingMilestone90Description,
        reference:
            "PMC - Cardiovascular Effects of Smoking and Smoking Cessation (2024)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11843939/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.smokingMilestone180Title,
        description: l10n.smokingMilestone180Description,
        reference: "Smoke Free NZ - The benefits of quitting",
        link:
            "https://www.smokefree.org.nz/quit/tips-and-advice/the-benefits-of-quitting",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.smokingMilestone365Title,
        description: l10n.smokingMilestone365Description,
        reference: "PMC - Smoking Cessation and Outcome After Ischemic Stroke",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5644463/",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.smokingMilestone1825Title,
        description: l10n.smokingMilestone1825Description,
        reference: "CDC - Benefits of Quitting Smoking",
        link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.smokingPageTitle,
      storageKey: 'smoking',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.smokingHeaderStarted,
      headerNotStarted: l10n.smokingHeaderNotStarted,
      subtitleStarted: l10n.smokingSubtitleStarted,
      subtitleNotStarted: l10n.smokingSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
