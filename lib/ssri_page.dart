import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

/// SSRI discontinuation recovery timeline.
///
/// Always taper under medical supervision. The milestones reflect a successful,
/// medically supervised taper of an SSRI (e.g. sertraline, paroxetine,
/// citalopram, escitalopram, fluoxetine).
class SsriPage extends StatelessWidget {
  final bool started;
  const SsriPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 3,
        title: l10n.ssriMilestone3Title,
        description: l10n.ssriMilestone3Description,
        reference: "Harvard Health - Going off antidepressants",
        link:
            "https://www.health.harvard.edu/diseases-and-conditions/going-off-antidepressants",
        referenceDate: "May 2026",
        referenceContent:
            "SSRI Discontinuation: The First Days\n\n"
            "Source: Harvard Health Publishing\n\n"
            "Important Safety Note\n"
            "SSRIs should only be stopped under medical supervision following a gradual taper. Abrupt cessation — especially after long-term use — significantly increases the severity of discontinuation symptoms.\n\n"
            "What Is SSRI Discontinuation Syndrome?\n"
            "SSRI discontinuation syndrome is a well-documented medical phenomenon that occurs when SSRIs are stopped or substantially reduced. Clinicians use the acronym FINISH to describe the common symptoms:\n"
            "• Flu-like symptoms (fatigue, sweating, muscle aches)\n"
            "• Insomnia and disturbed sleep\n"
            "• Nausea\n"
            "• Imbalance and dizziness\n"
            "• Sensory disturbances — particularly 'brain zaps'\n"
            "• Hyperarousal, irritability, and anxiety\n\n"
            "Half-Life Matters\n"
            "Fluoxetine (Prozac) has a very long half-life of 4–6 days, so it effectively self-tapers and produces milder discontinuation effects. Paroxetine (Paxil) has the shortest half-life of the common SSRIs and produces the most intense discontinuation symptoms. Sertraline, citalopram, and escitalopram fall in between.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.ssriMilestone7Title,
        description: l10n.ssriMilestone7Description,
        reference: "NHS - Stopping or coming off antidepressants",
        link:
            "https://www.nhs.uk/mental-health/talking-therapies-medicine-treatments/medicines-and-psychiatry/antidepressants/coming-off-antidepressants/",
        referenceDate: "May 2026",
        referenceContent:
            "One Week After SSRIs: The Acute Phase\n\n"
            "Source: NHS — Stopping or coming off antidepressants\n\n"
            "The Acute Discontinuation Phase\n"
            "The NHS documents that most antidepressant discontinuation symptoms begin within five days of stopping and last for up to six weeks in the majority of cases. By one week, the acute physical symptoms are typically at their most pronounced and beginning to trend downward for those who tapered gradually.\n\n"
            "What to Expect at One Week\n"
            "• Physical symptoms (nausea, dizziness, flu-like feelings) are at their most intense but should be beginning to ease\n"
            "• Sleep disturbances including vivid dreams or insomnia are common\n"
            "• Emotional lability — rapid mood changes — is frequent at this stage\n"
            "• Brain zaps may still be present but typically begin to reduce in frequency\n\n"
            "The Role of Tapering\n"
            "The NHS strongly recommends a slow taper — sometimes over months for long-term users — to minimise discontinuation effects. The Royal College of Psychiatrists has developed tapering guidelines that suggest very gradual dose reductions, often using liquid formulations, for those who have taken SSRIs for extended periods.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.ssriMilestone14Title,
        description: l10n.ssriMilestone14Description,
        reference:
            "The Lancet Psychiatry - Antidepressant discontinuation reactions",
        link:
            "https://www.thelancet.com/journals/lanpsy/article/PIIS2215-0366(19)30032-X/fulltext",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After SSRIs: Physical Symptoms Resolving\n\n"
            "Source: Davies & Read (2019), The Lancet Psychiatry — 'A systematic review into the incidence, severity and duration of antidepressant withdrawal effects'\n\n"
            "What the Research Found\n"
            "This landmark systematic review found that approximately 56% of people who discontinue antidepressants experience withdrawal effects, and 46% of those describe them as severe. For most people following a proper taper, the acute phase is largely resolved by two weeks:\n"
            "• Brain zaps significantly reduced or absent\n"
            "• Nausea and flu-like symptoms resolved\n"
            "• Dizziness and balance issues improving\n"
            "• Sleep beginning to normalise\n\n"
            "Distinguishing Discontinuation from Relapse\n"
            "Symptoms that appear within days of stopping and match the FINISH profile are most likely discontinuation syndrome. Symptoms that emerge after 2–4 weeks and resemble the original condition being treated are more likely relapse. Monitoring this distinction with your prescriber is important.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.ssriMilestone30Title,
        description: l10n.ssriMilestone30Description,
        reference: "PubMed - Antidepressant discontinuation syndrome: a review",
        link: "https://pubmed.ncbi.nlm.nih.gov/16390895/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After SSRIs: Stabilisation\n\n"
            "Source: Perahia et al. (2005), peer-reviewed review on antidepressant discontinuation syndrome\n\n"
            "The Stabilisation Phase\n"
            "One month represents the transition from acute discontinuation to stabilisation. For most people who completed a gradual taper, the acute neurological discontinuation symptoms are now largely resolved.\n\n"
            "Emotional Landscape at One Month\n"
            "Emotional changes at one month are variable and important to monitor:\n"
            "• Some people feel emotionally 'flatter' initially as the brain adjusts — this typically improves\n"
            "• Others experience emotional vividness they had not felt in years\n"
            "• Anxiety levels vary significantly by individual and underlying condition\n\n"
            "The Value of Non-Medication Support\n"
            "Research consistently shows that cognitive-behavioural therapy (CBT) and other evidence-based psychological therapies are highly effective for the conditions SSRIs treat. The one-month mark is an excellent time to ensure these supports are in place.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.ssriMilestone90Title,
        description: l10n.ssriMilestone90Description,
        reference: "Wikipedia - Antidepressant discontinuation syndrome",
        link:
            "https://en.wikipedia.org/wiki/Antidepressant_discontinuation_syndrome",
        referenceDate: "May 2026",
        referenceContent:
            "Three Months After SSRIs: Serotonin Receptor Recovery\n\n"
            "Source: Wikipedia — Antidepressant discontinuation syndrome\n\n"
            "Serotonin Receptor Recovery\n"
            "SSRIs work by blocking serotonin reuptake transporters (SERT). Long-term use causes compensatory downregulation of post-synaptic serotonin receptors (particularly 5-HT1A receptors). Brain imaging studies show that SERT occupancy returns to baseline within weeks of discontinuation, but receptor sensitivity restoration takes longer — typically 2–3 months for substantial recovery.\n\n"
            "Cognitive and Emotional Status at 3 Months\n"
            "Most people at the three-month mark report:\n"
            "• Mood that is stable and, for many, meaningfully better than on medication\n"
            "• Improved emotional range — the emotional blunting that some experience on SSRIs has resolved\n"
            "• Cognitive clarity, with the 'emotional anaesthesia' effect lifted\n"
            "• Reduced anxiety, particularly for those engaged in psychological therapy",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.ssriMilestone180Title,
        description: l10n.ssriMilestone180Description,
        reference:
            "PubMed - Long-term effects of antidepressant discontinuation",
        link: "https://pubmed.ncbi.nlm.nih.gov/31689556/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After SSRIs: Long-Term Brain Adjustment\n\n"
            "Brain Systems Normalised by Six Months\n"
            "• Serotonin receptor sensitivity: substantially restored, with 5-HT1A auto-receptor sensitivity returning to normal levels\n"
            "• Sleep architecture: fully restored, with natural REM and slow-wave sleep cycles\n"
            "• Sexual function: a common SSRI side effect that resolves post-discontinuation for the vast majority\n\n"
            "Emotional Experience at Six Months\n"
            "Many people at the six-month mark describe an emotional experience notably different from what they experienced on SSRIs:\n"
            "• Wider emotional range — both positive and challenging emotions are more available\n"
            "• Stronger connection to values and relationships\n"
            "• Improved sexual function\n"
            "• Clearer sense of self",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.ssriMilestone365Title,
        description: l10n.ssriMilestone365Description,
        reference:
            "PubMed - Antidepressant use and discontinuation in primary care",
        link: "https://pubmed.ncbi.nlm.nih.gov/24680484/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After SSRIs: Recovery Achieved\n\n"
            "One Year: A Complete Recovery Cycle\n"
            "One year after completing an SSRI taper, the brain has had a complete cycle of all four seasons to adapt and stabilise without pharmacological support.\n\n"
            "What Research Shows at One Year\n"
            "Studies following people for one year after SSRI discontinuation find that:\n"
            "• The majority of those who completed a proper taper and received psychological support remain well\n"
            "• Quality of life measures are comparable or better than those who remained on medication\n"
            "• The emotional blunting side effect of long-term SSRI use has fully resolved\n"
            "• Sexual function has returned to normal for the vast majority\n\n"
            "A Note on the Future\n"
            "Depression and anxiety are chronic conditions for some people. There is no failure in returning to medication if the underlying condition reasserts itself. The goal is wellbeing — and one year of successful discontinuation is a genuine achievement regardless of what comes next.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.ssriPageTitle,
      storageKey: 'ssri',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.ssriHeaderStarted,
      headerNotStarted: l10n.ssriHeaderNotStarted,
      subtitleStarted: l10n.ssriSubtitleStarted,
      subtitleNotStarted: l10n.ssriSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
