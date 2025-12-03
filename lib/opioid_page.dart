import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class OpioidPage extends StatelessWidget {
  final bool started;

  const OpioidPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.opioidMilestone1Title,
        description: l10n.opioidMilestone1Description,
        reference: "Medical News Today - Opioid Withdrawal Timeline",
        link:
            "https://www.medicalnewstoday.com/articles/opioid-withdrawal-timeline",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.opioidMilestone7Title,
        description: l10n.opioidMilestone7Description,
        reference: "Medical News Today - Opioid Withdrawal Timeline",
        link:
            "https://www.medicalnewstoday.com/articles/opioid-withdrawal-timeline",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.opioidMilestone14Title,
        description: l10n.opioidMilestone14Description,
        reference:
            "Bidirectional Relationship between Opioids and Disrupted Sleep: Putative Mechanisms",
        link:
            "https://molpharm.aspetjournals.org/article/S0026-895X(24)01026-5/fulltext",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.opioidMilestone30Title,
        description: l10n.opioidMilestone30Description,
        reference: "Mayo Clinic - How Opioid Use Disorder Occurs",
        link:
            "https://www.mayoclinic.org/diseases-conditions/prescription-drug-abuse/in-depth/how-opioid-addiction-occurs/art-20360372",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.opioidMilestone60Title,
        description: l10n.opioidMilestone60Description,
        reference: "Recovery Research Institute - The Brain in Recovery",
        link: "https://www.recoveryanswers.org/recovery-101/brain-in-recovery/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.opioidMilestone90Title,
        description: l10n.opioidMilestone90Description,
        reference: "Robert Alexander Center - Brain Recovery Timeline",
        link:
            "https://robertalexandercenter.com/brain-recovery-from-opioid-addiction-a-timeline/",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.opioidMilestone180Title,
        description: l10n.opioidMilestone180Description,
        reference:
            "Effects of opioid tolerance and withdrawal on the immune system",
        link: "https://pubmed.ncbi.nlm.nih.gov/18040801/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.opioidMilestone365Title,
        description: l10n.opioidMilestone365Description,
        reference:
            "Neuroplasticity of the extended amygdala in opioid withdrawal and prolonged opioid abstinence",
        link:
            "https://www.frontiersin.org/journals/pharmacology/articles/10.3389/fphar.2023.1253736/full",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.opioidMilestone730Title,
        description: l10n.opioidMilestone730Description,
        reference: "CDC - Treatment of Opioid Use Disorder",
        link:
            "https://www.cdc.gov/overdose-prevention/treatment/opioid-use-disorder.html",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.opioidsPageTitle,
      storageKey: 'opioids',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.opioidsHeaderStarted,
      headerNotStarted: l10n.opioidsHeaderNotStarted,
      subtitleStarted: l10n.opioidsSubtitleStarted,
      subtitleNotStarted: l10n.opioidsSubtitleNotStarted,
      infoBoxMessage: l10n.opioidsInfoBox,
      initialStarted: started,
    );
  }
}
