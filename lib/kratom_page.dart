import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class KratomPage extends StatelessWidget {
  final bool started;

  const KratomPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.kratomMilestone1Title,
        description: l10n.kratomMilestone1Description,
        reference:
            "Swogger et al. (2022) - Understanding Kratom Use: A Guide for Healthcare Providers (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8924421/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.kratomReferenceDay1,
        referenceContent:
            "Kratom Withdrawal: The First Day\n\nSource: Swogger et al. (2022), \"Understanding Kratom Use: A Guide for Healthcare Providers,\" Frontiers in Pharmacology\n\nWhy Withdrawal Happens\nKratom's active compounds act on the same opioid receptors as classical opioids. With regular use the body adapts, so stopping produces an opioid-like withdrawal. This clinical guide describes dependence and withdrawal as recognised risks of regular kratom use.\n\nWhat the Evidence Shows About Onset\nAnimal studies cited in the guide show somatic withdrawal signs emerging within about 12 hours, with anxiety-like effects evident by 24 hours; precise human onset timing is less established, but early symptoms commonly reported include:\n• Restlessness, anxiety, and irritability\n• Muscle aches and runny nose\n• Sweating and watery eyes\n• Cravings\n\nA Note on Severity\nThe guide notes that longer duration of use and higher doses are linked to more severe, longer-lasting withdrawal. Supervised medical support is worth seeking, particularly if kratom was used at high doses or alongside opioids.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.kratomMilestone3Title,
        description: l10n.kratomMilestone3Description,
        reference:
            "Singh et al. (2014) - Kratom Dependence, Withdrawal Symptoms and Craving (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/24698080/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.kratomReferenceDay3,
        referenceContent:
            "Kratom Withdrawal: The Hardest Days\n\nSource: Singh et al. (2014), Drug and Alcohol Dependence — survey of 293 regular kratom users in Malaysia\n\nWhat the Evidence Shows\nRather than a single defined 'peak day,' this survey found withdrawal severity tracks how much and how long someone used: people drinking three or more glasses of kratom daily had significantly higher odds of severe dependence and more difficult withdrawal. For most people, the first few days after stopping are the hardest.\n\nSymptoms Commonly Reported\n• Muscle and joint aches, restless legs\n• Insomnia despite exhaustion\n• Nausea, stomach cramps, and diarrhoea\n• Anxiety, low mood, and irritability\n• Strong cravings\n\nGetting Through It\nHydration, rest, and symptomatic support help. If withdrawal has felt severe so far, that lines up with heavier or longer use rather than something being unusually wrong — and it tends to ease from here.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.kratomMilestone7Title,
        description: l10n.kratomMilestone7Description,
        reference:
            "Swogger et al. (2022) - Understanding Kratom Use: A Guide for Healthcare Providers (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8924421/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.kratomReferenceDay7,
        referenceContent:
            "One Week Off Kratom\n\nSource: Swogger et al. (2022), \"Understanding Kratom Use: A Guide for Healthcare Providers,\" Frontiers in Pharmacology\n\nPast the Acute Phase\nHuman self-report data cited in this guide indicates withdrawal symptoms resolve within about one to three days for most people who stop. By one week, the acute physical symptoms — muscle aches, sweating, nausea — have typically settled for the majority. What can remain is more psychological: fatigue, disrupted sleep, and low mood as the opioid receptors kratom was stimulating adjust back to the body's own signals.\n\nA Real Risk\nThe guide also notes that a small number of people find kratom very difficult to quit, with more severe and longer-lasting withdrawal reported among heavier, longer-term users. This week is a common point for relapse, and tolerance drops quickly — returning to a previous dose, particularly if opioids are involved, is now genuinely dangerous.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.kratomMilestone14Title,
        description: l10n.kratomMilestone14Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.kratomReferenceDay14,
        referenceContent:
            "Two Weeks Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nBeyond the Studied Window\nControlled human data on kratom withdrawal timing generally covers only the first few days, so there isn't well-established research pinning down a specific 'two week' milestone. What is documented is the broader pattern: kratom acts on the same opioid receptors as classical opioids, and as regular use stops those receptors gradually restore their sensitivity to the body's own signals.\n\nWhat People Commonly Report\n• Appetite and energy often improve\n• Sleep tends to become more reliable\n• Mood is typically steadier, though still variable\n\nCravings are still triggered by stress and familiar cues, so having a plan for them remains useful.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.kratomMilestone30Title,
        description: l10n.kratomMilestone30Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.kratomReferenceDay30,
        referenceContent:
            "One Month Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nA Reward System Recovering\nNIDA describes kratom as acting on the brain's opioid receptors, with dependence and withdrawal as recognised risks of regular use. There is no specific study pinning a 'one month' recovery milestone, but the general pattern for opioid-receptor-based dependence is that the brain's response to everyday pleasures gradually normalises with sustained abstinence.\n\nWhat a Month Off Can Build\nA month without kratom is a month of consistent sleep, meals, and routine replacing the time and effort use required. Cravings tend to arrive less often and feel more manageable, though high-stress moments remain the most vulnerable ones.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.kratomMilestone90Title,
        description: l10n.kratomMilestone90Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.kratomReferenceDay90,
        referenceContent:
            "Three Months Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nA Steadier Day-to-Day State\nKratom acts on opioid receptors, so three months without it gives the brain's reward and stress systems sustained time to settle. Many people report clearer thinking and steadier motivation the further they get from active use.\n\nWhy It Matters\nThe less recent the use, the more the day-to-day pull of kratom tends to fade — making this milestone a solid foundation for lasting recovery.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.kratomMilestone365Title,
        description: l10n.kratomMilestone365Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.kratomReferenceDay365,
        referenceContent:
            "One Year Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nWell Past Acute Withdrawal\nNIDA doesn't publish a specific one-year kratom recovery timeline, but a year of sustained abstinence is well beyond the acute and early psychological withdrawal window documented in the kratom research. For most people who reach this point, cravings are infrequent and far easier to manage.\n\nThe Bigger Picture\nA year of abstinence represents a substantial change in health, finances, and self-direction. Staying connected to support helps keep that progress secure.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.kratomMilestone730Title,
        description: l10n.kratomMilestone730Description,
        reference:
            "Stanciu et al. (2021) - Kratom Use Disorder Management (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/33974767/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.kratomReferenceDay730,
        referenceContent:
            "Two Years Off Kratom\n\nSource: Stanciu et al. (2021), \"Pharmacotherapy for Management of 'Kratom Use Disorder': A Systematic Literature Review With Survey of Experts.\"\n\nWhat the Evidence Says\nThe review describes kratom dependence, relapse risk, and approaches to long-term management. It also states that there are no established guidelines for maintaining long-term abstinence from kratom. The evidence does not define two years as a biological recovery endpoint.\n\nWhat This Milestone Means\nTwo years is best treated as a celebration of sustained change, not a medical deadline. The routines, support, and choices that carried you here are meaningful achievements in their own right.",
      ),
      QuitMilestone(
        day: 1095,
        title: l10n.kratomMilestone1095Title,
        description: l10n.kratomMilestone1095Description,
        reference:
            "Stanciu et al. (2021) - Kratom Use Disorder Management (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/33974767/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.kratomReferenceDay1095,
        referenceContent:
            "Three Years Off Kratom\n\nSource: Stanciu et al. (2021), \"Pharmacotherapy for Management of 'Kratom Use Disorder': A Systematic Literature Review With Survey of Experts.\"\n\nWhat the Evidence Says\nThe review supports taking kratom dependence and relapse prevention seriously, but it does not establish a three-year physiological recovery point or a universal timetable for long-term abstinence.\n\nWhat This Milestone Means\nThree years marks another full year of maintaining the direction you chose. That continuing consistency matters even when the science cannot attach a biological percentage or finish line to the date.",
      ),
      QuitMilestone(
        day: 1460,
        title: l10n.kratomMilestone1460Title,
        description: l10n.kratomMilestone1460Description,
        reference:
            "Stanciu et al. (2021) - Kratom Use Disorder Management (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/33974767/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.kratomReferenceDay1460,
        referenceContent:
            "Four Years Off Kratom\n\nSource: Stanciu et al. (2021), \"Pharmacotherapy for Management of 'Kratom Use Disorder': A Systematic Literature Review With Survey of Experts.\"\n\nWhat the Evidence Says\nPublished guidance on kratom use disorder remains limited, and the review found no established standard for maintaining long-term abstinence. It does not support a specific four-year medical recovery claim.\n\nWhat This Milestone Means\nFour years reflects sustained follow-through: repeated choices, routines, and support held across a long stretch of real life. That durable change is worth celebrating without inventing a clinical deadline.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.kratomMilestone1825Title,
        description: l10n.kratomMilestone1825Description,
        reference:
            "Stanciu et al. (2021) - Kratom Use Disorder Management (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/33974767/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.kratomReferenceDay1825,
        referenceContent:
            "Five Years Off Kratom\n\nSource: Stanciu et al. (2021), \"Pharmacotherapy for Management of 'Kratom Use Disorder': A Systematic Literature Review With Survey of Experts.\"\n\nWhat the Evidence Says\nThe kratom treatment literature recognizes dependence, relapse risk, and the need for long-term management, while also noting the absence of established guidance for maintaining long-term abstinence. It does not define five years as a universal biological endpoint.\n\nWhat This Milestone Means\nFive years is 1,825 days of sustained direction. The evidence does not need to invent a cure date for that achievement to be substantial: the life and habits built across those years are the milestone.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.kratomPageTitle,
      storageKey: 'kratom',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.kratomHeaderStarted,
      headerNotStarted: l10n.kratomHeaderNotStarted,
      subtitleStarted: l10n.kratomSubtitleStarted,
      subtitleNotStarted: l10n.kratomSubtitleNotStarted,
      infoBoxMessage: l10n.kratomInfoBox,
      initialStarted: started,
    );
  }
}
