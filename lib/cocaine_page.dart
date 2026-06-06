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
        reference: "Withdrawal Syndromes — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
        referenceDate: "June 2026",
        referenceContent:
            "Cocaine Withdrawal: The First 24 Hours\n\n"
            "Source: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\n"
            "Cocaine and the Brain\n"
            "Cocaine blocks the reuptake of dopamine (and other monoamines) in the brain's reward circuits, causing dopamine to accumulate and producing intense euphoria and energy. With regular use the brain adapts by down-regulating this system, so that without the drug, normal activities feel flat.\n\n"
            "The Crash\n"
            "StatPearls describes stimulant withdrawal as beginning with a \"crash\" once use stops. In the first 24 hours this typically includes:\n"
            "• Extreme fatigue and increased need for sleep\n"
            "• Depressed mood and emotional flatness\n"
            "• Increased appetite (cocaine suppresses appetite)\n"
            "• Intense craving\n"
            "• Irritability, anxiety, and agitation\n\n"
            "Unlike Some Other Drugs\n"
            "StatPearls notes that stimulant withdrawal is treated with observation and supportive care; unlike alcohol or benzodiazepine withdrawal, it does not typically cause seizures or delirium. The principal danger is psychological — depression and, in heavy users, suicidal ideation can occur during the crash, so support and monitoring are advisable.\n\n"
            "No Approved Medication\n"
            "There are currently no medications approved to treat cocaine withdrawal; management is supportive, and non-drug approaches such as contingency management are the evidence-based treatments for the underlying use disorder.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.cocaineMilestone3Title,
        description: l10n.cocaineMilestone3Description,
        reference: "Cocaine Toxicity — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK430976/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Days Without Cocaine: Navigating Peak Challenge\n\n"
            "Source: \"Cocaine Toxicity,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\n"
            "How Cocaine Affects the Body\n"
            "StatPearls documents that cocaine blocks the reuptake of dopamine, norepinephrine, and serotonin, prolonging sympathetic stimulation. This is what drives both its euphoria and its danger — it can affect nearly every organ system.\n\n"
            "Days 2–4: Peak Psychological Withdrawal\n"
            "By day three the acute crash has given way to the most intense psychological withdrawal:\n"
            "• Dysphoria and depressed mood at their most intense\n"
            "• Anhedonia (inability to feel pleasure)\n"
            "• Strong, cue-triggered cravings\n"
            "• Anxiety and restlessness\n"
            "• Disturbed sleep — excessive in some, insomnia in others\n\n"
            "The Cardiovascular Danger Recedes\n"
            "StatPearls identifies cardiovascular toxicity as cocaine's most lethal effect: raised heart rate and blood pressure, increased myocardial oxygen demand, coronary vasospasm, and platelet activation — driving the risk of arrhythmia, infarction, and stroke, even in young users. The greatest acute risk falls within roughly an hour of use, so with cocaine cleared by day three, this acute cardiovascular threat has largely passed.\n\n"
            "The Road Ahead\n"
            "The acute phase is intense, but it is the psychological symptoms — depression, cravings, anhedonia — that require the most support and that persist longest.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.cocaineMilestone7Title,
        description: l10n.cocaineMilestone7Description,
        reference: "Withdrawal Syndromes — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Without Cocaine: Physical Recovery Begins\n\n"
            "Source: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\n"
            "The Acute Phase Is Ending\n"
            "StatPearls describes cocaine withdrawal as moving from the initial crash into a more protracted phase. By the end of the first week the most intense acute symptoms are typically subsiding, even though the dopamine system's recovery is a much longer process.\n\n"
            "Physical Recovery Underway\n"
            "With the drug's sympathetic stimulation gone, the physical effects are reversing:\n"
            "• Heart rate and blood pressure settling\n"
            "• Appetite returning (cocaine strongly suppresses it)\n"
            "• Sleep patterns stabilising\n"
            "• Nasal passages beginning to heal, if cocaine was snorted\n"
            "• Nutrition improving as food intake normalises\n\n"
            "Psychological Symptoms Continue\n"
            "StatPearls notes that depression and anhedonia are characteristic of stimulant withdrawal and outlast the physical symptoms:\n"
            "• Mood remains low, though less severe than at peak\n"
            "• Cue-triggered cravings remain strong\n"
            "• Concentration and motivation are still impaired\n\n"
            "Post-Acute Phase\n"
            "Withdrawal transitions into a longer phase of mood instability, cravings, and cognitive difficulty lasting weeks to months. Knowing this timeline helps set realistic expectations and reduces the risk of relapse from discouragement.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.cocaineMilestone14Title,
        description: l10n.cocaineMilestone14Description,
        reference: "Withdrawal Syndromes — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Without Cocaine: Finding Stability\n\n"
            "Source: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\n"
            "The Two-Week Marker\n"
            "Two weeks marks the transition from acute withdrawal into the early recovery phase. The severe crash-related symptoms StatPearls describes have largely resolved, and the challenge shifts from getting through acute symptoms to rebuilding neurological and psychological health.\n\n"
            "Mood and Emotional State\n"
            "At two weeks, mood is typically still below normal baseline — the dopamine system's recovery is gradual, and natural sources of pleasure have not yet fully resumed their reinforcing power. However, compared to days 1–7, most people notice genuine improvement: the profound anhedonia of early withdrawal is lessening, and moments of genuine wellbeing are starting to return.\n\n"
            "Cravings and Triggers\n"
            "Cue-triggered cravings are a significant challenge at this stage. The brain has formed strong associations between cocaine use and specific environments, people, emotions, and activities. Encountering any of these triggers can produce intense cravings even when general mood is improving. Avoiding high-risk environments and building new associations is important.\n\n"
            "Sleep Improvement\n"
            "Sleep is usually more stable and restorative by two weeks than it was during the acute withdrawal phase. Improved sleep has a significant positive effect on mood, cognitive function, and the ability to manage cravings.\n\n"
            "Building the Foundation\n"
            "Because the evidence-based treatments for stimulant use disorder are behavioural — contingency management, therapy, and peer support — the two-week mark is an important time to engage with support structures that will underpin long-term recovery.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.cocaineMilestone60Title,
        description: l10n.cocaineMilestone60Description,
        reference:
            "Recovering from Cocaine: Clinical & Preclinical Investigations (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3935515/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Months Without Cocaine: Mood and Reward Begin to Recover\n\n"
            "Source: \"Recovering from Cocaine: Insights from Clinical and Preclinical Investigations,\" Neuroscience & Biobehavioral Reviews (2013), on PubMed Central\n\n"
            "What the Brain Is Doing\n"
            "This review synthesises human and animal studies of what happens to the brain when cocaine use stops. Chronic cocaine alters the dopamine system and reduces activity in the frontal cortex; recovery of these systems is the substrate for the mood and motivation improvements people notice in early abstinence.\n\n"
            "Reward System Progress\n"
            "In primate studies, cocaine-related changes in dopamine D1 receptors and transporters began returning toward control levels with sustained abstinence. As this reward circuitry recovers, the deep anhedonia of early withdrawal lifts and natural rewards — food, connection, accomplishment — start to feel rewarding again.\n\n"
            "An Honest Picture\n"
            "The review is candid that recovery is gradual and varies between individuals: the longer and heavier the prior use, the slower and less complete the rebound. Two months is real, meaningful progress — not a finish line. Mood is improving and sleep is steadier, but the reward system is still rebuilding, which is why ongoing support matters at this stage.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.cocaineMilestone90Title,
        description: l10n.cocaineMilestone90Description,
        reference:
            "Recovering from Cocaine: Clinical & Preclinical Investigations (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3935515/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Without Cocaine: Dopamine Markers Rebound\n\n"
            "Source: \"Recovering from Cocaine: Insights from Clinical and Preclinical Investigations,\" Neuroscience & Biobehavioral Reviews (2013), on PubMed Central\n\n"
            "Why 90 Days Is a Landmark\n"
            "This review highlights the three-month point as biologically meaningful. In nonhuman primates, the dopamine D1 receptors and transporters that cocaine had elevated showed \"evidence of a return to control levels\" after roughly 90 days of abstinence — direct evidence that the reward system can recalibrate once the drug is gone.\n\n"
            "Prefrontal Cortex\n"
            "The authors single out preservation and recovery of frontal-cortex function as perhaps the most important marker of extended abstinence. The prefrontal cortex governs impulse control, decision-making, and self-regulation — the capacities most needed to sustain recovery, and the ones that improve as cortical function returns.\n\n"
            "The Crucial Caveat\n"
            "Recovery depends heavily on how long and how heavily cocaine was used. In animals exposed for 12 months, only about 60% recovered D1 markers within three months. So 90 days is a genuine turning point for many — but for some, particularly long-term heavy users, the dopamine system needs considerably longer. Either way, the trajectory is toward repair.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.cocaineMilestone180Title,
        description: l10n.cocaineMilestone180Description,
        reference:
            "Brain Recovery in Substance Use Disorders During Abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8885813/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Without Cocaine: Cognitive Gains\n\n"
            "Source: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" on PubMed Central\n\n"
            "Recovery You Can Image\n"
            "This review pools longitudinal brain-imaging studies that scan the same people repeatedly as their abstinence lengthens. For cocaine, it reports that functional activity recovers measurably with sustained abstinence.\n\n"
            "Brain Imaging Evidence\n"
            "Two functional-MRI studies tracked cocaine users over time and both found improved activation in the midbrain and thalamus with longer abstinence. In one, after about six months of abstinence the brain's activation pattern was comparable to that of non-addicted healthy controls. Across substances, the review notes that nuclear-imaging results point to a dopaminergic recovery with abstinence.\n\n"
            "What This Means at Six Months\n"
            "These functional gains track with the real-world improvements people report by this stage:\n"
            "• Better attention and working memory\n"
            "• Sharper decision-making and impulse control\n"
            "• Steadier mood and emotional regulation\n\n"
            "An Honest Note\n"
            "The review stresses that recovery is gradual and varies between people, and that not every structural change fully reverses. But the direction at six months is clearly toward a brain that is functioning more like a non-user's.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.cocaineMilestone365Title,
        description: l10n.cocaineMilestone365Description,
        reference: "Cocaine Toxicity — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK430976/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Without Cocaine: Cardiovascular Strain Removed\n\n"
            "Source: \"Cocaine Toxicity,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\n"
            "Why the Heart Is Central\n"
            "StatPearls identifies cardiovascular toxicity as cocaine's most lethal effect. Each use raises heart rate, blood pressure, and myocardial oxygen demand while causing coronary vasospasm and promoting clot formation — a combination that drives heart attack, arrhythmia, and stroke even in young people.\n\n"
            "What a Year of Abstinence Removes\n"
            "Every day without cocaine is a day free of these acute insults. Over a year, the repeated surges in blood pressure and heart rate are gone, the risk of cocaine-induced coronary spasm and acute infarction is removed, and the heart is no longer being driven into oxygen mismatch.\n\n"
            "An Honest Caveat\n"
            "Not everything reverses. Chronic cocaine use can cause lasting structural change — increased left-ventricular mass and areas of myocardial scarring — and atherosclerosis that has developed does not simply disappear. Stopping halts the ongoing damage and removes the acute danger; existing structural damage should be assessed and managed medically.\n\n"
            "Brain Recovery Too\n"
            "By one year the reward and frontal-control systems have had extended time to recalibrate, supporting better impulse control, mood, and natural reward — though, as the recovery literature notes, the pace varies with how heavy and how long the prior use was.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.cocaineMilestone730Title,
        description: l10n.cocaineMilestone730Description,
        reference:
            "Recovering from Cocaine: Clinical & Preclinical Investigations (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3935515/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Years Without Cocaine: Sustained Recovery\n\n"
            "Source: \"Recovering from Cocaine: Insights from Clinical and Preclinical Investigations,\" Neuroscience & Biobehavioral Reviews (2013), on PubMed Central\n\n"
            "The Long View\n"
            "This review draws together what human and animal studies show about extended cocaine abstinence. Its central conclusion is that preservation and recovery of frontal-cortex function is the most important marker of long-term abstinence — long-term abstainers (10+ months) showed higher frontal-cortex activity than shorter-term abstainers.\n\n"
            "What Continues to Heal\n"
            "• Dopamine markers altered by cocaine continue moving toward normal with sustained abstinence\n"
            "• Reduced grey- and white-matter integrity seen in active and early-abstinent users may reverse over longer abstinence, possibly through continued myelin maturation\n"
            "• Frontal-control circuitry — impulse control, judgement, emotional regulation — strengthens\n\n"
            "An Honest Caveat\n"
            "The authors raise a genuine scientific caution: some of the difference in long-term abstainers may reflect a \"survivor effect\" — people who began with greater cortical integrity may find it easier to stay abstinent — rather than recovery alone. What is clear is that two years cocaine-free supports a brain functioning far closer to a non-user's, and a life that is not merely abstinent but substantially rebuilt.",
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
