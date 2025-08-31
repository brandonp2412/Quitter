import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class NicotinePouchesPage extends StatelessWidget {
  const NicotinePouchesPage({super.key});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Taste & Smell Begin Recovery",
      description:
          "Nicotine dulls your taste buds and smell receptors. After just 24 hours without pouches, these senses start their comeback tour! Food is about to taste amazing again.",
      reference: "Medical News Today - Nicotine Withdrawal Timeline",
      link:
          "https://www.medicalnewstoday.com/articles/nicotine-withdrawal-timeline",
    ),
    QuitMilestone(
      day: 3,
      title: "Nicotine Completely Cleared",
      description:
          "Your body has officially evicted all nicotine! While withdrawal symptoms might peak around now, remember - this is your brain rewiring itself for freedom. The hardest part is almost over.",
      reference: "Cleveland Clinic - Nicotine Withdrawal",
      link:
          "https://my.clevelandclinic.org/health/diseases/21587-nicotine-withdrawal",
    ),
    QuitMilestone(
      day: 7,
      title: "Oral Health Improves",
      description:
          "Your gums are throwing a celebration! Nicotine pouches can cause gum irritation and recession. After a week, blood flow to your gums normalizes and healing begins.",
      reference: "Cleveland Clinic - Smokeless Tobacco Effects",
      link: "https://my.clevelandclinic.org/health/articles/smokeless-tobacco",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation Enhancement",
      description:
          "Your blood vessels are doing a happy dance! Nicotine constricts blood vessels, but two weeks free and your circulation is significantly improved. Hello, warmer hands and feet!",
      reference: "WebMD - Nicotine Pouches Use and Risks",
      link: "https://www.webmd.com/smoking-cessation/nicotine-pouches",
    ),
    QuitMilestone(
      day: 30,
      title: "Stress Response Normalizes",
      description:
          "Plot twist: nicotine actually increases stress between uses! Your cortisol levels and stress response are now returning to baseline. Real relaxation, not the nicotine fake-out.",
      reference: "Mayo Clinic - Resisting Tobacco Cravings",
      link:
          "https://www.mayoclinic.org/diseases-conditions/nicotine-dependence/in-depth/nicotine-craving/art-20045454",
    ),
    QuitMilestone(
      day: 60,
      title: "Sleep Quality Improves",
      description:
          "Sweet dreams are made of... no nicotine! While nicotine seems relaxing, it actually disrupts sleep architecture. Two months in, and your REM cycles are beautifully restored.",
      reference: "National Cancer Institute - Nicotine Withdrawal Tips",
      link:
          "https://www.cancer.gov/about-cancer/causes-prevention/risk/tobacco/withdrawal-fact-sheet",
    ),
    QuitMilestone(
      day: 90,
      title: "Dopamine Receptors Recover",
      description:
          "Your brain's reward system is back online! Nicotine hijacks dopamine pathways, making normal pleasures seem dull. Three months free, and life's natural joys are vibrant again.",
      reference: "Smokefree Veterans - How to Quit Dipping",
      link:
          "https://veterans.smokefree.gov/quit-dip-vapes/smokeless-tobacco/how-to-quit",
    ),
    QuitMilestone(
      day: 180,
      title: "Cardiovascular Risk Drops",
      description:
          "Your heart is sending love letters! Six months without nicotine significantly reduces cardiovascular disease risk. Your blood pressure and heart rate variability are vastly improved.",
      reference: "CDC - Benefits of Quitting Smoking",
      link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
    ),
    QuitMilestone(
      day: 365,
      title: "Long-term Health Secured",
      description:
          "One year of freedom! Your risk of nicotine-related health issues continues to plummet. You've broken the addiction cycle and reclaimed your autonomy. That's genuinely heroic! 🏆",
      reference: "CDC - Nicotine Pouches Health Information",
      link: "https://www.cdc.gov/tobacco/nicotine-pouches/index.html",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Pouch-Free Power',
      storageKey: 'nicotine_pouches',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) => 'Fresh & Free!',
      headerTextNotStarted: 'Your Fresh Start!',
      headerSubtitleStartedBuilder: (currentDay) =>
          'Embrace a brighter, healthier you ✨',
      headerSubtitleNotStarted: 'Ready to ditch the pouches? 🚀',
    );
  }
}
