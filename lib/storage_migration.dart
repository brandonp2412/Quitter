import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageMigration {
  static const String _migrationKey = 'migrated_to_secure_storage';

  static Future<void> migrateToSecureStorage() async {
    final secureStorage = const FlutterSecureStorage();

    // Check if already migrated
    final alreadyMigrated = await secureStorage.read(key: _migrationKey);
    if (alreadyMigrated == 'true') {
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    // Get all keys from SharedPreferences
    final allKeys = prefs.getKeys();

    // Migrate each key
    for (final key in allKeys) {
      final value = prefs.get(key);

      if (value is String) {
        await secureStorage.write(key: key, value: value);
      } else if (value is int) {
        await secureStorage.write(key: key, value: value.toString());
      } else if (value is double) {
        await secureStorage.write(key: key, value: value.toString());
      } else if (value is bool) {
        await secureStorage.write(key: key, value: value.toString());
      } else if (value is List<String>) {
        await secureStorage.write(key: key, value: jsonEncode(value));
      }
    }

    // Mark migration as complete
    await secureStorage.write(key: _migrationKey, value: 'true');

    // Optional: Clear SharedPreferences after migration
    await prefs.clear();
  }
}
