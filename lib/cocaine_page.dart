import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class CocainePage extends StatelessWidget {
  final bool started;
  const CocainePage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.cocaineMilestone1Title,
        description: l10n.cocaineMilestone1Description,
        reference: "Priory Group - Cocaine Withdrawal",
        link:
            "https://www.priorygroup.com/addiction-treatment/cocaine-addiction/cocaine-withdrawal",
        referenceDate: "March 2026",
        referenceContent:
            "Cocaine Withdrawal: The First 24 Hours\n\n"
            "Source: Priory Group\n\n"
            "Cocaine and the Brain\n"
            "Cocaine produces its effects primarily by blocking the reuptake of dopamine in the brain's reward circuits — particularly the nucleus accumbens. This causes dopamine to accumulate in synapses, producing intense euphoria, energy, and confidence. With regular use, the brain compensates by reducing dopamine production and receptor sensitivity, making normal activities feel flat and unrewarding.\n\n"
            "The Crash\n"
            "Cocaine's effects wear off quickly (30–90 minutes per use), and the first 24 hours of stopping are characterised by the acute crash:\n"
            "• Extreme fatigue and need for sleep\n"
            "• Depressed mood and emotional flatness\n"
            "• Increased appetite (cocaine strongly suppresses appetite)\n"
            "• Intense craving for more cocaine\n"
            "• Irritability and agitation\n\n"
            "Unlike Some Other Drugs\n"
            "Unlike alcohol or benzodiazepine withdrawal, cocaine withdrawal does not involve the same physical dangers (seizures, delirium). The primary risk is psychological — severe depression and suicidal ideation can occur in heavy users during the crash phase. Medical supervision is advisable.\n\n"
            "What the Priory Group Notes\n"
            "The Priory's clinical guidance emphasises that the first 24–72 hours are the most intense phase of cocaine withdrawal, and that residential support significantly improves outcomes for heavy users by providing a safe, drug-free environment and monitoring for severe psychological symptoms.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.cocaineMilestone3Title,
        description: l10n.cocaineMilestone3Description,
        reference: "Cleveland Clinic - Cocaine Effects",
        link:
            "https://my.clevelandclinic.org/health/articles/4038-cocaine-crack",
        referenceDate: "March 2026",
        referenceContent:
            "Three Days Without Cocaine: Navigating Peak Challenge\n\n"
            "Source: Cleveland Clinic\n\n"
            "How Cocaine Affects the Brain\n"
            "The Cleveland Clinic documents that cocaine is one of the most powerful activators of the brain's dopamine reward system. It prevents dopamine transporters from recycling dopamine, causing massive surges in dopamine concentration. With repeated use, the brain's reward system is profoundly altered — requiring cocaine to feel any pleasure at all.\n\n"
            "Days 2–4: Peak Withdrawal Challenges\n"
            "By day three, the acute crash has evolved into peak psychological withdrawal:\n"
            "• Dysphoria and depression are at their most intense\n"
            "• Anhedonia (inability to feel pleasure) is prominent\n"
            "• Cravings are very strong, often triggered by any reminder of cocaine use\n"
            "• Anxiety and restlessness\n"
            "• Sleep disturbances — some people sleep excessively, others cannot sleep\n\n"
            "Cocaine's Physical Effects\n"
            "The Cleveland Clinic also documents cocaine's serious cardiovascular effects: elevated heart rate, blood pressure, and risk of heart attack and stroke (even in young, healthy users). At the three-day mark, these cardiovascular risks are resolving, and heart function is normalising.\n\n"
            "The Road Ahead\n"
            "The Cleveland Clinic emphasises that while the acute phase is intense, most people find the physical symptoms manageable — it is the psychological symptoms (depression, cravings, anhedonia) that require the most support and that persist longest.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.cocaineMilestone7Title,
        description: l10n.cocaineMilestone7Description,
        reference: "Addiction Center - Cocaine Withdrawal and Detox",
        link:
            "https://www.addictioncenter.com/drugs/crack-cocaine/withdrawal-detox/",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Without Cocaine: Physical Recovery Begins\n\n"
            "Source: Addiction Center\n\n"
            "The Acute Phase Is Ending\n"
            "By the end of the first week, the most intense acute withdrawal symptoms are typically subsiding. The brain is beginning to adjust to functioning without cocaine, though the dopamine system's recovery is a much longer process.\n\n"
            "Physical Recovery Underway\n"
            "The physical effects of cocaine use are reversing:\n"
            "• Heart rate and blood pressure normalising\n"
            "• Appetite returning to normal (cocaine suppresses appetite significantly)\n"
            "• Sleep patterns stabilising\n"
            "• Nasal passages beginning to heal (if cocaine was snorted)\n"
            "• Nutritional deficits being addressed as appetite and food intake normalise\n\n"
            "Psychological Symptoms Continue\n"
            "While physical symptoms improve, psychological symptoms persist into the second week and beyond:\n"
            "• Mood remains low, though less severe than at peak withdrawal\n"
            "• Cravings remain strong, particularly in response to environmental cues\n"
            "• Concentration and motivation are still impaired\n\n"
            "Post-Acute Withdrawal\n"
            "The Addiction Center notes that cocaine withdrawal transitions into a post-acute phase lasting weeks to months, characterised primarily by mood instability, cravings, and cognitive difficulties. Understanding this timeline helps set realistic expectations for recovery.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.cocaineMilestone14Title,
        description: l10n.cocaineMilestone14Description,
        reference: "Oxford Treatment - Cocaine Withdrawal Timeline",
        link: "https://oxfordtreatment.com/substance-abuse/cocaine/withdrawal/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Without Cocaine: Finding Stability\n\n"
            "Source: Oxford Treatment Center\n\n"
            "The Two-Week Marker\n"
            "Oxford Treatment's cocaine withdrawal timeline identifies two weeks as the transition from acute withdrawal into the early recovery phase. The severe crash-related symptoms have largely resolved, and the challenge shifts from getting through acute symptoms to rebuilding neurological and psychological health.\n\n"
            "Mood and Emotional State\n"
            "At two weeks, mood is typically still below normal baseline — the dopamine system's recovery is gradual, and natural sources of pleasure have not yet fully resumed their reinforcing power. However, compared to days 1–7, most people notice genuine improvement: the profound anhedonia of early withdrawal is lessening, and moments of genuine wellbeing are starting to return.\n\n"
            "Cravings and Triggers\n"
            "Cue-triggered cravings are a significant challenge at this stage. The brain has formed strong associations between cocaine use and specific environments, people, emotions, and activities. Encountering any of these triggers can produce intense cravings even when general mood is improving. Avoiding high-risk environments and building new associations is important.\n\n"
            "Sleep Improvement\n"
            "Sleep is usually more stable and restorative by two weeks than it was during the acute withdrawal phase. Improved sleep has a significant positive effect on mood, cognitive function, and the ability to manage cravings.\n\n"
            "Building the Foundation\n"
            "Oxford Treatment emphasises that the two-week mark is an important time to engage with support structures — therapy, support groups, sober social connections — that will underpin long-term recovery.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.cocaineMilestone60Title,
        description: l10n.cocaineMilestone60Description,
        reference: "Guardian Recovery - Cocaine and Sleep",
        link:
            "https://www.guardianrecovery.com/addiction-treatment/cocaine-abuse-addiction/cocaine-sleep/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Months Without Cocaine: Sleep and Mood Improve\n\n"
            "Source: Guardian Recovery\n\n"
            "Cocaine and Sleep: The Problem\n"
            "Cocaine severely disrupts sleep through multiple mechanisms. It stimulates the central nervous system, suppressing sleep-promoting systems. It disrupts REM sleep — the stage associated with emotional processing and memory consolidation. Chronic cocaine users typically have very poor sleep quality: short, fragmented, non-restorative sleep alternating with post-binge crashes of excessive sleep.\n\n"
            "Sleep Recovery at 60 Days\n"
            "Guardian Recovery documents that by two months of abstinence, sleep architecture is significantly restored. REM sleep is normalising, sleep onset is more reliable, and sleep is genuinely restorative rather than just sedating. Many people at this stage report that they are sleeping better than they have in years.\n\n"
            "Mood Recovery\n"
            "The mood improvements at 60 days are substantial and interconnected with sleep recovery. As REM sleep normalises, emotional regulation improves — the brain is processing emotions more effectively during sleep. The anhedonia of early recovery is largely resolved. Most people at two months can genuinely enjoy activities, food, social connection, and accomplishment in ways that felt impossible in early withdrawal.\n\n"
            "Dopamine System Progress\n"
            "Research shows that dopamine receptor density and function improve significantly over the first 1–3 months of cocaine abstinence. At 60 days, the reward system is substantially more responsive to natural stimuli, which underlies the mood improvements and return of pleasure.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.cocaineMilestone90Title,
        description: l10n.cocaineMilestone90Description,
        reference: "Munster Behavioral Health - Brain Recovery Timeline",
        link:
            "https://munsterbehavioralhealth.com/how-long-to-rewire-brain-from-addiction/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Without Cocaine: Brain Restoration\n\n"
            "Source: Munster Behavioral Health\n\n"
            "Three months is a major neurological milestone in cocaine recovery. The brain has had substantial time to begin rebuilding the dopaminergic systems that cocaine disrupted so profoundly.\n\n"
            "Neural Rewiring\n"
            "Munster Behavioral Health documents that the brain requires a minimum of 90 days of abstinence to begin meaningful rewiring of the addiction-related neural circuits. During active cocaine use, the brain builds strong neural pathways associating cocaine with reward, and weakens natural reward pathways. Three months of non-activation begins to weaken the drug-associated pathways through a process called synaptic pruning, while natural reward pathways strengthen.\n\n"
            "Prefrontal Cortex Recovery\n"
            "Cocaine significantly impairs prefrontal cortex function — the brain region responsible for impulse control, decision-making, and self-regulation. Brain imaging studies show measurable improvement in prefrontal activity and connectivity at the three-month mark, which corresponds to real-world improvements in:\n"
            "• Impulse control and decision-making quality\n"
            "• Ability to delay gratification\n"
            "• Resistance to cravings and triggers\n\n"
            "Cognitive Function\n"
            "Working memory, attention, and cognitive flexibility show significant recovery at 90 days. The mental fog of early recovery is clearing, and the ability to concentrate on meaningful tasks returns.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.cocaineMilestone180Title,
        description: l10n.cocaineMilestone180Description,
        reference: "Recovery Research Institute - Brain Recovery from Cocaine",
        link:
            "https://www.recoveryanswers.org/research-post/brain-recovery-cocaine-use-disorder/",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Without Cocaine: Cognitive Gains\n\n"
            "Source: Recovery Research Institute\n\n"
            "Research-Based Recovery\n"
            "The Recovery Research Institute synthesises peer-reviewed neuroscience research on brain recovery from cocaine use disorder. At six months, the picture is one of substantial — and in many areas nearly complete — neurological recovery for most users.\n\n"
            "Brain Imaging Evidence\n"
            "PET scan studies of people recovering from cocaine use disorder show that brain glucose metabolism (a measure of neural activity) in the orbitofrontal cortex and striatum — areas severely disrupted by cocaine — shows significant recovery toward normal levels by 6 months of abstinence. These changes correlate with improved decision-making, reduced impulsivity, and better emotion regulation.\n\n"
            "Cognitive Recovery\n"
            "The RRI documents that at six months:\n"
            "• Attention and working memory are substantially recovered\n"
            "• Executive function (planning, decision-making, cognitive flexibility) is near normal for most users\n"
            "• Verbal learning and memory have improved significantly\n"
            "• Processing speed continues recovering\n\n"
            "Emotional and Social Recovery\n"
            "With the brain's regulatory systems working better, emotional life is richer and more stable. Many people at six months describe genuinely enjoying relationships, hobbies, and work in ways that were impossible during active cocaine use or early recovery.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.cocaineMilestone365Title,
        description: l10n.cocaineMilestone365Description,
        reference: "FHE Health - Addiction Healing Timeline",
        link: "https://fherehab.com/learning/how-long-to-heal-addiction",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Without Cocaine: Cardiovascular Health\n\n"
            "Source: FHE Health\n\n"
            "One Year — A Major Milestone\n"
            "FHE Health's addiction healing timeline identifies the one-year mark as when the most dramatic and far-reaching physical and neurological healing has occurred. For cocaine specifically, one year brings measurable recovery across the cardiovascular, neurological, and psychological systems.\n\n"
            "Cardiovascular Recovery\n"
            "Cocaine is extraordinarily hard on the cardiovascular system — it constricts blood vessels, raises blood pressure and heart rate, increases the risk of arrhythmias, and accelerates the development of atherosclerosis. Long-term cocaine users have significantly elevated risk of heart attack and stroke. At one year of abstinence:\n"
            "• Blood pressure has normalised\n"
            "• Vascular inflammation has reduced\n"
            "• Cocaine-associated cardiomyopathy (heart muscle damage) shows recovery in many cases\n"
            "• Risk of cocaine-induced coronary artery spasm is gone\n\n"
            "Brain Recovery\n"
            "Neurological recovery at one year is substantial. Dopamine system function, prefrontal cortex activity, and the overall architecture of the reward system have all improved markedly. The brain's capacity for natural reward, impulse control, and emotional regulation is functioning well.\n\n"
            "Long-term Sobriety\n"
            "FHE Health emphasises that at one year, the changes in identity, lifestyle, and neural circuitry that support sustained recovery are well-established. Relapse risk, while never zero, is substantially lower than in the first months.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.cocaineMilestone730Title,
        description: l10n.cocaineMilestone730Description,
        reference: "PMC - Recovering from Cocaine: Clinical Investigations",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3935515/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Years Without Cocaine: Sustained Recovery\n\n"
            "Source: PMC — Peer-reviewed clinical research on cocaine recovery\n\n"
            "Long-Term Neurological Recovery\n"
            "This PMC-published research on cocaine recovery documents findings from longitudinal clinical investigations following people in long-term cocaine abstinence. The two-year data shows that brain function measured by imaging continues to normalise, with some markers only reaching normal levels at 1–2 years.\n\n"
            "Dopamine Transporter Recovery\n"
            "One of the key findings in this body of research is the recovery of dopamine transporters (DAT) — proteins critical to normal dopamine signalling that are significantly impaired by long-term cocaine use. DAT density, measured by brain imaging, shows continued recovery over years of abstinence, approaching normal levels by the two-year mark for many users.\n\n"
            "Structural Brain Recovery\n"
            "Research at this time horizon also documents recovery of grey matter volume in regions including the prefrontal cortex and insula — areas reduced by chronic cocaine use. This structural recovery correlates with functional improvements in decision-making, self-awareness, and emotional regulation.\n\n"
            "Two Years in Context\n"
            "At two years, most people in recovery from cocaine use disorder describe a life that is qualitatively different from their using days — not just abstinent, but genuinely thriving. The neural infrastructure for healthy decision-making, emotional connection, and natural reward is fully operational.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.cocainePageTitle,
      storageKey: 'cocaine',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.cocaineHeaderStarted,
      headerNotStarted: l10n.cocaineHeaderNotStarted,
      subtitleStarted: l10n.cocaineSubtitleStarted,
      subtitleNotStarted: l10n.cocaineSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
