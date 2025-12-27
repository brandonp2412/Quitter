import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class AdderallPage extends StatelessWidget {
  final bool started;
  const AdderallPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.adderallMilestone1Title,
        description: l10n.adderallMilestone1Description,
        reference: "MedlinePlus - Substance use - amphetamines",
        link: "https://medlineplus.gov/ency/patientinstructions/000792.htm",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.adderallMilestone3Title,
        description: l10n.adderallMilestone3Description,
        reference: "NCBI Bookshelf - Withdrawal Management",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.adderallMilestone7Title,
        description: l10n.adderallMilestone7Description,
        reference: "BuzzRx - How Long Do Adderall Withdrawals Last?",
        link:
            "https://www.buzzrx.com/blog/how-long-do-adderall-withdrawals-last",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.adderallMilestone14Title,
        description: l10n.adderallMilestone14Description,
        reference: "WebMD - Adderall Withdrawal",
        link: "https://www.webmd.com/add-adhd/adderall-withdrawal",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.adderallMilestone30Title,
        description: l10n.adderallMilestone30Description,
        reference: "Drugs.com - How long does Adderall withdrawal last?",
        link:
            "https://www.drugs.com/medical-answers/long-adderall-withdrawal-3572393/",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.adderallMilestone60Title,
        description: l10n.adderallMilestone60Description,
        reference:
            "Orlando Recovery - Adderall Withdrawal Timeline: Symptoms, Duration and Treatment",
        link:
            "https://www.orlandorecovery.com/drug-addiction-resources/adderall/withdrawal-timeline/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.adderallMilestone90Title,
        description: l10n.adderallMilestone90Description,
        reference: "PMC - Clinical Management of Psychostimulant Withdrawal",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10069411/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.adderallMilestone180Title,
        description: l10n.adderallMilestone180Description,
        reference: "NCBI Bookshelf - Withdrawal Syndromes",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.adderallMilestone365Title,
        description: l10n.adderallMilestone365Description,
        reference:
            "Potential Adverse Effects of Amphetamine Treatment on Brain and Behavior: A Review",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC2670101",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.adderallPageTitle,
      storageKey: 'adderall',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.adderallHeaderStarted,
      headerNotStarted: l10n.adderallHeaderNotStarted,
      subtitleStarted: l10n.adderallSubtitleStarted,
      subtitleNotStarted: l10n.adderallSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
