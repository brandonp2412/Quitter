import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class GabapentinoidPage extends StatelessWidget {
  final bool started;

  const GabapentinoidPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.gabapentinoidsMilestone1Title,
        description: l10n.gabapentinoidsMilestone1Description,
        reference:
            "Current Evidence on Abuse and Misuse of Gabapentinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7686181/",
        referenceDate: "June 2026",
        referenceContent:
            "Stopping Gabapentinoids: Day One\n\nSource: \"Current Evidence on Abuse and Misuse of Gabapentinoids,\" on PubMed Central\n\n⚠ Critical Safety Note\nGabapentin and pregabalin should never be stopped abruptly. Sudden discontinuation can trigger withdrawal seizures — a particular danger for people who take them for epilepsy — along with severe agitation and confusion. Discontinuation must be done as a gradual taper supervised by a prescriber.\n\nWhy Dependence Develops\nGabapentinoids are GABA analogues that reduce neurotransmitter release; with repeated use the nervous system adapts. The literature documents tolerance and physical dependence with withdrawal symptoms on discontinuation.\n\nEarly Symptoms\nWithdrawal can begin within 12–48 hours: anxiety, insomnia, sweating, nausea, and restlessness.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.gabapentinoidsMilestone3Title,
        description: l10n.gabapentinoidsMilestone3Description,
        reference:
            "Current Evidence on Abuse and Misuse of Gabapentinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7686181/",
        referenceDate: "June 2026",
        referenceContent:
            "Gabapentinoid Withdrawal: Peak\n\nSource: \"Current Evidence on Abuse and Misuse of Gabapentinoids,\" on PubMed Central\n\nThe Peak\nWhen gabapentinoids are reduced too quickly, withdrawal tends to peak around the third day.\n\nSymptoms\n• Heightened anxiety and agitation\n• Insomnia and sweating\n• Nausea, headache, and palpitations\n• Confusion or disorientation in more severe cases\n• Rebound nerve pain or return of the treated symptom\n\nManaging It\nA slow taper — commonly reducing the dose by small increments every one to two weeks — keeps symptoms mild. Seek urgent care for seizures, severe confusion, hallucinations, or chest pain.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.gabapentinoidsMilestone7Title,
        description: l10n.gabapentinoidsMilestone7Description,
        reference:
            "Current Evidence on Abuse and Misuse of Gabapentinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7686181/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Gabapentinoids\n\nSource: \"Current Evidence on Abuse and Misuse of Gabapentinoids,\" on PubMed Central\n\nThe Acute Window Closes\nFor many people the acute gabapentinoid withdrawal syndrome substantially decreases around days 7–10, though some symptoms can linger longer.\n\nWhat Remains\n• Residual anxiety and irritability\n• Sleep that is still settling\n• Occasional nerve pain or low mood\n\nIf you are tapering, each reduction may bring a brief, milder echo of these symptoms — expected, and a sign to hold the pace steady rather than rush.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.gabapentinoidsMilestone14Title,
        description: l10n.gabapentinoidsMilestone14Description,
        reference:
            "Current Evidence on Abuse and Misuse of Gabapentinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7686181/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Gabapentinoids\n\nSource: \"Current Evidence on Abuse and Misuse of Gabapentinoids,\" on PubMed Central\n\nSettling\nWith the acute phase past, the nervous system is adapting to working without gabapentinoid support. Sleep becomes more reliable and baseline anxiety eases.\n\nA Note on Timelines\nWithdrawal duration varies widely — from days to, in some severe cases, several weeks. If symptoms persist, a slower taper rather than a faster one is the safer correction.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.gabapentinoidsMilestone30Title,
        description: l10n.gabapentinoidsMilestone30Description,
        reference:
            "Current Evidence on Abuse and Misuse of Gabapentinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7686181/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Gabapentinoids\n\nSource: \"Current Evidence on Abuse and Misuse of Gabapentinoids,\" on PubMed Central\n\nWhere One Month Sits\nFor most people the withdrawal syndrome resolves within days to a couple of weeks, so by a month the nervous system has largely readjusted. Mood, sleep, and concentration are steadier.\n\nIf You Took Them for Pain or Anxiety\nIt is worth revisiting the original condition with your clinician, since some symptoms can return once the drug is gone — and there are non-gabapentinoid options to manage them.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.gabapentinoidsMilestone90Title,
        description: l10n.gabapentinoidsMilestone90Description,
        reference:
            "Current Evidence on Abuse and Misuse of Gabapentinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7686181/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Gabapentinoids\n\nSource: \"Current Evidence on Abuse and Misuse of Gabapentinoids,\" on PubMed Central\n\nFully Adjusted\nBy three months the brain has long since adapted to functioning without gabapentinoids. Sleep, mood, and cognition are stable.\n\nStaying Free\nBecause gabapentinoids are often misused alongside opioids to potentiate their effects, keeping clear of both — and of the situations that paired them — protects your recovery.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.gabapentinoidsMilestone180Title,
        description: l10n.gabapentinoidsMilestone180Description,
        reference:
            "Current Evidence on Abuse and Misuse of Gabapentinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7686181/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off Gabapentinoids\n\nSource: \"Current Evidence on Abuse and Misuse of Gabapentinoids,\" on PubMed Central\n\nHalf a Year On\nWell beyond the withdrawal window, your nervous system functions on its own and the routines around use have been replaced. Any rebound anxiety, pain, or sleep disruption from stopping has resolved.\n\nThe Bigger Picture\nSix months is strong evidence the change has held. If gabapentinoids were treating a real condition, you and your clinician now have a clear, drug-free baseline to work from.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.gabapentinoidsPageTitle,
      storageKey: 'gabapentinoids',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.gabapentinoidsHeaderStarted,
      headerNotStarted: l10n.gabapentinoidsHeaderNotStarted,
      subtitleStarted: l10n.gabapentinoidsSubtitleStarted,
      subtitleNotStarted: l10n.gabapentinoidsSubtitleNotStarted,
      infoBoxMessage: l10n.gabapentinoidsInfoBox,
      initialStarted: started,
    );
  }
}
