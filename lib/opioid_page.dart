import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class OpioidPage extends StatelessWidget {
  final bool started;

  const OpioidPage({super.key, required this.started});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Acute Withdrawal Begins",
      description:
          "The hardest part starts now, but you're not alone. Acute withdrawal symptoms peak in the first 24-72 hours. This is your body beginning the healing process. Professional medical support is crucial during this phase.",
      reference: "Medical News Today - Opioid Withdrawal Timeline",
      link:
          "https://www.medicalnewstoday.com/articles/opioid-withdrawal-timeline",
    ),
    QuitMilestone(
      day: 7,
      title: "Physical Symptoms Peak & Begin Declining",
      description:
          "You've made it through the storm! The worst physical withdrawal symptoms typically peak around days 3-5 and start declining by day 7. Your body is working hard to restore its natural balance.",
      reference: "Medical News Today - Opioid Withdrawal Timeline",
      link:
          "https://www.medicalnewstoday.com/articles/opioid-withdrawal-timeline",
    ),
    QuitMilestone(
      day: 14,
      title: "Sleep Patterns Start Improving",
      description:
          "Sweet dreams are making a comeback! Two weeks in, your natural sleep architecture begins to restore. Opioids disrupt REM sleep, but your brain is learning to dream naturally again.",
      reference:
          "Bidirectional Relationship between Opioids and Disrupted Sleep: Putative Mechanisms",
      link:
          "https://molpharm.aspetjournals.org/article/S0026-895X(24)01026-5/fulltext",
    ),
    QuitMilestone(
      day: 30,
      title: "Cognitive Function Begins Recovery",
      description:
          "Brain fog is starting to lift! One month clean and your cognitive function, decision-making, and memory are beginning to improve. Your prefrontal cortex is healing from opioid-induced changes.",
      reference: "Mayo Clinic - How Opioid Use Disorder Occurs",
      link:
          "https://www.mayoclinic.org/diseases-conditions/prescription-drug-abuse/in-depth/how-opioid-addiction-occurs/art-20360372",
    ),
    QuitMilestone(
      day: 60,
      title: "Emotional Regulation Improves",
      description:
          "Your emotions are finding their natural rhythm again. Two months in recovery and your brain's reward system is starting to respond to everyday pleasures. The emotional rollercoaster is stabilizing.",
      reference: "Recovery Research Institute - The Brain in Recovery",
      link: "https://www.recoveryanswers.org/recovery-101/brain-in-recovery/",
    ),
    QuitMilestone(
      day: 90,
      title: "Dopamine Function Significantly Recovers",
      description:
          "Your brain's reward system is throwing a welcome-back party! Three months clean and dopamine function has significantly improved. Natural activities start feeling rewarding again - food, music, relationships.",
      reference: "Robert Alexander Center - Brain Recovery Timeline",
      link:
          "https://robertalexandercenter.com/brain-recovery-from-opioid-addiction-a-timeline/",
    ),
    QuitMilestone(
      day: 180,
      title: "Immune System Strengthens",
      description:
          "Your immune system is back on patrol duty! Six months of recovery and your body's natural defenses have significantly strengthened. You're better equipped to fight off infections and illness.",
      reference:
          "Effects of opioid tolerance and withdrawal on the immune system",
      link: "https://pubmed.ncbi.nlm.nih.gov/18040801/",
    ),
    QuitMilestone(
      day: 365,
      title: "Neural Plasticity & Brain Structure Improve",
      description:
          "Your brain has been busy renovating! One full year of recovery shows significant improvements in brain structure and neural plasticity. The changes from chronic opioid use are healing beautifully.",
      reference:
          "Neuroplasticity of the extended amygdala in opioid withdrawal and prolonged opioid abstinence",
      link:
          "https://www.frontiersin.org/journals/pharmacology/articles/10.3389/fphar.2023.1253736/full",
    ),
    QuitMilestone(
      day: 730,
      title: "Long-term Recovery Stability (2 Years)",
      description:
          "Two years of strength and resilience! You've built new neural pathways, coping strategies, and life patterns. Research shows that reaching this milestone dramatically reduces relapse risk. You're a recovery warrior!",
      reference: "CDC - Treatment of Opioid Use Disorder",
      link:
          "https://www.cdc.gov/overdose-prevention/treatment/opioid-use-disorder.html",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitMilestonesPage(
      title: 'Path to peace',
      storageKey: 'opioids',
      milestones: milestones,
      headerStarted: 'Stronger every day!',
      headerNotStarted: 'Road to recovery!',
      subtitleStarted: 'Embrace your strength 💪',
      subtitleNotStarted: 'Ready to reclaim your life? 💖',
      infoBoxMessage:
          'Recovery is a medical process. Always consult healthcare professionals.',
      initialStarted: started,
    );
  }
}
