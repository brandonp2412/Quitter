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
            "The Clinical Assessment and Treatment of Inhalant Abuse (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10266853/",
        referenceDate: "June 2026",
        referenceContent:
            "Stopping Inhalants: Day One\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nWhy Withdrawal Happens\nChronic inhalant use causes neuroadaptation — the nervous system comes to expect the substance. Many inhalants affect the same brain circuits as alcohol, so stopping leaves the brain temporarily imbalanced. The chemicals clear the blood fast but are stored in body fat, which can make withdrawal timing unpredictable.\n\nEarly Symptoms\nThis review describes inhalant withdrawal as resembling alcohol or benzodiazepine withdrawal, with reported symptoms including:\n• Nausea, vomiting, and sweating\n• Tremor and rapid heart rate\n• Insomnia and sleep disturbance\n• Anxiety and irritability\n\nA Safety Note\nIn more severe cases, the review also lists hallucinations, delusions, and seizures among reported symptoms, though it does not lay out a precise day-by-day schedule — treat these as symptoms that can occur, not a fixed timeline. Medical supervision is wise during detox, especially for heavy, long-term users.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.inhalantsMilestone7Title,
        description: l10n.inhalantsMilestone7Description,
        reference:
            "The Clinical Assessment and Treatment of Inhalant Abuse (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10266853/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Inhalants\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nThe Acute Window\nInhalant withdrawal is described in the clinical literature as resembling alcohol or benzodiazepine withdrawal, but it is generally understood to be shorter-lived. By the end of the first week the acute physical symptoms — nausea, tremor, sweating, insomnia — are usually resolving for most people.\n\nWhat Remains\n• Fatigue and brain fog\n• Low or unstable mood\n• Cravings\n\nNote on Early Abstinence\nBrain fog at this stage does not mean lasting damage — the brain is still readjusting. Research on how thinking and memory specifically recover over the following weeks and months is covered in later milestones.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.inhalantsMilestone14Title,
        description: l10n.inhalantsMilestone14Description,
        reference:
            "The Clinical Assessment and Treatment of Inhalant Abuse (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10266853/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Inhalants\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nThrough the Acute Phase\nClinical reviews describe inhalant withdrawal as similar to alcohol or benzodiazepine withdrawal but shorter. By two weeks, nausea, tremor, insomnia, and anxiety have usually settled.\n\nThe Road Ahead\nAttention, memory, movement, and coordination recover more gradually over the following months. Continued abstinence gives all of these systems time to improve. Good nutrition (inhalant use can deplete vitamin B12) and abstinence set the stage for it.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.inhalantsMilestone30Title,
        description: l10n.inhalantsMilestone30Description,
        reference:
            "Cognitive Recovery During and After Treatment for Volatile Solvent Abuse (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/21497458/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Inhalants\n\nSource: Dingwall et al., \"Cognitive recovery during and after treatment for volatile solvent abuse,\" Drug and Alcohol Dependence (2011), on PubMed\n\nWhere One Month Sits\nThe early withdrawal period is well behind you. In this study, some learning skills improved within six weeks, while visual coordination, memory, planning, and decision-making improved more gradually over the following months.\n\nWhat Can Improve\n• Attention and some learning tasks\n• Mood and sleep, as the body stabilises\n• Motor speed, gradually\n\nRecovery Signal\nThe study's conclusion is clear: memory, planning, and decision-making improve gradually over months to years of abstinence. Continued abstinence is the strongest driver of that recovery.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.inhalantsMilestone90Title,
        description: l10n.inhalantsMilestone90Description,
        reference:
            "Cognitive Recovery During and After Treatment for Volatile Solvent Abuse (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/21497458/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Inhalants\n\nSource: Dingwall et al., \"Cognitive recovery during and after treatment for volatile solvent abuse,\" Drug and Alcohol Dependence (2011), on PubMed\n\nAn Uneven, Longer Process\nThis study followed people beyond an eight-week treatment program and checked some of them again around a year later. Some learning skills improved within six weeks, while visual coordination, memory, planning, and decision-making kept improving over a longer period.\n\nStaying the Course\nThe study shows that the slower skills improve gradually over months to years. At three months, continued abstinence is the strongest lever for adding more recovery month after month.",
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
            "One Year Off Inhalants\n\nSource: \"A prospective study of neurocognitive changes 15 years after chronic inhalant abuse,\" on PubMed\n\nReal, Measurable Recovery\nA long-term study found substantial recovery from chronic inhalant-related brain and thinking problems after two years of abstinence. At one year, you are well along that recovery path.\n\nWhat It Means\nMemory, attention, and motor function continue to improve. Long-term abstinence produces genuine brain recovery: by two years, most brain, memory, and thinking scores had returned to normal in chronic users who did not have brain damage from lead.",
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
            "Two Years Off Inhalants\n\nSource: \"A prospective study of neurocognitive changes 15 years after chronic inhalant abuse,\" on PubMed\n\nThe Two-Year Mark\nThis is the key milestone in the research: deficits reflecting brain damage from long-term solvent use showed substantial recovery after two years of abstinence. The authors concluded that, in the absence of brain damage from leaded petrol, long-term abstinence may allow recovery of normal brain function.\n\nRecovery Signal\nThe major exception is damage from leaded petrol abuse, which can cause persistent deficits. Otherwise, two years of abstinence represents the brain's best documented opportunity to heal — alongside a life rebuilt around it.",
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
