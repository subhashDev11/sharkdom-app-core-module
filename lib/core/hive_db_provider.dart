import 'dart:async';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'utils/app_logger.dart';

class HiveConstants {
  static String get configurableDBName => "configurable_data_db";
}

class HiveDBProvider {
  static LazyBox? _lazyBox;

  static Future<void> initializeLazy(String dbName) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    try {
      _lazyBox = await Hive.openLazyBox(
        dbName,
      );
    } catch (e) {
      AppLogger.e('Error: $e');
    }
  }

  static Future<void> clearStorage(String dbName) async {
    try {
      await Hive.box(dbName).clear();
    } catch (e) {
      AppLogger.e("Failed to clear hive data - $e");
    }
  }

  static Future<void> close() async {
    await _lazyBox?.close();
  }

  static Future<void> create(String key, dynamic value) async {
    //AppLogger.i("Putting hive data key - $key");
    await _lazyBox?.put(key, value);
  }

  static dynamic get(String key) async {
    //AppLogger.i("Getting hive data key - $key");
    final value = await _lazyBox?.get(key);
    if (value != null && value is Map) {
      return dynamicMapToMap(value);
    }
    return value;
  }

  static Future<void> update(String key, dynamic value) async {
    await _lazyBox?.put(key, value);
  }

  static Future<void> delete(String key) async {
    await _lazyBox?.delete(key);
  }

  static Map<String, dynamic> dynamicMapToMap(Map<dynamic, dynamic> data) {
    List<dynamic> convertList(List<dynamic> src) {
      List<dynamic> dst = [];
      for (int i = 0; i < src.length; ++i) {
        if (src[i] is Map<dynamic, dynamic>) {
          dst.add(dynamicMapToMap(src[i]));
        } else if (src[i] is List<dynamic>) {
          dst.add(convertList(src[i]));
        } else {
          dst.add(src[i]);
        }
      }
      return dst;
    }

    Map<String, dynamic> retVal = {};
    for (dynamic key in data.keys) {
      if (data[key] is Map<dynamic, dynamic>) {
        retVal[key.toString()] = dynamicMapToMap(data[key]);
      } else if (data[key] is List<dynamic>) {
        retVal[key.toString()] = convertList(data[key]);
      } else {
        retVal[key.toString()] = data[key];
      }
    }
    return retVal;
  }
}
