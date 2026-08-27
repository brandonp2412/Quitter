import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class OpioidPage extends StatelessWidget {
  final bool started;
  final String storageKey;

  const OpioidPage({
    super.key,
    required this.started,
    this.storageKey = 'opioids',
  });

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.opioidMilestone1Title,
        description: l10n.opioidMilestone1Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "Opioid Withdrawal: Day One\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "⚠ Safety Note\n"
            "Opioid withdrawal is rarely fatal in otherwise healthy individuals, but it causes severe physical distress and carries a high risk of relapse. Relapse after a period of abstinence is particularly dangerous because tolerance drops rapidly — using the same dose as before abstinence can cause fatal overdose. Medical supervision and opioid agonist treatment are strongly recommended.\n\n"
            "When Withdrawal Begins\n"
            "The WHO withdrawal timetable sets the timing by opioid type:\n"
            "• Short-acting opioids (heroin, oxycodone): onset 8–24 hours after last use, duration 4–10 days\n"
            "• Long-acting opioids (methadone): onset 12–48 hours, duration 10–20 days\n\n"
            "Day One Symptoms\n"
            "The WHO guidelines list the early features of opioid withdrawal:\n"
            "• Anxiety and agitation\n"
            "• Muscle cramps and aches\n"
            "• Watery discharge from eyes and nose\n"
            "• Yawning and perspiration\n"
            "• Insomnia, with hot and cold flushes\n"
            "• Early nausea\n\n"
            "Why It Feels So Bad\n"
            "The opioid system regulates pain, stress, emotional wellbeing, and basic comfort. Long-term opioid use suppresses the body's own opioid production (endorphins). When opioids are removed, the body is left without its normal comfort system — experiencing pain, anxiety, and distress at a level that reflects the depth of that suppression. The WHO guidelines advise supportive care, including drinking 2–3 litres of water per day and monitoring 3–4 times daily.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.opioidMilestone7Title,
        description: l10n.opioidMilestone7Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Opioids: Peak Symptoms Declining\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "The Peak and Decline\n"
            "The WHO timetable puts short-acting opioid withdrawal at 4–10 days, with symptoms building early and then easing across that window. By the end of the first week:\n"
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
            "After the first withdrawal period, sleep problems, changing mood, and waves of craving can continue for weeks or months. Continued support matters most during this longer recovery phase.\n\n"
            "Opioid Agonist Treatment\n"
            "The WHO guidelines describe methadone and buprenorphine as effective treatments that reduce withdrawal severity and support recovery. These medications also reduce mortality from opioid use disorder, and many people in successful long-term recovery use them throughout the early recovery phase.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.opioidMilestone14Title,
        description: l10n.opioidMilestone14Description,
        reference:
            "Bidirectional Relationship between Opioids and Disrupted Sleep (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7562980/",
        referenceDate: "June 2026",
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
            "Sleep remains a significant challenge for many people at two weeks, but the trajectory is clearly improving. Better sleep directly improves mood, reduces cravings, and supports the clear thinking needed for recovery.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.opioidMilestone30Title,
        description: l10n.opioidMilestone30Description,
        reference: "Mayo Clinic - How Opioid Use Disorder Occurs",
        link:
            "https://www.mayoclinic.org/diseases-conditions/prescription-drug-abuse/in-depth/how-opioid-addiction-occurs/art-20360372",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Opioids: Thinking and Memory Begin to Recover\n\n"
            "Source: Mayo Clinic\n\n"
            "Understanding Opioid Use Disorder\n"
            "The Mayo Clinic explains that opioids attach to receptors throughout the brain and body, producing pain relief, euphoria, and sleepiness. With repeated use, the brain responds less strongly and makes fewer of its own opioid-like chemicals. That creates physical dependence.\n\n"
            "Thinking and Memory at One Month\n"
            "At 30 days, meaningful recovery in thinking and memory has occurred. The worst brain fog has cleared, and the front of the brain — which handles planning and self-control — is recovering:\n"
            "• Decision-making is improving\n"
            "• Working memory is recovering\n"
            "• Processing speed increasing\n"
            "• Concentration more reliable\n\n"
            "The Endorphin System\n"
            "At one month, the brain's natural endorphin system is actively recovering: it is producing more of its own opioid-like chemicals and responding more normally again. Emotional flatness and lower pain tolerance keep improving as that recovery continues.\n\n"
            "Relapse Prevention\n"
            "The Mayo Clinic emphasises that one month of sobriety does not mean the risk of relapse has passed — it remains elevated. Tolerance has dropped significantly, meaning that relapse using previous doses carries serious overdose risk.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.opioidMilestone60Title,
        description: l10n.opioidMilestone60Description,
        reference:
            "Neuroplasticity of the Extended Amygdala in Opioid Abstinence (Frontiers in Pharmacology)",
        link:
            "https://www.frontiersin.org/journals/pharmacology/articles/10.3389/fphar.2023.1253736/full",
        referenceDate: "June 2026",
        referenceContent:
            "Two Months Off Opioids: The Brain's Stress Circuits Begin to Settle\n\n"
            "Source: \"Neuroplasticity of the extended amygdala in opioid withdrawal and prolonged opioid abstinence,\" Frontiers in Pharmacology (2023)\n\n"
            "Where the Negative Feelings Come From\n"
            "This review maps how long-term opioid use changes the brain's stress and fear circuits. During withdrawal, these circuits become overactive while dopamine signalling in reward circuits drops. That combination helps explain anxiety, low mood, and cravings in early recovery.\n\n"
            "Why Two Months Brings Relief\n"
            "Crucially, the review documents that some of these changes are reversible. In animal models the loss of spine density in the accumbens shell is described as 'an enduring but reversible decrease,' returning toward pre-drug values over a couple of weeks. As these stress and reward circuits re-regulate, the mechanistic basis for early-recovery emotional turmoil eases — consistent with the reduced reactivity and steadier mood many people report by around two months.\n\n"
            "Recovery Signal\n"
            "The reversible spine-density and stress-circuit changes documented in this literature show a real biological recovery process: the circuitry driving the negative emotional state of dependence moves back toward its pre-drug state during abstinence.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.opioidMilestone90Title,
        description: l10n.opioidMilestone90Description,
        reference:
            "Structural & Functional Brain Recovery During Abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8885813/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Opioids: Reward Chemistry Starting to Recover\n\n"
            "Source: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" Drug and Alcohol Dependence (2022), on PubMed Central\n\n"
            "Dopamine and Opioids\n"
            "Opioids drive dopamine release in the brain's reward system. Long-term use leaves that system depleted: in one brain-scan study, proteins that recycle dopamine were about 30% below healthy levels at the start. That helps explain the loss of pleasure seen in opioid use disorder and early recovery.\n\n"
            "Recovery Is Gradual\n"
            "This review gathered the longitudinal studies that re-scanned the same people over abstinence. The dopamine-transporter deficit recovered by roughly 20% over 6–12 months of abstinence, and some frontal grey-matter and white-matter abnormalities seen in early withdrawal were no longer detectable after about a month. At three months you are early on that recovery curve: the reward and frontal systems are measurably mending, but have not finished.\n\n"
            "What People Experience\n"
            "As these circuits recover, many people at around 90 days notice:\n"
            "• More genuine enjoyment of activities, food, and relationships\n"
            "• Reduced cravings compared with early recovery\n"
            "• Clearer thinking and better decision-making\n\n"
            "Recovery Signal\n"
            "Longitudinal human imaging shows dopamine-transporter availability rising across 6–12 months of abstinence, while frontal grey- and white-matter abnormalities begin normalising much earlier. At 90 days, measurable brain recovery is already established.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.opioidMilestone180Title,
        description: l10n.opioidMilestone180Description,
        reference:
            "Effects of Opioid Tolerance and Withdrawal on the Immune System (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/18040801/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off Opioids: The Immune System Begins to Recover\n\n"
            "Source: \"Effects of opioid tolerance and withdrawal on the immune system,\" Journal of Neuroimmune Pharmacology (2006), on PubMed\n\n"
            "Opioids and the Immune System\n"
            "This review shows that long-term opioid use weakens the immune system in several ways:\n"
            "• Direct opioid action on immune cells (T cells, NK cells, macrophages)\n"
            "• Disrupted immune-signalling chemicals\n"
            "• Disruption of the hypodeep-brain-pituitary-adrenal (HPA) axis\n"
            "• Increased susceptibility to infection\n\n"
            "Recovery Signal\n"
            "Long-term opioids suppress several parts of the immune system. By six months off opioids, that constant suppression has been gone for half a year and immune function is actively rebuilding toward normal.\n\n"
            "What Six Months Means\n"
            "Six months without opioids gives immune cells, immune signalling, and the body's stress system sustained time to recover toward normal.\n\n"
            "Why This Still Matters\n"
            "This is particularly relevant for people who injected opioids, who faced added infection risks such as HIV and hepatitis C. Removing opioids, improving nutrition, and maintaining abstinence give the immune system the conditions it needs to keep recovering.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.opioidMilestone365Title,
        description: l10n.opioidMilestone365Description,
        reference:
            "Structural & Functional Brain Recovery During Abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8885813/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off Opioids: Brain Structure and Chemistry Recovering\n\n"
            "Source: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" Drug and Alcohol Dependence (2022), on PubMed Central\n\n"
            "What the Human Imaging Shows\n"
            "This review gathered the studies that scanned the same people with opioid use disorder more than once across abstinence. The findings point consistently toward recovery:\n"
            "• Dopamine-recycling proteins in reward and movement areas, about 30% below normal at the start, rose by roughly 20% over 6–12 months off opioids\n"
            "• Frontal grey-matter abnormalities present in early withdrawal were no longer detectable after about a month of abstinence\n"
            "• White-matter (frontal and cingulate) and resting-state frontal activity also began to re-normalise within the first month\n\n"
            "Where One Year Sits\n"
            "By twelve months you are at or past the longest window these studies measured. The dopamine system has had the most time to recover, and the frontal circuits that support self-control and judgement have been mending for months — the biological counterpart to the clearer thinking, weaker cravings, and steadier mood people describe at a year.\n\n"
            "Recovery Signal\n"
            "At one year, the human imaging signal is strongly recovery-oriented: dopamine-transporter availability has risen across the 6–12 month window, while frontal structural and functional abnormalities have had many months to normalise.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.opioidMilestone730Title,
        description: l10n.opioidMilestone730Description,
        reference: "Treatment of Opioid Use Disorder (CDC)",
        link:
            "https://www.cdc.gov/overdose-prevention/treatment/opioid-use-disorder.html",
        referenceDate: "June 2026",
        referenceContent:
            "Two Years Off Opioids: A Stable Foundation\n\n"
            "Source: \"Treatment of Opioid Use Disorder,\" Centers for Disease Control and Prevention (CDC)\n\n"
            "A Chronic Condition, Managed Well\n"
            "The CDC describes opioid use disorder as 'a chronic disease that can affect anyone' — 'a medical condition, not a moral failing.' Reaching two years of sustained recovery means you have been managing that condition successfully through one of its most vulnerable periods.\n\n"
            "What the CDC Says Works\n"
            "The CDC's guidance centres on treatments that keep recovery stable over the long term:\n"
            "• Medications for opioid use disorder — buprenorphine, methadone, and naltrexone — which it calls especially effective\n"
            "• Combining medication with behavioural therapy and counselling\n"
            "• Treatment that lasts for varying lengths of time, tailored to the person\n"
            "The CDC notes these medications help 'normalize brain chemistry' and relieve cravings — the chemistry that felt hijacked in active addiction works with you again.\n\n"
            "Staying Safe\n"
            "The CDC urges people in recovery to ask their doctor about the risk of returning to use and overdose, and to keep naloxone on hand. Tolerance falls during abstinence, so a return to opioids after this long is especially dangerous — knowing that is part of protecting what you've built.\n\n"
            "Two Years In\n"
            "The CDC is clear that recovery is often a long-term process rather than a finish line. Two years is not the end of the journey — it is a stable, healthy foundation, and strong evidence that the approach you are using works.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.opioidsPageTitle,
      storageKey: storageKey,
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
