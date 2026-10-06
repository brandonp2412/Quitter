import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

/// Tricyclic antidepressant (TCA) discontinuation recovery timeline.
///
/// Always taper under medical supervision. TCAs (e.g. amitriptyline,
/// nortriptyline, imipramine, clomipramine) produce cholinergic rebound
/// on cessation, distinct from SSRI/SNRI discontinuation syndrome.
class TcaPage extends StatelessWidget {
  final bool started;
  const TcaPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 3,
        title: l10n.tcaMilestone3Title,
        description: l10n.tcaMilestone3Description,
        reference: "PubMed - Cholinergic rebound and tricyclic antidepressants",
        link: "https://pubmed.ncbi.nlm.nih.gov/6849449/",
        referenceDate: "May 2026",
        localizedReferenceContent: l10n.tcaReferenceDay3,
        referenceContent:
            "TCA Discontinuation: The First Days — Cholinergic Rebound\n\n"
            "Source: Dilsaver, Feinberg & Greden (1983), American Journal of Psychiatry — 'Antidepressant withdrawal symptoms treated with anticholinergic agents' (case report, 3 patients)\n\n"
            "Why TCAs Can Feel Different\n"
            "Many TCAs have anticholinergic effects alongside their serotonin and noradrenaline activity. In three published cases, withdrawal symptoms after abrupt discontinuation or rapid taper responded to anticholinergic treatment, leading the authors to implicate central cholinergic overdrive.\n\n"
            "Symptoms Reported with TCA Withdrawal\n"
            "• Nausea, vomiting, diarrhoea, abdominal pain, and loss of appetite\n"
            "• Insomnia or other sleep disturbance\n"
            "• Anxiety, agitation, and irritability\n"
            "• Headaches and other physical symptoms\n\n"
            "Timing Varies\n"
            "Withdrawal can hit early, especially after abrupt stopping or a fast taper. This three-patient case report supports cholinergic rebound as a mechanism. It was not designed to establish a fixed day-by-day timeline or compare individual TCAs by rebound severity.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.tcaMilestone7Title,
        description: l10n.tcaMilestone7Description,
        reference: "NHS - Stopping or coming off antidepressants",
        link: "https://www.nhs.uk/medicines/antidepressants/",
        referenceDate: "May 2026",
        localizedReferenceContent: l10n.tcaReferenceDay7,
        referenceContent:
            "One Week After TCAs: Through the First Stretch\n\n"
            "What One Week Means\n"
            "NHS guidance says antidepressant withdrawal usually begins within a few days and lasts a few weeks. Some people have severe withdrawal or symptoms that last months or longer.\n\n"
            "Symptoms That Can Still Be in Play\n"
            "• Headache and aching muscles\n"
            "• Nausea and sweating\n"
            "• A racing, fluttering, pounding, or skipping heartbeat\n"
            "• Dizziness or unsteadiness\n"
            "• Sleep problems, strange dreams, and tiredness\n"
            "• Restlessness, irritability, anxiety, low mood, or difficulty thinking\n\n"
            "Seven Days Is Progress\n"
            "A full week off a TCA is worth celebrating. NHS guidance describes withdrawal over days to weeks, sometimes longer, so symptoms involving heart rate, digestion, sleep, and other autonomic functions can settle on different timelines.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.tcaMilestone14Title,
        description: l10n.tcaMilestone14Description,
        reference:
            "PubMed - Warner et al. (2006), American Family Physician — 'Antidepressant discontinuation syndrome'",
        link: "https://pubmed.ncbi.nlm.nih.gov/16913164/",
        referenceDate: "Oct 2026",
        localizedReferenceContent: l10n.tcaReferenceDay14,
        referenceContent:
            "Two Weeks After TCAs: Acute Withdrawal Is Usually Easing\n\n"
            "The Usual Acute Window\n"
            "A clinical review of antidepressant discontinuation syndrome reports that typical symptoms — including flu-like symptoms, insomnia, nausea, imbalance, sensory disturbances, and hyperarousal — usually last one to two weeks.\n\n"
            "What Day 14 Means\n"
            "At two weeks, many people are reaching the far end of the classic acute discontinuation window. The first-wave symptoms are often easing substantially by this point.\n\n"
            "Fourteen Days TCA-Free\n"
            "That makes day 14 a real recovery marker: the acute withdrawal wave is often breaking, and you are moving beyond the roughest early stretch.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.tcaMilestone30Title,
        description: l10n.tcaMilestone30Description,
        reference:
            "PubMed - Warner et al. (2006), American Family Physician — 'Antidepressant discontinuation syndrome'",
        link: "https://pubmed.ncbi.nlm.nih.gov/16913164/",
        referenceDate: "Oct 2026",
        localizedReferenceContent: l10n.tcaReferenceDay30,
        referenceContent:
            "One Month After TCAs: Acute Withdrawal Usually Settled\n\n"
            "The Usual Acute Window\n"
            "Warner et al. report that antidepressant discontinuation symptoms are usually mild and last one to two weeks. TCAs are explicitly included; balance and movement problems can be especially characteristic after stopping a TCA.\n\n"
            "What Day 30 Means\n"
            "At one month, most people are well beyond that usual acute phase. Flu-like symptoms, nausea, imbalance, insomnia, sensory disturbances, and hyperarousal have usually eased or resolved.\n\n"
            "Thirty Days Strong\n"
            "One month TCA-free is a concrete recovery marker: the classic acute discontinuation window is usually behind you.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.tcaMilestone90Title,
        description: l10n.tcaMilestone90Description,
        reference:
            "PMC - Kamp et al. (2024), BMJ Mental Health — 'Beneficial and harmful effects of tricyclic antidepressants for adults with major depressive disorder'",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10806869/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.tcaReferenceDay90,
        referenceContent:
            "Three Months After TCAs: 90 Days Off Treatment\n\n"
            "What the Evidence Shows\n"
            "A 2024 systematic review and meta-analysis included 103 randomised trials with 10,590 participants. Compared with placebo, TCAs reduced depressive symptoms, but serious adverse events were more common (odds ratio 2.78; 95% CI 2.18–3.55; 35 trials). All results were at high risk of bias and the certainty of the evidence was low or very low. The trials measured outcomes only at the end of treatment, no later than 12 weeks after randomisation.\n\n"
            "What Three Months Means\n"
            "This evidence does not measure serotonin, noradrenaline, acetylcholine, histamine, memory, mood, energy, or motivation three months after stopping. It therefore cannot establish a universal three-month neurochemical or cognitive recovery deadline.\n\n"
            "Three months is still a huge milestone: 90 days without ongoing TCA treatment. That achievement stands on its own.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.tcaMilestone180Title,
        description: l10n.tcaMilestone180Description,
        reference:
            "PubMed - Hu et al. (2024), Psychiatry Research — 'Association between duration of antidepressant treatment for major depressive disorder and relapse rate after discontinuation: A meta-analysis'",
        link: "https://pubmed.ncbi.nlm.nih.gov/38733930/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.tcaReferenceDay180,
        referenceContent:
            "Six Months After Antidepressant Discontinuation: Most Stayed Relapse-Free\n\n"
            "Six-Month Relapse Checkpoint\n"
            "A 2024 meta-analysis pooled 35 randomized antidepressant discontinuation trials in people treated for major depressive disorder. The pooled relapse rate after discontinuation was 34.81% at six months—equivalent to about 65% remaining relapse-free at that checkpoint.\n\n"
            "A Real Long-Term Outcome\n"
            "The same analysis found a 45.12% relapse rate at 12 months. Six months is a meaningful stability checkpoint: most participants in the pooled trials had not relapsed by then.\n\n"
            "Protect the Progress\n"
            "If depressive symptoms start returning, contact your clinician early. Reaching six months is a huge stretch of stability worth protecting.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.tcaMilestone365Title,
        description: l10n.tcaMilestone365Description,
        reference:
            "PubMed - Hu et al. (2024), Psychiatry Research — 'Association between duration of antidepressant treatment for major depressive disorder and relapse rate after discontinuation: A meta-analysis'",
        link: "https://pubmed.ncbi.nlm.nih.gov/38733930/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.tcaReferenceDay365,
        referenceContent:
            "One Year After Antidepressant Discontinuation: Most Stayed Relapse-Free\n\n"
            "Twelve-Month Relapse Checkpoint\n"
            "A 2024 meta-analysis pooled 35 randomized antidepressant discontinuation trials in people treated for major depressive disorder. The pooled relapse rate after discontinuation was 45.12% at 12 months—equivalent to about 55% remaining relapse-free at the one-year checkpoint.\n\n"
            "A Full Year of Stability\n"
            "The same analysis found a 34.81% relapse rate at six months. By 12 months, most participants in the pooled trials still had not relapsed. One full year without relapse is a major long-term stability milestone.\n\n"
            "Protect the Progress\n"
            "If depressive symptoms start returning, contact your clinician early. Reaching a full year is a substantial achievement worth protecting.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.tcaPageTitle,
      storageKey: 'tca',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.tcaHeaderStarted,
      headerNotStarted: l10n.tcaHeaderNotStarted,
      subtitleStarted: l10n.tcaSubtitleStarted,
      subtitleNotStarted: l10n.tcaSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
