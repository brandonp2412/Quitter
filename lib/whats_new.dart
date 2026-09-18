import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/logging.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({super.key});

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class Changelog {
  final String name;
  final String content;
  final DateTime created;

  Changelog({required this.name, required this.content, required this.created});
}

class _WhatsNewState extends State<WhatsNew> {
  List<Changelog> changelogs = [];
  String? _loadedLanguageCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageCode = Localizations.localeOf(context).languageCode;
    if (_loadedLanguageCode == languageCode) return;
    _loadedLanguageCode = languageCode;
    setChangelogs(languageCode);
  }

  void setChangelogs(String languageCode) async {
    try {
      final logs = await getChangelogFiles(context, languageCode);
      if (!mounted || _loadedLanguageCode != languageCode) return;
      setState(() => changelogs = logs);
      talker.info('Loaded ${logs.length} changelog entries');
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, 'Failed to load changelog entries');
    }
  }

  Future<Map<String, String>> _loadLocalizedChangelogs(
    AssetBundle bundle,
    String languageCode,
  ) async {
    if (languageCode == 'en') return const {};
    final contents = await bundle.loadString(
      'assets/changelogs/$languageCode.json',
    );
    final decoded = jsonDecode(contents) as Map<String, dynamic>;
    return decoded.map((key, value) => MapEntry(key, value as String));
  }

  Future<List<Changelog>> getChangelogFiles(
    BuildContext context,
    String languageCode,
  ) async {
    final bundle = DefaultAssetBundle.of(context);
    final manifest = await AssetManifest.loadFromAssetBundle(bundle);
    final localizedContent = await _loadLocalizedChangelogs(
      bundle,
      languageCode,
    );

    final files = manifest
        .listAssets()
        .where(
          (key) => key.startsWith('assets/changelogs/') && key.endsWith('.txt'),
        )
        .toList();

    files.sort((a, b) {
      final aName = a.split('/').last.split('.').first;
      final bName = b.split('/').last.split('.').first;
      final aNum = int.tryParse(aName) ?? 0;
      final bNum = int.tryParse(bName) ?? 0;
      return bNum.compareTo(aNum);
    });

    final result = <Changelog>[];
    for (final path in files) {
      try {
        final content = await bundle.loadString(path);
        final filename = path.split('/').last.replaceAll('.txt', '');
        final timestamp = int.tryParse(filename);
        if (timestamp == null || filename.isEmpty) {
          talker.warning('Skipping changelog asset with an invalid filename');
          continue;
        }
        if (content.trim().isEmpty) {
          talker.warning('Skipping empty changelog asset');
          continue;
        }
        result.add(
          Changelog(
            name: filename,
            created: DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
            content: localizedContent[filename] ?? content,
          ),
        );
      } catch (error, stackTrace) {
        talker.handle(error, stackTrace, 'Failed to load a changelog asset');
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.whatsNewTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            DateFormat.yMMMd(l10n.localeName).format(changelogs[index].created),
          ),
          subtitle: Text(changelogs[index].content),
        ),
        itemCount: changelogs.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.favorite_outline),
        onPressed: () async {
          const url = 'https://github.com/sponsors/brandonp2412';
          if (await canLaunchUrlString(url)) await launchUrlString(url);
        },
        label: Text(l10n.aboutDonate),
      ),
    );
  }
}
