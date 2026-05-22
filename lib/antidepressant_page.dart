import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

/// Antidepressant discontinuation recovery timeline.
///
/// Always taper under medical supervision — abrupt cessation can cause severe
/// discontinuation syndrome and, in some cases, return of the underlying
/// condition. The milestones here reflect a successful, medically supervised
/// taper.
class AntidepressantPage extends StatelessWidget {
  final bool started;
  const AntidepressantPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 3,
        title: l10n.antidepressantsMilestone3Title,
        description: l10n.antidepressantsMilestone3Description,
        reference: "Harvard Health - Going off antidepressants",
        link:
            "https://www.health.harvard.edu/diseases-and-conditions/going-off-antidepressants",
        referenceDate: "May 2026",
        referenceContent:
            "Antidepressant Discontinuation Syndrome: The First Days\n\n"
            "Source: Harvard Health Publishing\n\n"
            "Important Safety Note\n"
            "Antidepressants should only be stopped under medical supervision following a gradual taper. Abrupt cessation — especially after long-term use — significantly increases the severity of discontinuation symptoms and carries the risk of relapse of the underlying condition. If you are stopping antidepressants, do so with your prescriber's guidance.\n\n"
            "What Is Discontinuation Syndrome?\n"
            "Antidepressant discontinuation syndrome (ADS) is a well-documented medical phenomenon that occurs when antidepressants — particularly SSRIs and SNRIs — are stopped or substantially reduced. It is not the same as addiction or withdrawal in the classical sense; rather, it reflects the brain's temporary difficulty adjusting to the change in neurotransmitter signalling.\n\n"
            "The FINISH Symptoms\n"
            "Clinicians use the acronym FINISH to describe the common symptoms:\n"
            "• Flu-like symptoms (fatigue, sweating, muscle aches)\n"
            "• Insomnia and disturbed sleep\n"
            "• Nausea\n"
            "• Imbalance and dizziness\n"
            "• Sensory disturbances — particularly 'brain zaps' (brief, electric shock-like sensations)\n"
            "• Hyperarousal, irritability, and anxiety\n\n"
            "Why These Symptoms Occur\n"
            "SSRIs and SNRIs work by blocking the reuptake of serotonin (and norepinephrine for SNRIs), increasing their availability in synapses. Long-term use causes the brain to downregulate its own serotonin receptors. When the drug is removed, the brain needs time to restore normal receptor sensitivity — the symptoms are a manifestation of this adjustment.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.antidepressantsMilestone7Title,
        description: l10n.antidepressantsMilestone7Description,
        reference: "NHS - Stopping or coming off antidepressants",
        link:
            "https://www.nhs.uk/mental-health/talking-therapies-medicine-treatments/medicines-and-psychiatry/antidepressants/coming-off-antidepressants/",
        referenceDate: "May 2026",
        referenceContent:
            "One Week After Antidepressants: The Acute Phase\n\n"
            "Source: NHS — Stopping or coming off antidepressants\n\n"
            "The Acute Discontinuation Phase\n"
            "The NHS documents that most antidepressant discontinuation symptoms begin within five days of stopping and last for up to six weeks in the majority of cases. By one week, the acute physical symptoms are typically at their most pronounced and beginning to trend downward for those who tapered gradually.\n\n"
            "What to Expect at One Week\n"
            "• Physical symptoms (nausea, dizziness, flu-like feelings) are at their most intense but should be beginning to ease\n"
            "• Sleep disturbances including vivid dreams or insomnia are common\n"
            "• Emotional lability — rapid mood changes — is frequent at this stage\n"
            "• Brain zaps may still be present but typically begin to reduce in frequency\n\n"
            "Half-Life Matters\n"
            "The timing and severity of discontinuation syndrome depends heavily on the half-life of the antidepressant. Short-acting SSRIs like paroxetine (Paxil) and venlafaxine (Effexor) produce earlier and often more intense symptoms. Fluoxetine (Prozac), with its very long half-life of 4–6 days, tends to produce milder discontinuation effects because it effectively self-tapers in the body.\n\n"
            "The Role of Tapering\n"
            "The NHS strongly recommends a slow taper — sometimes over months for long-term users — to minimise discontinuation effects. The Royal College of Psychiatrists has developed tapering guidelines that suggest very gradual dose reductions (often hyperbolic tapering using liquid formulations) for those who have taken antidepressants for extended periods.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.antidepressantsMilestone14Title,
        description: l10n.antidepressantsMilestone14Description,
        reference:
            "The Lancet Psychiatry - Antidepressant discontinuation reactions",
        link:
            "https://www.thelancet.com/journals/lanpsy/article/PIIS2215-0366(19)30032-X/fulltext",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After Antidepressants: Physical Symptoms Resolving\n\n"
            "Source: Davies & Read (2019), The Lancet Psychiatry — 'A systematic review into the incidence, severity and duration of antidepressant withdrawal effects'\n\n"
            "What the Research Found\n"
            "This landmark systematic review in The Lancet Psychiatry found that antidepressant withdrawal effects are more common and more severe than previously recognised in official guidance. Approximately 56% of people who discontinue antidepressants experience withdrawal effects, and 46% of those describe them as severe. The review also found that for a significant subset of people, symptoms can last much longer than the classically cited 'a few weeks.'\n\n"
            "Two-Week Status\n"
            "For most people following a proper taper, the acute phase is largely resolved by two weeks:\n"
            "• Brain zaps significantly reduced or absent\n"
            "• Nausea and flu-like symptoms resolved\n"
            "• Dizziness and balance issues improving\n"
            "• Sleep beginning to normalise\n\n"
            "What May Persist\n"
            "• Emotional sensitivity — feeling more tearful or irritable than usual\n"
            "• Anxiety, which may be the return of the underlying condition rather than discontinuation syndrome\n"
            "• Vivid dreams or altered dream patterns\n\n"
            "Distinguishing Discontinuation from Relapse\n"
            "An important clinical distinction: symptoms that appear within days of stopping and match the FINISH profile are most likely discontinuation syndrome. Symptoms that emerge after 2–4 weeks and resemble the original condition being treated are more likely relapse. Monitoring this distinction with your prescriber is important.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.antidepressantsMilestone30Title,
        description: l10n.antidepressantsMilestone30Description,
        reference: "PubMed - Antidepressant discontinuation syndrome: a review",
        link: "https://pubmed.ncbi.nlm.nih.gov/16390895/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After Antidepressants: Stabilisation\n\n"
            "Source: Perahia et al. (2005), peer-reviewed review on antidepressant discontinuation syndrome\n\n"
            "The Stabilisation Phase\n"
            "One month represents the transition from acute discontinuation to stabilisation. For most people who completed a gradual taper, the acute neurological discontinuation symptoms are now largely resolved. What remains is the brain's ongoing adjustment to regulating neurotransmitters without pharmacological assistance.\n\n"
            "What Typically Improves by One Month\n"
            "• Physical discontinuation symptoms (brain zaps, nausea, dizziness) resolved for most people\n"
            "• Sleep quality improving — REM sleep patterns restoring naturally\n"
            "• Appetite and digestion normalising\n"
            "• Energy levels beginning to stabilise\n\n"
            "Emotional Landscape at One Month\n"
            "Emotional changes at one month are variable and important to monitor:\n"
            "• Some people feel emotionally 'flatter' initially as the brain adjusts — this typically improves\n"
            "• Others experience emotional vividness they had not felt in years\n"
            "• Anxiety levels vary significantly by individual and underlying condition\n\n"
            "The Value of Non-Medication Support\n"
            "Research consistently shows that cognitive-behavioural therapy (CBT) and other evidence-based psychological therapies are highly effective for the conditions antidepressants treat. The one-month mark is an excellent time to ensure these supports are in place.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.antidepressantsMilestone90Title,
        description: l10n.antidepressantsMilestone90Description,
        reference: "Wikipedia - Antidepressant discontinuation syndrome",
        link:
            "https://en.wikipedia.org/wiki/Antidepressant_discontinuation_syndrome",
        referenceDate: "May 2026",
        referenceContent:
            "Three Months After Antidepressants: Neurochemical Rebalancing\n\n"
            "Source: Wikipedia — Antidepressant discontinuation syndrome\n\n"
            "Three-Month Status\n"
            "Three months is a significant milestone in antidepressant recovery. Wikipedia's article on antidepressant discontinuation syndrome documents that while most people resolve acute symptoms within 6 weeks, a subset of long-term users experience a protracted course. By three months, even those with more prolonged discontinuation effects are typically well into recovery.\n\n"
            "Serotonin Receptor Recovery\n"
            "SSRIs work by blocking serotonin reuptake transporters (SERT). Long-term use causes compensatory downregulation of post-synaptic serotonin receptors (particularly 5-HT1A receptors). Brain imaging studies show that SERT occupancy returns to baseline within weeks of discontinuation, but receptor sensitivity restoration takes longer — typically 2–3 months for substantial recovery.\n\n"
            "Cognitive and Emotional Status at 3 Months\n"
            "Most people at the three-month mark report:\n"
            "• Mood that is stable and, for many, meaningfully better than on medication\n"
            "• Improved emotional range — the emotional blunting that some experience on SSRIs has resolved\n"
            "• Cognitive clarity, with the 'emotional anaesthesia' effect lifted\n"
            "• Reduced anxiety, particularly for those engaged in psychological therapy\n\n"
            "What Research Shows About Long-Term Outcomes\n"
            "Studies of people who successfully discontinue antidepressants find that the majority do not relapse into the original condition, particularly when:\n"
            "1. They received adequate psychological therapy alongside or instead of medication\n"
            "2. The original episode was situational rather than recurring major depression\n"
            "3. The taper was conducted slowly and under medical supervision",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.antidepressantsMilestone180Title,
        description: l10n.antidepressantsMilestone180Description,
        reference:
            "PubMed - Long-term effects of antidepressant discontinuation",
        link: "https://pubmed.ncbi.nlm.nih.gov/31689556/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After Antidepressants: Long-Term Brain Adjustment\n\n"
            "Source: Research on long-term outcomes following antidepressant discontinuation\n\n"
            "The Six-Month Assessment\n"
            "Six months after antidepressant discontinuation is an important clinical assessment point. Research at this timeframe consistently shows that people who completed a gradual taper and engaged with psychological support have outcomes comparable to those who remained on medication — without the ongoing side effects.\n\n"
            "Brain Systems Normalised by Six Months\n"
            "• Serotonin receptor sensitivity: substantially restored, with 5-HT1A auto-receptor sensitivity returning to normal levels\n"
            "• HPA axis (stress hormone regulation): normalising — cortisol responses becoming more calibrated\n"
            "• Sleep architecture: fully restored, with natural REM and slow-wave sleep cycles\n"
            "• Neuroplasticity: BDNF (brain-derived neurotrophic factor) — which antidepressants increase — returns to baseline levels supported by natural mechanisms including exercise, sleep, and psychological engagement\n\n"
            "Emotional Experience at Six Months\n"
            "Many people at the six-month mark describe an emotional experience notably different from what they experienced on antidepressants:\n"
            "• Wider emotional range — both positive and challenging emotions are more available\n"
            "• Stronger connection to values and relationships\n"
            "• Improved sexual function (a common side effect of SSRIs that resolves post-discontinuation)\n"
            "• Clearer sense of self\n\n"
            "Ongoing Monitoring\n"
            "Continued monitoring for recurrence of the original condition remains important. Many people benefit from ongoing therapy as a foundation rather than medication.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.antidepressantsMilestone365Title,
        description: l10n.antidepressantsMilestone365Description,
        reference:
            "PubMed - Antidepressant use and discontinuation in primary care",
        link: "https://pubmed.ncbi.nlm.nih.gov/24680484/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After Antidepressants: Recovery Achieved\n\n"
            "Source: Research on long-term antidepressant use and outcomes after discontinuation\n\n"
            "One Year: A Complete Recovery Cycle\n"
            "One year after completing an antidepressant taper, the brain has had a complete cycle of all four seasons to adapt and stabilise without pharmacological support. This represents a major milestone — one that research shows is associated with sustained recovery in the majority of people.\n\n"
            "What Research Shows at One Year\n"
            "Studies following people for one year after antidepressant discontinuation find that:\n"
            "• The majority of those who completed a proper taper and received psychological support remain well\n"
            "• Quality of life measures are comparable or better than those who remained on medication\n"
            "• The 'emotional blunting' side effect of long-term SSRI use has fully resolved\n"
            "• Sexual function has returned to normal for the vast majority\n\n"
            "Brain Health at One Year\n"
            "• All acute and post-acute discontinuation effects resolved\n"
            "• Natural neurotransmitter systems fully self-regulating\n"
            "• Neuroplasticity and brain function intact and actively maintained by natural means\n"
            "• Sleep architecture: fully natural and restorative\n\n"
            "Reflecting on the Journey\n"
            "Antidepressants serve an important medical purpose, and the decision to discontinue them — made in partnership with a prescriber — reflects significant self-knowledge and courage. One year of successful self-regulation is evidence of both the effectiveness of the work you have done and the brain's profound capacity to heal.\n\n"
            "A Note on the Future\n"
            "Depression and anxiety are chronic conditions for some people. There is no failure in returning to medication if the underlying condition reasserts itself. The goal is wellbeing — and one year of successful discontinuation is a genuine achievement regardless of what comes next.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.antidepressantsPageTitle,
      storageKey: 'antidepressants',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.antidepressantsHeaderStarted,
      headerNotStarted: l10n.antidepressantsHeaderNotStarted,
      subtitleStarted: l10n.antidepressantsSubtitleStarted,
      subtitleNotStarted: l10n.antidepressantsSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
