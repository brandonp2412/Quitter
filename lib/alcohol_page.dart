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
      reference: "WebMD - What Happens When You Quit Drinking",
      link:
          "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
    ),
    QuitMilestone(
      day: 3,
      title: "Hydration Levels Restore",
      description:
          "Your kidneys are finally getting a break from processing alcohol's diuretic effects. Say goodbye to that perpetual hangover thirst and hello to actually glowing skin!",
      reference: "Healthline - What Happens When You Stop Drinking Alcohol",
      link: "https://www.healthline.com/health/quit-drinking-alcohol",
    ),
    QuitMilestone(
      day: 7,
      title: "Immune System Strengthens",
      description:
          "Your white blood cells are back on patrol duty! Alcohol suppresses immune function, so after a week, your body's defense system is already getting back to fighting form.",
      reference: "Medical News Today - Benefits of Not Drinking Alcohol",
      link:
          "https://www.medicalnewstoday.com/articles/benefits-of-not-drinking-alcohol",
    ),
    QuitMilestone(
      day: 14,
      title: "Mental Clarity Returns",
      description:
          "Brain fog, begone! Alcohol affects neurotransmitter balance and cognitive function. Two weeks in, and your mental sharpness is making a comeback worthy of a superhero montage.",
      reference: "Cleveland Clinic - Alcohol Withdrawal Symptoms",
      link: "https://my.clevelandclinic.org/health/diseases/alcohol-withdrawal",
    ),
    QuitMilestone(
      day: 30,
      title: "Blood Pressure Normalizes",
      description:
          "Your cardiovascular system is sending thank-you cards. Regular alcohol consumption elevates blood pressure, but a month sober and your heart is already working more efficiently.",
      reference:
          "The Conversation - Timeline of Health Benefits When You Stop Drinking",
      link:
          "https://theconversation.com/even-a-day-off-alcohol-makes-a-difference-our-timeline-maps-the-health-benefits-when-you-stop-drinking-249272",
    ),
    QuitMilestone(
      day: 60,
      title: "Liver Function Improves",
      description:
          "Your liver is practically doing cartwheels! This amazing organ can regenerate, and after two months, liver enzymes and fat accumulation show significant improvement.",
      reference: "Cleveland Clinic - How Long to Detox From Alcohol",
      link: "https://health.clevelandclinic.org/detox-liver-from-alcohol",
    ),
    QuitMilestone(
      day: 90,
      title: "Memory Enhancement",
      description:
          "Remember when you couldn't remember things? Your hippocampus is recovering from alcohol's neurotoxic effects. Three months in, and your memory formation is significantly improved.",
      reference: "Addiction Center - First Year After You Stop Drinking",
      link:
          "https://www.addictioncenter.com/community/first-year-after-you-stop-drinking/",
    ),
    QuitMilestone(
      day: 180,
      title: "Neuroplasticity Increases",
      description:
          "Your brain is literally rewiring itself for the better! Six months of sobriety allows for significant neural recovery and increased brain plasticity. It's like a software update for your mind.",
      reference: "Priory Group - Benefits of Giving Up Alcohol for a Month",
      link:
          "https://www.priorygroup.com/blog/benefits-of-giving-up-alcohol-for-a-month",
    ),
    QuitMilestone(
      day: 365,
      title: "Cancer Risk Reduction",
      description:
          "A full year smoke-free from the bottle! Your risk for alcohol-related cancers (liver, breast, colorectal) begins to decrease significantly. Your cells are throwing a celebration party.",
      reference: "NHS - Alcohol-Related Liver Disease Treatment",
      link:
          "https://www.nhs.uk/conditions/alcohol-related-liver-disease-arld/treatment/",
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
