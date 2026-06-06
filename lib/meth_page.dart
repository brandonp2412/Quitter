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
            "• Depressed mood and anhedonia\n"
            "• Strong cravings\n"
            "• Anxiety and irritability\n\n"
            "Physical Safety\n"
            "The methamphetamine withdrawal syndrome itself is not generally life-threatening, but the depressive and (in some) psychotic symptoms measured in this study can be severe early on and may include suicidal thoughts. Medical supervision is strongly advisable, especially for heavy users.\n\n"
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
            "• Depression and anhedonia (loss of pleasure)\n"
            "• Strong cravings\n"
            "• Difficulty concentrating and thinking clearly\n"
            "• Disturbed sleep — insomnia alternating with hypersomnia\n"
            "• Continued fatigue\n\n"
            "Why It Feels This Way\n"
            "Meth withdrawal's intensity reflects the scale of dopamine depletion it causes. The depressive and psychotic symptoms the study measured are most evident in these early days — but importantly, it found they 'largely resolve within a week of abstinence.'\n\n"
            "This Will Pass\n"
            "The hardest stretch is the first few days, and the data show a steady decline from here. Understanding this state as temporary and neurological — not a permanent condition — helps in getting through it.",
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
            "This is one of the most encouraging findings in the research. The study reported that overall withdrawal severity 'reduced to near control levels by the end of the first week of abstinence' — the acute phase. Depressive and psychotic symptoms also 'largely resolved within a week.' The steepest part of the climb is behind you.\n\n"
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
            "• Depressive symptoms 'decreased substantially over the first 2 weeks of abstinence to stable low levels,' and by the end of four weeks no longer differed meaningfully from healthy controls\n"
            "• Psychiatric and psychotic-type symptoms had reached a low baseline by the end of the second week\n"
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
        link: "https://www.jneurosci.org/content/21/23/9414",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Without Meth: Healing Has Begun — Be Patient\n\n"
            "Source: Volkow et al., \"Loss of Dopamine Transporters in Methamphetamine Abusers Recovers with Protracted Abstinence,\" Journal of Neuroscience (2001)\n\n"
            "About This Research\n"
            "This landmark PET-imaging study by Nora Volkow's team (Volkow later became Director of NIDA) scanned methamphetamine users twice — once during short abstinence (around three months) and again during protracted abstinence (around 14 months) — to see how the dopamine system recovers.\n\n"
            "Where Three Months Sits\n"
            "Honesty matters here: at the short-abstinence scan — close to the three-month mark — dopamine transporter (DAT) levels in the striatum were still markedly reduced compared with healthy controls. The big rebound in this study did not appear at three months; it emerged later, with much longer abstinence.\n\n"
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
            "An Honest Note\n"
            "The study did not pin recovery to a fixed timeline, and it looked at people who already had heart failure, so the degree of recovery varies from person to person. The key, evidence-based message is clear: stopping meth can halt and partly reverse heart damage, and the sooner the better.",
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
            "One Year Without Meth: Real Recovery — and an Honest Picture\n\n"
            "Source: Wang et al., \"Partial Recovery of Brain Metabolism in Methamphetamine Abusers After Protracted Abstinence,\" American Journal of Psychiatry (2004), on PubMed\n\n"
            "What the Imaging Shows\n"
            "This PET study scanned methamphetamine users during early abstinence and again after protracted abstinence (12–17 months) — right around the one-year mark. It found genuine but region-specific recovery.\n\n"
            "The Good News: Thalamus and Cognition\n"
            "Metabolism in the thalamus increased with protracted abstinence, and — importantly — this was 'functionally significant,' linked to improved performance on motor and verbal memory tasks. The brain measurably regained function, and that recovery showed up in real-world thinking and memory.\n\n"
            "The Honest Part: Some Deficits Persist\n"
            "Recovery was partial. Metabolism in the striatum — especially the caudate and nucleus accumbens — did NOT recover and remained below that of healthy comparison subjects. The authors linked this lingering accumbens deficit to the lack of motivation and anhedonia that some people report as long as two years after their last use.\n\n"
            "What This Means at One Year\n"
            "At a year, expect a brain that thinks and remembers far better than in early recovery — clear, measurable healing. But if motivation or the ability to feel pleasure still lag at times, that is consistent with the science, not a personal failing: those reward circuits recover more slowly, and for some they keep improving well into the second year.",
      ),
      QuitMilestone(
        day: 420,
        title: l10n.methMilestone420Title,
        description: l10n.methMilestone420Description,
        reference:
            "Loss of Dopamine Transporters in Meth Abusers Recovers With Protracted Abstinence (Journal of Neuroscience)",
        link: "https://www.jneurosci.org/content/21/23/9414",
        referenceDate: "June 2026",
        referenceContent:
            "14 Months Without Meth: The Dopamine Marker Rebounds\n\n"
            "Source: Volkow et al., \"Loss of Dopamine Transporters in Methamphetamine Abusers Recovers with Protracted Abstinence,\" Journal of Neuroscience (2001)\n\n"
            "The Headline Finding\n"
            "This landmark PET study scanned meth users in early abstinence and again after protracted abstinence (about 12–17 months). Dopamine transporter (DAT) binding — markedly depleted in early abstinence — recovered substantially (roughly +16% to +19% in the striatum), to the point that it 'did not differ significantly' from healthy controls. The longer the abstinence, the greater the recovery.\n\n"
            "Why DAT Matters\n"
            "Dopamine transporters recycle dopamine after it is released. Meth depletes them, leaving the dopamine system poorly regulated. Their rebound by ~14 months is a genuine, measurable sign of healing in the dopamine system.\n\n"
            "The Honest Caveat\n"
            "The authors were careful: this recovery of the DAT marker was 'not sufficient for complete function recovery.' Neuropsychological and motor tests showed only a non-significant trend toward improvement — meaning the structural marker rebounded faster than thinking and motor performance did. The study was also small (only five people rescanned), so it points a direction rather than fixing an exact timeline.\n\n"
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
            "Two Years Without Meth: Cognition and Mood Keep Improving\n\n"
            "Source: Iudicello et al., \"Longer Term Improvement in Neurocognitive Functioning and Affective Distress Among Methamphetamine Users Who Achieve Stable Abstinence,\" Journal of Clinical and Experimental Neuropsychology (2010), on PubMed Central\n\n"
            "Recovery That Continues Past a Year\n"
            "This study followed methamphetamine users over an average of about 13 months and compared those who achieved stable abstinence with those who kept using and with healthy controls. Its conclusion supports 'partial recovery of neuropsychological functioning and improvement in affective distress upon sustained abstinence' — recovery that can extend beyond a year, into the timeframe you are now in.\n\n"
            "What Improves\n"
            "• Global cognition in abstainers caught up to healthy comparison subjects, while continued users stayed significantly impaired\n"
            "• The biggest gains were in processing speed and motor ability, especially for those most impaired at the start\n"
            "• Mood improved markedly: only the abstainers showed significant improvement in depression and overall mood\n\n"
            "An Honest Picture\n"
            "Recovery is real but not total. The authors found that some deficits — particularly verbal learning/memory and aspects of executive function and working memory — 'may persist despite prolonged periods of abstinence,' and they describe their findings as preliminary in a small sample. For very heavy or long-term users, some differences can linger while continuing to slowly improve.\n\n"
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
