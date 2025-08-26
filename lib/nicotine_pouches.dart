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
      reference: "Vennemann et al. (2008) - Chemical Senses",
      link: "https://pubmed.ncbi.nlm.nih.gov/18595826/",
    ),
    QuitMilestone(
      day: 3,
      title: "Nicotine Completely Cleared",
      description:
          "Your body has officially evicted all nicotine! While withdrawal symptoms might peak around now, remember - this is your brain rewiring itself for freedom. The hardest part is almost over.",
      reference: "Hukkanen et al. (2005) - Pharmacological Reviews",
      link: "https://pubmed.ncbi.nlm.nih.gov/16968945/",
    ),
    QuitMilestone(
      day: 7,
      title: "Oral Health Improves",
      description:
          "Your gums are throwing a celebration! Nicotine pouches can cause gum irritation and recession. After a week, blood flow to your gums normalizes and healing begins.",
      reference: "Caraway et al. (2020) - Tobacco Control",
      link: "https://pubmed.ncbi.nlm.nih.gov/32354768/",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation Enhancement",
      description:
          "Your blood vessels are doing a happy dance! Nicotine constricts blood vessels, but two weeks free and your circulation is significantly improved. Hello, warmer hands and feet!",
      reference: "Benowitz & Burbank (2016) - Annual Review of Pharmacology",
      link: "https://pubmed.ncbi.nlm.nih.gov/26514203/",
    ),
    QuitMilestone(
      day: 30,
      title: "Stress Response Normalizes",
      description:
          "Plot twist: nicotine actually increases stress between uses! Your cortisol levels and stress response are now returning to baseline. Real relaxation, not the nicotine fake-out.",
      reference: "Parrott (1999) - Addiction",
      link: "https://pubmed.ncbi.nlm.nih.gov/10605870/",
    ),
    QuitMilestone(
      day: 60,
      title: "Sleep Quality Improves",
      description:
          "Sweet dreams are made of... no nicotine! While nicotine seems relaxing, it actually disrupts sleep architecture. Two months in, and your REM cycles are beautifully restored.",
      reference: "Zhang et al. (2006) - Sleep Medicine Reviews",
      link: "https://pubmed.ncbi.nlm.nih.gov/16564189/",
    ),
    QuitMilestone(
      day: 90,
      title: "Dopamine Receptors Recover",
      description:
          "Your brain's reward system is back online! Nicotine hijacks dopamine pathways, making normal pleasures seem dull. Three months free, and life's natural joys are vibrant again.",
      reference: "Koob & Volkow (2016) - Neuropsychopharmacology",
      link: "https://pubmed.ncbi.nlm.nih.gov/26482517/",
    ),
    QuitMilestone(
      day: 180,
      title: "Cardiovascular Risk Drops",
      description:
          "Your heart is sending love letters! Six months without nicotine significantly reduces cardiovascular disease risk. Your blood pressure and heart rate variability are vastly improved.",
      reference:
          "Benowitz & Fraiman (2017) - Journal of the American College of Cardiology",
      link: "https://pubmed.ncbi.nlm.nih.gov/28302290/",
    ),
    QuitMilestone(
      day: 365,
      title: "Long-term Health Secured",
      description:
          "One year of freedom! Your risk of nicotine-related health issues continues to plummet. You've broken the addiction cycle and reclaimed your autonomy. That's genuinely heroic! 🏆",
      reference: "West & Shiffman (2016) - Addiction",
      link: "https://pubmed.ncbi.nlm.nih.gov/27264552/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Pouch-Free Power!',
      storageKey: 'nicotine_pouches',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) =>
          'Day $currentDay: Fresh & Free!',
      headerTextNotStarted: 'Your Fresh Start!',
      headerSubtitleStartedBuilder: (currentDay) =>
          'Embrace a brighter, healthier you! ✨',
      headerSubtitleNotStarted: 'Ready to ditch the pouches? 🚀',
    );
  }
}
