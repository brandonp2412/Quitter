import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class AlcoholPage extends StatelessWidget {
  final bool started;

  const AlcoholPage({super.key, required this.started});

  final List<QuitMilestone> miles = const [
    QuitMilestone(
      day: 1,
      title: "Sleep Quality Begins to Improve",
      description:
          "Your REM sleep cycles start to normalize within the first day. While alcohol might help you fall asleep initially, it disrupts deep sleep and REM cycles throughout the night, causing fragmented sleep.",
      reference: "WebMD - What Happens When You Quit Drinking",
      link:
          "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
    ),
    QuitMilestone(
      day: 3,
      title: "Hydration Levels Restore",
      description:
          "Your kidneys are recovering from alcohol's diuretic effects. Alcohol suppresses antidiuretic hormone, leading to increased urination and dehydration. By day 3, your body's fluid balance is improving significantly.",
      reference: "The retreat NZ - What Happens When You Stop Drinking",
      link:
          "https://www.theretreatnz.org.nz/what-happens-when-you-stop-drinking-alcohol/#:~:text=Alcohol%20is%20a%20diuretic%20which,risk%20of%20infections%20and%20illnesses.",
    ),
    QuitMilestone(
      day: 7,
      title: "Immune System Strengthens",
      description:
          "Your white blood cells are recovering their function. Even a single bout of heavy drinking can impair immune function for up to 24 hours, and chronic drinking significantly weakens your body's ability to fight infections.",
      reference: "WebMD - What Happens When You Quit Drinking",
      link:
          "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
    ),
    QuitMilestone(
      day: 14,
      title: "Brain Volume Recovery Begins",
      description:
          "Rapid recovery of brain volume begins within the first two weeks of abstinence. Research shows evidence of brain tissue recovery starting around 14 days, though full cognitive function continues improving over months.",
      reference: "Priory Group - Brain Recovery After Alcohol Abuse",
      link:
          "https://www.priorygroup.com/blog/how-long-does-brain-recovery-take-after-alcohol-abuse",
    ),
    QuitMilestone(
      day: 30,
      title: "Blood Pressure Normalizes",
      description:
          "Your cardiovascular system shows significant improvement. Regular alcohol consumption elevates blood pressure, but abstinence for about a month can help bring blood pressure back to healthier levels.",
      reference: "WebMD - What Happens When You Quit Drinking",
      link:
          "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
    ),
    QuitMilestone(
      day: 60,
      title: "Liver Function Improves",
      description:
          "Your liver shows measurable improvement in function. This regenerative organ can recover significantly from alcohol-induced damage, with liver enzymes and fat accumulation showing improvement within 2 months of abstinence.",
      reference: "WebMD - What Happens When You Quit Drinking",
      link:
          "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
    ),
    QuitMilestone(
      day: 90,
      title: "Cognitive Function Substantially Improves",
      description:
          "Significant cognitive recovery occurs over the first 3 months. Studies show people who maintain abstinence continue to recover cognitive function over several months, with measurable improvements in memory, concentration, and decision-making.",
      reference: "Rehabs.com - Alcohol and Brain Fog Treatment",
      link: "https://rehabs.com/alcohol/effects/brain-fog/",
    ),
    QuitMilestone(
      day: 180,
      title: "Brain Volume and Function Continue Recovery",
      description:
          "Six months of sobriety allows for continued neural recovery. Research indicates that brain volume continues to increase and cognitive abilities continue improving significantly during this period of sustained abstinence.",
      reference: "Rehabs.com - Alcohol and Brain Fog Treatment",
      link: "https://rehabs.com/alcohol/effects/brain-fog/",
    ),
    QuitMilestone(
      day: 365,
      title: "Cancer Risk Reduction May Begin",
      description:
          "One year of abstinence may begin to reduce cancer risk. While alcohol clearly increases risk for several cancers (liver, breast, colorectal, esophageal), research on risk reduction timeline is still emerging and varies by cancer type.",
      reference: "WebMD - What Happens When You Quit Drinking",
      link:
          "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.alcoholPageTitle,
      storageKey: 'alcohol',
      milestones: miles,
      headerStarted: l10n.alcoholHeaderStarted,
      headerNotStarted: l10n.alcoholHeaderNotStarted,
      subtitleStarted: l10n.alcoholSubtitleStarted,
      subtitleNotStarted: l10n.alcoholSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
