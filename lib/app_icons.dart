import 'package:flutter/material.dart';
import 'package:quitter/cupertino_icons.dart';
import 'package:quitter/material_icons.dart';

/// All selectable icons (curated Material + Cupertino), keyed by search name.
///
/// Cupertino entries are spread last so that, on a name collision, the
/// Cupertino glyph wins — preserving how previously stored icons resolve.
final Map<String, IconData> allIcons = {
  ...allMaterialIcons,
  ...allCupertinoIcons,
};

/// Reverse lookup from an icon to its stored name, used for serialization.
final Map<IconData, String> iconNames = {
  for (final entry in allIcons.entries) entry.value: entry.key,
};
