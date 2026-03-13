import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class AdderallPage extends StatelessWidget {
  final bool started;
  const AdderallPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.adderallMilestone1Title,
        description: l10n.adderallMilestone1Description,
        reference: "MedlinePlus - Substance use - amphetamines",
        link: "https://medlineplus.gov/ency/patientinstructions/000792.htm",
        referenceDate: "March 2026",
        referenceContent:
            "Amphetamine Withdrawal: What Happens in the First 24 Hours\n\n"
            "Source: MedlinePlus (U.S. National Library of Medicine)\n\n"
            "What Are Amphetamines?\n"
            "Amphetamines are stimulant drugs that include both illicit substances (like street speed) and prescription medications used to treat ADHD and narcolepsy (such as Adderall and Vyvanse). They work by flooding the brain with dopamine and norepinephrine, producing intense focus, energy, and euphoria. With regular use, the brain adapts by reducing its own dopamine production and receptor sensitivity — meaning the drug becomes necessary just to feel normal.\n\n"
            "The First 24 Hours: The Crash\n"
            "When amphetamine use stops, the brain's dopamine system is severely depleted. The first 24 hours bring the characteristic 'crash': profound fatigue, increased sleep (hypersomnia), increased appetite, and a low, depressed mood. This is the brain's acute response to the sudden absence of artificial dopamine stimulation.\n\n"
            "Common Withdrawal Symptoms\n"
            "• Extreme tiredness and difficulty staying awake\n"
            "• Increased hunger (appetite suppression ends)\n"
            "• Depression and emotional flatness (anhedonia)\n"
            "• Irritability and agitation\n"
            "• Intense cravings for the drug\n"
            "• Anxiety and difficulty concentrating\n\n"
            "Is Withdrawal Dangerous?\n"
            "Unlike alcohol or benzodiazepine withdrawal, amphetamine withdrawal is not typically medically dangerous in terms of seizures or physical complications. However, the psychological symptoms — particularly depression — can be severe and require support. People with pre-existing mental health conditions are at higher risk for serious depressive episodes during this phase.\n\n"
            "Medical Supervision\n"
            "MedlinePlus recommends seeking medical help when stopping amphetamines, especially after heavy or prolonged use. A healthcare provider can monitor for severe depression and provide support through the withdrawal process.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.adderallMilestone3Title,
        description: l10n.adderallMilestone3Description,
        reference: "NCBI Bookshelf - Withdrawal Management",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "March 2026",
        referenceContent:
            "Amphetamine Withdrawal Management: Day 3\n\n"
            "Source: NCBI Bookshelf — WHO Clinical Guidelines on Withdrawal Management\n\n"
            "Peak Withdrawal\n"
            "By day three, amphetamine withdrawal typically reaches its most intense point. The WHO clinical guidelines describe psychostimulant withdrawal as a syndrome characterised by dysphoric mood, fatigue, vivid and unpleasant dreams, insomnia or hypersomnia, increased appetite, and psychomotor retardation or agitation. For heavy users, these symptoms peak around 72 hours after the last dose.\n\n"
            "Psychological Symptoms Are the Primary Challenge\n"
            "Unlike opioid or alcohol withdrawal, the clinical guidelines note that amphetamine withdrawal does not involve significant physical symptoms like vomiting or tremors. The primary challenge is psychological: severe depression, anhedonia (inability to feel pleasure), and intense drug cravings driven by the dopamine-depleted state of the brain.\n\n"
            "Cravings at Their Strongest\n"
            "Cravings for amphetamines are typically at their most powerful around days 2–4. The brain is urgently signalling a return to the substance that restored its dopamine levels. Understanding that these cravings are a temporary neurological response — not a permanent state — is essential to getting through this phase.\n\n"
            "Management Approach\n"
            "The WHO guidelines recommend a supportive care approach during this phase:\n"
            "• A safe, calm environment with monitoring\n"
            "• Adequate nutrition and hydration (appetite may be returning)\n"
            "• Sleep support — many people alternate between insomnia and excessive sleeping\n"
            "• Psychological support and reassurance\n"
            "• No specific medication is universally recommended, though antidepressants may be considered for severe cases",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.adderallMilestone7Title,
        description: l10n.adderallMilestone7Description,
        reference: "BuzzRx - How Long Do Adderall Withdrawals Last?",
        link:
            "https://www.buzzrx.com/blog/how-long-do-adderall-withdrawals-last",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Without Adderall: Physical Symptoms Improving\n\n"
            "The Acute Phase Is Ending\n"
            "By the end of the first week, the most intense physical symptoms of Adderall withdrawal are typically resolving. The severe fatigue and hypersomnia of the crash phase give way to more normal energy levels, though most people still feel below their baseline. Sleep is becoming more regular, and appetite — which may have been ravenous in the early days — is stabilising.\n\n"
            "Withdrawal Timeline Overview\n"
            "Adderall withdrawal generally follows this pattern:\n"
            "• Hours 6–24: Crash begins — fatigue, increased appetite, mood drop\n"
            "• Days 2–4: Peak withdrawal — depression, cravings, irritability, sleep disruption\n"
            "• Days 5–7: Physical symptoms begin subsiding; emotional symptoms persist\n"
            "• Weeks 2–4: Post-acute phase — mood gradually improves, energy slowly returns\n"
            "• Months 1–3: Brain chemistry continues rebalancing\n\n"
            "What's Still Happening at Day 7\n"
            "While physical symptoms improve, psychological symptoms often persist into the second week and beyond. Low motivation, difficulty concentrating, and emotional flatness (anhedonia) reflect the ongoing process of dopamine system recovery. These symptoms can feel discouraging but are a normal and temporary part of the brain recalibrating.\n\n"
            "Factors Affecting Timeline\n"
            "How long withdrawal lasts depends on:\n"
            "• Duration and dose of use (longer use = longer recovery)\n"
            "• Whether the drug was taken as prescribed or in higher doses\n"
            "• Individual brain chemistry and metabolism\n"
            "• Whether other substances were also used",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.adderallMilestone14Title,
        description: l10n.adderallMilestone14Description,
        reference: "WebMD - Adderall Withdrawal",
        link: "https://www.webmd.com/add-adhd/adderall-withdrawal",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Off Adderall: Emotional Stability Returning\n\n"
            "The Post-Acute Phase\n"
            "By the two-week mark, most people have moved through acute withdrawal into what's called the post-acute withdrawal syndrome (PAWS) phase. The physical crash is over, and the focus now shifts to emotional and psychological recovery as the brain's dopamine system continues its slow rebuild.\n\n"
            "Emotional Symptoms\n"
            "WebMD notes that the emotional symptoms of Adderall withdrawal — particularly depression, mood swings, and difficulty experiencing pleasure — can persist for weeks to months after stopping. At two weeks, these symptoms are typically less severe than at peak withdrawal, but still present. The brain's natural reward system, suppressed by long-term stimulant use, is gradually reactivating.\n\n"
            "Sleep Normalisation\n"
            "Sleep patterns are meaningfully more regular by two weeks. The vivid, unpleasant dreams of early withdrawal are fading, and the pattern of extreme fatigue alternating with insomnia is resolving. Better sleep in turn supports mood, concentration, and energy recovery.\n\n"
            "Cognitive Function\n"
            "Many people notice some return of natural concentration and motivation by the two-week mark — though it often doesn't feel as sharp as it did on the medication. This is normal. The brain is recalibrating to function without artificial stimulation, and cognitive function continues improving over the following months.\n\n"
            "Relapse Risk\n"
            "The two-week period carries significant relapse risk, particularly if underlying ADHD symptoms return strongly. Speaking with a doctor about managing ADHD without stimulants — or exploring alternative medications — is important during this phase.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.adderallMilestone30Title,
        description: l10n.adderallMilestone30Description,
        reference: "Drugs.com - How long does Adderall withdrawal last?",
        link:
            "https://www.drugs.com/medical-answers/long-adderall-withdrawal-3572393/",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Off Adderall: Brain Chemistry Rebalancing\n\n"
            "Timeline to Full Withdrawal Resolution\n"
            "Drugs.com notes that Adderall withdrawal symptoms typically resolve within 1–3 weeks for most users, though people who used high doses for extended periods may experience symptoms for several months. At the 30-day mark, the acute and post-acute withdrawal phases are typically complete or nearly so for moderate users.\n\n"
            "Dopamine System Recovery\n"
            "The core process happening at one month is the ongoing recovery of the brain's dopamine system. Long-term amphetamine use causes the brain to downregulate its dopamine receptors — reducing their number and sensitivity — because the drug was providing artificial stimulation. Over weeks to months of abstinence, the brain gradually upregulates these receptors back toward normal levels. At 30 days, this process is well underway.\n\n"
            "Mood and Motivation\n"
            "Many people report a noticeable improvement in baseline mood and motivation around the one-month mark compared to early withdrawal. The profound anhedonia of the crash phase has lifted significantly. Activities that felt completely joyless in the first week are beginning to feel rewarding again as natural dopamine signalling recovers.\n\n"
            "Ongoing Challenges\n"
            "For people with ADHD who were using Adderall as prescribed medication, this period can be challenging as ADHD symptoms may be more prominent without medication. Working with a healthcare provider to manage these symptoms is important. For people who were misusing Adderall, the brain is doing the work of recalibrating to natural levels of energy and focus — which, though lower than the drug-induced state, are healthy and sustainable.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.adderallMilestone60Title,
        description: l10n.adderallMilestone60Description,
        reference:
            "Orlando Recovery - Adderall Withdrawal Timeline: Symptoms, Duration and Treatment",
        link:
            "https://www.orlandorecovery.com/drug-addiction-resources/adderall/withdrawal-timeline/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Months Off Adderall: Cognitive Function Improving\n\n"
            "By the two-month mark, the brain has had substantial time to recover from the effects of stimulant use. Most people no longer experience acute withdrawal symptoms, and the focus shifts entirely to the longer-term process of neural and cognitive recovery.\n\n"
            "Cognitive Recovery\n"
            "Orlando Recovery notes that cognitive improvements — particularly in working memory, attention, and executive function — continue well into the post-withdrawal period. At 60 days, many people notice they can concentrate more naturally without medication, think more clearly, and feel genuinely motivated rather than artificially energised.\n\n"
            "Dopamine Receptor Sensitivity\n"
            "Research shows that with sustained abstinence, dopamine receptor density and sensitivity continue recovering over months. At the two-month mark, the reward system is significantly more responsive to natural pleasures — food, social connection, accomplishment, exercise — than it was in early recovery.\n\n"
            "Emotional Stability\n"
            "Mood fluctuations that characterised early recovery are much less common by 60 days. Baseline emotional wellbeing is substantially improved for most people. Sleep quality continues to be good, which compounds the improvements in mood, cognition, and energy.\n\n"
            "Physical Health\n"
            "The physical effects of stimulant use — elevated heart rate, reduced appetite, weight loss — have fully reversed. Cardiovascular function is healthy, appetite is stable, and most people have reached a stable weight.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.adderallMilestone90Title,
        description: l10n.adderallMilestone90Description,
        reference: "PMC - Clinical Management of Psychostimulant Withdrawal",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10069411/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Off Adderall: Major Recovery Milestone\n\n"
            "Source: PMC (PubMed Central) — Peer-reviewed research on psychostimulant withdrawal\n\n"
            "What the Research Shows\n"
            "A systematic review published in PMC examining the clinical management of psychostimulant withdrawal found that the majority of withdrawal symptoms resolve within 1–3 months, with cognitive function showing measurable improvement throughout this period. By 90 days, most people who used stimulants at moderate levels have largely completed their neurological recovery.\n\n"
            "Protracted Withdrawal\n"
            "The research notes that a subset of heavy, long-term users may experience protracted withdrawal syndrome — a continuation of milder psychological symptoms (particularly mood instability and concentration difficulties) beyond the 90-day mark. This is less common but known, and typically continues improving with sustained abstinence.\n\n"
            "Brain Neuroplasticity\n"
            "By three months, the brain has undergone significant neuroplastic changes: dopamine receptors have largely recovered, neural pathways associated with natural reward are more active, and the prefrontal cortex — which governs self-control and decision-making — shows improved function. These changes compound over time.\n\n"
            "Treatment Implications\n"
            "The PMC research emphasises that the 90-day period is when behavioral interventions (therapy, lifestyle changes, exercise) are most effective, as the brain is now neurologically capable of consolidating new patterns and habits. This is a powerful window for building a sustainable life without stimulants.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.adderallMilestone180Title,
        description: l10n.adderallMilestone180Description,
        reference: "NCBI Bookshelf - Withdrawal Syndromes",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Off Adderall: Brain Healing Continues\n\n"
            "Source: NCBI Bookshelf — StatPearls clinical reference\n\n"
            "Six months represents a substantial period of neurological healing. NCBI's clinical overview of withdrawal syndromes confirms that stimulant-related neurological changes continue improving for months to years after cessation, with the first six months being the most active period of recovery.\n\n"
            "Neurochemical Restoration\n"
            "The NCBI resource documents that long-term amphetamine use causes lasting changes to the dopaminergic and noradrenergic systems. These changes are largely (though not always completely) reversible with sustained abstinence. At six months, the neurochemical environment of the brain is substantially closer to its pre-drug state. Dopamine receptor sensitivity, serotonin function, and norepinephrine balance have all improved.\n\n"
            "Cognitive and Emotional State\n"
            "By six months, most people report:\n"
            "• Stable, consistent mood without the cycling of early recovery\n"
            "• Natural concentration and focus that, while different from stimulant-induced focus, is reliable\n"
            "• Return of motivation driven by genuine interest rather than pharmacological stimulation\n"
            "• Improved sleep quality sustained over months\n"
            "• Emotional depth and capacity for pleasure fully restored\n\n"
            "Relationship to ADHD\n"
            "For people who had ADHD, six months of sobriety provides an opportunity for a clear-headed assessment of their current symptoms and whether non-stimulant treatment approaches are working. Many find that lifestyle changes (exercise, sleep hygiene, diet, therapy) significantly reduce ADHD symptoms at this stage.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.adderallMilestone365Title,
        description: l10n.adderallMilestone365Description,
        reference:
            "PMC - Potential Adverse Effects of Amphetamine Treatment on Brain and Behavior",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC2670101",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Off Adderall: Near-Complete Recovery\n\n"
            "Source: PMC — Ricaurte et al., review of amphetamine effects on brain and behavior\n\n"
            "This peer-reviewed review examines the long-term effects of amphetamine treatment on the brain, including evidence for both lasting damage and recovery with sustained abstinence.\n\n"
            "What the Research Shows\n"
            "The review documents that high-dose or long-term amphetamine use can cause lasting changes to dopaminergic and serotonergic nerve terminals — particularly in the striatum and prefrontal cortex. However, the research also shows evidence of substantial recovery with prolonged abstinence, with some markers of dopamine function showing near-normalisation at the 12-month mark in imaging studies.\n\n"
            "Recovery vs. Permanent Change\n"
            "The research distinguishes between two types of amphetamine-related neural change:\n"
            "• Functional changes (receptor downregulation, neurotransmitter imbalances) — largely reversible over months to years\n"
            "• Structural changes at very high doses (axon terminal damage) — partially reversible, with sprouting of new terminals documented over years of abstinence\n\n"
            "Practical Recovery at One Year\n"
            "For the vast majority of people who used Adderall at prescribed or moderate doses, one year represents near-complete functional recovery. The brain has rebuilt its natural reward, attention, and motivation systems. Cognitive function — memory, concentration, executive function — is fully operational.\n\n"
            "Long-term Resilience\n"
            "At one year, the risk of relapse is substantially lower than in early recovery, though it never reaches zero. The neural pathways associated with stimulant use have been significantly weakened by a year of non-activation, while new, healthier patterns have been strengthened.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.adderallPageTitle,
      storageKey: 'adderall',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.adderallHeaderStarted,
      headerNotStarted: l10n.adderallHeaderNotStarted,
      subtitleStarted: l10n.adderallSubtitleStarted,
      subtitleNotStarted: l10n.adderallSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
