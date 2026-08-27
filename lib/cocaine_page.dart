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
            "StatPearls describes stimulant withdrawal as beginning with a \"crash\" once use stops, characterised by marked depression, excessive sleep, hunger, low mood, and severe slowing of movement and thinking. In the first 24 hours this typically includes:\n"
            "• Extreme fatigue and increased need for sleep\n"
            "• Depressed mood and slower movement and thinking\n"
            "• Increased appetite (cocaine suppresses appetite)\n\n"
            "Cravings, irritability, and anxiety are also very commonly reported during this window in the broader addiction literature, even though StatPearls doesn't itemise them as part of the crash specifically.\n\n"
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
            "• Low mood and depressed mood at their most intense\n"
            "• Loss of pleasure\n"
            "• Strong, cue-triggered cravings\n"
            "• Anxiety and restlessness\n"
            "• Disturbed sleep — excessive in some, insomnia in others\n\n"
            "The Cardiovascular Danger Recedes\n"
            "StatPearls identifies cardiovascular toxicity as cocaine's most lethal effect: raised heart rate and blood pressure, increased myocardial oxygen demand, coronary vasospasm, and platelet activation — driving the risk of arrhythmia, infarction, and stroke, even in young users. Cocaine's own half-life is short, about one hour, and by day three the drug itself has fully cleared your system — though StatPearls notes its metabolites can still cause blood vessel constriction for hours after use, and one metabolite may linger for weeks, so some residual cardiovascular strain can outlast the drug itself.\n\n"
            "The Road Ahead\n"
            "The acute phase is intense, but it is the psychological symptoms — depression, cravings, loss of pleasure — that require the most support and that persist longest.",
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
            "StatPearls describes cocaine withdrawal as moving from the initial crash into a longer recovery phase. By the end of the first week, the worst symptoms are usually easing while the dopamine system continues rebuilding.\n\n"
            "Physical Recovery Underway\n"
            "Once cocaine's sympathetic stimulation stops, its cardiovascular, appetite, sleep, and airway effects begin reversing over the following days and weeks:\n"
            "• Heart rate and blood pressure moving back toward normal\n"
            "• Appetite gradually returning (cocaine strongly suppresses it)\n"
            "• Sleep patterns beginning to stabilise\n"
            "• Nasal passages starting to heal, if cocaine was snorted\n\n"
            "Psychological Symptoms Continue\n"
            "StatPearls notes that depression and loss of pleasure are characteristic of stimulant withdrawal and outlast the physical symptoms:\n"
            "• Mood remains low, though less severe than at peak\n"
            "• Cue-triggered cravings remain strong\n"
            "• Concentration and motivation are still impaired\n\n"
            "Post-Acute Phase\n"
            "Withdrawal then shifts into weeks or months of steadier improvement in mood, cravings, and clear thinking. Knowing that pattern makes the slower part of recovery easier to manage.",
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
            "Two Weeks In\n"
            "By two weeks, the severe crash symptoms — deep depression, sleeping a lot, and slowed movement and thinking — have generally eased. Recovery is now focused on rebuilding brain and emotional health.\n\n"
            "Mood and Emotional State\n"
            "At two weeks, mood can still be below normal while the dopamine system recovers. Compared with the first week, the deep loss of pleasure is easing and genuine moments of wellbeing are returning.\n\n"
            "Cravings and Triggers\n"
            "Cue-triggered cravings are a significant challenge at this stage. The brain has formed strong associations between cocaine use and specific environments, people, emotions, and activities. Encountering any of these triggers can produce intense cravings even when general mood is improving. Avoiding high-risk environments and building new associations is important.\n\n"
            "Sleep Improvement\n"
            "Sleep is usually more stable and restorative by two weeks than it was during the acute withdrawal phase. Improved sleep has a significant positive effect on mood, clear thinking, and the ability to manage cravings.\n\n"
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
            "In animal studies, cocaine-related changes in dopamine receptors and recycling proteins moved back toward healthy levels with sustained abstinence. As the reward system recovers, the deep loss of pleasure lifts and everyday rewards — food, connection, accomplishment — feel rewarding again.\n\n"
            "Recovery Signal\n"
            "By two months, mood is improving and sleep is steadier while dopamine and frontal-cortex systems continue rebuilding. Primate studies show cocaine-related D1-receptor and transporter changes moving back toward control levels with sustained abstinence.",
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
            "This review highlights the three-month point as biologically meaningful. In nonhuman primates, the dopamine D1 receptors and transporters that cocaine had elevated showed \"evidence of a return to control levels\" after roughly 90 days of abstinence — direct evidence that the reward system can readjust once the drug is gone.\n\n"
            "The Front of the Brain\n"
            "The authors highlight recovery in the front of the brain as one of the most important signs of extended abstinence. This area handles impulse control, decision-making, and self-control, and those abilities strengthen as it recovers.\n\n"
            "What 90 Days Shows\n"
            "At 90 days, primate studies found D1, D2, and dopamine-transporter densities no longer significantly different from non-drug controls. Even after long exposure, substantial dopamine-system recovery is already visible by this point and continues with abstinence.",
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
            "Six Months Without Cocaine: Clearer Thinking\n\n"
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
            "Recovery Signal\n"
            "At about six months, one longitudinal fMRI cohort showed an activation pattern comparable to non-addicted healthy controls, while midbrain and deep-brain activation improved as abstinence lengthened. That is directly imaged functional brain recovery.",
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
            "Recovery Signal\n"
            "Stopping cocaine halts the repeated coronary vasospasm, tachycardia, hypertension, clot promotion, and oxygen mismatch that drive acute heart injury. Existing fibrosis or myocarditis remains a medical issue, but the repeated cocaine-triggered insult is gone.\n\n"
            "Brain Recovery Too\n"
            "By one year, the reward and self-control systems have had extended time to recover, supporting better impulse control, steadier mood, and a stronger response to everyday rewards.",
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
            "Recovery Signal\n"
            "The authors raise a genuine scientific caution: some of the difference in long-term abstainers may reflect a \"survivor effect\" — people who began with greater brain integrity may find it easier to stay abstinent — rather than recovery alone. What is clear is that two years cocaine-free supports a brain functioning far closer to a non-user's, and a life that is not merely abstinent but substantially rebuilt.",
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
