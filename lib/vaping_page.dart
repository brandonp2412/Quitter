import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class VapingPage extends StatelessWidget {
  final bool started;

  const VapingPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.vapingMilestone1Title,
        description: l10n.vapingMilestone1Description,
        reference: "Cleveland Clinic - Nicotine Withdrawal Guide",
        link:
            "https://my.clevelandclinic.org/health/diseases/21587-nicotine-withdrawal",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.vapingMilestone3Title,
        description: l10n.vapingMilestone3Description,
        reference: "Healthline - What Are the Beefits of Quitting Vaping?",
        link: "https://www.healthline.com/health/benefits-of-quitting-vaping",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.vapingMilestone7Title,
        description: l10n.vapingMilestone7Description,
        reference: "Medical News Today - Timeline After Quitting Smoking",
        link: "https://www.medicalnewstoday.com/articles/317956",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.vapingMilestone14Title,
        description: l10n.vapingMilestone14Description,
        reference: "Truth Initiative - Benefits of Quitting Smoking or Vaping",
        link:
            "https://truthinitiative.org/research-resources/quitting-smoking-vaping/breath-fresh-air-immediate-benefits-quitting-smoking-or",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.vapingMilestone30Title,
        description: l10n.vapingMilestone30Description,
        reference: "Medical News Today - Can your lungs heal from vaping?",
        link:
            "https://www.medicalnewstoday.com/articles/effects-of-vaping-on-lungs",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.vapingMilestone60Title,
        description: l10n.vapingMilestone60Description,
        reference:
            "Charlie Health - The Vaping Withdrawal Timeline (and What to Expect When You Quit)",
        link: "https://www.charliehealth.com/post/vaping-withdrawal-timeline",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.vapingMilestone90Title,
        description: l10n.vapingMilestone90Description,
        reference: "WebMD - Understanding Nicotine Withdrawal Symptoms",
        link:
            "https://www.webmd.com/smoking-cessation/understanding-nicotine-withdrawal-symptoms",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.vapingMilestone180Title,
        description: l10n.vapingMilestone180Description,
        reference:
            "Hobsonville Point Dental - The effects of vaping on your oral health",
        link:
            "https://www.hobsonvillepointdental.co.nz/blog/news/the-effects-vaping-has-on-your-oral-health.html",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.vapingMilestone365Title,
        description: l10n.vapingMilestone365Description,
        reference:
            "American Cancer Society - Health Benefits of Quitting Over Time",
        link:
            "https://www.cancer.org/cancer/risk-prevention/tobacco/guide-quitting-smoking/benefits-of-quitting-smoking-over-time.html",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.vapingPageTitle,
      storageKey: 'vaping',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.vapingHeaderStarted,
      headerNotStarted: l10n.vapingHeaderNotStarted,
      subtitleStarted: l10n.vapingSubtitleStarted,
      subtitleNotStarted: l10n.vapingSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
