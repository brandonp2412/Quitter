import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({super.key});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Digital Detox Day One! 🎯",
      description:
          "You've officially started rewiring your brain! Research shows that even thinking about checking social media triggers the same neural pathways as addiction. But you're already breaking the cycle - go you!",
      reference: "Haynes et al. (2012) - Internet addiction in students",
      link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3480687/",
    ),
    QuitMilestone(
      day: 3,
      title: "FOMO? More Like FO-NO! 😎",
      description:
          "Three days in and those anxious 'what am I missing?' thoughts are already fading. You're training your brain that real life is way more interesting than curated feeds!",
      reference: "University of Pennsylvania self-monitoring benefits study",
      link: "https://guilfordjournals.com/doi/10.1521/jscp.2018.37.10.751",
    ),
    QuitMilestone(
      day: 7,
      title: "Attention Span: Goldfish → Human 🧠",
      description:
          "Week one complete! Your ability to focus without checking your phone every few minutes is already improving. Studies show our brains crave the dopamine hits from notifications - but you're teaching yours to find rewards elsewhere!",
      reference: "Ward et al. (2017) - Brain drain hypothesis",
      link: "https://www.journals.uchicago.edu/doi/abs/10.1086/691462",
    ),
    QuitMilestone(
      day: 14,
      title: "Sleep Like a Baby (Not a Zombie) 😴",
      description:
          "Two weeks without scrolling before bed = better sleep quality! The blue light from screens suppresses melatonin production, but your natural sleep rhythms are bouncing back beautifully.",
      reference: "Woods & Scott (2016) - #Sleepyteens study",
      link:
          "https://onlinelibrary.wiley.com/doi/abs/10.1016/j.adolescence.2016.05.008",
    ),
    QuitMilestone(
      day: 30,
      title: "Real Friends > Fake Likes 💝",
      description:
          "One month offline = significant reductions in loneliness and depression! The University of Pennsylvania proved that limiting social media to just 30 minutes a day creates major mental health improvements. You've gone even further!",
      reference: "Hunt, Marx & Lipson (2018) - No More FOMO study",
      link: "https://guilfordjournals.com/doi/10.1521/jscp.2018.37.10.751",
    ),
    QuitMilestone(
      day: 60,
      title: "Comparison Trap: ESCAPED! ✨",
      description:
          "Two months without constant social comparison = confidence through the roof! Research consistently shows that social media use correlates with decreased self-esteem, especially from upward social comparisons. You've broken free from the comparison trap!",
      reference: "Nesi & Prinstein (2015) - Social media and self-esteem",
      link: "https://onlinelibrary.wiley.com/doi/abs/10.1111/jora.12146",
    ),
    QuitMilestone(
      day: 90,
      title: "Hobby Collector Level: Expert 🎨",
      description:
          "Three months = roughly 270+ hours reclaimed! That's enough time to learn a new skill, read 15+ books, or master that hobby you always said you'd try 'someday.' Neuroplasticity research shows your brain is literally rewiring for these new awesome habits!",
      reference: "Lally et al. (2010) - How long to form a habit",
      link: "https://onlinelibrary.wiley.com/doi/abs/10.1002/ejsp.674",
    ),
    QuitMilestone(
      day: 180,
      title: "Mental Health Glow-Up Complete 🌟",
      description:
          "Six months offline and you're officially thriving! Long-term studies show that reducing social media use leads to sustained improvements in wellbeing, self-esteem, and life satisfaction. You're living proof that life's better in the real world!",
      reference:
          "Shakya & Christakis (2017) - Facebook use and life satisfaction",
      link:
          "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0185501",
    ),
    QuitMilestone(
      day: 365,
      title: "Digital Zen Master Achieved 🏆",
      description:
          "One full year of intentional living! You've reclaimed 1,000+ hours, formed deeper relationships, and proved that the best moments in life aren't meant for sharing - they're meant for experiencing. You're officially a digital wellness legend!",
      reference:
          "Twenge & Campbell (2018) - Screen time and psychological well-being",
      link: "https://journals.sagepub.com/doi/10.1177/0956797617741719",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Digital Detox Delight!',
      storageKey: 'social_media',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) =>
          'Day $currentDay: Unplug & Play!',
      headerTextNotStarted: 'Your Fresh Start!',
      headerSubtitleStartedBuilder: (currentDay) =>
          'Real life is the best feed! 💖',
      headerSubtitleNotStarted: 'Ready to reclaim your time? 🚀',
    );
  }
}
