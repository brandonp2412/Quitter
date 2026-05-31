import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

/// SNRI discontinuation recovery timeline.
///
/// Always taper under medical supervision. SNRIs — particularly venlafaxine —
/// carry some of the most severe antidepressant discontinuation syndromes.
/// The milestones reflect a successful, medically supervised taper.
class SnriPage extends StatelessWidget {
  final bool started;
  const SnriPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 3,
        title: l10n.snriMilestone3Title,
        description: l10n.snriMilestone3Description,
        reference: "Harvard Health - Going off antidepressants",
        link:
            "https://www.health.harvard.edu/diseases-and-conditions/going-off-antidepressants",
        referenceDate: "May 2026",
        referenceContent:
            "SNRI Discontinuation: The First Days\n\n"
            "Source: Harvard Health Publishing\n\n"
            "Important Safety Note\n"
            "SNRIs should only be stopped under medical supervision following a gradual taper. Venlafaxine (Effexor) in particular has an extremely short half-life of approximately 5 hours, meaning the drug clears from the body very rapidly and discontinuation symptoms can be severe and sudden.\n\n"
            "Why SNRIs Are Harder to Stop Than SSRIs\n"
            "SNRIs block both serotonin and norepinephrine reuptake, meaning two neurotransmitter systems need to readjust simultaneously. The FINISH symptoms are often more intense with SNRIs than SSRIs:\n"
            "• Flu-like symptoms (fatigue, sweating, muscle aches)\n"
            "• Insomnia and disturbed sleep\n"
            "• Nausea — often more pronounced than with SSRIs\n"
            "• Imbalance and dizziness\n"
            "• Sensory disturbances — 'brain zaps' can be very intense with venlafaxine\n"
            "• Hyperarousal, irritability, and anxiety\n\n"
            "Comparing SNRIs\n"
            "Venlafaxine has the most difficult discontinuation profile due to its short half-life. Duloxetine (Cymbalta) tends to be somewhat easier due to its longer half-life of 12 hours. Desvenlafaxine falls between the two.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.snriMilestone7Title,
        description: l10n.snriMilestone7Description,
        reference: "NHS - Stopping or coming off antidepressants",
        link:
            "https://www.nhs.uk/mental-health/talking-therapies-medicine-treatments/medicines-and-psychiatry/antidepressants/coming-off-antidepressants/",
        referenceDate: "May 2026",
        referenceContent:
            "One Week After SNRIs: Dual Neurotransmitter Adjustment\n\n"
            "Source: NHS — Stopping or coming off antidepressants\n\n"
            "The Dual-System Challenge\n"
            "Unlike SSRIs which primarily affect serotonin, SNRIs affect both serotonin and norepinephrine simultaneously. By one week, both systems are adjusting:\n\n"
            "Norepinephrine System Effects\n"
            "The norepinephrine system governs the body's fight-or-flight response, blood pressure regulation, and energy levels. As it readjusts:\n"
            "• Blood pressure fluctuations may occur\n"
            "• Anxiety may feel more physical (racing heart, sweating)\n"
            "• Energy levels may be inconsistent\n\n"
            "Serotonin System Effects\n"
            "Simultaneously, the serotonin system is adjusting — producing the FINISH symptoms typical of all antidepressant discontinuation. The combination of both systems adjusting can make the first week particularly challenging.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.snriMilestone14Title,
        description: l10n.snriMilestone14Description,
        reference:
            "The Lancet Psychiatry - Antidepressant discontinuation reactions",
        link:
            "https://www.thelancet.com/journals/lanpsy/article/PIIS2215-0366(19)30032-X/fulltext",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After SNRIs: Physical Symptoms Fading\n\n"
            "Source: Davies & Read (2019), The Lancet Psychiatry\n\n"
            "Two-Week Status\n"
            "For most people following a proper taper, the acute physical phase is largely resolved by two weeks:\n"
            "• Brain zaps significantly reduced or absent\n"
            "• Nausea and flu-like symptoms resolved\n"
            "• Dizziness and balance issues improving\n"
            "• Blood pressure and heart rate stabilising as norepinephrine rebalances\n\n"
            "What May Persist\n"
            "• Emotional sensitivity and mood variability\n"
            "• Anxiety — which the norepinephrine system particularly influences\n"
            "• Fatigue, as the norepinephrine system provides alertness and energy\n\n"
            "Research Context\n"
            "The Lancet Psychiatry systematic review (Davies & Read, 2019) confirmed that SNRI discontinuation effects are among the most severe of any antidepressant class, with venlafaxine associated with particularly high rates of significant withdrawal symptoms.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.snriMilestone30Title,
        description: l10n.snriMilestone30Description,
        reference: "PubMed - Antidepressant discontinuation syndrome: a review",
        link: "https://pubmed.ncbi.nlm.nih.gov/16390895/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After SNRIs: Dual System Stabilising\n\n"
            "The Stabilisation Phase\n"
            "One month represents a significant milestone in dual serotonin-norepinephrine recovery. Most acute neurological discontinuation symptoms are now resolved.\n\n"
            "What Typically Improves by One Month\n"
            "• Physical discontinuation symptoms (brain zaps, nausea, dizziness) resolved for most\n"
            "• Blood pressure returning to natural baseline\n"
            "• Sleep quality improving — REM sleep patterns restoring naturally\n"
            "• Energy levels beginning to stabilise as norepinephrine regulation normalises\n\n"
            "Emotional Blunting Resolution\n"
            "One of the most commonly reported experiences at this stage is the resolution of emotional blunting — many people on SNRIs notice a 'flattened' emotional range. As the drug clears and the brain readjusts, emotional range and sensitivity typically returns.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.snriMilestone90Title,
        description: l10n.snriMilestone90Description,
        reference: "Wikipedia - Antidepressant discontinuation syndrome",
        link:
            "https://en.wikipedia.org/wiki/Antidepressant_discontinuation_syndrome",
        referenceDate: "May 2026",
        referenceContent:
            "Three Months After SNRIs: Dual System Rebalancing\n\n"
            "Three-Month Status\n"
            "Three months is a significant milestone. Both the serotonin transporter (SERT) and norepinephrine transporter (NET) have had time to normalise, and receptor sensitivity in both systems has substantially recovered.\n\n"
            "Norepinephrine System at 3 Months\n"
            "The locus coeruleus — the brain's primary source of norepinephrine — has adapted to functioning without SNRI-mediated blockade of NET. Stress resilience, attention, and the ability to self-regulate anxiety are improving.\n\n"
            "Cognitive Status\n"
            "The combination of serotonin and norepinephrine normalisation typically produces:\n"
            "• Improved focus and sustained attention\n"
            "• Better working memory\n"
            "• More stable mood\n"
            "• Reduced anxiety and improved stress resilience",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.snriMilestone180Title,
        description: l10n.snriMilestone180Description,
        reference:
            "PubMed - Long-term effects of antidepressant discontinuation",
        link: "https://pubmed.ncbi.nlm.nih.gov/31689556/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After SNRIs: Neurological Recovery\n\n"
            "Brain Systems Normalised by Six Months\n"
            "• Serotonin receptor sensitivity: substantially restored\n"
            "• Norepinephrine receptor sensitivity: normalised, with improved HPA axis regulation\n"
            "• HPA axis (stress hormone regulation): normalising — the norepinephrine system's influence on cortisol and stress responses is rebalancing\n"
            "• Sleep architecture: fully restored\n"
            "• Sexual function: largely restored (sexual dysfunction is a common SNRI side effect)\n\n"
            "Resilience to Stress\n"
            "Many people at six months report notably improved resilience to everyday stressors. The norepinephrine system's role in maintaining appropriate arousal and stress responses — which SNRIs powerfully modulate — has normalised.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.snriMilestone365Title,
        description: l10n.snriMilestone365Description,
        reference:
            "PubMed - Antidepressant use and discontinuation in primary care",
        link: "https://pubmed.ncbi.nlm.nih.gov/24680484/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After SNRIs: Recovery Achieved\n\n"
            "One Year: A Complete Dual-System Recovery\n"
            "One year after completing an SNRI taper, both the serotonergic and noradrenergic systems have had a complete cycle to adapt and stabilise.\n\n"
            "What Research Shows at One Year\n"
            "Research following people for one year after SNRI discontinuation finds that:\n"
            "• The majority of those who completed a proper taper and received psychological support remain well\n"
            "• The emotional blunting and sexual dysfunction that characterise SNRI use have fully resolved\n"
            "• Cognitive function, including the concentration benefits that SNRIs can provide, are maintained through natural brain function\n\n"
            "The Significance of This Milestone\n"
            "Successfully discontinuing an SNRI — particularly venlafaxine — is a significant achievement. The intensity of the discontinuation process and the commitment required to manage it under medical supervision demonstrates remarkable resilience.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.snriPageTitle,
      storageKey: 'snri',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.snriHeaderStarted,
      headerNotStarted: l10n.snriHeaderNotStarted,
      subtitleStarted: l10n.snriSubtitleStarted,
      subtitleNotStarted: l10n.snriSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
