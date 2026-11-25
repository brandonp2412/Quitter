import 'package:quitter/adderall_page.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/entry_page.dart';
import 'package:quitter/ghb_page.dart';
import 'package:quitter/inhalants_page.dart';
import 'package:quitter/ketamine_page.dart';
import 'package:quitter/kratom_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/maoi_page.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/mdma_page.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/nitrous_oxide_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/snri_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/ssri_page.dart';
import 'package:quitter/steroids_page.dart';
import 'package:quitter/synthetic_cannabinoids_page.dart';
import 'package:quitter/tca_page.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/vaping_page.dart';

List<QuitMilestone> milestonesForJourney(
  AppLocalizations l10n,
  String? presetKey,
) {
  return switch (presetKey) {
    'adderall' => AdderallPage.milestonesFor(l10n),
    'alcohol' => AlcoholPage.milestonesFor(l10n),
    'benzos' => BenzodiazepinePage.milestonesFor(l10n),
    'cocaine' => CocainePage.milestonesFor(l10n),
    null => EntryPage.milestones(l10n),
    'ghb' || 'gabapentinoids' => GhbPage.milestonesFor(l10n),
    'inhalants' => InhalantsPage.milestonesFor(l10n),
    'ketamine' => KetaminePage.milestonesFor(l10n),
    'kratom' => KratomPage.milestonesFor(l10n),
    'maoi' => MaoiPage.milestonesFor(l10n),
    'marijuana' => MarijuanaPage.milestonesFor(l10n),
    'mdma' => MdmaPage.milestonesFor(l10n),
    'meth' => MethPage.milestonesFor(l10n),
    'nitrous_oxide' => NitrousOxidePage.milestonesFor(l10n),
    'opioids' || 'heroin' || 'fentanyl' => OpioidPage.milestonesFor(l10n),
    'pornography' => PornographyPage.milestonesFor(l10n),
    'nicotine_pouches' => const NicotinePouchesPage(
      started: true,
    ).milestonesFor(l10n),
    'smoking' ||
    'smokeless_tobacco' => const SmokingPage(started: true).milestonesFor(l10n),
    'snri' => SnriPage.milestonesFor(l10n),
    'social_media' => SocialMediaPage.milestonesFor(l10n),
    'ssri' => SsriPage.milestonesFor(l10n),
    'steroids' => SteroidsPage.milestonesFor(l10n),
    'synthetic_cannabinoids' => SyntheticCannabinoidsPage.milestonesFor(l10n),
    'tca' => TcaPage.milestonesFor(l10n),
    'vaping' => VapingPage.milestonesFor(l10n),
    _ => const [],
  };
}

Iterable<({int day, DateTime date})> upcomingMilestoneDates({
  required DateTime quitDate,
  required DateTime now,
  required int at,
  required Iterable<int> predefinedDays,
}) sync* {
  final currentDay = daysCeilAt(quitDate.toIso8601String(), now);
  final firstDay = currentDay > 1 ? currentDay : 1;
  final lastDay = firstDay + 5 * 365;
  final days = {
    ...predefinedDays.where((day) => day >= firstDay),
    for (var day = ((firstDay + 99) ~/ 100) * 100; day <= lastDay; day += 100)
      if (day >= 400) day,
    for (var day = ((firstDay + 364) ~/ 365) * 365; day <= lastDay; day += 365)
      day,
  }.toList()..sort();
  for (final day in days) {
    final date = DateTime(
      quitDate.year,
      quitDate.month,
      quitDate.day + day - 1,
      at ~/ 60,
      at % 60,
    );
    if (date.isAfter(now) && !date.isBefore(quitDate))
      yield (day: day, date: date);
  }
}
