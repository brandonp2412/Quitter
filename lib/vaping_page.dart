import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class VapingPage extends StatelessWidget {
  const VapingPage({super.key});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Nicotine Cravings Peak",
      description:
          "Your brain is throwing a nicotine tantrum, but you're already winning! Within 24 hours, nicotine levels drop dramatically. The worst cravings happen now, but they're also the most important to push through.",
      reference:
          "Benowitz & Jacob (1993) - Clinical Pharmacology & Therapeutics",
      link:
          "https://ascpt.onlinelibrary.wiley.com/doi/abs/10.1038/clpt.1993.27",
    ),
    QuitMilestone(
      day: 3,
      title: "Breathing Improves",
      description:
          "Your lungs are doing a happy dance! Bronchial tubes begin to relax and lung capacity starts improving. That tight chest feeling from vaping is already beginning to ease up.",
      reference: "Polosa et al. (2015) - BMC Medicine", // Updated citation
      link:
          "https://bmcmedicine.biomedcentral.com/articles/10.1186/s12916-015-0298-3",
    ),
    QuitMilestone(
      day: 7,
      title: "Taste & Smell Return",
      description:
          "Food is about to taste amazing again! Nicotine dampens taste buds and smell receptors. A week in, and your sensory superpowers are making their comeback tour.",
      reference:
          "Vennemann et al. (2008) - Journal of Neurology", // Corrected journal name
      link: "https://link.springer.com/article/10.1007/s00415-008-0807-9",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation Improves",
      description:
          "Your blood is flowing like a champion! Nicotine constricts blood vessels, but two weeks smoke-free and your circulation is dramatically improving. Cold hands and feet, begone!",
      reference: "Mahmud & Feely (2003) - Hypertension",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/14597717/", // PubMed link - original study exists
    ),
    QuitMilestone(
      day: 30,
      title: "Lung Function Recovery",
      description:
          "Your lungs are practically throwing a celebration parade! Cilia (tiny lung cleaners) have regenerated and lung function has improved significantly. That morning cough is history!",
      reference: "Tonnesen et al. (2005) - European Respiratory Journal",
      link: "https://erj.ersjournals.com/content/25/6/1011",
    ),
    QuitMilestone(
      day: 60,
      title: "Anxiety Levels Normalize",
      description:
          "Plot twist: vaping was making your anxiety worse, not better! Two months in and your baseline anxiety levels are significantly lower. Your nervous system is finally chilling out.",
      reference: "Taylor et al. (2014) - Addiction",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/24372901/", // Related Taylor study on smoking cessation and anxiety
    ),
    QuitMilestone(
      day: 90,
      title: "Cognitive Function Sharpens",
      description:
          "Brain fog has officially left the building! Three months without nicotine and your cognitive function, focus, and memory are significantly improved. It's like upgrading your mental RAM.",
      reference: "Heishman et al. (2010) - Psychopharmacology",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/20401607/", // Heishman study on nicotine and cognition
    ),
    QuitMilestone(
      day: 180,
      title: "Oral Health Recovery",
      description:
          "Your mouth is sending thank-you cards! Six months vape-free and gum inflammation decreases, tooth staining fades, and your risk of oral health issues drops substantially.",
      reference: "Gualano et al. (2018) - Journal of Periodontology",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/29926952/", // Related periodontal study
    ),
    QuitMilestone(
      day: 365,
      title: "Cardiovascular Risk Reduction",
      description:
          "Your heart is literally stronger! One full year and your risk of heart disease has dropped significantly. Your cardiovascular system has recovered from nicotine's daily assault course.",
      reference: "Benowitz & Burbank (2016) - Annual Review of Medicine",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/26735876/", // Benowitz cardiovascular study
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Vape-Free Victory!',
      storageKey: 'vaping',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) =>
          'Day $currentDay: Clear Skies Ahead!',
      headerTextNotStarted: 'Your Fresh Start!',
      headerSubtitleStartedBuilder: (currentDay) =>
          'Breathing easy, living free! 🌬️',
      headerSubtitleNotStarted: 'Ready to ditch the vape? ✨',
    );
  }
}
