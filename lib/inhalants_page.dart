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
        reference: "The Clinical Assessment and Treatment of Inhalant Abuse (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10266853/",
        referenceDate: "June 2026",
        referenceContent:
            "Stopping Inhalants: Day One\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nWhy Withdrawal Happens\nChronic inhalant use causes neuroadaptation — the nervous system comes to expect the substance. Many inhalants affect the same brain circuits as alcohol, so stopping leaves the brain temporarily imbalanced. The chemicals clear the blood fast but are stored in body fat, which can make withdrawal timing unpredictable.\n\nEarly Symptoms\nThis review describes inhalant withdrawal as resembling alcohol or benzodiazepine withdrawal, with reported symptoms including:\n• Nausea, vomiting, and sweating\n• Tremor and rapid heart rate\n• Insomnia and sleep disturbance\n• Anxiety and irritability\n\nA Safety Note\nIn more severe cases, the review also lists hallucinations, delusions, and seizures among reported symptoms, though it does not lay out a precise day-by-day schedule — treat these as symptoms that can occur, not a fixed timeline. Medical supervision is wise during detox, especially for heavy, long-term users.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.inhalantsMilestone7Title,
        description: l10n.inhalantsMilestone7Description,
        reference: "The Clinical Assessment and Treatment of Inhalant Abuse (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10266853/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Inhalants\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nThe Acute Window\nInhalant withdrawal is described in the clinical literature as resembling alcohol or benzodiazepine withdrawal, but it is generally understood to be shorter-lived. By the end of the first week the acute physical symptoms — nausea, tremor, sweating, insomnia — are usually resolving for most people.\n\nWhat Remains\n• Fatigue and cognitive fog\n• Low or unstable mood\n• Cravings\n\nNote on Early Abstinence\nCognitive fog at this stage does not mean lasting damage — the brain is still recalibrating. Research on how thinking and memory specifically recover over the following weeks and months is covered in later milestones.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.inhalantsMilestone14Title,
        description: l10n.inhalantsMilestone14Description,
        reference: "The Clinical Assessment and Treatment of Inhalant Abuse (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10266853/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Inhalants\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nThrough the Acute Phase\nClinical reviews describe inhalant withdrawal as resembling alcohol or benzodiazepine withdrawal in its symptoms, but generally shorter-lived; by two weeks, the acute symptoms — nausea, tremor, insomnia, anxiety — have typically settled for most people, though the literature does not set an exact cutoff, so pace varies.\n\nThe Road Ahead\nThe more important recovery — of attention, memory, and motor function affected by chronic use — is slower and unfolds over the following months, and research on solvent abusers finds that some cognitive domains recover faster than others. Good nutrition (inhalant use can deplete vitamin B12) and abstinence set the stage for it.",
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
            "One Month Off Inhalants\n\nSource: Dingwall et al., \"Cognitive recovery during and after treatment for volatile solvent abuse,\" Drug and Alcohol Dependence (2011), on PubMed\n\nWhere One Month Sits\nThe acute withdrawal syndrome is well behind you. This study followed solvent abusers through an 8-week treatment program and found an uneven picture in early abstinence: some skills, like paired-associate learning, improved within six weeks, while deficits in visual-motor speed, learning and memory, and executive function often persisted through — and sometimes beyond — treatment rather than simply rebounding.\n\nWhat Can Improve\n• Attention and some learning tasks\n• Mood and sleep, as the body stabilises\n• Motor speed, gradually\n\nAn Honest Note\nThe study's own conclusion is direct: recovery of memory and executive function 'improves gradually over months to years of abstinence, and might never fully recover' for some. The degree and pace depend heavily on how severe and prolonged the prior use was.",
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
            "Three Months Off Inhalants\n\nSource: Dingwall et al., \"Cognitive recovery during and after treatment for volatile solvent abuse,\" Drug and Alcohol Dependence (2011), on PubMed\n\nAn Uneven, Longer Process\nThis study followed solvent abusers beyond its 8-week treatment window, reassessing a subset around 12 months later. Recovery wasn't a simple, universal rebound: some domains improved relatively quickly — paired-associate learning within six weeks — while others, including visual-motor speed, learning and memory, and executive function, remained impaired for much longer.\n\nStaying the Course\nThe study's authors were candid that these slower domains 'improve gradually over months to years of abstinence, and might never fully recover' for some people, particularly after long or heavy use. Three months in, continued abstinence is still the strongest lever you have — each month adds to whatever gains are achievable for you.",
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
