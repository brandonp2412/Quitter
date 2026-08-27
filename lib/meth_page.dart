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
        reference:
            "The Nature, Time Course and Severity of Methamphetamine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/16128721/",
        referenceDate: "June 2026",
        referenceContent:
            "Methamphetamine Withdrawal: The First 24 Hours\n\n"
            "Source: McGregor et al., \"The nature, time course and severity of methamphetamine withdrawal,\" Addiction (2005), on PubMed\n\n"
            "The Crash\n"
            "Methamphetamine drives a large release of dopamine; when use stops, the system is left depleted. This study tracked withdrawal symptoms daily across the first three weeks of abstinence and found that overall severity was at its highest within 24 hours of the last use — the 'crash,' an abrupt swing from extreme stimulation to physical and psychological exhaustion.\n\n"
            "Day One Symptoms\n"
            "The study documented the withdrawal features that are most intense now:\n"
            "• Extreme fatigue and increased sleep (hypersomnia)\n"
            "• Increased appetite (meth powerfully suppresses appetite)\n"
            "• Depressed mood and loss of pleasure\n"
            "• Strong cravings\n"
            "• Anxiety and irritability\n\n"
            "Physical Safety\n"
            "The methamphetamine withdrawal syndrome itself is not generally life-threatening, but the depression-related symptoms measured in this study can be severe early on and may include suicidal thoughts. Medical supervision is strongly advisable, especially for heavy users.\n\n"
            "It Starts to Lift\n"
            "The encouraging finding from this research: severity is highest at the very start and then falls. From this 24-hour peak, symptoms decline steadily over the following days — the worst point is the beginning.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.methMilestone3Title,
        description: l10n.methMilestone3Description,
        reference:
            "The Nature, Time Course and Severity of Methamphetamine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/16128721/",
        referenceDate: "June 2026",
        referenceContent:
            "Meth Withdrawal: Day Three — Still in the Acute Phase\n\n"
            "Source: McGregor et al., \"The nature, time course and severity of methamphetamine withdrawal,\" Addiction (2005), on PubMed\n\n"
            "Coming Down From the Peak\n"
            "This study found that overall withdrawal severity peaks within the first 24 hours and then declines in a roughly linear pattern across the acute phase (about 7–10 days). By day three you are past the highest point, but still firmly in the acute phase — symptoms remain prominent even as the trend is downward.\n\n"
            "Day Three Symptoms\n"
            "The features the study tracked that are still significant now:\n"
            "• Depression and loss of pleasure\n"
            "• Strong cravings\n"
            "• Difficulty concentrating and thinking clearly\n"
            "• Disturbed sleep — insomnia alternating with hypersomnia\n"
            "• Continued fatigue\n\n"
            "Why It Feels This Way\n"
            "Meth withdrawal's intensity reflects the scale of dopamine depletion it causes. The depression-related symptoms the study measured are most evident in these early days — but importantly, the study found overall withdrawal severity 'reducing to near control levels by the end of the first week of abstinence.'\n\n"
            "This Will Pass\n"
            "The hardest stretch is the first few days, and the data show a steady decline from here. Understanding this state as temporary and brain and nerve — not a permanent condition — helps in getting through it.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.methMilestone7Title,
        description: l10n.methMilestone7Description,
        reference:
            "The Nature, Time Course and Severity of Methamphetamine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/16128721/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Without Meth: The Acute Phase Ends\n\n"
            "Source: McGregor et al., \"The nature, time course and severity of methamphetamine withdrawal,\" Addiction (2005), on PubMed\n\n"
            "End of the Acute Phase\n"
            "This is one of the most encouraging findings in the research. The study reported that overall withdrawal severity — including the depression-related symptoms it tracked — 'reduced to near control levels by the end of the first week of abstinence,' marking the end of the acute phase. The steepest part of the climb is behind you.\n\n"
            "Two Phases of Withdrawal\n"
            "The authors described meth withdrawal as having:\n"
            "• An acute phase lasting about 7–10 days, in which symptom severity falls steadily from its early peak\n"
            "• A subacute phase lasting at least a further two weeks, with milder, lingering symptoms\n\n"
            "What Remains at Day 7\n"
            "Entering the subacute phase, the dominant challenges are now psychological rather than the acute crash:\n"
            "• Low mood, though much improved from the first days\n"
            "• Cravings, especially in response to cues\n"
            "• Concentration and memory still recovering\n"
            "• Sleep still settling\n\n"
            "Physical Recovery Underway\n"
            "With the acute phase over, appetite has returned and energy is slowly building as the body recovers from meth's effects on sleep, nutrition, and the cardiovascular system.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.methMilestone30Title,
        description: l10n.methMilestone30Description,
        reference:
            "Withdrawal Symptoms in Abstinent Methamphetamine-Dependent Subjects (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3071736/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Without Meth: Mood Settles, Cravings Linger\n\n"
            "Source: Zorick et al., \"Withdrawal symptoms in abstinent methamphetamine-dependent subjects,\" Addiction (2010), on PubMed Central\n\n"
            "Tracking the First Five Weeks\n"
            "This study followed methamphetamine-dependent participants who stayed abstinent for up to five weeks, comparing them with healthy controls — giving an unusually clear picture of where the one-month mark sits.\n\n"
            "What Has Improved by One Month\n"
            "• Depressive symptoms 'decreased substantially over the first 2 weeks of abstinence to stable low levels,' and by the end of four weeks were approaching, though not yet statistically matching, healthy-control levels (the gap had narrowed to a borderline, non-significant trend)\n"
            "• Psychiatric and psychotic-type symptoms had reached a low starting level by the end of the second week\n"
            "So at 30 days, the heavy depression of early withdrawal has largely lifted — a genuine, measured improvement.\n\n"
            "What Still Lingers\n"
            "The study was clear that one symptom outlasts the others: craving 'still continued at a reduced level throughout 5 weeks of abstinence.' Cravings are weaker than in the first week but have not gone, which is why one month is still a high-risk period and ongoing support matters.\n\n"
            "The Takeaway\n"
            "By a month, the brain's mood machinery has recovered enough that day-to-day feeling is far better than in early withdrawal — while persistent cravings are a normal part of this stage, not a sign of failure.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.methMilestone90Title,
        description: l10n.methMilestone90Description,
        reference:
            "Loss of Dopamine Transporters in Meth Abusers Recovers With Protracted Abstinence (Journal of Neuroscience)",
        link: "https://pubmed.ncbi.nlm.nih.gov/11717374/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Without Meth: Healing Has Begun — Be Patient\n\n"
            "Source: Volkow et al., \"Loss of Dopamine Transporters in Methamphetamine Abusers Recovers with Protracted Abstinence,\" Journal of Neuroscience (2001)\n\n"
            "About This Research\n"
            "This landmark brain-scan study followed methamphetamine users twice — around three months off meth and again around 14 months — to see how the dopamine system recovers.\n\n"
            "Where Three Months Sits\n"
            "At three months, the early withdrawal period is long over and deeper dopamine recovery is underway. The same study later found that proteins that recycle dopamine in the brain's reward and movement areas rose by roughly 16% to 19% after 12–17 months off meth.\n\n"
            "What That Means For You\n"
            "By 90 days the acute withdrawal is far behind you, mood and sleep have improved, and engagement with therapy becomes far more productive. But the deeper dopamine recovery is a longer project that unfolds over the following year. If motivation and pleasure still feel muted at three months, that is expected and not a sign of failure — the trajectory in this study is clearly upward from here.\n\n"
            "Why It's Worth the Wait\n"
            "The same study showed that staying abstinent is what drives the recovery: the longer the abstinence, the greater the DAT recovery measured. Three months is the foundation; the gains keep coming.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.methMilestone180Title,
        description: l10n.methMilestone180Description,
        reference:
            "Stopping Methamphetamine Use Can Reverse Heart Damage (American College of Cardiology)",
        link:
            "https://www.acc.org/about-acc/press-releases/2017/05/30/09/59/stopping-drug-abuse-can-reverse-related-heart-damage",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Without Meth: The Heart Can Recover\n\n"
            "Source: \"Stopping Drug Abuse Can Reverse Related Heart Damage,\" American College of Cardiology (2017), reporting a study in JACC: Heart Failure\n\n"
            "Meth and the Heart\n"
            "Methamphetamine is one of the most cardiotoxic recreational drugs. It can drive severe hypertension and arrhythmias and, over time, methamphetamine-associated cardiomyopathy — a weakening of the heart muscle that leads to heart failure.\n\n"
            "What the Study Found\n"
            "The ACC reported on patients with meth-associated cardiomyopathy (all with significantly reduced heart-pumping function). The central, hopeful finding: quitting 'can reverse the damage the drug causes to the heart and improve heart function.' Patients who stopped using had markedly better outcomes than those who kept using, and the authors stressed that catching it early 'could prevent further deterioration of the cardiomyopathy.'\n\n"
            "Why Six Months Matters\n"
            "Every month of abstinence removes the ongoing toxic stress on your heart and gives the muscle a chance to recover. At six months you have given your cardiovascular system a substantial, sustained break from that damage — exactly the condition under which this study saw improvement.\n\n"
            "Recovery Signal\n"
            "The evidence-backed result is strong: stopping meth can reverse methamphetamine-associated heart damage and improve heart function. Six months without the repeated stimulant insult gives the heart a substantial recovery window.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.methMilestone365Title,
        description: l10n.methMilestone365Description,
        reference:
            "Partial Recovery of Brain Metabolism in Meth Abusers After Protracted Abstinence (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/14754772/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Without Meth: Measurable Brain Recovery\n\n"
            "Source: Wang et al., \"Partial Recovery of Brain Metabolism in Methamphetamine Abusers After Protracted Abstinence,\" American Journal of Psychiatry (2004), on PubMed\n\n"
            "What the Imaging Shows\n"
            "This brain-scan study checked methamphetamine users early in abstinence and again after 12–17 months. It found genuine brain recovery, with some areas recovering faster than others.\n\n"
            "The Good News: Deep-Brain and Thinking Recovery\n"
            "The thalamus, a deep brain relay centre, started using energy more normally with long-term abstinence. That recovery tracked with better movement and verbal-memory performance, so the brain-scan improvement showed up in real thinking and memory.\n\n"
            "Reward Circuits Recover More Slowly\n"
            "At 12–17 months, the deep brain relay centre had recovered strongly and that gain tracked with better movement and verbal memory. Reward and motivation systems kept strengthening too, making the one-year picture one of major recovery in thinking and memory.\n\n"
            "What This Means at One Year\n"
            "At a year, expect a brain that thinks and remembers far better than in early recovery — clear, measurable healing. But if motivation or the ability to feel pleasure still lag at times, that is consistent with the science, not a personal failing: this study found those reward circuits can recover more slowly, with some deficits still present well over a year out.",
      ),
      QuitMilestone(
        day: 420,
        title: l10n.methMilestone420Title,
        description: l10n.methMilestone420Description,
        reference:
            "Loss of Dopamine Transporters in Meth Abusers Recovers With Protracted Abstinence (Journal of Neuroscience)",
        link: "https://pubmed.ncbi.nlm.nih.gov/11717374/",
        referenceDate: "June 2026",
        referenceContent:
            "14 Months Without Meth: The Dopamine Marker Rebounds\n\n"
            "Source: Volkow et al., \"Loss of Dopamine Transporters in Methamphetamine Abusers Recovers with Protracted Abstinence,\" Journal of Neuroscience (2001)\n\n"
            "The Headline Finding\n"
            "This landmark brain-scan study checked meth users early in abstinence and again after about 12–17 months. Proteins that recycle dopamine rose roughly 16% to 19% in the brain's reward and movement areas and reached levels that no longer differed significantly from healthy controls. Longer abstinence meant greater recovery.\n\n"
            "Why DAT Matters\n"
            "These proteins recycle dopamine after it is released. Meth depletes them, leaving the dopamine system poorly regulated. Their rebound by about 14 months is a genuine, measurable sign of healing.\n\n"
            "Recovery Signal\n"
            "After 12–17 months, dopamine-recycling proteins in reward and movement areas rose about 16% to 19% and reached healthy-control levels. The dopamine system has measurably rebounded toward normal, while thinking, memory, and movement continue improving.\n\n"
            "What This Means at 14 Months\n"
            "The dopamine system's hardware is measurably recovering toward normal — real cause for optimism. But full functional recovery (memory, motivation, fine motor control) can lag behind the imaging, and continues to improve with ongoing abstinence.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.methMilestone730Title,
        description: l10n.methMilestone730Description,
        reference:
            "Longer-Term Improvement in Neurocognition and Mood With Stable Meth Abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC2911490/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Years Without Meth: Thinking and Mood Keep Improving\n\n"
            "Source: Iudicello et al., \"Longer Term Improvement in Neurocognitive Functioning and Affective Distress Among Methamphetamine Users Who Achieve Stable Abstinence,\" Journal of Clinical and Experimental Neuropsychology (2010), on PubMed Central\n\n"
            "Recovery That Continues Past a Year\n"
            "This study followed methamphetamine users for about 13 months and compared stable abstainers with continued users and healthy controls. Stable abstinence improved overall thinking and reduced emotional distress, with gains continuing beyond a year.\n\n"
            "What Improves\n"
            "• Overall thinking in abstainers caught up to healthy controls, while continued users stayed significantly impaired\n"
            "• The biggest gains were in processing speed and motor ability, especially for those most impaired at the start\n"
            "• Mood improved markedly: only the abstainers showed significant improvement in depression and overall mood\n\n"
            "Recovery Signal\n"
            "Stable abstainers caught up to healthy controls on overall thinking and reported less emotional distress. Verbal learning, working memory, planning, and focus can keep improving beyond the first year, so the recovery trend continues into the second year.\n\n"
            "Two Years In\n"
            "The evidence-based message: sustained abstinence keeps paying off well past the first year — sharper thinking, better mood, and steadily improving function — even if a few areas take longer to come back.",
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
