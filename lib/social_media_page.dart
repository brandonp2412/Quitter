import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SocialMediaPage extends StatelessWidget {
  final bool started;

  const SocialMediaPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.socialMediaMilestone1Title,
        description: l10n.socialMediaMilestone1Description,
        reference: "Cleveland Clinic - Social Media Addiction",
        link:
            "https://health.clevelandclinic.org/is-it-possible-to-become-addicted-to-social-media",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.socialMediaMilestone3Title,
        description: l10n.socialMediaMilestone3Description,
        reference: "Cleveland Clinic - Social Media Effects on Youth",
        link:
            "https://health.clevelandclinic.org/dangers-of-social-media-for-youth",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.socialMediaMilestone7Title,
        description: l10n.socialMediaMilestone7Description,
        reference: "WebMD - Digital Detox Benefits",
        link: "https://www.webmd.com/balance/what-is-digital-detox",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.socialMediaMilestone14Title,
        description: l10n.socialMediaMilestone14Description,
        reference: "PMC - Two-Week Social Media Detox Study",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10740995/",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.socialMediaMilestone30Title,
        description: l10n.socialMediaMilestone30Description,
        reference: "HelpGuide.org - Social Media and Mental Health",
        link:
            "https://www.helpguide.org/mental-health/wellbeing/social-media-and-mental-health",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.socialMediaMilestone60Title,
        description: l10n.socialMediaMilestone60Description,
        reference: "McLean Hospital - How Social Media Affects Mental Health",
        link: "https://www.mcleanhospital.org/essential/social-media",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.socialMediaMilestone90Title,
        description: l10n.socialMediaMilestone90Description,
        reference: "Cleveland Clinic - 4 Reasons to Do a Digital Detox",
        link: "https://health.clevelandclinic.org/digital-detox",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.socialMediaMilestone180Title,
        description: l10n.socialMediaMilestone180Description,
        reference: "PMC - Digital Social Media Detox Meta-Analysis",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11392003/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.socialMediaMilestone365Title,
        description: l10n.socialMediaMilestone365Description,
        reference: "Mayo Clinic Press - Social Media on Mental Health",
        link:
            "https://mcpress.mayoclinic.org/mental-health/the-pros-and-cons-of-social-media-on-mental-health/",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.socialMediaPageTitle,
      storageKey: 'social_media',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.socialMediaHeaderStarted,
      headerNotStarted: l10n.socialMediaHeaderNotStarted,
      subtitleStarted: l10n.socialMediaSubtitleStarted,
      subtitleNotStarted: l10n.socialMediaSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
