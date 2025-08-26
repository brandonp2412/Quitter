import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class AlcoholPage extends StatelessWidget {
  const AlcoholPage({super.key});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Sleep Quality Improves",
      description:
          "Your REM sleep cycles are already starting to normalize. No more tossing and turning like a rotisserie chicken! While alcohol might knock you out initially, it's terrible for deep sleep quality.",
      reference:
          "Ebrahim et al. (2013) - Alcoholism: Clinical and Experimental Research",
      link: "https://onlinelibrary.wiley.com/doi/abs/10.1111/acer.12006",
    ),
    QuitMilestone(
      day: 3,
      title: "Hydration Levels Restore",
      description:
          "Your kidneys are finally getting a break from processing alcohol's diuretic effects. Say goodbye to that perpetual hangover thirst and hello to actually glowing skin!",
      reference:
          "Hobson & Maughan (2010) - European Journal of Applied Physiology",
      link: "https://pubmed.ncbi.nlm.nih.gov/20532878/",
    ),
    QuitMilestone(
      day: 7,
      title: "Immune System Strengthens",
      description:
          "Your white blood cells are back on patrol duty! Alcohol suppresses immune function, so after a week, your body's defense system is already getting back to fighting form.",
      reference: "Sarkar et al. (2015) - Alcohol Research: Current Reviews",
      link: "https://arcr.niaaa.nih.gov/volume/37/2/alcohol-and-immune-system",
    ),
    QuitMilestone(
      day: 14,
      title: "Mental Clarity Returns",
      description:
          "Brain fog, begone! Alcohol affects neurotransmitter balance and cognitive function. Two weeks in, and your mental sharpness is making a comeback worthy of a superhero montage.",
      reference: "Oscar-Berman & Marinković (2007) - Alcohol Research & Health",
      link: "https://pubs.niaaa.nih.gov/publications/arh314/178-190.htm",
    ),
    QuitMilestone(
      day: 30,
      title: "Blood Pressure Normalizes",
      description:
          "Your cardiovascular system is sending thank-you cards. Regular alcohol consumption elevates blood pressure, but a month sober and your heart is already working more efficiently.",
      reference:
          "Roerecke & Rehm (2017) - Cochrane Database of Systematic Reviews",
      link: "https://pubmed.ncbi.nlm.nih.gov/28425681/",
    ),
    QuitMilestone(
      day: 60,
      title: "Liver Function Improves",
      description:
          "Your liver is practically doing cartwheels! This amazing organ can regenerate, and after two months, liver enzymes and fat accumulation show significant improvement.",
      reference: "Liangpunsakul et al. (2010) - Hepatology",
      link: "https://pubmed.ncbi.nlm.nih.gov/20564754/",
    ),
    QuitMilestone(
      day: 90,
      title: "Memory Enhancement",
      description:
          "Remember when you couldn't remember things? Your hippocampus is recovering from alcohol's neurotoxic effects. Three months in, and your memory formation is significantly improved.",
      reference: "Zahr & Pfefferbaum (2017) - Neuropsychology Review",
      link: "https://pubmed.ncbi.nlm.nih.gov/28424985/",
    ),
    QuitMilestone(
      day: 180,
      title: "Neuroplasticity Increases",
      description:
          "Your brain is literally rewiring itself for the better! Six months of sobriety allows for significant neural recovery and increased brain plasticity. It's like a software update for your mind.",
      reference: "Duka et al. (2011) - Addiction Biology",
      link: "https://pubmed.ncbi.nlm.nih.gov/21309956/",
    ),
    QuitMilestone(
      day: 365,
      title: "Cancer Risk Reduction",
      description:
          "A full year smoke-free from the bottle! Your risk for alcohol-related cancers (liver, breast, colorectal) begins to decrease significantly. Your cells are throwing a celebration party.",
      reference: "Bagnardi et al. (2015) - British Journal of Cancer",
      link: "https://pubmed.ncbi.nlm.nih.gov/25734382/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Sober & Sparkling!',
      storageKey: 'alcohol',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) =>
          'Day $currentDay: Cheers to You!',
      headerTextNotStarted: 'Your Fresh Start!',
      headerSubtitleStartedBuilder: (currentDay) => 'Every day is a win! 🥳',
      headerSubtitleNotStarted: 'Ready for a brighter you? ✨',
    );
  }
}
