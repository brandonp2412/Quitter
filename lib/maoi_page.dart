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
        link: "https://pubmed.ncbi.nlm.nih.gov/2845711/",
        referenceDate: "May 2026",
        referenceContent:
            "MAOI Discontinuation: The Highest-Risk Phase\n\n"
            "Source: Dilsaver (1988), research on MAOI withdrawal reactions\n\n"
            "Critical Safety Warning\n"
            "MAOIs carry the most serious discontinuation risks of any antidepressant class. Abrupt cessation — particularly of phenelzine and tranylcypromine — can produce severe reactions including:\n"
            "• Severe anxiety and agitation\n"
            "• Pressured speech and restlessness\n"
            "• Sleeplessness or drowsiness\n"
            "• Hallucinations\n"
            "• Delirium and paranoid psychosis\n\n"
            "If you are experiencing these symptoms, seek immediate medical attention.\n\n"
            "How MAOIs Work\n"
            "MAOIs work by irreversibly binding to and disabling monoamine oxidase enzymes (MAO-A and MAO-B). These enzymes normally break down serotonin, norepinephrine, dopamine, and tyramine in the brain and gut. Because the enzyme itself is destroyed rather than just blocked, recovery depends on the body producing fresh enzyme rather than on how quickly the drug clears the bloodstream.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.maoiMilestone7Title,
        description: l10n.maoiMilestone7Description,
        reference: "StatPearls - Monoamine Oxidase Inhibitors (MAOIs)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK539848/",
        referenceDate: "July 2026",
        referenceContent:
            "One Week After MAOIs: MAO Enzyme Synthesis Underway\n\n"
            "Source: \"Monoamine Oxidase Inhibitors (MAOIs)\" (StatPearls, NCBI Bookshelf)\n\n"
            "The Enzyme Recovery Process\n"
            "Unlike SSRIs, SNRIs, and TCAs — which inhibit neurotransmitter reuptake reversibly — irreversible MAOIs (phenelzine, tranylcypromine) permanently destroy monoamine oxidase enzyme molecules. Clinical washout is therefore governed by how quickly the body can synthesise entirely new enzyme — about 2 weeks — rather than by how fast the drug itself clears the bloodstream.\n\n"
            "What's Happening at One Week\n"
            "• MAO-A and MAO-B enzyme synthesis is well underway, roughly midway through the ~2-week resynthesis window\n"
            "• The acute risk phase described on day 3 is passing, though close medical supervision remains important\n\n"
            "Dietary Cautions\n"
            "MAOI treatment requires a low-tyramine diet, since these enzymes normally break down tyramine and prevent it from triggering a hypertensive crisis. Guidance is to keep observing dietary restrictions through this resynthesis window — your prescriber will advise when it's safe to relax them.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.maoiMilestone14Title,
        description: l10n.maoiMilestone14Description,
        reference:
            "Fritz et al. (1983) - Tranylcypromine lowers human platelet MAO B activity but not concentration (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/6871302/",
        referenceDate: "July 2026",
        referenceContent:
            "Two Weeks After MAOIs: MAO Enzyme Activity Substantially Recovered\n\n"
            "Source: Fritz et al. (1983), Biological Psychiatry\n\n"
            "The Critical Two-Week Mark\n"
            "Two weeks is the standard clinical washout timeframe for MAO enzyme recovery after discontinuation of an irreversible MAOI like tranylcypromine or phenelzine. Studying tranylcypromine, this research found that platelet MAO-B catalytic activity — sharply reduced within a day of dosing — rebounds to normal within about two weeks, as the body replaces drug-affected platelets with fresh ones carrying active enzyme, even though total MAO-B protein levels never changed.\n\n"
            "MAO Enzyme Recovery\n"
            "• Platelet MAO-B activity has substantially recovered by this point\n"
            "• Brain MAO-A and MAO-B, which follow a broadly similar resynthesis timeline, are also largely restored\n"
            "• Normal tyramine metabolism is re-establishing — the MAOI dietary restrictions can typically be relaxed in consultation with your prescriber\n\n"
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
        reference: "StatPearls - Monoamine Oxidase Inhibitors (MAOIs)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK539848/",
        referenceDate: "July 2026",
        referenceContent:
            "One Month After MAOIs: Neurotransmitter Systems Rebalancing\n\n"
            "Source: \"Monoamine Oxidase Inhibitors (MAOIs)\" (StatPearls, NCBI Bookshelf)\n\n"
            "The One-Month Assessment\n"
            "One month after MAOI discontinuation is well past the roughly 2-week MAO enzyme resynthesis window described in this source, so by this point MAO enzyme activity has fully recovered and neurotransmitter systems are under entirely natural regulation.\n\n"
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
        reference:
            "Antidepressant Withdrawal Syndrome — Therapeutics Letter (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK598502/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months After MAOIs: Well Past Withdrawal\n\n"
            "Source: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\n"
            "Withdrawal Across the Antidepressant Classes\n"
            "This evidence review treats antidepressant withdrawal as a real phenomenon of tolerance and dependence — placing antidepressants 'alongside opiates and benzodiazepines.' Its detailed evidence centres on SSRIs and SNRIs, but withdrawal reactions are recognised across antidepressant classes, including after stopping an MAOI. Symptoms 'usually appear within a few days of stopping' and 'most… resolve within 2 weeks,' though some last longer.\n\n"
            "Where Three Months Sits\n"
            "By three months, the acute withdrawal phase is well behind the great majority of people, and the body has long readjusted to regulating monoamines without MAO inhibition.\n\n"
            "An Honest Note on 'Receptor Resensitisation'\n"
            "Confident claims that serotonin, norepinephrine, and dopamine receptors have all 'resensitised by three months' go beyond what the evidence pins down. What is dependable: the withdrawal phase has typically resolved by now, and for most people mood, energy, and emotional range are stabilising on natural, self-regulated neurotransmission.\n\n"
            "Withdrawal Versus Relapse\n"
            "The Letter stresses telling withdrawal apart from a genuine return of the underlying condition. If symptoms persist at three months, review them with your prescriber rather than assuming they are only withdrawal.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.maoiMilestone180Title,
        description: l10n.maoiMilestone180Description,
        reference:
            "Zwiebel & Viguera (2022) - Discontinuing antidepressants: Pearls and pitfalls (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/34983798/",
        referenceDate: "July 2026",
        referenceContent:
            "Six Months After MAOIs: Long-Term Recovery\n\n"
            "Source: Zwiebel & Viguera (2022), Cleveland Clinic Journal of Medicine\n\n"
            "The Six-Month Assessment\n"
            "This review explains that antidepressants work partly by causing monoamine receptors to downregulate over time, and that this downregulation requires weeks to months to reverse once the medication stops — a slower process than the roughly two-week MAO enzyme resynthesis itself.\n\n"
            "Where Six Months Sits\n"
            "Six months sits comfortably past that weeks-to-months receptor readjustment window for the great majority of people, alongside enzyme activity that fully normalised within the first month. An Honest Note: precise timelines for full serotonin, norepinephrine, and dopamine receptor resensitisation are not established with day-by-day certainty in the literature — what is dependable is that by six months, most people are functioning on natural, self-regulated neurotransmission.\n\n"
            "A Note on Phenethylamine\n"
            "MAOIs also inhibit the degradation of phenethylamine (PEA), a trace amine linked to mood and energy. Its metabolism is expected to normalise alongside general MAO enzyme recovery, though — as with receptor resensitisation — a precise PEA-specific timeline isn't established in the research literature.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.maoiMilestone365Title,
        description: l10n.maoiMilestone365Description,
        reference: "StatPearls - Monoamine Oxidase Inhibitors (MAOIs)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK539848/",
        referenceDate: "July 2026",
        referenceContent:
            "One Year After MAOIs: Recovery Achieved\n\n"
            "Source: \"Monoamine Oxidase Inhibitors (MAOIs)\" (StatPearls, NCBI Bookshelf)\n\n"
            "One Year: A Remarkable Achievement\n"
            "Completing one year after MAOI discontinuation is a genuinely significant milestone. MAOIs are among the most pharmacologically demanding antidepressants to come off, with an irreversible mechanism, a strict low-tyramine diet, and drug-interaction precautions that are unlike any other antidepressant class.\n\n"
            "What This Year Represents\n"
            "• A full year of natural, self-regulated monoamine oxidase activity, built on enzyme resynthesis that completed within the first month\n"
            "• Demonstrated capacity to maintain wellbeing without pharmacological MAO inhibition\n"
            "• A track record long enough to be confident the acute discontinuation risks of day 3 are firmly behind you\n\n"
            "A Note on MAOIs\n"
            "MAOIs remain uniquely effective for certain treatment-resistant conditions and atypical depression. Successful discontinuation does not diminish their value as medications — it demonstrates the brain's capacity for recovery and the patient's ability to navigate an exceptionally demanding medical process. One lasting precaution: continue to tell any new prescriber or anaesthetist about past MAOI use, since some drug-interaction risks are worth flagging indefinitely.",
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
