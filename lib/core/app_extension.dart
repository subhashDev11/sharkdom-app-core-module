import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_core_module/core/common_data/configurable_data_model/configurable_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:app_core_module/core/common_data/error_model.dart';

extension BuildCtxExtension on BuildContext {
  ThemeData get getTheme => Theme.of(this);

  bool get isDarkTheme => getTheme.brightness == Brightness.dark;

  Size get screenSize => MediaQuery.of(this).size;

  Color get getBrightnessBG => Theme.of(this).brightness == Brightness.light
      ? Colors.white
      : Theme.of(this).cardColor;
}

extension IndexOfDropdownValue on List<ConfigurableDataModel> {
  int? getIndexFromKey(String? key) {
    if (key == null || key.isEmpty) {
      return null;
    } else {
      int index = indexWhere(
          (element) => (element.key ?? '').toLowerCase() == key.toLowerCase());
      // (element.key ?? '').toLowerCase().toString() ==
      // name.toLowerCase().toString());
      return index != -1 ? index : null;
    }
  }

  ConfigurableDataModel? getConfiguresFromKey(String? key) {
    if (key == null) {
      return null;
    }
    int? index = getIndexFromKey(key);
    if (index != null) {
      return this[index];
    } else {
      return null;
    }
  }

  List<String> getDropdownOptions({bool? removeNum}) {
    return map((e) {
      if (removeNum ?? false) {
        return (e.key ?? '')
            .capitalizeFirstLetter()
            .replaceAll("_", " ")
            .removeNumbersFromString();
      }
      return (e.key ?? '').capitalizeFirstLetter().replaceAll("_", " ");
    }).toList().toSet().toList();
  }

  List<String> getFromValue() {
    return map((e) {
      return (e.value ?? '');
    }).toList().toSet().toList();
  }
}

extension StringExtension on String {
  String removeNumbersFromString() {
    return replaceAll(RegExp(r'\d'), '');
  }

  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    String sanitized = toLowerCase();
    sanitized =
        sanitized.replaceFirst(sanitized[0], sanitized[0].toUpperCase());
    return sanitized;
  }
}

extension HttpResponseExtension on http.Response {
  Map<String, dynamic>? toJson() {
    try {
      return jsonDecode(body);
    } catch (e) {
      return null;
    }
  }

  String? getErrorMessage() {
    try {
      return ErrorResponse.fromJson(body).message;
    } catch (e) {
      return null;
    }
  }
}
