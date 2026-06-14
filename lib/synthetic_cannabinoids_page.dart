import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/marijuana_page.dart';

class SyntheticCannabinoidsPage extends StatelessWidget {
  final bool started;

  const SyntheticCannabinoidsPage({super.key, required this.started});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return MarijuanaPage(
      started: started,
      storageKey: 'synthetic_cannabinoids',
      pageTitle: l10n.synthetic_cannabinoidsPageTitle,
      headerStarted: l10n.synthetic_cannabinoidsHeaderStarted,
      headerNotStarted: l10n.synthetic_cannabinoidsHeaderNotStarted,
      subtitleStarted: l10n.synthetic_cannabinoidsSubtitleStarted,
      subtitleNotStarted: l10n.synthetic_cannabinoidsSubtitleNotStarted,
      infoBoxMessage: l10n.synthetic_cannabinoidsInfoBox,
    );
  }
}
