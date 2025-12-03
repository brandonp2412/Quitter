import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class NicotinePouchesPage extends StatelessWidget {
  final bool started;

  const NicotinePouchesPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.nicotinePouchesMilestone1Title,
        description: l10n.nicotinePouchesMilestone1Description,
        reference:
            "Tomassini, S., Cuoghi, V., Catalani, E., Casini, G., & Bigiani, A. (2007) - Long term effects of nicotine on rat fungiform taste buds",
        link: "https://pubmed.ncbi.nlm.nih.gov/17560039/",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.nicotinePouchesMilestone3Title,
        description: l10n.nicotinePouchesMilestone3Description,
        reference:
            "Ian McLaughlin, John A Dani, Mariella De Biasi - Nicotine withdrawal",
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.nicotinePouchesMilestone7Title,
        description: l10n.nicotinePouchesMilestone7Description,
        reference:
            "Arvind Muthukrishnan, Saman Warnakulasuriya - Oral health consequences of smokeless tobacco use",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6172921/",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.nicotinePouchesMilestone14Title,
        description: l10n.nicotinePouchesMilestone14Description,
        reference:
            "Cardiovascular Toxicity of Nicotine: Implications for Electronic Cigarette Use",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4958544/",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.nicotinePouchesMilestone30Title,
        description: l10n.nicotinePouchesMilestone30Description,
        reference: "Mayo Clinic - Resisting Tobacco Cravings",
        link:
            "https://www.mayoclinic.org/diseases-conditions/nicotine-dependence/in-depth/nicotine-craving/art-20045454",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.nicotinePouchesMilestone60Title,
        description: l10n.nicotinePouchesMilestone60Description,
        reference: "Sleep foundation - Nicotine and Sleep",
        link:
            "https://www.sleepfoundation.org/physical-health/nicotine-and-sleep",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.nicotinePouchesMilestone90Title,
        description: l10n.nicotinePouchesMilestone90Description,
        reference: "Smokefree Veterans - How to Quit Dipping",
        link:
            "https://veterans.smokefree.gov/quit-dip-vapes/smokeless-tobacco/how-to-quit",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.nicotinePouchesMilestone180Title,
        description: l10n.nicotinePouchesMilestone180Description,
        reference: "CDC - Benefits of Quitting Smoking",
        link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.nicotinePouchesMilestone365Title,
        description: l10n.nicotinePouchesMilestone365Description,
        reference: "CDC - Nicotine Pouches Health Information",
        link: "https://www.cdc.gov/tobacco/nicotine-pouches/index.html",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.nicotinePouchesPageTitle,
      storageKey: 'nicotine_pouches',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.nicotinePouchesHeaderStarted,
      headerNotStarted: l10n.nicotinePouchesHeaderNotStarted,
      subtitleStarted: l10n.nicotinePouchesSubtitleStarted,
      subtitleNotStarted: l10n.nicotinePouchesSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
