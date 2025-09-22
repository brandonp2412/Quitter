import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:quitter/enjoying_page.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({super.key});

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class Changelog {
  final String name;
  final String content;
  final String created;

  Changelog({required this.name, required this.content, required this.created});
}

class _WhatsNewState extends State<WhatsNew> {
  List<Changelog> changelogs = [];
  List<Changelog> filtered = [];
  bool searching = false;
  FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();
    setChangelogs();
  }

  void setChangelogs() async {
    final logs = await getChangelogFiles(context);
    setState(() {
      changelogs = logs;
      filtered = logs;
    });
  }

  Future<List<Changelog>> getChangelogFiles(BuildContext context) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final manifestMap = json.decode(manifestContent) as Map<String, dynamic>;

    final files = manifestMap.keys
        .where((key) => key.startsWith('assets/changelogs/'))
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
      final content = await rootBundle.loadString(path);
      final filename = path.split('/').last.replaceAll('.txt', '');
      final timestamp = int.tryParse(filename);

      if (timestamp == null || filename.isEmpty) {
        print('Skipping invalid changelog file: $path');
        continue;
      }

      result.add(
        Changelog(
          name: filename,
          created: DateFormat.yMMMd().format(
            DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
          ),
          content: content,
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searching
            ? TextField(
                focusNode: node,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onChanged: (terms) => setState(() {
                  filtered = changelogs
                      .where(
                        (changelog) => changelog.content.toLowerCase().contains(
                          terms.toLowerCase(),
                        ),
                      )
                      .toList();
                }),
              )
            : const Text("What's new?"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searching = !searching;
              });
              if (searching)
                node.requestFocus();
              else
                setState(() {
                  filtered = changelogs;
                });
            },
            icon: Icon(searching ? Icons.close : Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(filtered[index].created),
            subtitle: Text(filtered[index].content),
          ),
          itemCount: filtered.length,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.favorite_outline),
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const EnjoyingPage())),
        label: const Text("Enjoying the app?"),
      ),
    );
  }
}
