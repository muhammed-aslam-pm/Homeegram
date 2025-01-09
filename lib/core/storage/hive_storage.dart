import 'package:hive/hive.dart';

class HiveStorage {
  late Box _box;

  Future<void> init() async {
    // await Hive.initFlutter();
    _box = await Hive.openBox('app_cache');
  }

  Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<dynamic> get(String key) async {
    return await _box.get(key);
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
