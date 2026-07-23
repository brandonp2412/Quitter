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
        link: "https://www.nhs.uk/medicines/antidepressants/",
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
            "Davies & Read — Antidepressant Withdrawal Systematic Review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30292574/",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After SSRIs: Physical Symptoms Resolving\n\n"
            "Source: Davies & Read (2019), Addictive Behaviors — 'A systematic review into the incidence, severity and duration of antidepressant withdrawal effects'\n\n"
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
        reference:
            "Haddad (2001) - Antidepressant Discontinuation Syndromes (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/11347722/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After SSRIs: Stabilisation\n\n"
            "Source: Haddad PM (2001), Drug Safety — 'Antidepressant Discontinuation Syndromes'\n\n"
            "The Stabilisation Phase\n"
            "This review describes discontinuation onset as rapid, typically within days of stopping or reducing an antidepressant, and notes that most reactions are mild and short-lived, resolving without specific treatment. One month represents the transition from that acute window to stabilisation; for most people who completed a gradual taper, the acute discontinuation symptoms are now largely resolved.\n\n"
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
        reference:
            "Antidepressant Withdrawal Syndrome — Therapeutics Letter (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK598502/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months After SSRIs: Well Past Withdrawal\n\n"
            "Source: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\n"
            "Where Three Months Sits\n"
            "This evidence review notes that antidepressant withdrawal symptoms 'usually appear within a few days of stopping, or dose reduction,' and that 'most antidepressant withdrawal symptoms resolve within 2 weeks' — though severe cases can last weeks to months. By three months, the acute withdrawal phase is well behind the great majority of people.\n\n"
            "Why SSRIs Vary\n"
            "Withdrawal is more likely with shorter half-life SSRIs (such as paroxetine) than with long half-life ones (fluoxetine). The Letter is candid that withdrawal reactions can be substantial — two systematic reviews found them 'very similar' to those from benzodiazepines — and occur in at least a third of people who stop.\n\n"
            "An Honest Note on 'Receptor Recovery'\n"
            "You may see confident claims that serotonin receptors 'fully resensitise by 2–3 months.' The robust evidence is about the withdrawal syndrome and its timing, not a precise receptor-recovery clock. What's dependable: by three months the withdrawal phase has typically resolved, and many people notice the emotional blunting and sexual side effects some experience on SSRIs ease after stopping.\n\n"
            "If Symptoms Linger\n"
            "The Letter advises distinguishing withdrawal from a genuine return of the underlying condition. If low mood or anxiety persists at three months, that's worth reviewing with your prescriber rather than assuming it's 'just withdrawal.'",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.ssriMilestone180Title,
        description: l10n.ssriMilestone180Description,
        reference:
            "Antidepressant Withdrawal Syndrome — Therapeutics Letter (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK598502/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After SSRIs: A Grounded View\n\n"
            "Source: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\n"
            "What's Well-Established by Six Months\n"
            "This review notes that even severe, prolonged withdrawal symptoms typically last weeks to months rather than indefinitely — so by six months the acute withdrawal syndrome has, for the great majority of people, clearly resolved.\n\n"
            "Being Honest About the Rest\n"
            "Confident claims that serotonin 5-HT1A receptor sensitivity or sleep architecture 'fully normalise' by a specific date go beyond what this evidence base actually measures. Sexual side effects usually improve after stopping an SSRI, but a minority of people report persistent sexual dysfunction that can last well beyond six months — a recognised possibility worth raising with a prescriber if it applies to you.\n\n"
            "What People Commonly Report\n"
            "• A wider emotional range compared with being on medication\n"
            "• Improved sleep and energy for most\n"
            "• Continued gradual improvement, though the pace varies widely between individuals",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.ssriMilestone365Title,
        description: l10n.ssriMilestone365Description,
        reference:
            "Duffy et al. (2021) - ANTLER RCT, Antidepressant Discontinuation in Primary Care (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/34842135/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After SSRIs: An Honest Look at the Evidence\n\n"
            "Source: Duffy et al. (2021), Health Technology Assessment — the ANTLER trial\n\n"
            "What This Trial Actually Found\n"
            "ANTLER followed long-term antidepressant users in UK primary care who either stayed on medication or discontinued. Over the following year, 56% of those who discontinued relapsed, compared with 39% of those who stayed on medication — roughly double the risk — and the discontinuation group reported somewhat lower quality of life on average.\n\n"
            "The Fuller Picture\n"
            "Despite the higher relapse rate, a substantial share of people who discontinued did not relapse and remained well without medication. About a third of those who discontinued eventually restarted their antidepressant — a reasonable clinical choice, not a failure.\n\n"
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
