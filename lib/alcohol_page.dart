import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class AlcoholPage extends StatelessWidget {
  final bool started;

  const AlcoholPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.alcoholMilestone1Title,
        description: l10n.alcoholMilestone1Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.alcoholMilestone3Title,
        description: l10n.alcoholMilestone3Description,
        reference: "The retreat NZ - What Happens When You Stop Drinking",
        link:
            "https://www.theretreatnz.org.nz/what-happens-when-you-stop-drinking-alcohol/#:~:text=Alcohol%20is%20a%20diuretic%20which,risk%20of%20infections%20and%20illnesses.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.alcoholMilestone7Title,
        description: l10n.alcoholMilestone7Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.alcoholMilestone14Title,
        description: l10n.alcoholMilestone14Description,
        reference: "Priory Group - Brain Recovery After Alcohol Abuse",
        link:
            "https://www.priorygroup.com/blog/how-long-does-brain-recovery-take-after-alcohol-abuse",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.alcoholMilestone30Title,
        description: l10n.alcoholMilestone30Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.alcoholMilestone60Title,
        description: l10n.alcoholMilestone60Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.alcoholMilestone90Title,
        description: l10n.alcoholMilestone90Description,
        reference: "Rehabs.com - Alcohol and Brain Fog Treatment",
        link: "https://rehabs.com/alcohol/effects/brain-fog/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.alcoholMilestone180Title,
        description: l10n.alcoholMilestone180Description,
        reference: "Rehabs.com - Alcohol and Brain Fog Treatment",
        link: "https://rehabs.com/alcohol/effects/brain-fog/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.alcoholMilestone365Title,
        description: l10n.alcoholMilestone365Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.alcoholPageTitle,
      storageKey: 'alcohol',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.alcoholHeaderStarted,
      headerNotStarted: l10n.alcoholHeaderNotStarted,
      subtitleStarted: l10n.alcoholSubtitleStarted,
      subtitleNotStarted: l10n.alcoholSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
