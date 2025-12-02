import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class MarijuanaPage extends StatelessWidget {
  final bool started;

  const MarijuanaPage({super.key, required this.started});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Withdrawal Symptoms Begin",
      description:
          "Your brain is adjusting to life without THC! Within 24-48 hours, you might experience irritability, anxiety, or sleep difficulties. This is completely normal - your cannabinoid receptors are starting to reset.",
      reference: "Cleveland Clinic - Marijuana Withdrawal",
      link:
          "https://my.clevelandclinic.org/health/diseases/marijuana-weed-withdrawal",
    ),
    QuitMilestone(
      day: 3,
      title: "Physical Symptoms Peak",
      description:
          "You're at the toughest point, but it's all uphill from here! Days 2-6 typically see peak withdrawal symptoms including headaches, sweating, and mood changes. Your body is working hard to rebalance itself.",
      reference: "American Addiction Centers - Marijuana Withdrawal Timeline",
      link:
          "https://americanaddictioncenters.org/withdrawal-timelines-treatments/weed-marijuana",
    ),
    QuitMilestone(
      day: 7,
      title: "Sleep Patterns Improve",
      description:
          "Sweet dreams are making a comeback! After a week without cannabis, your natural sleep architecture begins to normalize. REM sleep rebounds, leading to more vivid dreams and better rest quality.",
      reference: "Medical News Today - Weed Withdrawal Symptoms",
      link: "https://www.medicalnewstoday.com/articles/324301",
    ),
    QuitMilestone(
      day: 14,
      title: "Acute Withdrawal Ends",
      description:
          "The storm has passed! Most physical withdrawal symptoms significantly decrease after two weeks. Your mood is stabilizing and daily functioning becomes much easier. The hardest part is behind you.",
      reference: "PubMed - Cannabis Withdrawal Time Course",
      link: "https://pubmed.ncbi.nlm.nih.gov/12943018/",
    ),
    QuitMilestone(
      day: 30,
      title: "Memory Function Improves",
      description:
          "Your brain fog is clearing! Research shows that verbal learning and memory begin improving significantly after stopping cannabis use. The hippocampus, crucial for memory formation, starts functioning better.",
      reference: "Harvard Health - Effects of Marijuana on Memory",
      link:
          "https://www.health.harvard.edu/mind-and-mood/the-effects-of-marijuana-on-your-memory",
    ),
    QuitMilestone(
      day: 60,
      title: "Concentration Sharpens",
      description:
          "Focus mode: activated! Two months without cannabis and your ability to concentrate and maintain attention shows marked improvement. Work tasks and studying become noticeably easier to manage.",
      reference: "NCBI - Impact of Abstinence on Cognition",
      link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7483189/",
    ),
    QuitMilestone(
      day: 90,
      title: "Mood Stability Returns",
      description:
          "Emotional equilibrium restored! Three months of abstinence brings significant improvements in mood regulation, decreased anxiety levels, and better stress management. Your emotional baseline is normalizing.",
      reference: "NCBI - Clinical Management of Cannabis Withdrawal",
      link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9110555/",
    ),
    QuitMilestone(
      day: 180,
      title: "Executive Function Recovery",
      description:
          "Your mental CEO is back in charge! Six months without cannabis shows substantial improvement in executive functions - planning, decision-making, and problem-solving abilities are significantly enhanced.",
      reference: "NCBI - Cannabis Effects on Executive Function",
      link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3037578/",
    ),
    QuitMilestone(
      day: 365,
      title: "Brain Structure Restoration",
      description:
          "Neural architecture rebuilt! One year of abstinence allows significant recovery of brain regions affected by chronic cannabis use. Cognitive improvements become your new normal, with lasting benefits to learning and memory.",
      reference: "NutritionFacts.org - Cannabis Brain Damage Reversible",
      link:
          "https://nutritionfacts.org/blog/cannabis-brain-damage-reversible-in-adults/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.marijuanaPageTitle,
      storageKey: 'marijuana',
      milestones: milestones,
      headerStarted: l10n.marijuanaHeaderStarted,
      headerNotStarted: l10n.marijuanaHeaderNotStarted,
      subtitleStarted: l10n.marijuanaSubtitleStarted,
      subtitleNotStarted: l10n.marijuanaSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
