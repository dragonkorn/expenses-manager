import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  StorageManager();

  final storage = const FlutterSecureStorage();

  Future<String> read(String key) async {
    // String value = await storage.read(key: key);
    // return value;
    String? value = await storage.read(key: key);
    if (value != null) {
      return value;
    } else {
      return '';
    }
  }

  // // Read all values
  // Map<String, String> allValues = await storage.readAll();

  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
