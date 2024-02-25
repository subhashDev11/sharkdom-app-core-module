import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_core_module/core/hive_db_provider.dart';
import 'package:app_core_module/core/utils/app_logger.dart';

class AuthTokenService {
  String getStoreKey = "token_data";

  Future<void> clearTokenState() async {
    Map<String, dynamic> updatedData = ({
      "updateTime": null,
      "token": null,
    });
    await HiveDBProvider.create(getStoreKey, updatedData);
  }

  Future<String> getToken() async {
    String returnToken = "";
    if (FirebaseAuth.instance.currentUser == null) {
      return returnToken;
    }
    Map<String, dynamic>? storageData = await HiveDBProvider.get(getStoreKey);
    if (storageData != null &&
        storageData['updateTime'] != null &&
        storageData['token'] != null) {
      int storedTimestamp = storageData['updateTime'];
      String token = storageData['token'];
      int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
      if (currentTimestamp - storedTimestamp > 59 * 60 * 1000) {
        String? token = await refreshFAuthToken();
        returnToken = token ?? "";
      } else {
        returnToken = token;
      }
    } else {
      returnToken = (await refreshFAuthToken() ?? "");
    }
    AppLogger.i("Auth Token - $returnToken");
    return returnToken;
  }

  Future<String?> refreshFAuthToken() async {
    Completer<String?> completer = Completer();
    FirebaseAuth.instance.currentUser?.getIdToken().then((value) async {
      int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
      Map<String, dynamic> updatedData = ({
        "updateTime": currentTimestamp,
        "token": value,
      });
      AppLogger.i("Refreshed Token - $value");
      await HiveDBProvider.create(getStoreKey, updatedData);
      completer.complete(value);
    }).onError((error, stackTrace) {
      completer.complete();
    });
    return completer.future;
  }
}
