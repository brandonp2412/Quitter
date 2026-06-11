import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class GhbPage extends StatelessWidget {
  final bool started;

  const GhbPage({super.key, required this.started});

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
            "GHB Withdrawal: The First Hours\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\n⚠ This Is a Medical Emergency\nGHB withdrawal ranks among the most dangerous substance withdrawals, rivalling severe alcohol and benzodiazepine withdrawal. Untreated, it can progress to delirium in over half of cases, with dangerous swings in heart rate and blood pressure and seizures. Anyone dependent on GHB, GBL, or 1,4-butanediol should seek supervised inpatient detox rather than stopping alone.\n\nWhy It Starts So Fast\nGHB's half-life is only 30–60 minutes, so symptoms can begin 1–6 hours after the last dose — far faster than alcohol.\n\nEarly Symptoms\nAnxiety, insomnia, tremor, sweating, fast heart rate, and rising blood pressure.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.ghbMilestone3Title,
        description: l10n.ghbMilestone3Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "GHB Withdrawal: Peak\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nThe Peak\nGHB withdrawal symptoms typically peak around 48–72 hours. This is the most dangerous window, when the syndrome can escalate to a delirium with dangerous swings in heart rate and blood pressure.\n\nSevere Features\n• Severe agitation and anxiety\n• Auditory and visual hallucinations, paranoia\n• Tremor, sweating, racing heart, and high blood pressure\n• Risk of seizures\n\nManagement\nThe standard of care is benzodiazepines (often in high doses), sometimes with baclofen or a pharmaceutical GHB taper, under intensive monitoring. This is not safe to manage at home.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.ghbMilestone7Title,
        description: l10n.ghbMilestone7Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nThe Acute Syndrome Resolves\nGHB withdrawal lasts roughly 9–10 days on average, with mild cases under 5 days and severe cases up to about two weeks. By one week, many people are through the most dangerous phase, though delirium when it occurs can persist for 5–15 days.\n\nWhat Remains\n• Lingering anxiety and insomnia\n• Fatigue\n• Cravings\n\nContinued medical oversight remains important until the syndrome has clearly settled.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.ghbMilestone14Title,
        description: l10n.ghbMilestone14Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nPast the Acute Syndrome\nBy two weeks even severe GHB withdrawal has generally resolved. Heart rate, blood pressure, and sleep are stabilising.\n\nWhat Lingers\nAnxiety, low mood, insomnia, and cognitive fog can persist into the protracted phase. These are the symptoms that most often drive relapse, so support and structure matter now.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.ghbMilestone30Title,
        description: l10n.ghbMilestone30Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nWhere One Month Sits\nThe acute, dangerous phase is long past. What remains is the protracted phase — anxiety, depression, insomnia, cognitive fog, and problems with coordination that the literature notes can linger for three to six months.\n\nWhy Support Still Helps\nThese protracted symptoms drive high relapse rates. At one month they are usually milder than early on, and they continue to fade with time, sleep, and treatment.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.ghbMilestone90Title,
        description: l10n.ghbMilestone90Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nThe Protracted Phase Eases\nThe lingering anxiety, insomnia, and cognitive fog of GHB withdrawal are described as lasting up to three to six months. By three months many people notice clear improvement as the brain's calming systems re-regulate.\n\nWhat People Notice\n• Calmer baseline mood\n• More reliable sleep\n• Clearer thinking and fewer cravings",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.ghbMilestone180Title,
        description: l10n.ghbMilestone180Description,
        reference: "Characterization of the GHB Withdrawal Syndrome (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8199158/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nHalf a Year On\nBy six months the protracted symptoms that can follow GHB withdrawal have, for most people, resolved. Mood, sleep, and cognition are back to baseline.\n\nThe Bigger Picture\nGetting through GHB withdrawal safely and staying off for half a year is a major achievement given how dangerous the early phase is. The routines and support that got you here are worth keeping.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.ghbPageTitle,
      storageKey: 'ghb',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.ghbHeaderStarted,
      headerNotStarted: l10n.ghbHeaderNotStarted,
      subtitleStarted: l10n.ghbSubtitleStarted,
      subtitleNotStarted: l10n.ghbSubtitleNotStarted,
      infoBoxMessage: l10n.ghbInfoBox,
      initialStarted: started,
    );
  }
}
