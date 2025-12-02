import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final info = PackageInfo.fromPlatform();
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.aboutPageTitle)),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: SvgPicture.asset(
                'assets/neurology.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(AppLocalizations.of(context)!.aboutVersion),
              subtitle: FutureBuilder(
                future: info,
                builder: (context, snap) => Text(snap.data?.version ?? "1.0.0"),
              ),
              onTap: () => launchUrlString(
                'https://github.com/brandonp2412/Quitter/releases/latest',
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.aboutAuthor),
              leading: const Icon(Icons.person),
              subtitle: Text(AppLocalizations.of(context)!.aboutAuthorName),
              onTap: () => launchUrlString('https://github.com/brandonp2412'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.aboutLicense),
              leading: const Icon(Icons.balance),
              subtitle: Text(AppLocalizations.of(context)!.aboutLicenseMIT),
              onTap: () => launchUrlString(
                'https://github.com/brandonp2412/Quitter?tab=MIT-1-ov-file#readme',
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.aboutDonate),
              leading: const Icon(Icons.favorite_outline),
              subtitle: Text(AppLocalizations.of(context)!.aboutDonateSubtitle),
              onTap: () =>
                  launchUrlString('https://github.com/sponsors/brandonp2412'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.aboutSourceCode),
              leading: const Icon(Icons.code),
              onTap: () =>
                  launchUrlString('https://github.com/brandonp2412/Quitter'),
            ),
          ],
        ),
      ),
    );
  }
}