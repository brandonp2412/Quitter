import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final desktop = MediaQuery.sizeOf(context).width >= 1000;
    final info = PackageInfo.fromPlatform();
    final tiles = <Widget>[
      ListTile(
        leading: const Icon(Icons.info_outline),
        title: Text(l10n.aboutVersion),
        subtitle: FutureBuilder<PackageInfo>(
          future: info,
          builder: (context, snap) => Text(snap.data?.version ?? '1.0.0'),
        ),
        trailing: const Icon(Icons.open_in_new, size: 18),
        onTap: () => launchUrlString(
          'https://github.com/brandonp2412/Quitter/releases/latest',
        ),
      ),
      ListTile(
        leading: const Icon(Icons.person_outline),
        title: Text(l10n.aboutAuthor),
        subtitle: Text(l10n.aboutAuthorName),
        trailing: const Icon(Icons.open_in_new, size: 18),
        onTap: () => launchUrlString('https://github.com/brandonp2412'),
      ),
      ListTile(
        leading: const Icon(Icons.balance_outlined),
        title: Text(l10n.aboutLicense),
        subtitle: Text(l10n.aboutLicenseMIT),
        trailing: const Icon(Icons.open_in_new, size: 18),
        onTap: () => launchUrlString(
          'https://github.com/brandonp2412/Quitter?tab=MIT-1-ov-file#readme',
        ),
      ),
      ListTile(
        leading: const Icon(Icons.favorite_outline),
        title: Text(l10n.aboutDonate),
        subtitle: Text(l10n.aboutDonateSubtitle),
        trailing: const Icon(Icons.open_in_new, size: 18),
        onTap: () =>
            launchUrlString('https://github.com/sponsors/brandonp2412'),
      ),
      ListTile(
        leading: const Icon(Icons.code),
        title: Text(l10n.aboutSourceCode),
        trailing: const Icon(Icons.open_in_new, size: 18),
        onTap: () => launchUrlString('https://github.com/brandonp2412/Quitter'),
      ),
    ];

    Widget logo(double size) => SvgPicture.asset(
      'assets/neurology.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(colors.onSurface, BlendMode.srcIn),
    );

    return Scaffold(
      appBar: desktop ? null : AppBar(title: Text(l10n.aboutPageTitle)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: ListView(
              padding: EdgeInsets.all(desktop ? 32 : 16),
              children: [
                if (desktop) ...[
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton.icon(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const Icon(Icons.arrow_back),
                      label: Text(l10n.tabSettings),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Row(
                        children: [
                          logo(88),
                          const SizedBox(width: 28),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.appTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  l10n.aboutPageTitle,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: colors.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final cardWidth = (constraints.maxWidth - 16) / 2;
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          for (final tile in tiles)
                            SizedBox(
                              width: cardWidth,
                              child: Card.outlined(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 8,
                                  ),
                                  child: tile,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: logo(100),
                  ),
                  ...tiles,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
