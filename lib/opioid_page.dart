import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class OpioidPage extends StatelessWidget {
  final bool started;

  const OpioidPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.opioidMilestone1Title,
        description: l10n.opioidMilestone1Description,
        reference: "Medical News Today - Opioid Withdrawal Timeline",
        link:
            "https://www.medicalnewstoday.com/articles/opioid-withdrawal-timeline",
        referenceDate: "March 2026",
        referenceContent:
            "Opioid Withdrawal: Day One\n\n"
            "Source: Medical News Today\n\n"
            "⚠ Safety Note\n"
            "Opioid withdrawal is rarely fatal in otherwise healthy individuals, but it causes severe physical distress and carries an extremely high risk of relapse. Relapse after a period of abstinence is particularly dangerous because tolerance drops rapidly — using the same dose as before abstinence can cause fatal overdose. Medical supervision and medication-assisted treatment are strongly recommended.\n\n"
            "When Withdrawal Begins\n"
            "The timing depends on the opioid:\n"
            "• Short-acting opioids (heroin, oxycodone, hydrocodone): within 8–24 hours\n"
            "• Long-acting opioids (methadone, buprenorphine): 24–72 hours or later\n\n"
            "Day One Symptoms\n"
            "Medical News Today documents the early symptoms of opioid withdrawal:\n"
            "• Anxiety and agitation\n"
            "• Muscle aches and restlessness\n"
            "• Runny nose and watery eyes\n"
            "• Yawning and sweating\n"
            "• Insomnia\n"
            "• Early nausea\n\n"
            "Why It Feels So Bad\n"
            "The opioid system regulates pain, stress, emotional wellbeing, and basic comfort. Long-term opioid use suppresses the body's own opioid production (endorphins). When opioids are removed, the body is left without its normal comfort system — experiencing pain, anxiety, and distress at a level that reflects the depth of that suppression.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.opioidMilestone7Title,
        description: l10n.opioidMilestone7Description,
        reference: "Medical News Today - Opioid Withdrawal Timeline",
        link:
            "https://www.medicalnewstoday.com/articles/opioid-withdrawal-timeline",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Off Opioids: Peak Symptoms Declining\n\n"
            "Source: Medical News Today\n\n"
            "The Peak and Decline\n"
            "For short-acting opioids, Medical News Today documents that acute withdrawal peaks around days 2–4 and begins meaningfully declining by day 5–7. By the end of the first week:\n"
            "• Vomiting and diarrhoea are largely resolved\n"
            "• Muscle cramps are less severe\n"
            "• Physical distress is meaningfully reduced\n\n"
            "What Remains at Day 7\n"
            "While acute physical symptoms are improving, significant challenges persist:\n"
            "• Insomnia — sleep disruption is one of the most persistent opioid withdrawal symptoms\n"
            "• Depressed mood and emotional flatness\n"
            "• Fatigue and weakness\n"
            "• Cravings\n"
            "• Anxiety\n\n"
            "Post-Acute Withdrawal\n"
            "Medical News Today documents the transition to post-acute withdrawal syndrome (PAWS), which can last weeks to months and includes ongoing sleep disturbance, mood instability, cognitive difficulties, and episodic cravings. This phase is when most relapses occur.\n\n"
            "Medication-Assisted Treatment\n"
            "Buprenorphine (Suboxone) and methadone are evidence-based medications that dramatically reduce withdrawal symptoms and cravings, and reduce mortality from opioid use disorder. Many people in successful long-term opioid recovery use these medications throughout the early recovery phase.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.opioidMilestone14Title,
        description: l10n.opioidMilestone14Description,
        reference:
            "Bidirectional Relationship between Opioids and Disrupted Sleep (ASPET)",
        link:
            "https://molpharm.aspetjournals.org/article/S0026-895X(24)01026-5/fulltext",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Off Opioids: Sleep Patterns Starting to Improve\n\n"
            "Source: Peer-reviewed pharmacology research on opioids and sleep\n\n"
            "The Opioid-Sleep Connection\n"
            "This research paper examines the bidirectional relationship between opioid use and sleep disruption. The findings document that opioids severely disrupt normal sleep architecture through multiple mechanisms:\n"
            "• Suppression of slow-wave (deep) sleep\n"
            "• Disruption of REM sleep\n"
            "• Causing sleep-disordered breathing (central sleep apnea)\n"
            "• Disrupting circadian rhythm regulation\n\n"
            "A Vicious Cycle\n"
            "The research highlights the bidirectional nature of the problem: opioid use disrupts sleep, and poor sleep increases pain sensitivity and craving intensity, driving further opioid use. Breaking opioid dependence also means breaking this sleep-disruption cycle.\n\n"
            "Sleep at Two Weeks\n"
            "By 14 days of opioid abstinence, sleep is beginning to normalise:\n"
            "• Central sleep apnea (if present) resolves within days\n"
            "• Deep slow-wave sleep is beginning to recover\n"
            "• REM sleep is returning to normal proportion\n"
            "• Sleep onset is becoming more reliable\n\n"
            "Sleep remains a significant challenge for many people at two weeks, but the trajectory is clearly improving. Better sleep directly improves mood, reduces cravings, and supports the cognitive function needed for recovery.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.opioidMilestone30Title,
        description: l10n.opioidMilestone30Description,
        reference: "Mayo Clinic - How Opioid Use Disorder Occurs",
        link:
            "https://www.mayoclinic.org/diseases-conditions/prescription-drug-abuse/in-depth/how-opioid-addiction-occurs/art-20360372",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Off Opioids: Cognitive Function Begins Recovery\n\n"
            "Source: Mayo Clinic\n\n"
            "Understanding Opioid Use Disorder\n"
            "The Mayo Clinic explains how opioid use disorder develops through changes in the brain: opioids bind to mu-opioid receptors throughout the brain and body, producing analgesia, euphoria, and sedation. With repeated use, the brain adapts — reducing receptor sensitivity (tolerance) and suppressing the brain's own opioid production. This creates physical dependence.\n\n"
            "Cognitive Recovery at One Month\n"
            "At 30 days of abstinence, meaningful cognitive recovery has occurred. The brain fog of acute withdrawal has cleared, and the prefrontal cortex — severely impaired by chronic opioid use — is recovering function:\n"
            "• Decision-making is improving\n"
            "• Working memory is recovering\n"
            "• Processing speed increasing\n"
            "• Concentration more reliable\n\n"
            "The Endorphin System\n"
            "The Mayo Clinic's explanation of opioid neurochemistry highlights how long it takes for the natural endorphin system to recover. At one month, this process is genuinely underway — the brain is producing more of its own opioids and receptor sensitivity is recovering — but it is not complete. This explains why some emotional flatness and reduced pain tolerance persist at 30 days.\n\n"
            "Relapse Prevention\n"
            "The Mayo Clinic emphasises that one month of sobriety does not mean the risk of relapse has passed — it remains elevated. Tolerance has dropped significantly, meaning that relapse using previous doses carries serious overdose risk.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.opioidMilestone60Title,
        description: l10n.opioidMilestone60Description,
        reference: "Recovery Research Institute - The Brain in Recovery",
        link: "https://www.recoveryanswers.org/recovery-101/brain-in-recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Months Off Opioids: Emotional Regulation Improves\n\n"
            "Source: Recovery Research Institute\n\n"
            "The Brain in Recovery\n"
            "The Recovery Research Institute's comprehensive review of addiction neuroscience documents the brain changes that occur with sustained opioid abstinence. By two months, meaningful progress has been made across multiple neurological systems.\n\n"
            "Emotional Regulation at 60 Days\n"
            "One of the most significant improvements at two months is in emotional regulation. Chronic opioid use impairs the prefrontal cortex and amygdala — the systems that govern emotional processing and regulation. Two months of recovery brings:\n"
            "• Reduced emotional reactivity\n"
            "• Better ability to tolerate distress without using\n"
            "• Return of a fuller emotional range (both positive and negative emotions)\n"
            "• Improved frustration tolerance\n\n"
            "Natural Reward System\n"
            "The RRI documents that the brain's natural reward system is substantially more responsive at two months than in early recovery. Activities, relationships, and achievements that felt completely flat and joyless in the first weeks of sobriety are now generating meaningful feelings of wellbeing.\n\n"
            "Physical Health at 60 Days\n"
            "Physical health continues improving:\n"
            "• Immune function recovering\n"
            "• Sleep substantially better\n"
            "• Nutritional status improving\n"
            "• Gastrointestinal function normalising (opioids slow bowel motility, causing chronic constipation)",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.opioidMilestone90Title,
        description: l10n.opioidMilestone90Description,
        reference: "Robert Alexander Center - Brain Recovery Timeline",
        link:
            "https://robertalexandercenter.com/brain-recovery-from-opioid-addiction-a-timeline/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Off Opioids: Dopamine Function Recovering\n\n"
            "Source: Robert Alexander Center\n\n"
            "Three-Month Brain Recovery\n"
            "The Robert Alexander Center documents the three-month mark as a significant milestone in opioid brain recovery, based on research showing that dopamine function — severely disrupted by chronic opioid use — shows measurable recovery at this timeframe.\n\n"
            "Dopamine and Opioids\n"
            "Opioids stimulate dopamine release in the brain's reward circuits as part of their euphoric effect. Chronic use leads to opioid receptor downregulation and reduced dopamine system activity. This underlies the anhedonia (inability to feel pleasure) that characterises opioid use disorder and early recovery.\n\n"
            "Recovery at 90 Days\n"
            "Brain imaging studies show that at three months:\n"
            "• Opioid receptor density is recovering toward normal\n"
            "• Dopamine release in response to natural rewards is increasing\n"
            "• Prefrontal cortex function is substantially improved\n"
            "• The brain's natural pain regulation system is more effective\n\n"
            "What People Experience\n"
            "At 90 days, most people in recovery from opioids report:\n"
            "• Genuine enjoyment of activities, food, and relationships\n"
            "• Significantly reduced cravings compared to early recovery\n"
            "• Clearer thinking and better decision-making\n"
            "• Improved ability to manage pain without opioids\n"
            "• Meaningful engagement with therapy and recovery support",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.opioidMilestone180Title,
        description: l10n.opioidMilestone180Description,
        reference:
            "Effects of Opioid Tolerance and Withdrawal on the Immune System (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/18040801/",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Off Opioids: Immune System Strengthens\n\n"
            "Source: Peer-reviewed research on opioids and immune function\n\n"
            "Opioids and the Immune System\n"
            "This peer-reviewed research examines how opioid tolerance and withdrawal affect immune system function. The findings document that chronic opioid use causes significant immunosuppression through multiple mechanisms:\n"
            "• Direct opioid receptor action on immune cells (T cells, NK cells, macrophages)\n"
            "• Dysregulation of cytokine production\n"
            "• Hypothalamic-pituitary-adrenal (HPA) axis disruption\n"
            "• Increased susceptibility to infections\n\n"
            "Immune Recovery at Six Months\n"
            "The research documents that immune function recovers with sustained abstinence from opioids. By six months:\n"
            "• T-cell and NK cell function have substantially recovered\n"
            "• Cytokine balance is normalising\n"
            "• HPA axis function is recovering\n"
            "• Resistance to infections is meaningfully improved\n\n"
            "Practical Immune Effects\n"
            "At six months, the improved immune function translates to:\n"
            "• Fewer infections and illnesses\n"
            "• Faster recovery when sick\n"
            "• Better wound healing\n"
            "• Reduced chronic inflammation\n\n"
            "This is particularly meaningful for people who used intravenous opioids, who faced additional infection risks including HIV and hepatitis C alongside the immunosuppressive effects of opioids themselves.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.opioidMilestone365Title,
        description: l10n.opioidMilestone365Description,
        reference:
            "Neuroplasticity of the Extended Amygdala in Opioid Abstinence (Frontiers in Pharmacology)",
        link:
            "https://www.frontiersin.org/journals/pharmacology/articles/10.3389/fphar.2023.1253736/full",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Off Opioids: Neural Plasticity and Brain Structure\n\n"
            "Source: Peer-reviewed research — Frontiers in Pharmacology (2023)\n\n"
            "About This Research\n"
            "This 2023 review examined neuroplastic changes in the extended amygdala — a brain region central to stress, fear, anxiety, and the negative emotional states that drive compulsive opioid use — during both acute withdrawal and prolonged abstinence.\n\n"
            "Key Findings\n"
            "The research documents a progression of neural changes:\n"
            "• During acute withdrawal: the extended amygdala becomes hyperactive, driving intense anxiety, dysphoria, and cravings\n"
            "• With prolonged abstinence: neuroplastic recovery occurs — receptor expression, synaptic strength, and circuit activity gradually normalise\n"
            "• At one year: the extended amygdala's stress-related overactivity is substantially resolved, corresponding to significantly reduced anxiety, craving intensity, and vulnerability to stress-induced relapse\n\n"
            "What This Means at One Year\n"
            "At one year, the neurological underpinnings of both the physical and emotional components of opioid dependence have substantially healed. The circuits that drove compulsive opioid-seeking are much weaker; the circuits that support healthy stress coping and natural reward are much stronger.\n\n"
            "Brain Structure Recovery\n"
            "Structural MRI studies at one year also show recovery of grey matter volume in prefrontal and limbic regions — structural evidence of the functional improvements people experience.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.opioidMilestone730Title,
        description: l10n.opioidMilestone730Description,
        reference: "CDC - Treatment of Opioid Use Disorder",
        link:
            "https://www.cdc.gov/overdose-prevention/treatment/opioid-use-disorder.html",
        referenceDate: "March 2026",
        referenceContent:
            "Two Years Off Opioids: Long-term Recovery Stability\n\n"
            "Source: CDC — Centers for Disease Control and Prevention\n\n"
            "Two Years: A Major Threshold\n"
            "Research on opioid use disorder recovery consistently shows that reaching two years of sustained recovery dramatically reduces the risk of returning to use. The CDC's guidance on opioid use disorder treatment documents this milestone as a key indicator of long-term recovery stability.\n\n"
            "CDC's Approach to Treatment\n"
            "The CDC emphasises that effective treatment for opioid use disorder should be:\n"
            "• Long-term — recovery is measured in years, not weeks\n"
            "• Medication-supported when appropriate — buprenorphine and methadone save lives\n"
            "• Integrated with behavioural health support\n"
            "• Addressing underlying trauma and mental health conditions\n\n"
            "Two-Year Recovery Profile\n"
            "At two years:\n"
            "• The brain's opioid receptor system has largely normalised\n"
            "• Endorphin production and sensitivity are fully recovered\n"
            "• Emotional regulation and stress coping are robust\n"
            "• The neural circuits supporting non-drug reward are strong\n"
            "• Risk of overdose death — the most dangerous consequence of relapse — is much lower than in early recovery\n\n"
            "The Ongoing Journey\n"
            "The CDC is clear that opioid use disorder is a chronic condition for many people, and that long-term recovery often involves ongoing support, medication, and lifestyle management. Two years is not the end of the journey — it is the establishment of a stable, healthy foundation.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.opioidsPageTitle,
      storageKey: 'opioids',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.opioidsHeaderStarted,
      headerNotStarted: l10n.opioidsHeaderNotStarted,
      subtitleStarted: l10n.opioidsSubtitleStarted,
      subtitleNotStarted: l10n.opioidsSubtitleNotStarted,
      infoBoxMessage: l10n.opioidsInfoBox,
      initialStarted: started,
    );
  }
}
