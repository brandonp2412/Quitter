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
        reference: "American Addiction Centers - Benzodiazepine Withdrawal",
        link:
            "https://americanaddictioncenters.org/benzodiazepine/length-of-withdrawal",
        referenceDate: "March 2026",
        referenceContent:
            "Benzodiazepine Withdrawal: The First Week\n\n"
            "Source: American Addiction Centers\n\n"
            "Note on Benzo Withdrawal Safety\n"
            "Benzodiazepine withdrawal is one of the few drug withdrawals that can be life-threatening. Abrupt cessation after prolonged use can cause seizures and severe neurological complications. Medical supervision and a tapering schedule are strongly recommended. Do not stop benzodiazepines abruptly without consulting a doctor.\n\n"
            "Why Benzo Withdrawal Starts Late\n"
            "Unlike short-acting benzodiazepines (e.g., Xanax, Ativan) where withdrawal can begin within hours, long-acting benzodiazepines (e.g., Valium, Klonopin) have half-lives of 1–4 days, meaning active drug levels remain in the body for several days after the last dose. The first week milestone marks the point at which even long-acting benzos have cleared enough for withdrawal to be in full effect.\n\n"
            "Early Withdrawal Symptoms\n"
            "• Rebound anxiety — often more intense than the original anxiety the drug was treating\n"
            "• Insomnia and disturbed sleep\n"
            "• Tremors and muscle tension\n"
            "• Sweating and heart palpitations\n"
            "• Headaches and dizziness\n"
            "• Heightened sensitivity to light and sound\n\n"
            "Why These Symptoms Occur\n"
            "Benzodiazepines work by enhancing GABA — the brain's primary inhibitory (calming) neurotransmitter. Long-term use causes the brain to reduce its own GABA production and receptor sensitivity. When benzos are removed, the brain is left with inadequate inhibitory signalling, resulting in neural overexcitation — the cause of anxiety, tremors, and seizure risk.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.benzoMilestone14Title,
        description: l10n.benzoMilestone14Description,
        reference: "Wikipedia - Benzodiazepine Withdrawal Syndrome",
        link:
            "https://en.wikipedia.org/wiki/Benzodiazepine_withdrawal_syndrome",
        referenceDate: "March 2026",
        referenceContent:
            "Benzodiazepine Withdrawal Syndrome: Two Weeks\n\n"
            "Source: Wikipedia — Benzodiazepine Withdrawal Syndrome\n\n"
            "Acute Withdrawal Phase\n"
            "The acute withdrawal phase for long-acting benzodiazepines typically peaks around days 10–14. This is when the neurological imbalance between GABA (inhibitory) and glutamate (excitatory) systems is at its most pronounced. Symptoms during this phase can include severe anxiety, panic attacks, insomnia, perceptual disturbances, and — in serious cases — seizures.\n\n"
            "Protracted Withdrawal Syndrome\n"
            "Wikipedia's article on benzo withdrawal syndrome documents a well-established phenomenon called protracted (or post-acute) withdrawal syndrome (PAWS). A significant proportion of long-term benzodiazepine users — estimated at 10–40% — experience symptoms that persist for months to years after stopping. These include:\n"
            "• Anxiety and depression\n"
            "• Cognitive difficulties (memory, concentration)\n"
            "• Insomnia\n"
            "• Muscle twitching and tremors\n"
            "• Tinnitus and sensory disturbances\n\n"
            "The Ashton Manual\n"
            "The landmark reference work on benzo withdrawal, developed by Professor Heather Ashton over decades of clinical research, documented that benzo withdrawal is one of the most complex and protracted withdrawal syndromes in psychiatry. Recovery is real but requires patience — symptoms typically improve gradually over months to years.\n\n"
            "Gradual Taper vs. Abrupt Cessation\n"
            "The evidence strongly supports a slow, supervised taper as the safest and most effective approach to stopping benzodiazepines, as it allows the brain to gradually adapt to lower GABA activity.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.benzoMilestone60Title,
        description: l10n.benzoMilestone60Description,
        reference: "PubMed - Chronic Benzodiazepine Usage and Withdrawal",
        link: "https://pubmed.ncbi.nlm.nih.gov/15003439/",
        referenceDate: "March 2026",
        referenceContent:
            "Chronic Benzodiazepine Use and Sleep Recovery at Two Months\n\n"
            "Source: Pétursson, H. (1994) — peer-reviewed research on benzodiazepine usage and withdrawal\n\n"
            "Sleep and Benzodiazepines\n"
            "Benzodiazepines are widely prescribed for insomnia, but research shows they fundamentally alter sleep architecture. While they reduce time to sleep onset and increase total sleep time, they do so by suppressing deep slow-wave sleep and REM sleep — the most restorative stages. Long-term users lose the benefits of truly restorative sleep even while feeling sedated.\n\n"
            "Sleep Recovery at 60 Days\n"
            "By two months of abstinence, sleep architecture is beginning to normalise. The rebound insomnia of early withdrawal (which can be severe) has typically resolved, and the brain is rebuilding its natural sleep-wake regulation systems. Most people at this stage are experiencing meaningfully better quality sleep than they had while taking benzodiazepines — though it may not feel that way compared to the sedated sleep the drug provided.\n\n"
            "What the Research Found\n"
            "The peer-reviewed research documented that after withdrawal, sleep quality continues improving for months. GABA receptor function — disrupted by long-term benzo use — shows progressive recovery with sustained abstinence, which directly underlies the improvement in natural sleep.\n\n"
            "Other Physical Improvements at 60 Days\n"
            "At the two-month mark, many physical withdrawal symptoms have resolved:\n"
            "• Muscle tension and tremors significantly reduced or gone\n"
            "• Cardiovascular symptoms (palpitations, sweating) resolved\n"
            "• Appetite and digestive function normalised\n"
            "• Energy levels improving as GABA/glutamate balance restores",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.benzoMilestone90Title,
        description: l10n.benzoMilestone90Description,
        reference: "High Focus Centers - Benzodiazepine Withdrawal Timeline",
        link:
            "https://www.highfocuscenters.com/2024/07/03/benzodiazepine-withdrawal-duration-timeline-and-symptoms/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months After Benzodiazepines: Physical Health Stabilises\n\n"
            "Three months represents a major milestone in benzo recovery. The acute and early post-acute phases are behind you, and the brain is well into its long-term healing process.\n\n"
            "Physical Stabilisation\n"
            "By 90 days, most physical withdrawal symptoms have fully resolved for people who completed a managed taper:\n"
            "• Tremors and muscle spasms resolved\n"
            "• Cardiovascular symptoms gone\n"
            "• Headaches resolved\n"
            "• Gastrointestinal symptoms improved\n"
            "• Sleep generally stable and improving\n\n"
            "Ongoing Psychological Symptoms\n"
            "For many long-term benzo users, psychological symptoms continue beyond the 90-day mark. Anxiety — often more prominent than before starting benzos — continues improving but may not be fully resolved. This is partly because:\n"
            "1. The brain's GABA system is still recovering toward normal sensitivity\n"
            "2. The underlying anxiety that led to benzo use is now experienced without a pharmacological buffer\n\n"
            "Importance of Therapy\n"
            "The 90-day mark is an excellent point to engage seriously with cognitive-behavioural therapy (CBT) for anxiety. Research shows CBT is highly effective for the anxiety that emerges after benzo discontinuation, and the brain at this stage is neurologically capable of forming new response patterns to anxiety triggers.\n\n"
            "Protracted Symptoms\n"
            "For a subset of long-term users, some symptoms — particularly intermittent anxiety, cognitive fog, and sensory disturbances — may continue beyond three months. This is known and expected; it does not mean permanent damage.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.benzoMilestone180Title,
        description: l10n.benzoMilestone180Description,
        reference: "PubMed - Lack of Cognitive Recovery Following Withdrawal",
        link: "https://pubmed.ncbi.nlm.nih.gov/8208885/",
        referenceDate: "March 2026",
        referenceContent:
            "Cognitive Recovery at Six Months: What the Research Says\n\n"
            "Source: Gorenstein, C. et al. (1993) — peer-reviewed cognitive assessment study\n\n"
            "An Honest Look at Cognitive Recovery\n"
            "This PubMed study examined cognitive function in patients who had withdrawn from long-term benzodiazepine use and found that, at six months post-withdrawal, some areas of cognitive function — particularly memory and psychomotor speed — had not fully recovered to the levels of non-benzo users. This is one of the most important and honest data points in benzo recovery literature.\n\n"
            "What This Means\n"
            "The research does not conclude that cognitive recovery is impossible — it shows that it is slower than previously thought for some functions. Later studies with longer follow-up periods (1–3 years) have documented continued improvement, and many people do achieve full cognitive recovery given enough time.\n\n"
            "Areas Showing Improvement at 6 Months\n"
            "Even in studies showing incomplete recovery, significant improvements are documented at six months:\n"
            "• Verbal learning and recall improving\n"
            "• Working memory better than at acute withdrawal\n"
            "• Processing speed recovering\n"
            "• Overall functional cognition meaningfully better\n\n"
            "Areas Recovering More Slowly\n"
            "• Visuospatial memory\n"
            "• Psychomotor speed and reaction time\n"
            "• Sustained attention\n\n"
            "The Takeaway\n"
            "If you feel mentally foggy at six months, this research validates that experience — and also confirms that continued abstinence is the proven path to further recovery. The brain continues healing beyond this milestone.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.benzoMilestone365Title,
        description: l10n.benzoMilestone365Description,
        reference: "Wikipedia - Effects of Long-term Benzodiazepine Use",
        link:
            "https://en.wikipedia.org/wiki/Effects_of_long-term_benzodiazepine_use",
        referenceDate: "March 2026",
        referenceContent:
            "One Year After Benzodiazepines: One Year of Healing\n\n"
            "Source: Wikipedia — Effects of Long-term Benzodiazepine Use\n\n"
            "One year represents a major milestone in benzo recovery. Long-term benzodiazepine use causes widespread effects on the brain and body, and one year of abstinence allows substantial healing across all these systems.\n\n"
            "Cognitive Recovery\n"
            "Wikipedia's extensive article on long-term benzo effects documents that cognitive impairments — including memory problems, difficulties with concentration, and impaired problem-solving — improve significantly over the first year of abstinence. Studies with one-year follow-up show meaningful recovery in most cognitive domains, though some users with very long-term heavy use may still show residual effects.\n\n"
            "Neurological Recovery\n"
            "GABA receptor function — the primary mechanism of benzodiazepine action — shows substantial normalisation at one year. The brain's inhibitory/excitatory balance, profoundly disrupted by long-term benzo use, is largely restored. This underlies improvements in:\n"
            "• Anxiety management\n"
            "• Sleep quality\n"
            "• Emotional regulation\n"
            "• Sensory processing\n\n"
            "Physical Health\n"
            "Physical effects of long-term benzo use (lethargy, respiratory depression, muscle weakness, fall risk) are fully resolved by one year. Cardiovascular and respiratory function are normal.\n\n"
            "Quality of Life\n"
            "Research consistently shows that the majority of people who successfully discontinue long-term benzodiazepines report significantly improved quality of life at the one-year mark — including better sleep, reduced anxiety, improved mental clarity, and greater engagement with life — despite the difficult journey to get there.",
      ),
      QuitMilestone(
        day: 540,
        title: l10n.benzoMilestone540Title,
        description: l10n.benzoMilestone540Description,
        reference: "Ardu Recovery - Brain Healing After Benzos",
        link: "https://www.ardurecoverycenter.com/brain-healing-after-benzos/",
        referenceDate: "March 2026",
        referenceContent:
            "18 Months After Benzodiazepines: Continued Brain Recovery\n\n"
            "The 18-month mark is when many long-term benzo users who struggled with protracted withdrawal syndrome report the most significant turn in their recovery.\n\n"
            "Why Benzo Recovery Takes Longer Than Other Substances\n"
            "Benzodiazepines bind to GABA-A receptors throughout the brain — receptors involved in sleep, anxiety, muscle tone, cognition, and mood. Long-term use causes extensive neuroadaptation across all these systems. Reversing that adaptation is a comprehensive neurological project that, for many people, takes 1–2+ years.\n\n"
            "What Typically Resolves by 18 Months\n"
            "Most people who persevere through protracted withdrawal report that by 18 months:\n"
            "• Sensory disturbances (tinnitus, visual disturbances, hyperacusis) are significantly reduced or gone\n"
            "• Cognitive function is meaningfully better — concentration, memory, and clarity have substantially improved\n"
            "• Anxiety has returned to manageable levels, particularly for those engaged in therapy\n"
            "• Sleep quality is substantially improved and usually reliable\n"
            "• Depersonalisation and derealisation (common benzo withdrawal symptoms) have resolved\n\n"
            "The Healing Continues\n"
            "At 18 months, brain healing is ongoing. Neuroplasticity — the brain's ability to reorganise and rebuild neural connections — is actively working. Many people notice continued improvement month-to-month even at this stage, particularly in emotional regulation and cognitive clarity.\n\n"
            "Keeping Perspective\n"
            "The recovery timeline for benzodiazepines is genuinely long compared to most substances. This is not a sign of permanent damage — it reflects the depth and breadth of the neurological changes that long-term benzo use causes, all of which are slowly reversing.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.benzoMilestone730Title,
        description: l10n.benzoMilestone730Description,
        reference: "Psychiatric Medication Awareness Group - Recovery Tips",
        link: "https://psychmedaware.org/recovery_tips.html",
        referenceDate: "March 2026",
        referenceContent:
            "Two Years After Benzodiazepines: Major Progress\n\n"
            "Source: Psychiatric Medication Awareness Group (PMAG)\n\n"
            "The two-year mark is considered a landmark in benzodiazepine recovery. For those who experienced protracted withdrawal syndrome, two years is when the majority report feeling genuinely well and experiencing sustained improvement.\n\n"
            "What PMAG Documents\n"
            "The Psychiatric Medication Awareness Group, which has compiled extensive first-hand accounts of benzo withdrawal and recovery, documents that at the two-year mark, the vast majority of former benzo users who experienced difficult protracted withdrawal are either fully recovered or experiencing only minor residual symptoms that continue to improve.\n\n"
            "Two-Year Recovery Profile\n"
            "Most people at two years report:\n"
            "• Anxiety at or below pre-benzo baseline (often better, especially with therapy)\n"
            "• Cognitive function fully or largely restored\n"
            "• Sleep reliable and restorative without medication\n"
            "• Emotional stability and appropriate emotional range restored\n"
            "• Sense of self and identity re-established after the disorientation of withdrawal\n\n"
            "The Challenge of the Journey\n"
            "PMAG emphasises that the path to two years can be extremely difficult and that people in benzo recovery need validation, support, and patience. The extended timeline is a medical reality, not a personal failing. Many people who reach this milestone describe it as one of the most profound accomplishments of their lives.",
      ),
      QuitMilestone(
        day: 1095,
        title: l10n.benzoMilestone1095Title,
        description: l10n.benzoMilestone1095Description,
        reference: "Ardu Recovery - Brain Damage Recovery Timeline",
        link: "https://www.ardurecoverycenter.com/brain-healing-after-benzos/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Years After Benzodiazepines: Long-term Recovery\n\n"
            "Three years represents the outer boundary of documented benzo recovery timelines and a milestone that most people — even those with severe protracted withdrawal — have crossed into full or near-full recovery.\n\n"
            "Research on Long-term Recovery\n"
            "Long-term follow-up studies of benzodiazepine users who discontinued (such as those by Professor Heather Ashton and the Oxford group) found that the great majority of patients who persisted through the recovery process eventually achieved complete or near-complete resolution of symptoms. The three-year mark is when this outcome is typically achieved even in the most challenging cases.\n\n"
            "Neurological Healing\n"
            "By three years, GABA receptor function has substantially normalised in most people. The widespread neuroadaptive changes caused by long-term benzodiazepine use — affecting sleep, anxiety, cognition, sensory processing, and motor function — have largely reversed. The brain has shown remarkable plasticity in recovering from years of pharmacological suppression.\n\n"
            "Life at Three Years\n"
            "People who reach the three-year milestone commonly describe:\n"
            "• A sense of being 'themselves' again — often for the first time in many years\n"
            "• Cognitive sharpness they had not experienced since before benzos\n"
            "• Emotional richness and depth restored\n"
            "• Genuine wellbeing not dependent on medication\n"
            "• Deep appreciation for life after the difficulty of recovery\n\n"
            "A Message of Hope\n"
            "The benzo recovery journey is one of the most demanding in medicine. Three years of sustained healing is a profound achievement. If you are still in early recovery, know that the evidence is clear: the brain heals, and people do fully recover.",
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
