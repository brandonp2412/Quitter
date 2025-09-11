import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class SmokingPage extends StatelessWidget {
  final bool initialStarted;

  const SmokingPage({super.key, required this.initialStarted});

  final List<QuitMilestone> milestones = const [
    QuitMilestone(
      day: 1,
      title: "Carbon Monoxide Clears",
      description:
          "Your blood is breathing again! Within 24 hours, carbon monoxide levels drop to normal and oxygen levels increase. Your heart doesn't have to work overtime anymore to pump poisoned blood around your body.",
      reference: "NHS Better Health - Quit Smoking Timeline",
      link: "https://www.nhs.uk/better-health/quit-smoking/",
    ),
    QuitMilestone(
      day: 3,
      title: "Nicotine Withdrawal Peaks",
      description:
          "The nicotine monster is at its angriest, but you're winning the battle! All nicotine has left your system. The worst cravings happen now, but they're also your ticket to freedom on the other side.",
      reference:
          'McLaughlin, Ian, et al. "Nicotine withdrawal." Current Topics in Behavioral Neurosciences',
      link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
    ),
    QuitMilestone(
      day: 7,
      title: "Taste & Smell Dramatically Improve",
      description:
          "Food is about to become an adventure again! Smoking destroys taste buds and smell receptors. One week in, and you're rediscovering flavors you forgot existed. Prepare for some serious food appreciation!",
      reference: "NHS Better Health - Quit Smoking Benefits",
      link: "https://www.nhs.uk/better-health/quit-smoking/",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation & Walking Improve",
      description:
          "Your legs are thanking you with every step! Blood circulation improves dramatically, making walking and exercise noticeably easier. Those stairs aren't looking so intimidating anymore, are they?",
      reference: "Medical News Today - Timeline After Quitting Smoking",
      link: "https://www.medicalnewstoday.com/articles/317956",
    ),
    QuitMilestone(
      day: 30,
      title: "Lung Function Increases",
      description:
          "Your lungs are throwing a comeback party! Cilia have regrown and are sweeping out years of tar and debris. Lung capacity increases significantly, and that smoker's cough is history.",
      reference: "PMC - Smoking Cessation for People with COPD",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6400424/",
    ),
    QuitMilestone(
      day: 90,
      title: "Heart Attack Risk Drops Significantly",
      description:
          "Your heart is sending love letters! Three months smoke-free and your cardiovascular risk has already dropped substantially. Your cardiovascular system is healing faster than you might think possible.",
      reference:
          "PMC - Cardiovascular Effects of Smoking and Smoking Cessation (2024)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11843939/",
    ),
    QuitMilestone(
      day: 180,
      title: "Immune System Strengthens",
      description:
          "Your immune system just got a superhero upgrade! Six months without smoking and your white blood cells are back to full strength, fighting infections like the champions they were born to be.",
      reference: "Smoke Free NZ - The benefits of quitting",
      link:
          "https://www.smokefree.org.nz/quit/tips-and-advice/the-benefits-of-quitting",
    ),
    QuitMilestone(
      day: 365,
      title: "Stroke Risk Reduces Significantly",
      description:
          "One full year of freedom! Your stroke risk has decreased substantially, and your blood vessels are healing beautifully. You've officially given your brain the gift of better circulation and protection.",
      reference: "PMC - Smoking Cessation and Outcome After Ischemic Stroke",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5644463/",
    ),
    QuitMilestone(
      day: 1825,
      title: "Cancer Risk Plummets (5 Years)",
      description:
          "Five years of victory! Your risk of mouth, throat, esophagus, and bladder cancers has dropped by half. Lung cancer risk has decreased significantly too. Your cells have had time to repair and regenerate.",
      reference: "CDC - Benefits of Quitting Smoking",
      link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return QuitPageTemplate(
      title: 'Smoke-Free & Soaring',
      storageKey: 'smoking',
      milestones: milestones,
      headerTextStartedBuilder: (currentDay) => 'Breathe Easy!',
      headerTextNotStarted: 'Smoke-Free Journey!',
      headerSubtitleStartedBuilder: (currentDay) =>
          'Every puff-free day is a win 🚭',
      headerSubtitleNotStarted: 'Ready to reclaim your health? ✨',
      initialStarted: initialStarted,
    );
  }
}
