import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class OpioidPage extends StatelessWidget {
  const OpioidPage({super.key});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Acute Withdrawal Begins",
      description:
          "The hardest part starts now, but you're not alone. Acute withdrawal symptoms peak in the first 24-72 hours. This is your body beginning the healing process. Professional medical support is crucial during this phase.",
      reference: "NCBI Bookshelf - Opioid Withdrawal (2023)",
      link: "https://www.ncbi.nlm.nih.gov/books/NBK526012/",
    ),
    QuitMilestone(
      day: 7,
      title: "Physical Symptoms Peak & Begin Declining",
      description:
          "You've made it through the storm! The worst physical withdrawal symptoms typically peak around days 3-5 and start declining by day 7. Your body is working hard to restore its natural balance.",
      reference:
          "NCBI Bookshelf - Clinical Guidelines for Withdrawal Management (2023)",
      link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
    ),
    QuitMilestone(
      day: 14,
      title: "Sleep Patterns Start Improving",
      description:
          "Sweet dreams are making a comeback! Two weeks in, your natural sleep architecture begins to restore. Opioids disrupt REM sleep, but your brain is learning to dream naturally again.",
      reference:
          "PMC - New Directions in Treatment of Opioid Withdrawal (2020)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7385662/",
    ),
    QuitMilestone(
      day: 30,
      title: "Cognitive Function Begins Recovery",
      description:
          "Brain fog is starting to lift! One month clean and your cognitive function, decision-making, and memory are beginning to improve. Your prefrontal cortex is healing from opioid-induced changes.",
      reference:
          "NCBI Bookshelf - The Neurobiology of Substance Use, Misuse, and Addiction",
      link: "https://www.ncbi.nlm.nih.gov/books/NBK424849/",
    ),
    QuitMilestone(
      day: 60,
      title: "Emotional Regulation Improves",
      description:
          "Your emotions are finding their natural rhythm again. Two months in recovery and your brain's reward system is starting to respond to everyday pleasures. The emotional rollercoaster is stabilizing.",
      reference: "PMC - The Neurobiology of Opioid Dependence (2010)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC2851054/",
    ),
    QuitMilestone(
      day: 90,
      title: "Dopamine Function Significantly Recovers",
      description:
          "Your brain's reward system is throwing a welcome-back party! Three months clean and dopamine function has significantly improved. Natural activities start feeling rewarding again - food, music, relationships.",
      reference:
          "PMC - Dopamine, Opioids, and PET Imaging of Human Brain (2019)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6892395/",
    ),
    QuitMilestone(
      day: 180,
      title: "Immune System Strengthens",
      description:
          "Your immune system is back on patrol duty! Six months of recovery and your body's natural defenses have significantly strengthened. You're better equipped to fight off infections and illness.",
      reference:
          "PMC - Effective Management of Opioid Withdrawal Symptoms (2019)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6590307/",
    ),
    QuitMilestone(
      day: 365,
      title: "Neural Plasticity & Brain Structure Improve",
      description:
          "Your brain has been busy renovating! One full year of recovery shows significant improvements in brain structure and neural plasticity. The changes from chronic opioid use are healing beautifully.",
      reference:
          "PMC - Allostatic Changes in cAMP System Drive Opioid-Induced Adaptation (2019)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6871051/",
    ),
    QuitMilestone(
      day: 730,
      title: "Long-term Recovery Stability (2 Years)",
      description:
          "Two years of strength and resilience! You've built new neural pathways, coping strategies, and life patterns. Research shows that reaching this milestone dramatically reduces relapse risk. You're a recovery warrior!",
      reference:
          "NIDA - Drugs, Brains, and Behavior: The Science of Addiction (2025)",
      link:
          "https://nida.nih.gov/publications/drugs-brains-behavior-science-addiction/drugs-brain",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Path to Peace!',
      storageKey: 'opioids',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) =>
          'Day $currentDay: Stronger Every Day!',
      headerTextNotStarted: 'Your Fresh Start!',
      headerSubtitleStartedBuilder: (currentDay) => 'Embrace your strength! 💪',
      headerSubtitleNotStarted: 'Ready to reclaim your life? 💖',
      infoBoxMessage:
          'Recovery is a medical process. Always consult healthcare professionals.',
    );
  }
}
