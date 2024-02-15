import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'app_logger.dart';

class InternetUtils {
  static Future<bool> isConnected() async {
    Completer<bool> completer = Completer();
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        completer.complete(true);
      }
    } on SocketException catch (_) {
      AppLogger.i('not connected');
      completer.complete(false);
    }
    return completer.future;
  }
}

class ConnectivityChangeNotifier with ChangeNotifier {
  bool isConnected = true;

  onChange(bool isConnected) {
    this.isConnected = isConnected;
    notifyListeners();
  }
}
