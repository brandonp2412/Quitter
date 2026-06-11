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
        reference: "Effects of ecstasy on neurotransmitter systems (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5021729/",
        referenceDate: "June 2026",
        referenceContent:
            "After MDMA: The Comedown\n\nSource: \"The effects of ecstasy on neurotransmitter systems: a review of molecular imaging studies,\" on PubMed Central\n\nWhy You Feel Low\nMDMA works by driving a large release of serotonin (with some dopamine). Afterwards the brain is temporarily depleted of serotonin, which produces the “comedown” — low mood, fatigue, and irritability that can last up to a couple of days.\n\nWhat Helps\n• Hydration and nutritious food\n• Sleep\n• Patience — the dip is the depletion, not a permanent state\n\nThe comedown after a single use differs from withdrawal, which follows heavier, repeated use.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.mdmaMilestone3Title,
        description: l10n.mdmaMilestone3Description,
        reference: "Effects of ecstasy on neurotransmitter systems (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5021729/",
        referenceDate: "June 2026",
        referenceContent:
            "A Few Days After MDMA\n\nSource: \"The effects of ecstasy on neurotransmitter systems,\" on PubMed Central\n\nRebalancing\nThe acute comedown usually fades within one to three days as serotonin stores are replenished. Some people feel low energy or foggy for up to five to seven days after heavy or repeated weekend use.\n\nWhat Improves\n• Mood lifts from its lowest point\n• Energy returns\n• Sleep starts to normalise",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.mdmaMilestone7Title,
        description: l10n.mdmaMilestone7Description,
        reference: "Effects of ecstasy on neurotransmitter systems (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5021729/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week After MDMA\n\nSource: \"The effects of ecstasy on neurotransmitter systems,\" on PubMed Central\n\nThe Acute Phase Closes\nFor people who used heavily or repeatedly, a withdrawal-like phase of low mood, poor concentration, memory lapses, and cravings can last roughly a week. By the end of it most people are improving.\n\nWhen to Seek Help\nIf low mood, anxiety, or sleep problems persist beyond one to two weeks, that may be more than a comedown — it is worth talking to a professional.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.mdmaMilestone14Title,
        description: l10n.mdmaMilestone14Description,
        reference: "Effects of ecstasy on neurotransmitter systems (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5021729/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off MDMA\n\nSource: \"The effects of ecstasy on neurotransmitter systems,\" on PubMed Central\n\nRecovery Underway\nMDMA withdrawal generally resolves within one to two weeks. By now mood, sleep, and concentration are noticeably better as serotonin signalling recovers.\n\nThe Longer View\nHeavy or frequent use can deplete serotonin for longer, so recovery of mood can take several weeks in some people. Hydration, sleep, and nutrition support the process.",
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
            "Three Months Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nContinued Recovery\nWith sustained abstinence the the brain's serotonin system continues to recover, especially in deeper brain regions. Mood and sleep are stable, and reviews note that anxiety and irritability tend to ease over roughly a year of abstinence.\n\nThe Honest Picture\nRecovery is real but, after heavy use, may be incomplete in some some brain regions and for some memory functions. Staying off gives the brain its best opportunity to heal.",
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
            "One Year Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nA Year On\nWith a year of abstinence, serotonin transporter availability has recovered substantially and mood is stable; reviews report that anxiety and irritability associated with use tend to remit around the one-year mark.\n\nAn Honest Caveat\nAfter heavy use, some cognitive (particularly memory) effects and cortical changes can persist, and the research base has limits. The clear direction, though, is genuine recovery — and a year free is strong evidence of it.",
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
