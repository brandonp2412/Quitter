import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SteroidsPage extends StatelessWidget {
  final bool started;

  const SteroidsPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.steroidsMilestone1Title,
        description: l10n.steroidsMilestone1Description,
        reference:
            "Common symptoms associated with usage and cessation of anabolic androgenic steroids in men (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35999138/",
        referenceDate: "July 2026",
        localizedReferenceContent: l10n.steroidsReferenceDay1,
        referenceContent:
            "Stopping Anabolic Steroids: The First Days\n\nSource: \"Common symptoms associated with usage and cessation of anabolic androgenic steroids in men,\" Best Practice & Research Clinical Endocrinology & Metabolism (2022)\n\nThe Acute Phase\nThis review describes AAS withdrawal as unfolding in two phases. The first, driven by sympathetic nervous system activation rather than hormone levels, appears within 1–2 days of stopping and can include:\n• Headache\n• Tremors\n• Palpitations\n• Nausea\n\nWhy Symptoms Appear\nAnabolic steroids also suppress the body's own testosterone production — the brain detects the steroids and shuts off the hormonal signals that normally drive it. That suppression persists after stopping, setting up the second, longer-lasting phase of withdrawal described in later milestones.\n\nA Safety Note\nDepression can emerge during steroid withdrawal and become serious. Seek medical care, and urgent help for any thoughts of self-harm. Clinicians often guide recovery; some use medications to support it.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.steroidsMilestone14Title,
        description: l10n.steroidsMilestone14Description,
        reference:
            "Common symptoms associated with usage and cessation of anabolic androgenic steroids in men (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35999138/",
        referenceDate: "July 2026",
        localizedReferenceContent: l10n.steroidsReferenceDay14,
        referenceContent:
            "Two Weeks Off Anabolic Steroids\n\nSource: \"Common symptoms associated with usage and cessation of anabolic androgenic steroids in men,\" Best Practice & Research Clinical Endocrinology & Metabolism (2022)\n\nThe Chronic Phase Sets In\nBy two weeks, the brief sympathetic symptoms of the first days have typically passed, and the review's second phase — driven by ongoing testosterone deficiency — is more prominent:\n• Fatigue and low mood\n• Muscle aches (myalgia)\n• Reduced libido\n• Insomnia and cravings\n\nStill at Low Ebb\nNatural testosterone production takes far longer than two weeks to reset, so this phase is expected rather than a sign something is wrong.\n\nA Known Trap\nSome men return to using specifically to escape this gap — a cycle that resets the recovery clock rather than ending it. Support from a doctor or counsellor helps bridge this phase rather than medicating it with more steroids.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.steroidsMilestone30Title,
        description: l10n.steroidsMilestone30Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/37855241/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.steroidsReferenceDay30,
        referenceContent:
            "One Month Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nRecovery Begins\nAfter stopping, the hormone signals that tell the testes to make testosterone start switching back on. Research puts much of this recovery in the three-to-six-month range, so at one month the process is already underway.\n\nWhat to Expect\nLow mood, libido, and energy commonly persist while hormones climb back. Recovery depends on age and how heavy and prolonged the use was.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.steroidsMilestone90Title,
        description: l10n.steroidsMilestone90Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/37855241/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.steroidsReferenceDay90,
        referenceContent:
            "Three Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nA Good Time for a Blood Test\nBy three months, the hormone system has had time to show meaningful recovery. This is a useful point to ask your GP to check testosterone and the hormones that control it.\n\nWhat to Expect\nFor many men at three months, levels are climbing but not fully normalised. Mood and libido often improve before testosterone fully catches up. Testicle size and sperm production recover more slowly and can keep improving over the following year. Breast tissue growth (gynaecomastia), where it occurred, is unlikely to reverse without specific treatment.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.steroidsMilestone180Title,
        description: l10n.steroidsMilestone180Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/37855241/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.steroidsReferenceDay180,
        referenceContent:
            "Six Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nWhere the Evidence Points\nThe review reports that LH and FSH — the hormones that tell the testes to make testosterone — usually recover within about three to six months. By six months, testosterone itself is well along its recovery path too.\n\nIf You're Not There Yet\nIf low-testosterone symptoms are still present at six months, an endocrinologist can check what is happening and discuss treatment rather than leaving you to wait.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.steroidsMilestone365Title,
        description: l10n.steroidsMilestone365Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10620455/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.steroidsReferenceDay365,
        referenceContent:
            "One Year Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" Endocrine Connections (2023)\n\nA Year Free\nRecovery after AAS is highly variable. The review reports near-complete testosterone recovery over months, gonadotropin recovery over about three to six months, and recovery of testicular size and sperm production over months to years. Psychological recovery is less predictable.\n\nOne Year Still Counts\nA full year steroid-free is a huge milestone, not a universal hormone-normalisation deadline. If low-testosterone symptoms are still present, specialist assessment can check where your recovery stands.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.steroidsMilestone730Title,
        description: l10n.steroidsMilestone730Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10620455/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.steroidsReferenceDay730,
        referenceContent:
            "Two Years Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" Endocrine Connections (2023)\n\nTwo Years Strong\nTwo years steroid-free is a long stretch without re-exposure. Recovery varies with factors including age and the extent of prior androgen use; there is no universal two-year hormone finish line.\n\nThe Long Game\nThe review reports testosterone recovery over months and gonadotropin recovery over about three to six months, while testicular size and sperm production may keep recovering over months to years. Persistent low-testosterone symptoms deserve specialist assessment — not another steroid cycle.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.steroidsPageTitle,
      storageKey: 'steroids',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.steroidsHeaderStarted,
      headerNotStarted: l10n.steroidsHeaderNotStarted,
      subtitleStarted: l10n.steroidsSubtitleStarted,
      subtitleNotStarted: l10n.steroidsSubtitleNotStarted,
      infoBoxMessage: l10n.steroidsInfoBox,
      initialStarted: started,
    );
  }
}
