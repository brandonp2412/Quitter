import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class BenzodiazepinePage extends StatelessWidget {
  final bool started;
  const BenzodiazepinePage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 7,
        title: l10n.benzoMilestone7Title,
        description: l10n.benzoMilestone7Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "Benzodiazepine Withdrawal: The First Week\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Note on Benzo Withdrawal Safety\n"
            "Benzodiazepine withdrawal can be dangerous. The WHO guidelines are explicit that the safest approach is to give benzodiazepines in gradually decreasing amounts, which 'helps to relieve benzodiazepine withdrawal symptoms and prevent the development of seizures.' Do not stop abruptly after prolonged use — work with a doctor on a taper.\n\n"
            "When Withdrawal Appears\n"
            "The WHO timeline depends on the drug's duration of action:\n"
            "• Short-acting (oxazepam, alprazolam, temazepam): withdrawal begins 1–2 days after the last dose and continues for 2–4 weeks or longer\n"
            "• Long-acting (diazepam, nitrazepam): withdrawal begins 2–7 days after the last dose and continues for 2–8 weeks or longer\n"
            "The first-week milestone is the point at which even longer-acting benzodiazepines have cleared enough for withdrawal to be in full effect.\n\n"
            "Early Withdrawal Symptoms\n"
            "• Rebound anxiety — often more intense than the original anxiety the drug treated\n"
            "• Insomnia and disturbed sleep\n"
            "• Tremors and muscle tension\n"
            "• Sweating and palpitations\n"
            "• Heightened sensitivity to light and sound\n\n"
            "Monitoring\n"
            "The WHO guidelines note that withdrawal severity 'can fluctuate markedly,' so formal scales are not recommended; instead a clinician should check in every few hours, provide reassurance, and explain symptoms. Benzodiazepines enhance GABA, the brain's main calming signal; long-term use blunts that system, so removing the drug leaves the brain over-excited — the source of the anxiety, tremor, and seizure risk that make a gradual taper essential.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.benzoMilestone14Title,
        description: l10n.benzoMilestone14Description,
        reference:
            "Protracted Withdrawal Syndromes From Benzodiazepines (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/1675688/",
        referenceDate: "June 2026",
        referenceContent:
            "Benzodiazepine Withdrawal: Two Weeks\n\n"
            "Source: Ashton, \"Protracted withdrawal syndromes from benzodiazepines,\" Journal of Substance Abuse Treatment (1991), on PubMed\n\n"
            "Still in Acute Withdrawal\n"
            "At two weeks, many people — especially those coming off longer-acting benzodiazepines — are still in the acute phase, when the imbalance between the brain's calming (GABA) and excitatory systems is most pronounced. Anxiety, insomnia, and perceptual disturbances are common.\n\n"
            "Why Benzo Withdrawal Can Drag On\n"
            "Professor Heather Ashton describes how the first withdrawal symptoms can blend into longer-lasting problems. Anxiety, insomnia, trouble thinking clearly, and sensory changes can continue for months because the brain's tolerance changes can be slow to reverse.\n\n"
            "Slowly Reversible Changes\n"
            "Ashton characterises these as 'slowly reversible functional changes in the central nervous system.' The central claim is recovery: the nervous system progressively reverses the functional adaptations created by long-term benzodiazepine exposure.\n\n"
            "Gradual Taper Is Key\n"
            "The evidence strongly supports a slow, supervised taper as the safest way to stop, letting the brain gradually re-adapt rather than facing a sudden loss of inhibitory signalling.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.benzoMilestone60Title,
        description: l10n.benzoMilestone60Description,
        reference:
            "Chronic Benzodiazepine Usage and Withdrawal in Insomnia Patients (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15003439/",
        referenceDate: "June 2026",
        referenceContent:
            "Benzodiazepines and Sleep Recovery by Two Months\n\n"
            "Source: Poyares et al., \"Chronic benzodiazepine usage and withdrawal in insomnia patients,\" Journal of Psychiatric Research (2004), on PubMed\n\n"
            "How Benzos Change Sleep\n"
            "Benzodiazepines are widely prescribed for insomnia, but they alter sleep architecture. In this polysomnography study of patients who had taken benzodiazepines nightly for an average of nearly seven years, chronic use was associated with reduced slow-wave (deep) sleep and more light stage-2 sleep — so users lose restorative deep sleep even while feeling sedated.\n\n"
            "Deep Sleep Comes Back\n"
            "The encouraging finding: the study measured sleep again 15 days after withdrawal and found recovery of slow-wave sleep and delta activity compared with the chronic-use nights, along with improved subjective sleep quality. Deep sleep, suppressed by the drug, began returning within about two weeks of stopping.\n\n"
            "What This Means at 60 Days\n"
            "If deep sleep is recovering within two weeks, then by two months your brain has had ample time to keep rebuilding natural, restorative sleep. The severe rebound insomnia of early withdrawal has typically settled. The authors were honest that withdrawal worsened sleep at first — which is why a gradual taper matters — but by the end of their protocol, sleep quality had improved over chronic benzodiazepine use.\n\n"
            "Other Improvements by Two Months\n"
            "Many early physical withdrawal symptoms — muscle tension, tremor, palpitations, sweating — have typically eased or resolved by the two-month mark as the body re-regulates.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.benzoMilestone90Title,
        description: l10n.benzoMilestone90Description,
        reference:
            "Protracted Withdrawal Syndromes From Benzodiazepines (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/1675688/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months After Benzodiazepines: Physical Health Stabilises\n\n"
            "Source: Ashton, \"Protracted withdrawal syndromes from benzodiazepines,\" Journal of Substance Abuse Treatment (1991), on PubMed\n\n"
            "Physical Stabilisation\n"
            "By 90 days, the acute phase is well behind you. For people who completed a managed taper, most of the physical withdrawal symptoms — tremor, palpitations, headaches, and the worst sleep disruption — have eased substantially, and sleep is generally more stable.\n\n"
            "Why Some Symptoms Persist\n"
            "Ashton documents that some symptoms can last for months. At three months, lingering anxiety, brain fog, and sensory changes can still appear while the brain continues its slow, reversible readjustment.\n\n"
            "Two Reasons Anxiety Lingers\n"
            "1. The brain's GABA system is still re-adapting toward normal sensitivity — a slow process\n"
            "2. Any underlying anxiety that led to benzo use is now felt without a drug-driven buffer\n\n"
            "A Good Time for Therapy\n"
            "With the worst early symptoms behind you, three months is a strong point to use support such as talking therapy such as CBT (CBT) for anxiety and build coping skills while the nervous system keeps settling.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.benzoMilestone180Title,
        description: l10n.benzoMilestone180Description,
        reference:
            "Lack of Cognitive Recovery Following Withdrawal From Long-Term Benzodiazepine Use (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/8208885/",
        referenceDate: "June 2026",
        referenceContent:
            "Thinking and Memory at Six Months: Measurable Gains\n\n"
            "Source: Tata et al., \"Lack of cognitive recovery following withdrawal from long-term benzodiazepine use,\" Psychological Medicine (1994), on PubMed\n\n"
            "What the Study Did\n"
            "This study tested 21 long-term benzodiazepine patients before withdrawal, just after withdrawal, and again at six months of abstinence, comparing them with matched controls. It is one of the most candid data points in the benzo recovery literature.\n\n"
            "What It Found\n"
            "Before stopping, patients had problems with verbal learning, memory, movement speed, visual coordination, and visual reasoning. Right after stopping there was little change. By six months, several of those areas had measurably improved.\n\n"
            "What This Means\n"
            "By six months, verbal learning, memory, movement speed, and visual coordination were measurably recovering. The improvement was already clear and had room to continue.\n\n"
            "The Bigger Picture\n"
            "If you feel foggy at six months, this research says: that is expected, and continued abstinence is the path forward. Longer-term studies show recovery continues well beyond this point — the brain keeps healing.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.benzoMilestone365Title,
        description: l10n.benzoMilestone365Description,
        reference:
            "Persistence of Cognitive Effects After Withdrawal From Long-Term Benzodiazepine Use: A Meta-Analysis (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15033227/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year After Benzodiazepines: Thinking and Memory Keep Recovering\n\n"
            "Source: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\n"
            "The Strongest Evidence We Have\n"
            "Researchers combined studies that re-tested long-term benzodiazepine users after at least six months off the drug. The combined result shows clear recovery in thinking and memory after withdrawal.\n\n"
            "The Good News\n"
            "The combined studies found genuine, measurable improvement in several areas of thinking and memory after withdrawal. Around one year, the recovery is broad and obvious compared with active use.\n\n"
            "Recovery Continues\n"
            "The combined studies found broad recovery in thinking and memory. By one year, you are well along a recovery trend that was already measurable at six months.\n\n"
            "What This Means at One Year\n"
            "Expect substantial recovery in thinking, memory, and clarity by a year — most people feel markedly sharper than during use. But if some areas still lag, that is consistent with the evidence, not a sign you have stalled. Recovery continues, and a year of abstinence is a major, worthwhile milestone on that path.",
      ),
      QuitMilestone(
        day: 540,
        title: l10n.benzoMilestone540Title,
        description: l10n.benzoMilestone540Description,
        reference:
            "Protracted Withdrawal Syndromes From Benzodiazepines (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/1675688/",
        referenceDate: "June 2026",
        referenceContent:
            "18 Months After Benzodiazepines: Slow but Real Recovery\n\n"
            "Source: Ashton, \"Protracted withdrawal syndromes from benzodiazepines,\" Journal of Substance Abuse Treatment (1991), on PubMed\n\n"
            "Why Benzo Recovery Takes So Long\n"
            "Benzodiazepines act on GABA, the brain's main calming system. Long-term use changes how strongly that system responds, and those changes can take months to reverse. That is why benzo recovery is measured in months rather than weeks.\n\n"
            "Where 18 Months Sits\n"
            "Ashton describes longer-lasting withdrawal symptoms that can take months to ease. By 18 months, the worst is well behind most people and lingering anxiety, sensory changes, and brain fog have substantially settled.\n\n"
            "Slowly Reversible\n"
            "Crucially, Ashton frames the underlying changes as 'slowly reversible functional changes in the central nervous system.' Slow, but reversible — the long timeline reflects the depth of the adaptation benzodiazepines caused, not permanent damage in most people.\n\n"
            "Recovery Signal\n"
            "Ashton describes the underlying changes as slowly reversible. By 18 months, the brain's calming GABA system has had a long time to settle and the dominant direction is continued recovery toward normal.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.benzoMilestone730Title,
        description: l10n.benzoMilestone730Description,
        reference:
            "Persistence of Cognitive Effects After Withdrawal From Long-Term Benzodiazepine Use: A Meta-Analysis (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15033227/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Years After Benzodiazepines: Major, Lasting Progress\n\n"
            "Source: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\n"
            "A Landmark in Recovery\n"
            "Two years is a major milestone, especially after a long withdrawal. The early and lingering symptom phases are long past, and the gains from the first year have had another year to strengthen.\n\n"
            "What the Evidence Supports\n"
            "The combined studies show recovery in many areas after withdrawal. By two years, most people report anxiety at or below their pre-benzo level, reliable sleep without medication, steadier emotions, and clearer thinking than during use.\n\n"
            "Recovery Signal\n"
            "The combined studies establish recovery across many areas of thinking and memory. At two years, sustained recovery is the evidence-backed expectation.\n\n"
            "Keeping Perspective\n"
            "Two years gives sleep, mood, memory, and clear thinking a long recovery window. The evidence shows substantial improvement across all four, with healing continuing from here.",
      ),
      QuitMilestone(
        day: 1095,
        title: l10n.benzoMilestone1095Title,
        description: l10n.benzoMilestone1095Description,
        reference:
            "Persistence of Cognitive Effects After Withdrawal From Long-Term Benzodiazepine Use: A Meta-Analysis (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15033227/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Years After Benzodiazepines: Long-Term Healing\n\n"
            "Source: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\n"
            "The Long View\n"
            "Three years sits at the far end of the benzo recovery timeline. For the great majority of people, even after severe long-lasting withdrawal, disruptive symptoms are well behind them and quality of life is transformed compared with active use.\n\n"
            "What the Meta-Analysis Found\n"
            "Combined studies of long-term users show recovery in many areas after withdrawal. Over years of abstinence, the dominant story is broad recovery in thinking, memory, and day-to-day function.\n\n"
            "Recovery Signal\n"
            "Long-term research shows recovery across many areas of thinking and memory. By three years, the early and lingering withdrawal phases are far behind you and those gains have had years to strengthen.\n\n"
            "A Message of Hope\n"
            "The benzo recovery journey is one of the most demanding in medicine, and three years of sustained healing is a profound achievement. The evidence is clear: the brain heals substantially, most people recover their clarity, sleep, and emotional range, and improvement continues with time.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.benzoPageTitle,
      storageKey: 'benzos',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.benzoHeaderStarted,
      headerNotStarted: l10n.benzoHeaderNotStarted,
      subtitleStarted: l10n.benzoSubtitleStarted,
      subtitleNotStarted: l10n.benzoSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
