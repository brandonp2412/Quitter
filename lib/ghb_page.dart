import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class GhbPage extends StatelessWidget {
  final bool started;
  final String storageKey;
  final String? pageTitle;
  final String? headerStarted;
  final String? headerNotStarted;
  final String? subtitleStarted;
  final String? subtitleNotStarted;
  final String? infoBoxMessage;

  const GhbPage({
    super.key,
    required this.started,
    this.storageKey = 'ghb',
    this.pageTitle,
    this.headerStarted,
    this.headerNotStarted,
    this.subtitleStarted,
    this.subtitleNotStarted,
    this.infoBoxMessage,
  });

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.ghbMilestone1Title,
        description: l10n.ghbMilestone1Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "GHB Withdrawal: The First Hours\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\n⚠ This Is a Medical Emergency\nGHB withdrawal ranks among the most dangerous substance withdrawals, rivalling severe alcohol and benzodiazepine withdrawal. Untreated, it can progress to delirium in over half of cases, with dangerous swings in heart rate and blood pressure and seizures. Anyone dependent on GHB, GBL, or 1,4-butanediol should seek supervised inpatient detox rather than stopping alone.\n\nWhy It Starts So Fast\nGHB's half-life is only 30–60 minutes, and dependent users typically need to redose every 2–3 hours just to avoid withdrawal — far faster than alcohol or benzodiazepines. That rapid pharmacokinetics is why symptoms can appear much sooner than with other sedative-hypnotic withdrawal.\n\nEarly Symptoms\nAnxiety, insomnia, tremor, sweating, fast heart rate, and rising blood pressure.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.ghbMilestone3Title,
        description: l10n.ghbMilestone3Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "GHB Withdrawal: The Hardest Days\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nThe Roughest Stretch\nThis study found several core withdrawal symptoms — muscle aches, muscle twitches, a tensed and stressed feeling, a fast heart rate, and abdominal cramps — were at their worst in the first three days, with more than a 70% drop in severity for many symptoms by day four. This early window is generally the highest-risk period, when untreated withdrawal is most likely to escalate toward delirium, seizures, or dangerous swings in heart rate and blood pressure.\n\nSevere Features\n• Severe agitation and anxiety\n• Auditory and visual hallucinations, paranoia\n• Tremor, sweating, racing heart, and high blood pressure\n• Risk of seizures\n\nManagement\nThe study describes benzodiazepine tapering and pharmaceutical GHB tapering as the two commonly used detoxification methods, noting some evidence that a GHB taper may control symptoms more effectively than benzodiazepines alone. Either approach requires close monitoring — this is not safe to manage at home.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.ghbMilestone7Title,
        description: l10n.ghbMilestone7Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nMost Symptoms Are Fading\nSeveral core withdrawal symptoms dropped by more than 70% in severity or prevalence within the first four days. Under supervised tapering, the tapering phase itself lasted 11 days on average, followed by a recovery phase of about six days — so by one week many people are well into that improvement, even if the process isn't fully finished.\n\nWhat Can Linger\n• Sweating, tremor, and shaky hands\n• Sleeping a lot, or conversely insomnia and restlessness\n• Cravings\n\nThe study found these particular symptoms changed comparatively little even out to 11 days, so persistence this week isn't unusual. Continued medical oversight remains important until the syndrome has clearly settled.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.ghbMilestone14Title,
        description: l10n.ghbMilestone14Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nPast the Acute Syndrome\nBy two weeks, the acute physical syndrome described in this study — whose tapering and recovery phases together average around 17 days under supervised treatment — has generally resolved or is very close to it. Heart rate, blood pressure, and most physical symptoms should be stabilising.\n\nWhat Lingers\nThe study specifically flags craving and insomnia as still present at discharge for some patients, noting these may contribute to relapse risk. Support and structure matter now, even as the dangerous early phase is behind you.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.ghbMilestone30Title,
        description: l10n.ghbMilestone30Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nWhere One Month Sits\nThe acute, dangerous phase described in this study is long past by one month. The study itself doesn't track symptoms this far out — it focuses on the acute tapering and recovery phases, together roughly two and a half weeks — but it does flag that craving and insomnia can still be present at discharge and may contribute to relapse risk.\n\nWhy Support Still Helps\nIf cravings, low mood, or sleep problems are still present at one month, that lines up with what the study's authors flagged as relapse risk factors — which is exactly why continued support and structure matter.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.ghbMilestone90Title,
        description: l10n.ghbMilestone90Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nBeyond What This Study Tracked\nThis study followed patients through acute tapering and a roughly two-and-a-half-week recovery window — it doesn't report data out to three months. What it does establish is that craving and insomnia can persist at discharge and were flagged as relapse risk factors, consistent with the broader clinical picture that GHB dependence carries a real relapse risk in the months after detox.\n\nWhat People Commonly Report\n• Calmer baseline mood\n• More reliable sleep\n• Clearer thinking and fewer cravings\n\nIf anxiety, insomnia, or low mood are still prominent at three months, that's worth discussing with a clinician rather than assuming it will resolve on its own.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.ghbMilestone180Title,
        description: l10n.ghbMilestone180Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nHalf a Year On\nThis study's data doesn't extend to six months, so it can't confirm what's happening by this point — but the acute, dangerous phase it documents is, for the overwhelming majority of people, resolved within a few weeks of stopping. By six months, most people are functioning well outside the withdrawal syndrome itself.\n\nThe Bigger Picture\nGetting through GHB withdrawal safely and staying off for half a year is a major achievement given how dangerous the early phase is, and how real the relapse risk — driven partly by lingering craving and insomnia — can be. The routines and support that got you here are worth keeping.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: pageTitle ?? l10n.ghbPageTitle,
      storageKey: storageKey,
      milestones: _getMilestones(l10n),
      headerStarted: headerStarted ?? l10n.ghbHeaderStarted,
      headerNotStarted: headerNotStarted ?? l10n.ghbHeaderNotStarted,
      subtitleStarted: subtitleStarted ?? l10n.ghbSubtitleStarted,
      subtitleNotStarted: subtitleNotStarted ?? l10n.ghbSubtitleNotStarted,
      infoBoxMessage: infoBoxMessage ?? l10n.ghbInfoBox,
      initialStarted: started,
    );
  }
}
