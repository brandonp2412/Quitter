import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SocialMediaPage extends StatelessWidget {
  final bool started;

  const SocialMediaPage({super.key, required this.started});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Digital Detox Day One! 🎯",
      description:
          "You've officially started rewiring your brain! Research shows that even thinking about checking social media triggers the same neural pathways as addiction. But you're already breaking the cycle - go you!",
      reference: "Cleveland Clinic - Social Media Addiction",
      link:
          "https://health.clevelandclinic.org/is-it-possible-to-become-addicted-to-social-media",
    ),
    QuitMilestone(
      day: 3,
      title: "FOMO? More Like FO-NO! 😎",
      description:
          "Three days in and those anxious 'what am I missing?' thoughts are already fading. You're training your brain that real life is way more interesting than curated feeds!",
      reference: "Cleveland Clinic - Social Media Effects on Youth",
      link:
          "https://health.clevelandclinic.org/dangers-of-social-media-for-youth",
    ),
    QuitMilestone(
      day: 7,
      title: "Attention Span: Goldfish → Human 🧠",
      description:
          "Week one complete! Your ability to focus without checking your phone every few minutes is already improving. Studies show our brains crave the dopamine hits from notifications - but you're teaching yours to find rewards elsewhere!",
      reference: "WebMD - Digital Detox Benefits",
      link: "https://www.webmd.com/balance/what-is-digital-detox",
    ),
    QuitMilestone(
      day: 14,
      title: "Sleep Like a Baby (Not a Zombie) 😴",
      description:
          "Two weeks without scrolling before bed = better sleep quality! The blue light from screens suppresses melatonin production, but your natural sleep rhythms are bouncing back beautifully.",
      reference: "PMC - Two-Week Social Media Detox Study",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10740995/",
    ),
    QuitMilestone(
      day: 30,
      title: "Real Friends > Fake Likes 💝",
      description:
          "One month offline = significant reductions in loneliness and depression! Research proves that limiting social media creates major mental health improvements. You've gone even further!",
      reference: "HelpGuide.org - Social Media and Mental Health",
      link:
          "https://www.helpguide.org/mental-health/wellbeing/social-media-and-mental-health",
    ),
    QuitMilestone(
      day: 60,
      title: "Comparison Trap: ESCAPED! ✨",
      description:
          "Two months without constant social comparison = confidence through the roof! Research consistently shows that social media use correlates with decreased self-esteem, especially from upward social comparisons. You've broken free from the comparison trap!",
      reference: "McLean Hospital - How Social Media Affects Mental Health",
      link: "https://www.mcleanhospital.org/essential/social-media",
    ),
    QuitMilestone(
      day: 90,
      title: "Hobby Collector Level: Expert 🎨",
      description:
          "Three months = roughly 270+ hours reclaimed! That's enough time to learn a new skill, read 15+ books, or master that hobby you always said you'd try 'someday.' Neuroplasticity research shows your brain is literally rewiring for these new awesome habits!",
      reference: "Cleveland Clinic - 4 Reasons to Do a Digital Detox",
      link: "https://health.clevelandclinic.org/digital-detox",
    ),
    QuitMilestone(
      day: 180,
      title: "Mental Health Glow-Up Complete 🌟",
      description:
          "Six months offline and you're officially thriving! Long-term studies show that reducing social media use leads to sustained improvements in wellbeing, self-esteem, and life satisfaction. You're living proof that life's better in the real world!",
      reference: "PMC - Digital Social Media Detox Meta-Analysis",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11392003/",
    ),
    QuitMilestone(
      day: 365,
      title: "Digital Zen Master Achieved 🏆",
      description:
          "One full year of intentional living! You've reclaimed 1,000+ hours, formed deeper relationships, and proved that the best moments in life aren't meant for sharing - they're meant for experiencing. You're officially a digital wellness legend!",
      reference: "Mayo Clinic Press - Social Media on Mental Health",
      link:
          "https://mcpress.mayoclinic.org/mental-health/the-pros-and-cons-of-social-media-on-mental-health/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitMilestonesPage(
      title: 'Digital detox delight',
      storageKey: 'social_media',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) => 'Unplug & play!',
      headerTextNotStarted: 'Digital detox journey!',
      headerSubtitleStartedBuilder: (currentDay) =>
          'Real life is the best feed 💖',
      headerSubtitleNotStarted: 'Ready to reclaim your time? 🚀',
      initialStarted: started,
    );
  }
}
