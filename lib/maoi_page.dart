import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

/// MAOI discontinuation recovery timeline.
///
/// Always taper under medical supervision. MAOIs (e.g. phenelzine,
/// tranylcypromine, selegiline, moclobemide) carry the most serious
/// discontinuation risks of any antidepressant class. Medical supervision
/// throughout the tapering process is essential.
class MaoiPage extends StatelessWidget {
  final bool started;
  const MaoiPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 3,
        title: l10n.maoiMilestone3Title,
        description: l10n.maoiMilestone3Description,
        reference: "PubMed - MAOI discontinuation syndrome",
        link: "https://pubmed.ncbi.nlm.nih.gov/12503976/",
        referenceDate: "May 2026",
        referenceContent:
            "MAOI Discontinuation: The Highest-Risk Phase\n\n"
            "Source: Research on MAOI withdrawal reactions\n\n"
            "Critical Safety Warning\n"
            "MAOIs carry the most serious discontinuation risks of any antidepressant class. Abrupt cessation — particularly of phenelzine and tranylcypromine — can produce severe medical emergencies including:\n"
            "• Severe agitation and restlessness\n"
            "• Confusion and delirium\n"
            "• Hallucinations (visual and auditory)\n"
            "• Myoclonus (uncontrolled muscle twitching)\n"
            "• Hyperthermia (elevated body temperature)\n"
            "• In rare cases: hypertensive crisis from dietary tyramine exposure during transition\n\n"
            "If you are experiencing these symptoms, seek immediate medical attention.\n\n"
            "How MAOIs Work\n"
            "MAOIs work by irreversibly binding to and disabling monoamine oxidase enzymes (MAO-A and MAO-B). These enzymes normally break down serotonin, norepinephrine, dopamine, and tyramine in the brain and gut. When MAOIs are removed, the brain must wait for the body to synthesise new MAO enzymes — a process that takes approximately 14 days.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.maoiMilestone7Title,
        description: l10n.maoiMilestone7Description,
        reference: "NHS - Stopping or coming off antidepressants",
        link:
            "https://www.nhs.uk/mental-health/talking-therapies-medicine-treatments/medicines-and-psychiatry/antidepressants/coming-off-antidepressants/",
        referenceDate: "May 2026",
        referenceContent:
            "One Week After MAOIs: MAO Enzyme Synthesis Underway\n\n"
            "The Enzyme Recovery Process\n"
            "Unlike SSRIs, SNRIs, and TCAs — which inhibit neurotransmitter reuptake reversibly — MAOIs permanently destroy monoamine oxidase enzyme molecules. The only way the body can recover full MAO activity is by synthesising entirely new enzyme.\n\n"
            "What's Happening at One Week\n"
            "• MAO-A and MAO-B enzyme synthesis is well underway\n"
            "• Approximately 50% of normal MAO activity may have recovered by day 7–10\n"
            "• Severe acute discontinuation symptoms (delirium, myoclonus, hyperthermia) are substantially reduced\n"
            "• The acute risk phase is passing, though close medical supervision remains important\n\n"
            "Dietary Cautions\n"
            "MAOI treatment requires a low-tyramine diet to prevent hypertensive crisis. As MAO enzyme activity recovers over the first two weeks, tyramine metabolism is restoring. Your prescriber will advise when dietary restrictions can be relaxed.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.maoiMilestone14Title,
        description: l10n.maoiMilestone14Description,
        reference:
            "PubMed - Monoamine oxidase recovery after phenelzine discontinuation",
        link: "https://pubmed.ncbi.nlm.nih.gov/3571640/",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After MAOIs: MAO Enzyme Activity Substantially Recovered\n\n"
            "Source: Research on monoamine oxidase recovery after MAOI discontinuation\n\n"
            "The Critical Two-Week Mark\n"
            "Two weeks is the standard clinical timeframe for MAO enzyme recovery after discontinuation of irreversible MAOIs. Research confirms that by approximately 14 days:\n\n"
            "MAO Enzyme Recovery\n"
            "• Platelet MAO-B activity has substantially recovered\n"
            "• Brain MAO-A and MAO-B activity is largely restored\n"
            "• Normal tyramine metabolism is re-established — the MAOI dietary restrictions can typically be relaxed in consultation with your prescriber\n\n"
            "Neurotransmitter Normalisation\n"
            "With MAO enzyme activity recovering, the neurotransmitter systems that MAOIs affect are beginning to come under natural regulation:\n"
            "• Serotonin, norepinephrine, and dopamine are no longer being elevated by MAO inhibition\n"
            "• The supersensitivity of monoamine receptors (caused by chronic MAOI-elevated monoamine levels) is beginning to resolve\n"
            "• Natural mood and energy regulation is returning",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.maoiMilestone30Title,
        description: l10n.maoiMilestone30Description,
        reference: "PubMed - Antidepressant discontinuation syndrome: a review",
        link: "https://pubmed.ncbi.nlm.nih.gov/16390895/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After MAOIs: Neurotransmitter Systems Rebalancing\n\n"
            "The One-Month Assessment\n"
            "One month after MAOI discontinuation represents the point at which MAO enzyme activity has fully recovered and neurotransmitter systems are under entirely natural regulation.\n\n"
            "What Has Recovered by One Month\n"
            "• Complete MAO enzyme activity: both MAO-A and MAO-B are fully operational\n"
            "• Dietary restrictions resolved: normal diet without tyramine restrictions\n"
            "• Natural serotonin degradation: the brain's normal serotonin turnover cycle restored\n"
            "• Natural catecholamine regulation: dopamine and norepinephrine levels regulated by natural MAO activity\n\n"
            "Drug Interaction Cautions\n"
            "MAOIs are associated with life-threatening interactions with serotonergic drugs. These interaction risks have resolved at the one-month mark. However, always inform your prescriber and pharmacist of previous MAOI use when any new medication is prescribed.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.maoiMilestone90Title,
        description: l10n.maoiMilestone90Description,
        reference: "Wikipedia - Antidepressant discontinuation syndrome",
        link:
            "https://en.wikipedia.org/wiki/Antidepressant_discontinuation_syndrome",
        referenceDate: "May 2026",
        referenceContent:
            "Three Months After MAOIs: Brain Chemistry Normalising\n\n"
            "Three-Month Status\n"
            "Three months of natural monoamine regulation has allowed the brain to substantially readjust from the MAO-inhibited state.\n\n"
            "Receptor Supersensitivity Resolution\n"
            "Chronic MAOI treatment — by elevating synaptic levels of all monoamines — causes the brain's monoamine receptors to downregulate (become less sensitive) as a compensatory response. Now that MAOIs are no longer artificially elevating monoamine levels:\n"
            "• Receptor sensitivity is normalising across serotonin, norepinephrine, and dopamine systems\n"
            "• The brain's response to natural monoamine levels is recalibrating\n"
            "• Mood regulation, energy, and cognitive function are stabilising\n\n"
            "Emotional and Cognitive Recovery\n"
            "Most people at three months report meaningful improvements in mood stability, cognitive clarity, and emotional range — with the artificial amplification of monoamine signalling from MAO inhibition replaced by natural, self-regulated neurotransmission.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.maoiMilestone180Title,
        description: l10n.maoiMilestone180Description,
        reference:
            "PubMed - Long-term effects of antidepressant discontinuation",
        link: "https://pubmed.ncbi.nlm.nih.gov/31689556/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After MAOIs: Long-Term Recovery\n\n"
            "The Six-Month Assessment\n"
            "Six months represents a substantial period of natural monoamine system function after MAOI discontinuation.\n\n"
            "Brain Systems at Six Months\n"
            "• Serotonin system: receptor populations normalised and naturally regulated\n"
            "• Norepinephrine system: locus coeruleus activity and receptor sensitivity stabilised\n"
            "• Dopamine system: mesolimbic and prefrontal dopamine pathways functioning naturally\n"
            "• Phenethylamine pathways: trace amine signalling restored to natural levels\n\n"
            "The Significance of Phenethylamine Recovery\n"
            "MAOIs also inhibit the degradation of phenethylamine (PEA) — a neuromodulator associated with mood and energy. Natural PEA metabolism, restored at this stage, is an often-overlooked aspect of MAOI recovery that contributes to the subjective sense of emotional normalisation.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.maoiMilestone365Title,
        description: l10n.maoiMilestone365Description,
        reference:
            "PubMed - Antidepressant use and discontinuation in primary care",
        link: "https://pubmed.ncbi.nlm.nih.gov/24680484/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After MAOIs: Recovery Achieved\n\n"
            "One Year: A Remarkable Achievement\n"
            "Completing one year after MAOI discontinuation is a genuinely significant milestone. MAOIs are the most pharmacologically complex antidepressants in clinical use, with the broadest effects on neurotransmitter systems and the most demanding discontinuation process.\n\n"
            "What This Year Represents\n"
            "• Approximately 365 days of natural monoamine oxidase activity\n"
            "• Complete recovery of all monoamine receptor populations\n"
            "• Full restoration of natural serotonin, norepinephrine, dopamine, and phenethylamine regulation\n"
            "• Demonstrated capacity to maintain wellbeing without pharmacological MAO inhibition\n\n"
            "A Note on MAOIs\n"
            "MAOIs remain uniquely effective for certain treatment-resistant conditions and atypical depression. Successful discontinuation does not diminish their value as medications — it demonstrates the brain's capacity for recovery and the patient's ability to navigate an exceptionally demanding medical process.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.maoiPageTitle,
      storageKey: 'maoi',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.maoiHeaderStarted,
      headerNotStarted: l10n.maoiHeaderNotStarted,
      subtitleStarted: l10n.maoiSubtitleStarted,
      subtitleNotStarted: l10n.maoiSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
