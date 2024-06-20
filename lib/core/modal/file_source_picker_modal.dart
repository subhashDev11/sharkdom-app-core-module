import 'dart:async';

import 'package:app_core_module/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_core_module/core/app_widgets/file_source_picker.dart';

class FileSourcePickerModal {
  static Future<ImageSource?> pickDocSource(BuildContext context) async {
    Completer<ImageSource?> completer = Completer();
    showModalBottomSheet(
      context: context,
      backgroundColor: context.getBrightnessBG,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (_) {
        return const FileSourcePickerWidget();
      },
    ).then((value) {
      if (value is ImageSource?) {
        completer.complete(value);
      } else {
        completer.complete(null);
      }
    }).onError((error, stackTrace) {
      completer.complete(null);
    });
    return completer.future;
  }
}
