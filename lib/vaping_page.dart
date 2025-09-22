import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class VapingPage extends StatelessWidget {
  final bool started;

  const VapingPage({super.key, required this.started});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Nicotine Cravings Peak",
      description:
          "Your brain is throwing a nicotine tantrum, but you're already winning! Within 24 hours, nicotine levels drop dramatically. The worst cravings happen now, but they're also the most important to push through.",
      reference: "Cleveland Clinic - Nicotine Withdrawal Guide",
      link:
          "https://my.clevelandclinic.org/health/diseases/21587-nicotine-withdrawal",
    ),
    QuitMilestone(
      day: 3,
      title: "Breathing Improves",
      description:
          "Your lungs are doing a happy dance! Bronchial tubes begin to relax and lung capacity starts improving. That tight chest feeling from vaping is already beginning to ease up.",
      reference: "Healthline - What Are the Beefits of Quitting Vaping?",
      link: "https://www.healthline.com/health/benefits-of-quitting-vaping",
    ),
    QuitMilestone(
      day: 7,
      title: "Taste & Smell Return",
      description:
          "Food is about to taste amazing again! Nicotine dampens taste buds and smell receptors. A week in, and your sensory superpowers are making their comeback tour.",
      reference: "Medical News Today - Timeline After Quitting Smoking",
      link: "https://www.medicalnewstoday.com/articles/317956",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation Improves",
      description:
          "Your blood is flowing like a champion! Nicotine constricts blood vessels, but two weeks smoke-free and your circulation is dramatically improving. Cold hands and feet, begone!",
      reference: "Truth Initiative - Benefits of Quitting Smoking or Vaping",
      link:
          "https://truthinitiative.org/research-resources/quitting-smoking-vaping/breath-fresh-air-immediate-benefits-quitting-smoking-or",
    ),
    QuitMilestone(
      day: 30,
      title: "Lung Function Recovery",
      description:
          "Your lungs are practically throwing a celebration parade! Cilia (tiny lung cleaners) have regenerated and lung function has improved significantly. That morning cough is history!",
      reference: "Medical News Today - Can your lungs heal from vaping?",
      link:
          "https://www.medicalnewstoday.com/articles/effects-of-vaping-on-lungs",
    ),
    QuitMilestone(
      day: 60,
      title: "Anxiety Levels Normalize",
      description:
          "Plot twist: vaping was making your anxiety problems worse, not better! Two months in and your baseline anxiety levels are significantly lower. Your nervous system is finally chilling out.",
      reference:
          "Charlie Health - The Vaping Withdrawal Timeline (and What to Expect When You Quit)",
      link: "https://www.charliehealth.com/post/vaping-withdrawal-timeline",
    ),
    QuitMilestone(
      day: 90,
      title: "Cognitive Function Sharpens",
      description:
          "Brain fog has officially left the building! Three months without nicotine and your cognitive function, focus, and memory are significantly improved. It's like upgrading your mental RAM.",
      reference: "WebMD - Understanding Nicotine Withdrawal Symptoms",
      link:
          "https://www.webmd.com/smoking-cessation/understanding-nicotine-withdrawal-symptoms",
    ),
    QuitMilestone(
      day: 180,
      title: "Oral Health Recovery",
      description:
          "Your mouth is sending thank-you cards! Six months vape-free and gum inflammation decreases, tooth staining fades, and your risk of oral health issues drops substantially.",
      reference:
          "Hobsonville Point Dental - The effects of vaping on your oral health",
      link:
          "https://www.hobsonvillepointdental.co.nz/blog/news/the-effects-vaping-has-on-your-oral-health.html",
    ),
    QuitMilestone(
      day: 365,
      title: "Cardiovascular Risk Reduction",
      description:
          "Your heart is literally stronger! One full year and your risk of heart disease has dropped significantly. Your cardiovascular system has recovered from nicotine's daily assault course.",
      reference:
          "American Cancer Society - Health Benefits of Quitting Over Time",
      link:
          "https://www.cancer.org/cancer/risk-prevention/tobacco/guide-quitting-smoking/benefits-of-quitting-smoking-over-time.html",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitMilestonesPage(
      title: 'Vape-free victory',
      storageKey: 'vaping',
      milestones: milestones,
      headerStarted: 'Clear skies ahead!',
      headerNotStarted: 'Vape-free living!',
      subtitleStarted: 'Breathing easy, living free 🌬️',
      subtitleNotStarted: 'Ready to ditch the vape? ✨',
      initialStarted: started,
    );
  }
}
