import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class PornographyPage extends StatelessWidget {
  final bool started;

  const PornographyPage({super.key, required this.started});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Breaking the Cycle",
      description:
          "You've taken the hardest step! Day one is about breaking the automatic response pattern. Your brain is already starting to notice the absence of the dopamine spike it was expecting.",
      reference: "Neuroscience News - Pornography Brain Effects",
      link:
          "https://neurosciencenews.com/neuroscience-pornography-brain-15354/",
    ),
    QuitMilestone(
      day: 3,
      title: "Withdrawal Symptoms Peak",
      description:
          "The storm before the calm. Cravings, restlessness, and mood swings are at their strongest now. Your brain is working hard to rewire itself. This discomfort is actually your neural pathways healing!",
      reference: "Optimum Joy - Porn Withdrawal Symptoms Guide",
      link: "https://optimumjoy.com/blog/recognizing-porn-withdrawal-symptoms/",
    ),
    QuitMilestone(
      day: 7,
      title: "Sleep Quality Improves",
      description:
          "Sweet dreams are made of this! Your sleep cycles are stabilizing as your brain's reward system begins to rebalance. Many people report deeper, more restorative sleep and fewer sleep disturbances.",
      reference: "Tech Lockdown - Recovery Timeline Guide",
      link:
          "https://www.techlockdown.com/guides/porn-addiction-recovery-timeline",
    ),
    QuitMilestone(
      day: 14,
      title: "Motivation & Energy Return",
      description:
          "The fog is lifting! Many people notice increased motivation, clearer thinking, and more energy for real-world activities. Your brain's natural reward system is starting to find pleasure in everyday experiences again.",
      reference: "Addiction Help - Recovery Process",
      link: "https://www.addictionhelp.com/porn/recovery/",
    ),
    QuitMilestone(
      day: 30,
      title: "Confidence & Self-Control Grow",
      description:
          "You're building mental muscle! One month of abstinence often brings increased self-confidence, better emotional regulation, and a stronger sense of personal control. You're proving to yourself that you can overcome challenges.",
      reference: "Still Mind Florida - Recovery Timeline",
      link:
          "https://stillmindflorida.com/mental-health/porn-addiction-recovery-timeline/",
    ),
    QuitMilestone(
      day: 90,
      title: "Brain Function Stabilizes",
      description:
          "Your brain is finding its balance! Three months allows significant improvements in focus, decision-making, and emotional regulation. The compulsive urges are becoming much more manageable.",
      reference: "Mental Health - Brain Changes Research",
      link: "https://www.mentalhealth.com/library/the-brains-of-porn-addicts",
    ),
    QuitMilestone(
      day: 180,
      title: "Relationship & Social Skills Improve",
      description:
          "Connection is your superpower now! Six months often brings improved ability to form genuine connections, better eye contact, reduced social anxiety, and more authentic relationships with others.",
      reference: "Culture Reframed - Neuroscience Research",
      link: "https://culturereframed.org/neuroscience-of-pornography/",
    ),
    QuitMilestone(
      day: 365,
      title: "Complete Neural Pathway Reset",
      description:
          "You've rewired your brain! One year allows for substantial neural pathway changes. Many report complete transformation in how they view relationships, intimacy, and personal fulfillment. You've built a new you!",
      reference: "Rehab Support - Long-term Recovery",
      link: "https://therehabsupport.com/porn-addiction-recovery-timeline/",
    ),
    QuitMilestone(
      day: 1825,
      title: "Lasting Life Transformation (5 Years)",
      description:
          "Five years of freedom! You've established completely new neural patterns and life habits. Research suggests brain rewiring can take 1-60 months depending on addiction severity, and you've surpassed that milestone.",
      reference: "Simcoe Addiction - Brain Rewiring Timeline",
      link:
          "https://www.simcoerehab.ca/2024/02/09/how-long-to-rewire-your-brain-from-addiction/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Pure & powerful',
      storageKey: 'pornography',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) => 'Reclaiming your mind!',
      headerTextNotStarted: 'Freedom from pornography!',
      headerSubtitleStartedBuilder: (currentDay) =>
          'Building authentic connections 🧠✨',
      headerSubtitleNotStarted: 'Ready to break free and rebuild? 💪',
      initialStarted: started,
    );
  }
}
