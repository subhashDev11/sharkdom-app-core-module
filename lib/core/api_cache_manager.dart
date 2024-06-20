import 'package:app_core_module/core/api_routes.dart';
import 'package:app_core_module/core/hive_db_provider.dart';
import 'package:app_core_module/core/utils/network_service.dart';

enum FetchSource {
  cache,
  remote,
}

class APICacheManager {
  static Future<String?> getFromServerCache(String key,
      {FetchSource? fetchSource}) async {
    if ((fetchSource ?? FetchSource.cache) != FetchSource.remote) {
      String? fromCacheSource = await fromCache(key);
      if (fromCacheSource == null) {
        return fromCacheSource;
      } else {
        return await fromRemote(key);
      }
    } else {
      String? fromCacheSource = await fromRemote(key);
      if (fromCacheSource == null) {
        return fromCacheSource;
      } else {
        return await fromCache(key);
      }
    }
  }

  static Future<String?> fromCache(String key) async {
    var fromHive = await HiveDBProvider.get(key);
    if (fromHive != null && fromHive is String) {
      return fromHive;
    }
    return null;
  }

  static Future<String?> fromRemote(String key) async {
    var response = await NetworkService.get(
      url: "${APIRoutes.baseUrl}$key",
    );
    if (response.statusCode == 200) {
      await HiveDBProvider.create(key, response.body);
      return response.body;
    } else {
      return null;
    }
  }
}
