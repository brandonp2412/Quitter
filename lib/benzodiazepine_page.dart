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
            "This landmark paper by Professor Heather Ashton describes how acute symptoms 'tend to merge with more persistent symptoms' — a protracted withdrawal syndrome in which problems such as anxiety, insomnia, cognitive difficulty, and sensory disturbances 'may last for many months.' Ashton attributes this to tolerance that 'may be slow to reverse.'\n\n"
            "An Honest, Hopeful Framing\n"
            "Ashton characterises these as 'slowly reversible functional changes in the central nervous system' — slow, but reversible. The length of benzo recovery reflects how deeply the drug reshaped the brain's inhibitory system, not a sign that you are failing. Patience is part of the process.\n\n"
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
            "Ashton's paper documents that benzo withdrawal symptoms 'may last for many months' as acute symptoms 'merge with more persistent symptoms.' At three months, lingering anxiety — sometimes more prominent than before starting benzos — and intermittent cognitive fog or sensory disturbances are recognised features of this protracted phase, not signs of permanent harm. Ashton frames the underlying changes as 'slowly reversible.'\n\n"
            "Two Reasons Anxiety Lingers\n"
            "1. The brain's GABA system is still re-adapting toward normal sensitivity — a slow process\n"
            "2. Any underlying anxiety that led to benzo use is now felt without a pharmacological buffer\n\n"
            "A Good Time for Therapy\n"
            "Because the changes are slowly reversible and the acute storm has passed, three months is a strong point to engage with psychological support such as cognitive-behavioural therapy for anxiety, building durable coping skills as the nervous system continues to settle.",
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
            "Cognitive Recovery at Six Months: An Honest Look\n\n"
            "Source: Tata et al., \"Lack of cognitive recovery following withdrawal from long-term benzodiazepine use,\" Psychological Medicine (1994), on PubMed\n\n"
            "What the Study Did\n"
            "This study tested 21 long-term benzodiazepine patients before withdrawal, just after withdrawal, and again at six months of abstinence, comparing them with matched controls. It is one of the most candid data points in the benzo recovery literature.\n\n"
            "What It Found\n"
            "At baseline the patients showed 'significant impairment… in verbal learning and memory, psychomotor, visuo-motor and visuo-conceptual abilities.' There was 'no evidence of immediate recovery' right after stopping. By six months, 'modest recovery of certain deficits emerged,' but performance 'remained significantly below' that of controls.\n\n"
            "What This Means\n"
            "The honest takeaway is twofold. First, recovery is real but slower than many expect — at six months, some cognitive functions are still catching up. Second, the direction is clearly upward: deficits were improving, not fixed. The study's value is in validating that lingering mental fog at six months is a recognised part of benzo recovery, not a personal failing.\n\n"
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
            "One Year After Benzodiazepines: What the Cognition Research Shows\n\n"
            "Source: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\n"
            "The Strongest Evidence We Have\n"
            "This meta-analysis pooled studies that re-tested long-term benzodiazepine users after at least six months of abstinence — the best available evidence on whether cognition recovers. It asked two questions: does function improve after withdrawal, and is there any residual impairment at follow-up?\n\n"
            "The Good News\n"
            "The meta-analysis found that long-term users 'do show recovery of function in many areas after withdrawal.' Around the one-year mark, the broad picture is genuine, measurable cognitive improvement across multiple domains compared with active use.\n\n"
            "The Honest Part\n"
            "Recovery was not complete within the period the evidence actually covers. The meta-analysis found no full restitution of function 'at least in the first 6 months following cessation,' with former users still showing significant impairment in 'most areas of cognition' compared with controls or normative data. The effect is broad rather than confined to one skill; the analysis does not establish how much further recovery occurs beyond that six-month window.\n\n"
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
            "Benzodiazepines act on GABA-A receptors throughout the brain — receptors involved in sleep, anxiety, muscle tone, cognition, and mood. Ashton's work documents that the resulting tolerance 'may be slow to reverse,' which is why benzo recovery is measured in many months rather than weeks.\n\n"
            "Where 18 Months Sits\n"
            "Ashton describes protracted withdrawal symptoms that 'may last for many months' before easing. By 18 months, most people who persevered through that protracted phase find the worst of it well behind them — lingering anxiety, sensory disturbances, and cognitive fog have, for many, substantially settled.\n\n"
            "Slowly Reversible\n"
            "Crucially, Ashton frames the underlying changes as 'slowly reversible functional changes in the central nervous system.' Slow, but reversible — the long timeline reflects the depth of the adaptation benzodiazepines caused, not permanent damage in most people.\n\n"
            "An Honest Note\n"
            "Ashton also flagged that, occasionally, very long or heavy use may leave more stubborn changes. Recovery for most is real and continuing at 18 months; its completeness and pace vary from person to person, and ongoing support remains worthwhile.",
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
            "Two years is a major milestone, especially for anyone who went through protracted withdrawal. By now the acute and protracted symptom phases are long past, and the gains seen in the first year have had much more time to consolidate.\n\n"
            "What the Evidence Supports\n"
            "This meta-analysis found that long-term benzodiazepine users 'show recovery of function in many areas after withdrawal.' At the two-year mark most people report anxiety at or below their pre-benzo baseline, reliable sleep without medication, steadier emotions, and clearer thinking than during use.\n\n"
            "The Honest Caveat\n"
            "The same meta-analysis is candid about the limits of its own evidence: it documents that impairment across 'most areas of cognition' persists 'at least in the first 6 months' of abstinence, but its data does not track users out to two years, so it cannot confirm how complete recovery is by now. What it does support is real recovery of function in many areas after withdrawal; for most people that improvement continues well past six months, even where this particular evidence base stops short of proving it.\n\n"
            "Keeping Perspective\n"
            "The extended benzo timeline is a medical reality, not a personal failing. Reaching two years of sustained recovery — with substantial, evidence-backed improvement across sleep, mood, and cognition — is a profound accomplishment, and healing continues from here.",
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
            "Three years of abstinence sits at the far end of the documented benzo recovery timeline. For the great majority of people — even those who endured severe protracted withdrawal — this is well past the phase of disruptive symptoms, and quality of life is typically transformed compared with active use.\n\n"
            "What the Meta-Analysis Found\n"
            "Pooling studies of withdrawn long-term users, the analysis concluded that they 'show recovery of function in many areas after withdrawal.' The dominant story over years of abstinence is substantial, broad cognitive and functional recovery.\n\n"
            "An Honest Caveat\n"
            "The evidence this milestone rests on documents impairment in 'most areas of cognition' persisting 'at least in the first 6 months' of abstinence — it does not include long-term follow-up data reaching three years, so it cannot confirm exactly how complete recovery is by this point. What is well established is that recovery of function occurs in many areas after withdrawal; honesty matters more than a tidy promise of a complete reset this evidence base does not itself measure.\n\n"
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
