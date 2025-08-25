import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pkgInfo = PackageInfo.fromPlatform();
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
            child: SvgPicture.asset(
              'assets/icon/neurology.svg',
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Version"),
            subtitle: FutureBuilder(
              future: pkgInfo,
              builder: (context, snapshot) =>
                  Text(snapshot.data?.version ?? "1.0.0"),
            ),
            onTap: () async {
              const url =
                  'https://github.com/brandonp2412/Quitter/releases/latest';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("Author"),
            leading: const Icon(Icons.person),
            subtitle: const Text("Brandon Dick"),
            onTap: () async {
              const url = 'https://github.com/brandonp2412';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("License"),
            leading: const Icon(Icons.balance),
            subtitle: const Text("MIT"),
            onTap: () async {
              const url =
                  'https://github.com/brandonp2412/Quitter?tab=MIT-1-ov-file#readme';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("Donate"),
            leading: const Icon(Icons.favorite_outline),
            subtitle: const Text("Help support this project"),
            onTap: () async {
              const url = 'https://github.com/sponsors/brandonp2412';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("Source code"),
            leading: const Icon(Icons.code),
            onTap: () async {
              const url = 'https://github.com/brandonp2412/Quitter';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
        ],
      ),
    );
  }
}
