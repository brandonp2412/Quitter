import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/logging.dart';
import 'package:quitter/locale_utils.dart';
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
  static const _pageSize = 10;
  List<Changelog> changelogs = [];
  List<String> _changelogFiles = [];
  int _page = 0;
  bool _isLoading = true;
  String? _loadedLanguageCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localeKey = localePreferenceValue(Localizations.localeOf(context));
    if (_loadedLanguageCode == localeKey) return;
    _loadedLanguageCode = localeKey;
    setChangelogs(localeKey);
  }

  void setChangelogs(String languageCode) async {
    try {
      final files = await _getChangelogFiles(context);
      if (!mounted || _loadedLanguageCode != languageCode) return;
      setState(() {
        _changelogFiles = files;
        _page = 0;
        _isLoading = true;
      });
      final logs = await _loadChangelogPage(context, files, languageCode, 0);
      if (!mounted || _loadedLanguageCode != languageCode) return;
      setState(() => changelogs = logs);
      setState(() => _isLoading = false);
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

  Future<List<String>> _getChangelogFiles(BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final manifest = await AssetManifest.loadFromAssetBundle(bundle);
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
    return files;
  }

  Future<List<Changelog>> _loadChangelogPage(
    BuildContext context,
    List<String> files,
    String languageCode,
    int page,
  ) async {
    final bundle = DefaultAssetBundle.of(context);
    final localizedContent = await _loadLocalizedChangelogs(
      bundle,
      languageCode,
    );
    final pageFiles = files.skip(page * _pageSize).take(_pageSize);
    final result = <Changelog>[];
    for (final path in pageFiles) {
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

  Future<void> _setPage(int page) async {
    final pageCount = (_changelogFiles.length / _pageSize).ceil();
    if (page < 0 || page >= pageCount) return;
    setState(() {
      _page = page;
      _isLoading = true;
    });
    final languageCode = _loadedLanguageCode;
    if (languageCode == null) return;
    final logs = await _loadChangelogPage(
      context,
      _changelogFiles,
      languageCode,
      page,
    );
    if (!mounted || _page != page || _loadedLanguageCode != languageCode) {
      return;
    }
    setState(() {
      changelogs = logs;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.whatsNewTitle)),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        DateFormat.yMMMd(
                          l10n.localeName,
                        ).format(changelogs[index].created),
                      ),
                      subtitle: Text(changelogs[index].content),
                    ),
                    itemCount: changelogs.length,
                  ),
          ),
          if (_changelogFiles.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _page > 0 ? () => _setPage(_page - 1) : null,
                    icon: const Icon(Icons.chevron_left),
                    tooltip: MaterialLocalizations.of(
                      context,
                    ).previousPageTooltip,
                  ),
                  Text(
                    '${_page + 1} / ${(_changelogFiles.length / _pageSize).ceil()}',
                  ),
                  IconButton(
                    onPressed:
                        _page + 1 < (_changelogFiles.length / _pageSize).ceil()
                        ? () => _setPage(_page + 1)
                        : null,
                    icon: const Icon(Icons.chevron_right),
                    tooltip: MaterialLocalizations.of(context).nextPageTooltip,
                  ),
                ],
              ),
            ),
        ],
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
