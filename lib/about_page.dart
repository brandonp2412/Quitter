import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final info = PackageInfo.fromPlatform();
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
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
              title: const Text("Version"),
              subtitle: FutureBuilder(
                future: info,
                builder: (context, snap) => Text(snap.data?.version ?? "1.0.0"),
              ),
              onTap: () => launchUrlString(
                'https://github.com/brandonp2412/Quitter/releases/latest',
              ),
            ),
            ListTile(
              title: const Text("Author"),
              leading: const Icon(Icons.person),
              subtitle: const Text("Brandon Dick"),
              onTap: () => launchUrlString('https://github.com/brandonp2412'),
            ),
            ListTile(
              title: const Text("License"),
              leading: const Icon(Icons.balance),
              subtitle: const Text("MIT"),
              onTap: () => launchUrlString(
                'https://github.com/brandonp2412/Quitter?tab=MIT-1-ov-file#readme',
              ),
            ),
            ListTile(
              title: const Text("Donate"),
              leading: const Icon(Icons.favorite_outline),
              subtitle: const Text("Help support this project"),
              onTap: () =>
                  launchUrlString('https://github.com/sponsors/brandonp2412'),
            ),
            ListTile(
              title: const Text("Source code"),
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
