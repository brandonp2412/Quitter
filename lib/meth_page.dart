import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class MethPage extends StatelessWidget {
  final bool started;
  const MethPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.methMilestone1Title,
        description: l10n.methMilestone1Description,
        reference: "Orlando Recovery Center - Meth Withdrawal Timeline",
        link:
            "https://www.orlandorecovery.com/drug-addiction-resources/meth/withdrawal-timeline/",
        referenceDate: "March 2026",
        referenceContent:
            "Methamphetamine Withdrawal: The First 24 Hours\n\n"
            "Source: Orlando Recovery Center\n\n"
            "The Crash\n"
            "Methamphetamine produces its effects by massively flooding the brain with dopamine — up to five times more than cocaine. When meth use stops, the dopamine system collapses into a state of profound depletion. The first 24 hours are characterised by the crash: an abrupt transition from the extreme stimulation of meth to profound physical and psychological exhaustion.\n\n"
            "Day One Symptoms\n"
            "• Extreme fatigue — most people sleep for extended periods\n"
            "• Increased appetite (meth powerfully suppresses appetite)\n"
            "• Depressed mood and emotional flatness\n"
            "• Intense cravings\n"
            "• Anxiety and irritability\n"
            "• Paranoia may persist from recent meth use\n\n"
            "Physical Safety\n"
            "Like cocaine, meth withdrawal is not directly life-threatening in terms of the withdrawal syndrome itself. However, the profound psychological effects — particularly severe depression — can lead to suicidal ideation in some users. Medical supervision is strongly advisable, especially for heavy users.\n\n"
            "The Scale of the Challenge\n"
            "Orlando Recovery Center emphasises that meth is one of the most difficult substances to withdraw from psychologically, because it causes more profound dopamine depletion than almost any other substance. The crash is extreme, but it is temporary — the brain's recovery begins immediately.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.methMilestone3Title,
        description: l10n.methMilestone3Description,
        reference: "The Recovery Village - Meth Withdrawal and Detox",
        link:
            "https://www.therecoveryvillage.com/meth-addiction/withdrawal-detox/",
        referenceDate: "March 2026",
        referenceContent:
            "Meth Withdrawal: Day Three — Peak Challenge\n\n"
            "Source: The Recovery Village\n\n"
            "Peak Withdrawal\n"
            "The Recovery Village documents that meth withdrawal peaks around days 2–4, with day three being among the most difficult. After the initial crash and sleep, the user wakes into the full force of the withdrawal syndrome.\n\n"
            "Day Three Symptoms\n"
            "• Severe depression — often the most intense depression many people have experienced\n"
            "• Anhedonia — complete inability to feel pleasure from anything\n"
            "• Intense cravings, driven by the dopamine-depleted brain's urgent signals\n"
            "• Cognitive difficulties — difficulty thinking clearly or concentrating\n"
            "• Insomnia alternating with hypersomnia\n"
            "• Continued fatigue and physical weakness\n\n"
            "The Dopamine Deficit\n"
            "The Recovery Village explains that meth withdrawal's intensity compared to other stimulants stems from the scale of dopamine depletion it causes. PET scan studies show that long-term meth users have significantly reduced dopamine receptor density and dopamine transporter availability in the brain — particularly in the striatum. At day three, these deficits are stark, producing the severe anhedonia and depression characteristic of this phase.\n\n"
            "This Will Pass\n"
            "Day three is typically close to the worst point of acute withdrawal. Understanding that this extreme state is temporary and neurological — not a permanent condition — is important for enduring it.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.methMilestone7Title,
        description: l10n.methMilestone7Description,
        reference: "Greenhouse Treatment - Meth Withdrawal Information",
        link:
            "https://greenhousetreatment.com/stimulants/crystal-meth-addiction/withdrawal/",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Without Meth: Physical Symptoms Ease\n\n"
            "Source: Greenhouse Treatment Center\n\n"
            "End of Acute Phase\n"
            "Greenhouse Treatment documents that by the end of the first week, the acute physical symptoms of meth withdrawal are largely subsiding. The severe fatigue and physical crash are improving, appetite is returning, and basic physical functioning is recovering.\n\n"
            "Meth Withdrawal Timeline\n"
            "• Hours 0–24: Crash — extreme fatigue, depression, increased sleep\n"
            "• Days 2–4: Peak — severe depression, anhedonia, cravings, cognitive fog\n"
            "• Days 5–7: Gradual improvement in physical symptoms\n"
            "• Weeks 2–4: Post-acute phase — mood slowly improving, cravings frequent\n"
            "• Months 1–3: Ongoing psychological recovery\n"
            "• Months 3–14: Dopamine system recovery continues\n\n"
            "Persistent Challenges at Day 7\n"
            "While physical symptoms are improving, psychological symptoms are the dominant challenge at week one:\n"
            "• Depression, though less severe than at peak, is still significant\n"
            "• Cravings are still strong, particularly in response to cues\n"
            "• Cognitive function remains impaired — concentration and memory are still affected\n"
            "• Sleep may still be disrupted\n\n"
            "Physical Recovery Underway\n"
            "The body is beginning to recover from meth's effects on cardiovascular function, nutrition, and hydration. Appetite is returning and energy is slowly building.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.methMilestone30Title,
        description: l10n.methMilestone30Description,
        reference: "Clearhaven Recovery - Stages of Meth Recovery",
        link:
            "https://www.clearhavenrecovery.com/what-are-the-stages-of-meth-recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Without Meth: Emerging Stability\n\n"
            "Source: Clearhaven Recovery\n\n"
            "Stages of Meth Recovery\n"
            "Clearhaven Recovery describes meth recovery in distinct stages, with the one-month mark representing the transition from the crisis phase to the beginning of true stabilisation.\n\n"
            "Stage 1 (Days 1–7): Acute withdrawal — crash, peak symptoms, survival mode\n"
            "Stage 2 (Weeks 2–4): Honeymoon — some improvement, cautious optimism, though challenges remain\n"
            "Stage 3 (Months 1–4): The 'wall' — often the most psychologically challenging sustained period, where the reality of early recovery sets in without the acute drama\n\n"
            "What's Happening at One Month\n"
            "At 30 days, the brain has had substantial time to begin its long-term dopamine recovery process. Improvements at this stage include:\n"
            "• Mood is noticeably better than during acute withdrawal, though still below normal\n"
            "• Appetite and weight are stabilising\n"
            "• Sleep is becoming more regular\n"
            "• Basic cognitive function improving\n\n"
            "The 'Wall' Warning\n"
            "Clearhaven honestly documents that many people in meth recovery experience a difficult psychological period around months 1–4 where motivation is low, depression persists, and relapse risk is high. Understanding this as a normal and temporary phase — not a sign of failure — is critical for getting through it.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.methMilestone90Title,
        description: l10n.methMilestone90Description,
        reference: "American Journal of Psychiatry - Meth Dependence Treatment (Rawson et al.)",
        link: "https://psychiatryonline.org/doi/10.1176/appi.ajp.161.2.242",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Without Meth: Brain Healing Begins\n\n"
            "Source: Rawson et al. (2004) — American Journal of Psychiatry\n\n"
            "About This Research\n"
            "This peer-reviewed study published in the American Journal of Psychiatry compared multiple psychosocial treatment approaches for methamphetamine dependence and tracked outcomes over time. It is one of the foundational studies in understanding meth recovery trajectories.\n\n"
            "Three-Month Outcomes\n"
            "The study found that participants who maintained abstinence showed measurable improvement in psychological and functional outcomes by the three-month mark. Critically, cognitive function — which is severely impaired by meth use — showed the beginning of meaningful recovery at this stage.\n\n"
            "Brain Healing at 90 Days\n"
            "Neuroimaging research (complementing this clinical study) shows that at three months of meth abstinence:\n"
            "• Dopamine transporter (DAT) levels are recovering in the striatum\n"
            "• Brain metabolic activity in the prefrontal cortex is increasing\n"
            "• Impulse control and decision-making are measurably improving\n\n"
            "The Importance of 90 Days\n"
            "The research documents that three months is a meaningful threshold in meth recovery — the brain has recovered enough function that engagement with behavioral therapy becomes highly productive. Cognitive-behavioural therapy, contingency management, and group support all show greater effectiveness when the brain has had 90 days to begin healing.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.methMilestone180Title,
        description: l10n.methMilestone180Description,
        reference: "American College of Cardiology - Heart Recovery After Drug Abuse",
        link:
            "https://www.acc.org/about-acc/press-releases/2017/05/30/09/59/stopping-drug-abuse-can-reverse-related-heart-damage",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Without Meth: Cardiovascular Recovery\n\n"
            "Source: American College of Cardiology\n\n"
            "Meth and the Heart\n"
            "Methamphetamine is one of the most cardiotoxic recreational drugs known. The American College of Cardiology documents that meth use causes:\n"
            "• Severe hypertension and elevated heart rate during use\n"
            "• Cardiomyopathy (weakening of the heart muscle)\n"
            "• Coronary artery disease and arterial inflammation\n"
            "• Arrhythmias (irregular heart rhythms)\n"
            "• Increased risk of heart attack and sudden cardiac death\n\n"
            "Can the Heart Recover?\n"
            "The ACC's 2017 research findings — which gained significant attention — documented that stopping meth use can reverse significant amounts of the cardiac damage it causes. Research presented to the ACC showed measurable recovery of cardiac function in former meth users who had maintained abstinence.\n\n"
            "Six-Month Cardiovascular Status\n"
            "At six months of abstinence:\n"
            "• Blood pressure and resting heart rate have normalised\n"
            "• Cardiac inflammation is substantially reduced\n"
            "• Heart muscle function is showing signs of recovery in many users\n"
            "• Risk of acute meth-related cardiac events is eliminated\n\n"
            "This Is Remarkable\n"
            "The ACC's finding that drug-related heart damage can reverse with abstinence was significant because it challenged assumptions about permanence. The heart, like the brain, has substantial capacity for healing when the damaging substance is removed.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.methMilestone365Title,
        description: l10n.methMilestone365Description,
        reference: "Recovery Research Institute - Brain in Recovery",
        link: "https://www.recoveryanswers.org/recovery-101/brain-in-recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Without Meth: Major Brain Recovery\n\n"
            "Source: Recovery Research Institute\n\n"
            "One year of meth abstinence is associated with dramatic neurological recovery. The dopaminergic system, which meth devastates more thoroughly than almost any other substance, has had substantial time to rebuild.\n\n"
            "Brain Imaging at One Year\n"
            "PET scan studies of meth users at one year of abstinence show significant recovery in:\n"
            "• Dopamine transporter (DAT) density — approaching normal levels in many users\n"
            "• Dopamine receptor (D2/D3) availability — recovering\n"
            "• Prefrontal cortex glucose metabolism — significantly improved\n"
            "• Striatal function — recovering toward normal\n\n"
            "Cognitive Recovery\n"
            "The Recovery Research Institute documents that cognitive function shows major recovery at one year:\n"
            "• Working memory: near normal for many users\n"
            "• Processing speed: significantly improved\n"
            "• Executive function: substantially recovered\n"
            "• Attention: near normal\n\n"
            "What People Experience at One Year\n"
            "People at one year of meth recovery commonly describe feeling like themselves again — experiencing emotions, thinking clearly, and engaging with life in ways that were impossible during use and early recovery. The neurological foundation for genuine wellbeing has been substantially rebuilt.",
      ),
      QuitMilestone(
        day: 420,
        title: l10n.methMilestone420Title,
        description: l10n.methMilestone420Description,
        reference: "Journal of Neuroscience - Dopamine Transporter Recovery After Meth",
        link: "https://www.jneurosci.org/content/21/23/9414",
        referenceDate: "March 2026",
        referenceContent:
            "14 Months Without Meth: Dopamine Normalisation\n\n"
            "Source: Volkow et al. (2001) — Journal of Neuroscience\n\n"
            "About This Research\n"
            "This landmark paper by Nora Volkow and colleagues (Volkow was later Director of NIDA) used PET brain imaging to study dopamine transporter (DAT) recovery in methamphetamine users after abstinence. It is one of the most cited studies in meth recovery research.\n\n"
            "The Finding\n"
            "The study found that DAT levels — severely depleted in meth users — showed significant recovery with abstinence. Critically, the research documented that DAT recovery continued for over 14 months, with levels approaching (though not always fully reaching) those of non-users at this timeframe.\n\n"
            "Why DAT Matters\n"
            "Dopamine transporters (DATs) are proteins responsible for recycling dopamine after it is released in synapses. Meth destroys DAT function, leaving the dopamine system unable to regulate itself normally. Recovery of DAT function is a key marker of dopamine system normalisation and correlates directly with improved mood, motivation, and cognitive function.\n\n"
            "What This Means at 14 Months\n"
            "At 14 months, the Volkow study's data suggests the brain's dopamine system has substantially recovered. The meth-induced dopamine deficit that caused profound anhedonia, depression, and cognitive impairment in early recovery has largely resolved. The natural reward system is functioning at or near normal levels.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.methMilestone730Title,
        description: l10n.methMilestone730Description,
        reference: "Better Addiction Care - Dopamine Receptor Recovery",
        link:
            "https://betteraddictioncare.com/addiction/dopamine-receptor-recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Years Without Meth: Sustained Recovery\n\n"
            "Source: Better Addiction Care\n\n"
            "Dopamine Receptor Recovery: The Long Game\n"
            "Better Addiction Care documents the multi-year timeline of dopamine receptor recovery after meth use. While meth causes the most profound dopamine system disruption of common substances, the evidence shows that this disruption is largely reversible over 1–2 years of sustained abstinence.\n\n"
            "Two-Year Recovery Status\n"
            "At two years, research and clinical experience document:\n"
            "• D2/D3 dopamine receptor density substantially recovered\n"
            "• DAT levels near normal or at normal\n"
            "• Natural reward system functional: the ability to experience pleasure, motivation, and satisfaction from normal life activities is fully restored\n"
            "• Brain structure: grey matter volume in affected regions (striatum, prefrontal cortex, insula) shows continued recovery\n\n"
            "Cognitive Function at Two Years\n"
            "Cognitive function is largely or fully normalised at two years for most meth users. The one exception may be very long-term heavy users, who may retain some subtle cognitive differences — though these continue improving.\n\n"
            "Life at Two Years\n"
            "Two years of meth-free living represents a complete transformation. The neurological infrastructure that meth destroyed has been rebuilt. People at this stage describe motivation, emotional connection, clarity of mind, and physical health that are far superior to anything they experienced during use.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.methPageTitle,
      storageKey: 'meth',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.methHeaderStarted,
      headerNotStarted: l10n.methHeaderNotStarted,
      subtitleStarted: l10n.methSubtitleStarted,
      subtitleNotStarted: l10n.methSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
