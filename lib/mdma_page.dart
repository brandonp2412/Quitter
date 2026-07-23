import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class MdmaPage extends StatelessWidget {
  final bool started;

  const MdmaPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.mdmaMilestone1Title,
        description: l10n.mdmaMilestone1Description,
        reference: "MDMA: Current Perspectives (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3931692/",
        referenceDate: "July 2026",
        referenceContent:
            "After MDMA: The Comedown\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nWhy You Feel Low\nMDMA works by driving a large release of serotonin (with some dopamine). Afterwards the brain is temporarily depleted of serotonin. This review describes a lowering of mood — the so-called \"midweek blues\" — that researchers have measured in both novice and experienced users 2 to 5 days after use.\n\nWhat Helps\n• Hydration and nutritious food\n• Sleep\n• Patience — the dip is the depletion, not a permanent state\n\nThe comedown after a single use differs from dependence-related withdrawal, which the same review describes as involving cravings but not significant physical symptoms.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.mdmaMilestone3Title,
        description: l10n.mdmaMilestone3Description,
        reference: "MDMA: Current Perspectives (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3931692/",
        referenceDate: "July 2026",
        referenceContent:
            "A Few Days After MDMA\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nThe Midweek Blues\nThis is roughly the window this review is describing when it discusses the \"midweek blues\" — a dip in mood measured 2 to 5 days after use in both novice and experienced users, tied to short-term serotonin depletion rather than long-term change.\n\nWhat Improves\n• Mood typically lifts from its lowest point around now\n• Energy returns\n• Sleep starts to normalise",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.mdmaMilestone7Title,
        description: l10n.mdmaMilestone7Description,
        reference: "MDMA: Current Perspectives (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3931692/",
        referenceDate: "July 2026",
        referenceContent:
            "One Week After MDMA\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nPast the Midweek Blues\nFor most people, a week is past the 2-to-5-day window this review associates with the acute comedown, so mood should be back to baseline. The review notes that for people who use heavily or repeatedly, cravings can persist as part of a dependence pattern, though it does not describe this as involving significant physical withdrawal symptoms.\n\nWhen to Seek Help\nIf low mood, anxiety, or sleep problems persist a week on, that may be more than a comedown — it is worth talking to a professional.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.mdmaMilestone14Title,
        description: l10n.mdmaMilestone14Description,
        reference: "MDMA: Current Perspectives (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3931692/",
        referenceDate: "July 2026",
        referenceContent:
            "Two Weeks Off MDMA\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nAn Honest Timeline\nFor a single-use comedown, two weeks is well past the 2-to-5-day dip this review documents, so mood, sleep, and concentration should be steady. For heavier or repeated use, though, this review is candid that the research on how quickly serotonergic function and cognition recover is unclear — it does not support a claim that heavy-use effects resolve within two weeks.\n\nWhat This Means for You\nIf your use was occasional, you're likely through the worst of it. If it was frequent or heavy, be patient with yourself — full recovery of serotonin signalling is a longer process than two weeks, covered in the next milestones.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.mdmaMilestone30Title,
        description: l10n.mdmaMilestone30Description,
        reference:
            "Serotonin transporter availability in abstinent MDMA users (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/34506649/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nWhere One Month Sits\nThe acute comedown and withdrawal are well behind you, and mood and cognition are steadier. Imaging research shows MDMA reduces the brain's capacity to process serotonin, and that this capacity recovers with sustained abstinence.\n\nAn Honest Note\nThe same research found memory function does not always track SERT recovery, so heavy users may notice lingering memory effects even as mood improves. Continued abstinence gives the best chance of recovery.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.mdmaMilestone90Title,
        description: l10n.mdmaMilestone90Description,
        reference:
            "Serotonin transporter availability in abstinent MDMA users (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/34506649/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nContinued Recovery\nWith sustained abstinence the brain's serotonin system continues to recover, especially in deeper brain regions. Mood and sleep are typically stable by this point.\n\nThe Honest Picture\nRecovery is real but, after heavy use, may be incomplete in some brain regions and for some memory functions. Staying off gives the brain its best opportunity to heal.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.mdmaMilestone365Title,
        description: l10n.mdmaMilestone365Description,
        reference:
            "Serotonin transporter availability in abstinent MDMA users (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/34506649/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nA Year On\nWith a year of abstinence, the brain's serotonin processing has recovered substantially and mood is stable.\n\nAn Honest Caveat\nAfter heavy use, some cognitive (particularly memory) effects and cortical changes can persist, and the research base has limits. The clear direction, though, is genuine recovery — and a year free is strong evidence of it.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.mdmaPageTitle,
      storageKey: 'mdma',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.mdmaHeaderStarted,
      headerNotStarted: l10n.mdmaHeaderNotStarted,
      subtitleStarted: l10n.mdmaSubtitleStarted,
      subtitleNotStarted: l10n.mdmaSubtitleNotStarted,
      infoBoxMessage: l10n.mdmaInfoBox,
      initialStarted: started,
    );
  }
}
