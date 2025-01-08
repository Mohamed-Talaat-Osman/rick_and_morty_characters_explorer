import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'cache_key.dart';

class Cache {
  // Private constructor
  Cache._privateConstructor();

  // Static final instance
  static final Cache _instance = Cache._privateConstructor();

  // Static method
  static Cache get instance {
    return _instance;
  }

  store(String value, CacheKey key) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: key.value, value: value);
  }

  Future<String> retrive(CacheKey key) async {
    const storage = FlutterSecureStorage();
    String? data = await storage.read(key: key.value);
    return data ?? "";
  }

  delete(CacheKey key) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: key.value);
  }
}


