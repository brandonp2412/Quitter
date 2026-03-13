import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class HeroinPage extends StatelessWidget {
  final bool started;
  const HeroinPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.heroinMilestone1Title,
        description: l10n.heroinMilestone1Description,
        reference: "Oxford Treatment - Heroin Withdrawal Timeline",
        link: "https://oxfordtreatment.com/substance-abuse/heroin/withdrawal/",
        referenceDate: "March 2026",
        referenceContent:
            "Heroin Withdrawal: Day One\n\n"
            "Source: Oxford Treatment Center\n\n"
            "Important Safety Note\n"
            "Heroin withdrawal, while rarely fatal in otherwise healthy individuals, can cause severe dehydration from vomiting and diarrhoea. It is also associated with an extremely high relapse risk, and relapse after a period of abstinence dramatically increases overdose risk because tolerance has dropped. Medical supervision during withdrawal is strongly recommended.\n\n"
            "When Withdrawal Begins\n"
            "Heroin is a short-acting opioid. Withdrawal typically begins 6–24 hours after the last dose. The onset is often gradual — beginning with anxiety, yawning, and restlessness before escalating to more severe symptoms.\n\n"
            "Day One Symptoms\n"
            "Oxford Treatment documents the first-day experience as:\n"
            "• Intense anxiety and agitation\n"
            "• Muscle aches and cramps (the body desperately wants opioids for pain relief)\n"
            "• Yawning, runny nose, teary eyes\n"
            "• Sweating and chills\n"
            "• Insomnia despite exhaustion\n"
            "• Nausea beginning to develop\n\n"
            "Why Heroin Withdrawal Feels So Terrible\n"
            "The opioid system regulates pain, pleasure, stress, and much of the body's basic comfort. Long-term heroin use causes the body's natural opioid production (endorphins) to essentially stop. When heroin is removed, the body is left without its normal comfort signalling, experiencing everything as painful, distressing, and unbearable. This is not permanent — the endorphin system gradually recovers.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.heroinMilestone3Title,
        description: l10n.heroinMilestone3Description,
        reference: "Liberty House Recovery - Heroin Detox Timeline",
        link: "https://libertyhouserecoverycenter.com/heroin-detox-timeline/",
        referenceDate: "March 2026",
        referenceContent:
            "Heroin Detox: Day Three — Peak Withdrawal\n\n"
            "Source: Liberty House Recovery\n\n"
            "Peak Intensity\n"
            "Day three of heroin withdrawal is typically the most physically intense point of the acute withdrawal phase. Liberty House Recovery's clinical documentation of the detox timeline shows that symptoms peak around 48–72 hours after the last dose and include the full spectrum of opioid withdrawal syndrome.\n\n"
            "Peak Symptoms at Day Three\n"
            "• Severe muscle aches, cramps, and restless legs — the origin of the phrase 'kicking the habit'\n"
            "• Vomiting and diarrhoea — the primary cause of dangerous dehydration\n"
            "• Profuse sweating alternating with chills and goosebumps ('cold turkey')\n"
            "• Insomnia — virtually no sleep is possible at this stage\n"
            "• Extreme anxiety, agitation, and psychological distress\n"
            "• Intense, overwhelming cravings\n\n"
            "Medical Management\n"
            "Medications used in medically supervised detox to manage these symptoms include:\n"
            "• Clonidine — reduces anxiety, sweating, and cardiovascular symptoms\n"
            "• Loperamide — manages diarrhoea\n"
            "• NSAIDs — for muscle pain\n"
            "• Methadone or buprenorphine — opioid replacement therapy that significantly reduces withdrawal severity\n\n"
            "It Gets Better\n"
            "Day three is the worst day for most people undergoing heroin withdrawal. The knowledge that symptoms will begin improving from this point is important for getting through it.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.heroinMilestone7Title,
        description: l10n.heroinMilestone7Description,
        reference: "American Addiction Centers - Heroin Withdrawal",
        link:
            "https://americanaddictioncenters.org/opioids/heroin/withdrawal-detox",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Off Heroin: Acute Symptoms Subside\n\n"
            "Source: American Addiction Centers\n\n"
            "End of Acute Withdrawal\n"
            "By the end of the first week, the acute physical withdrawal syndrome for short-acting heroin is largely over. Vomiting, diarrhoea, and severe muscle cramps have typically resolved. The body is no longer in acute physiological crisis.\n\n"
            "What Remains at Day 7\n"
            "While physical symptoms are resolving, significant challenges persist:\n"
            "• Fatigue and general weakness — the body is depleted\n"
            "• Insomnia — sleep normalisation takes weeks\n"
            "• Depressed mood and emotional flatness\n"
            "• Persistent cravings\n"
            "• Anxiety and restlessness\n\n"
            "Post-Acute Withdrawal Syndrome (PAWS)\n"
            "American Addiction Centers document the transition from acute withdrawal to PAWS — a period of weeks to months during which milder but persistent symptoms continue. PAWS from heroin typically includes ongoing sleep disruption, depression, anxiety, and episodic cravings. This phase is when relapse risk is high and ongoing support is critical.\n\n"
            "Nutrition and Physical Recovery\n"
            "Appetite is typically returning by day seven. Prioritising nutritious food, hydration, and light movement supports the body's recovery from the physical depletion of acute withdrawal.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.heroinMilestone30Title,
        description: l10n.heroinMilestone30Description,
        reference: "Fusion Recovery - Physical Health Improvements",
        link:
            "https://fusionrecovery.com/how-long-does-heroin-addiction-treatment-take-a-timeline-for-recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Off Heroin: Physical Health Normalises\n\n"
            "Source: Fusion Recovery\n\n"
            "Physical Transformation at 30 Days\n"
            "One month of heroin abstinence brings dramatic physical improvements. The body has had substantial time to recover from the physiological effects of opioid dependence and the physical neglect that typically accompanies heroin use.\n\n"
            "Physical Health Improvements\n"
            "• Nutrition: Appetite is fully restored; weight is recovering toward healthy levels\n"
            "• Cardiovascular: Heart rate, blood pressure, and circulation have normalised\n"
            "• Skin: Skin colour, texture, and healing have improved substantially\n"
            "• Immune function: Beginning to recover (the immune system is significantly impaired by heroin)\n"
            "• Liver function: Improving, particularly for those who used intravenously\n"
            "• Pain sensitivity: Natural endorphin-based pain regulation is being restored\n\n"
            "The Endorphin System\n"
            "Fusion Recovery documents that one month is a meaningful point in the recovery of the body's natural endorphin system. The endorphins that heroin was substituting are being produced again, and the opioid receptors — downregulated by chronic heroin exposure — are gradually recovering their sensitivity.\n\n"
            "Psychological State\n"
            "Depression and anhedonia are still present at one month for most people, though less severe than in early withdrawal. The natural reward system is recovering, and moments of genuine pleasure and wellbeing are becoming more accessible.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.heroinMilestone90Title,
        description: l10n.heroinMilestone90Description,
        reference: "PubMed - Immune Function Recovery in Heroin Users",
        link: "https://pubmed.ncbi.nlm.nih.gov/26789146/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Off Heroin: Immune System Recovery\n\n"
            "Source: PubMed — Peer-reviewed research on immune function in heroin users\n\n"
            "Heroin and the Immune System\n"
            "This peer-reviewed research examined immune function in people using heroin and those in recovery. The findings document that heroin significantly suppresses immune function through multiple mechanisms: direct action on opioid receptors in immune cells, disruption of natural killer cell activity, impairment of T-cell function, and pro-inflammatory cytokine dysregulation.\n\n"
            "Recovery at 90 Days\n"
            "The research documents measurable recovery of immune parameters at the three-month mark of abstinence. Key immune markers including:\n"
            "• Natural killer (NK) cell activity — recovering toward normal\n"
            "• T-cell count and function — improving\n"
            "• Inflammatory cytokine balance — normalising\n\n"
            "Practical Immune Effects\n"
            "At three months, people in recovery notice concrete evidence of immune recovery:\n"
            "• Greater resistance to common infections\n"
            "• Faster healing of wounds and injuries\n"
            "• Better recovery from illness\n"
            "• Reduced frequency of infections compared to using days\n\n"
            "Broader Health Recovery\n"
            "The three-month mark also shows significant improvements in other physical health markers: liver function, cardiovascular health, nutritional status, and weight are all meaningfully better than at the one-month mark.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.heroinMilestone180Title,
        description: l10n.heroinMilestone180Description,
        reference: "Foundations Group - Brain Recovery Timeline",
        link:
            "https://www.foundationsgrouprecoverycenters.com/blog/how-long-does-your-brain-take-to-recover-from-drugs/",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Off Heroin: Cognitive Improvements\n\n"
            "Source: Foundations Group Recovery Centers\n\n"
            "Six months represents a critical milestone in heroin recovery. The acute and post-acute withdrawal phases are behind, and the brain is well into the longer-term process of structural and functional recovery.\n\n"
            "Cognitive Recovery at 6 Months\n"
            "Foundations Group documents that cognitive function — including memory, executive function, and processing speed — shows significant improvement at the six-month mark. Heroin impairs cognition through multiple mechanisms: direct opioid receptor effects on hippocampal function, disrupted sleep (which is essential for memory consolidation), and systemic effects of chronic drug use. All of these are reversing by six months.\n\n"
            "Specific Improvements Documented\n"
            "• Verbal memory improving significantly\n"
            "• Working memory and cognitive flexibility recovering\n"
            "• Processing speed increasing\n"
            "• Decision-making quality improving\n"
            "• Emotional regulation more stable\n\n"
            "The Brain's Endorphin System\n"
            "By six months, the brain's endogenous opioid system — which regulates pain, pleasure, stress, and social bonding — has recovered substantially. Natural activities like exercise, food, social connection, and achievement are generating meaningful feelings of wellbeing, replacing the artificial stimulation of heroin.\n\n"
            "Physical Health at 6 Months\n"
            "Physical health continues to improve across all systems. Liver health, cardiovascular function, nutritional status, immune function, and skin/tissue health are all significantly better than at early recovery stages.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.heroinMilestone365Title,
        description: l10n.heroinMilestone365Description,
        reference: "FHE Health - Brain Healing from Heroin",
        link: "https://fherehab.com/learning/heroin-affects-brain",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Off Heroin: Major Brain Healing\n\n"
            "Source: FHE Health\n\n"
            "How Heroin Affects the Brain\n"
            "FHE Health's review of heroin's neurological effects documents the extensive damage caused by long-term heroin use: depletion of the brain's natural opioids (endorphins and enkephalins), downregulation of mu-opioid receptors, disruption of dopamine reward circuits, impaired prefrontal cortex function, and white matter damage affecting communication between brain regions.\n\n"
            "Recovery at One Year\n"
            "At the one-year mark, FHE Health documents substantial recovery across all these systems:\n"
            "• Opioid receptor density has largely recovered toward normal levels\n"
            "• Natural endorphin production is functioning again\n"
            "• Dopamine reward circuits are substantially restored\n"
            "• Prefrontal cortex activity — governing decision-making and impulse control — is meaningfully recovered\n"
            "• White matter integrity showing signs of recovery\n\n"
            "Life Quality at One Year\n"
            "One year of sobriety typically brings profound changes to quality of life. The neurological capacity for natural joy, meaningful connection, and motivated action is restored. Most people at this stage describe a life that is not just drug-free, but genuinely rewarding — one built on authentic relationships, purposeful activity, and self-care.\n\n"
            "Ongoing Recovery\n"
            "Recovery from heroin continues beyond one year, particularly for long-term heavy users. But one year represents a point at which the foundation of recovery is well-established and the trajectory is clearly toward continued healing.",
      ),
      QuitMilestone(
        day: 540,
        title: l10n.heroinMilestone540Title,
        description: l10n.heroinMilestone540Description,
        reference: "Excel Treatment Center - Brain Recovery Timeline",
        link:
            "https://exceltreatmentcenter.com/brain-rewiring-and-healing-during-addiction-recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "18 Months Off Heroin: Continued Cognitive Recovery\n\n"
            "Source: Excel Treatment Center\n\n"
            "Long-Term Neural Healing\n"
            "Excel Treatment Center documents that brain recovery from heroin use is a multi-year process, with meaningful healing continuing well into the second year of abstinence. The 18-month mark represents a point where many cognitive functions that were still impaired at six months have substantially or fully recovered.\n\n"
            "Neuroplasticity at Work\n"
            "The brain's neuroplasticity — its ability to form new neural connections and rewire existing ones — is actively healing the damage of chronic heroin use at the 18-month mark. This includes:\n"
            "• Formation of new dendritic connections in the prefrontal cortex\n"
            "• Strengthening of non-drug reward pathways\n"
            "• Continued recovery of white matter integrity\n"
            "• Ongoing restoration of opioid receptor function\n\n"
            "What People Experience at 18 Months\n"
            "People in heroin recovery at 18 months commonly describe:\n"
            "• Cognitive sharpness and clarity substantially improved from early recovery\n"
            "• Emotional stability and appropriate emotional range\n"
            "• Strong, meaningful relationships rebuilt\n"
            "• Sustained ability to pursue goals and delay gratification\n"
            "• Sense of identity and self-worth not dependent on substances\n\n"
            "Still Growing\n"
            "At 18 months, recovery is not 'complete' — it is ongoing. But the trajectory is clear, and the neurological foundation for long-term flourishing is well-established.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.heroinMilestone730Title,
        description: l10n.heroinMilestone730Description,
        reference: "Recovery Research Institute - Brain Recovery",
        link: "https://www.recoveryanswers.org/recovery-101/brain-in-recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Years Off Heroin: Long-Term Brain Recovery\n\n"
            "Source: Recovery Research Institute\n\n"
            "The Science of Brain Recovery\n"
            "The Recovery Research Institute synthesises the neuroscience of addiction recovery across substances. For heroin and opioids, their review of the evidence documents that brain recovery is a genuine and achievable process that continues over years of abstinence.\n\n"
            "Two-Year Evidence\n"
            "At the two-year mark, brain imaging studies show that the neurological changes caused by heroin use have largely normalised:\n"
            "• Opioid receptor density has recovered significantly\n"
            "• Dopamine transporter levels approaching normal\n"
            "• Prefrontal cortex grey matter volume recovered in most regions\n"
            "• White matter connectivity substantially restored\n"
            "• Metabolic activity in key brain regions near normal levels\n\n"
            "The RRI's Key Message\n"
            "The Recovery Research Institute emphasises that addiction is a brain disorder characterised by neuroplastic changes — and that recovery involves equally real neuroplastic healing. The brain that was changed by heroin is not permanently damaged; it is capable of recovery given time, abstinence, and the right support.\n\n"
            "Two Years in Life\n"
            "Two years of heroin-free living represents a profound transformation. The lifestyle, relationships, cognitive function, physical health, and sense of self that heroin destroyed have been rebuilt. Many people at this milestone describe it as one of the greatest accomplishments of their lives.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.heroinPageTitle,
      storageKey: 'heroin',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.heroinHeaderStarted,
      headerNotStarted: l10n.heroinHeaderNotStarted,
      subtitleStarted: l10n.heroinSubtitleStarted,
      subtitleNotStarted: l10n.heroinSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
