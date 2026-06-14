import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class InhalantsPage extends StatelessWidget {
  final bool started;

  const InhalantsPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.inhalantsMilestone1Title,
        description: l10n.inhalantsMilestone1Description,
        reference:
            "Cognitive recovery after volatile solvent abuse (ScienceDirect)",
        link: "https://pubmed.ncbi.nlm.nih.gov/21497458/",
        referenceDate: "June 2026",
        referenceContent:
            "Stopping Inhalants: Day One\n\nSource: Research on cognitive recovery during and after treatment for volatile solvent abuse\n\nWhy Withdrawal Happens\nChronic inhalant use causes neuroadaptation — the nervous system comes to expect the substance. Many inhalants affect the same brain circuits as alcohol, so stopping leaves the brain temporarily imbalanced. The chemicals clear the blood fast but are stored in body fat, which can make withdrawal timing unpredictable.\n\nEarly Symptoms\n• Headache and nausea\n• Irritability and anxiety\n• Insomnia\n\nA Safety Note\nHeavy users can have more severe withdrawal, including tremor, sweating, and — rarely — seizures. Medical supervision is wise during detox.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.inhalantsMilestone7Title,
        description: l10n.inhalantsMilestone7Description,
        reference:
            "Cognitive recovery after volatile solvent abuse (ScienceDirect)",
        link: "https://pubmed.ncbi.nlm.nih.gov/21497458/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Inhalants\n\nSource: Research on cognitive recovery during and after treatment for volatile solvent abuse\n\nThe Acute Window\nInhalant withdrawal is shorter than alcohol or opioid withdrawal but can be intense, peaking around days 2–5. By the end of the first week the acute physical symptoms are usually resolving.\n\nWhat Remains\n• Fatigue and cognitive fog\n• Low or unstable mood\n• Cravings\n\nNote on Early Abstinence\nCognitive function is known to dip in very early abstinence before it recovers — so feeling foggy now does not mean lasting damage; it is part of the early healing curve.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.inhalantsMilestone14Title,
        description: l10n.inhalantsMilestone14Description,
        reference:
            "Cognitive recovery after volatile solvent abuse (ScienceDirect)",
        link: "https://pubmed.ncbi.nlm.nih.gov/21497458/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Inhalants\n\nSource: Research on cognitive recovery during and after treatment for volatile solvent abuse\n\nThrough Acute Withdrawal\nAcute inhalant withdrawal generally resolves within one to two weeks. The body is out of the acute phase, and mood is stabilising.\n\nThe Road Ahead\nThe more important recovery — of attention, memory, and motor function affected by chronic use — is slower and unfolds over the following months. Good nutrition (inhalant use can deplete vitamin B12) and abstinence set the stage for it.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.inhalantsMilestone30Title,
        description: l10n.inhalantsMilestone30Description,
        reference:
            "Cognitive recovery after volatile solvent abuse (ScienceDirect)",
        link: "https://pubmed.ncbi.nlm.nih.gov/21497458/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Inhalants\n\nSource: Research on cognitive recovery during and after treatment for volatile solvent abuse\n\nWhere One Month Sits\nThe acute syndrome is well behind you. Research shows cognitive function dips in early abstinence and then recovers progressively, so the trajectory now turns upward.\n\nWhat Improves\n• Clearer thinking and attention\n• Steadier mood\n• Better sleep and energy\n\nThe degree and pace of recovery depend on how severe and prolonged the use was.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.inhalantsMilestone90Title,
        description: l10n.inhalantsMilestone90Description,
        reference:
            "Cognitive recovery after volatile solvent abuse (ScienceDirect)",
        link: "https://pubmed.ncbi.nlm.nih.gov/21497458/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Inhalants\n\nSource: Research on cognitive recovery during and after treatment for volatile solvent abuse\n\nProgressive Recovery\nStudies describe recovery of brain function from solvent use as progressive over abstinence, with the pace tied to how impaired someone was to begin with. Three months in, memory, attention, and motor function are continuing to improve.\n\nStaying the Course\nBecause recovery is gradual and continues for a long time, consistency matters more than speed. Each month of abstinence adds to the gains.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.inhalantsMilestone365Title,
        description: l10n.inhalantsMilestone365Description,
        reference:
            "Neurocognitive changes 15 years after chronic inhalant abuse (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/23490054/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off Inhalants\n\nSource: \"A prospective study of neurocognitive changes 15 years after chronic inhalant abuse,\" on PubMed\n\nReal, Measurable Recovery\nA prospective study found that brain and thinking problems from chronic inhalant abuse showed substantial recovery after two years of abstinence, with recovery progressive and dependent on baseline severity. At one year you are well along that curve.\n\nWhat It Means\nMemory, attention, and motor function continue to improve. The honest message is not that everything resets, but that long-term abstinence allows genuine recovery of brain function.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.inhalantsMilestone730Title,
        description: l10n.inhalantsMilestone730Description,
        reference:
            "Neurocognitive changes 15 years after chronic inhalant abuse (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/23490054/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Years Off Inhalants\n\nSource: \"A prospective study of neurocognitive changes 15 years after chronic inhalant abuse,\" on PubMed\n\nThe Two-Year Mark\nThis is the key milestone in the research: deficits reflecting brain damage from long-term solvent use showed substantial recovery after two years of abstinence. The authors concluded that, in the absence of brain damage from leaded petrol, long-term abstinence may allow recovery of normal brain function.\n\nAn Honest Caveat\nThe major exception is damage from leaded petrol abuse, which can cause persistent deficits. Otherwise, two years of abstinence represents the brain's best documented opportunity to heal — alongside a life rebuilt around it.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.inhalantsPageTitle,
      storageKey: 'inhalants',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.inhalantsHeaderStarted,
      headerNotStarted: l10n.inhalantsHeaderNotStarted,
      subtitleStarted: l10n.inhalantsSubtitleStarted,
      subtitleNotStarted: l10n.inhalantsSubtitleNotStarted,
      infoBoxMessage: l10n.inhalantsInfoBox,
      initialStarted: started,
    );
  }
}
