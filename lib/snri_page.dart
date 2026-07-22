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
            "SNRIs affect two mood-regulating brain chemicals — serotonin and noradrenaline — meaning both need to readjust when you stop. The discontinuation symptoms are often more intense with SNRIs than SSRIs:\n"
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
        link: "https://www.nhs.uk/medicines/antidepressants/",
        referenceDate: "May 2026",
        referenceContent:
            "One Week After SNRIs: Dual Neurotransmitter Adjustment\n\n"
            "Source: NHS — Stopping or coming off antidepressants (general antidepressant guidance; the noradrenaline-specific mechanisms below reflect general SNRI pharmacology rather than SNRI-specific detail from the NHS page itself)\n\n"
            "The Dual-System Challenge\n"
            "Unlike most antidepressants that affect one system, SNRIs affect both serotonin and noradrenaline. By one week, both systems are adjusting:\n\n"
            "Noradrenaline System Effects\n"
            "The noradrenaline system governs the body's fight-or-flight response, blood pressure regulation, and energy levels. As it readjusts:\n"
            "• Blood pressure fluctuations may occur\n"
            "• Anxiety may feel more physical (racing heart, sweating)\n"
            "• Energy levels may be inconsistent\n\n"
            "Serotonin System Effects\n"
            "Simultaneously, the serotonin system is adjusting — producing the withdrawal symptoms typical of stopping any antidepressant. The combination of both systems adjusting can make the first week particularly challenging.\n\n"
            "Physically this often shows as improving blood pressure stability and fewer episodes of dizziness on standing. Emotionally, mood is more variable than it will be at 30 days but no longer in freefall.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.snriMilestone14Title,
        description: l10n.snriMilestone14Description,
        reference:
            "Davies & Read — Antidepressant Withdrawal Systematic Review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30292574/",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After SNRIs: Physical Symptoms Fading\n\n"
            "Source: Davies & Read (2019), Addictive Behaviors\n\n"
            "Two-Week Status\n"
            "For most people following a proper taper, the acute physical phase is largely resolved by two weeks:\n"
            "• Brain zaps significantly reduced or absent\n"
            "• Nausea and flu-like symptoms resolved\n"
            "• Dizziness and balance issues improving\n"
            "• Blood pressure and heart rate stabilising as noradrenaline rebalances\n\n"
            "What May Persist\n"
            "• Emotional sensitivity and mood variability\n"
            "• Anxiety — which the noradrenaline system particularly influences\n"
            "• Fatigue, as the noradrenaline system provides alertness and energy\n\n"
            "Research Context\n"
            "The Addictive Behaviors systematic review (Davies & Read, 2019) confirmed that SNRI discontinuation effects are among the most severe of any antidepressant class, with venlafaxine associated with particularly high rates of significant withdrawal symptoms.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.snriMilestone30Title,
        description: l10n.snriMilestone30Description,
        reference:
            "Davies & Read — Antidepressant Withdrawal Systematic Review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30292574/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After SNRIs: Dual System Stabilising\n\n"
            "Source: Davies & Read (2019), Addictive Behaviors — systematic review of antidepressant withdrawal incidence, severity, and duration\n\n"
            "The Stabilisation Phase\n"
            "One month represents a significant milestone in serotonin and noradrenaline recovery. This review found that, while a substantial minority of people experience withdrawal effects lasting beyond a few weeks, most people are well past the acute, most-severe phase of physical discontinuation symptoms by this point.\n\n"
            "What Typically Improves by One Month\n"
            "• Physical discontinuation symptoms (brain zaps, nausea, dizziness) resolved for most\n"
            "• Blood pressure returning to natural baseline\n"
            "• Sleep quality improving — REM sleep patterns restoring naturally\n"
            "• Energy levels beginning to stabilise as noradrenaline regulation normalises\n\n"
            "Emotional Blunting Resolution\n"
            "One of the most commonly reported experiences at this stage is the resolution of emotional blunting — many people on SNRIs notice a 'flattened' emotional range. As the drug clears and the brain readjusts, emotional range and sensitivity typically returns.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.snriMilestone90Title,
        description: l10n.snriMilestone90Description,
        reference:
            "Antidepressant Withdrawal Syndrome — Therapeutics Letter (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK598502/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months After SNRIs: Well Past Withdrawal\n\n"
            "Source: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\n"
            "Why SNRIs Deserve Extra Care\n"
            "This evidence review singles out short half-life antidepressants — including venlafaxine and duloxetine (both SNRIs) — as carrying a higher risk of withdrawal symptoms. A manufacturer-funded study found 51% of people stopping duloxetine experienced one or more symptoms. So SNRI withdrawal can be pronounced, which is exactly why a gradual, supervised taper matters.\n\n"
            "Where Three Months Sits\n"
            "The Letter notes withdrawal symptoms 'usually appear within a few days of stopping' and that 'most antidepressant withdrawal symptoms resolve within 2 weeks' (occasionally longer). By three months, the acute withdrawal phase is well behind the great majority of people.\n\n"
            "An Honest Note on 'Receptor Recovery'\n"
            "Popular timelines claim the serotonin and noradrenaline systems have 'fully rebalanced' by three months. The solid evidence concerns the withdrawal syndrome and its timing, not a precise receptor-recovery clock. What's dependable: by three months the withdrawal phase has typically resolved, and many people notice the emotional blunting some feel on SNRIs eases after stopping.\n\n"
            "Withdrawal Versus Relapse\n"
            "The Letter advises distinguishing withdrawal from a true return of the underlying condition. If anxiety or low mood persists at three months, review it with your prescriber rather than assuming it is only withdrawal.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.snriMilestone180Title,
        description: l10n.snriMilestone180Description,
        reference:
            "Davies & Read — Antidepressant Withdrawal Systematic Review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30292574/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After SNRIs: Neurological Recovery\n\n"
            "An Honest Note on Six-Month Data\n"
            "Davies & Read's systematic review documents that SNRI withdrawal effects can be among the most severe of any antidepressant class, but there is no dedicated study measuring SNRI-specific neurotransmitter, sleep, or sexual-function markers at exactly six months post-discontinuation. What follows is the general clinical expectation for someone this far past a completed, medically supervised taper:\n"
            "• Serotonin pathways: substantially restored\n"
            "• Noradrenaline pathways: normalised, with the stress response system also settling\n"
            "• Sleep architecture: expected to be fully restored\n"
            "• Sexual function: largely restored for most people (sexual dysfunction is a common SNRI side effect, though for some it can persist and is worth discussing with a prescriber)\n\n"
            "Resilience to Stress\n"
            "Many people at six months report notably improved resilience to everyday stressors as the noradrenaline system's role in arousal and stress response — which SNRIs powerfully modulate — settles back to its natural baseline.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.snriMilestone365Title,
        description: l10n.snriMilestone365Description,
        reference:
            "Antidepressant Withdrawal Syndrome — Therapeutics Letter (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK598502/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After SNRIs: Recovery Achieved\n\n"
            "One Year: A Complete Dual-System Recovery\n"
            "One year after completing an SNRI taper, both the serotonin and noradrenaline systems have had a complete cycle to adapt and stabilise.\n\n"
            "What the Evidence Actually Supports at One Year\n"
            "This Therapeutics Letter review notes that documented withdrawal symptoms 'usually appear within a few days of stopping' and that most resolve within about two weeks — there is no controlled study following people specifically one year after SNRI discontinuation. What's well supported by the broader clinical picture at this distance:\n"
            "• The majority of those who completed a proper taper and received psychological support remain well\n"
            "• The emotional blunting and sexual dysfunction that characterise SNRI use have fully resolved for most people\n"
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
