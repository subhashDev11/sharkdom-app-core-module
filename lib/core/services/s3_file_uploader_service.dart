import 'dart:io';
import 'package:app_core_module/core/modal/organization_model/organization_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:minio_flutter/minio.dart';
import 'package:path_provider/path_provider.dart' as sys_paths;
import 'package:path_provider/path_provider.dart';
import 'package:app_core_module/core/utils/InternetUtils.dart';
import 'package:app_core_module/core/utils/app_logger.dart';
import 'package:path/path.dart' as path;

class MinioUploadService {
  final MinioFlutter minio;
  final String bucketName;
  final String projectId;
  final String envName;

  MinioUploadService({
    required String endPoint,
    required String accessKey,
    required String secretKey,
    required String region,
    required this.bucketName,
    required this.projectId,
    required this.envName,
  }) : minio = MinioFlutter(
          endPoint: endPoint,
          accessKey: accessKey,
          secretKey: secretKey,
          useSSL: true,
          region: region,
        );

  String getOrgImageS3Path(String fileName) {
    return "$bucketName/logos/$fileName.png";
  }

  Future<String?> getOrgLogoByOrgModel(
      OrganizationModel organizationModel) async {
    String fileName = organizationModel.getOrgFileLogoName();
    String s3Path = getOrgImageS3Path(fileName);
    return await getFileById(id: s3Path);
  }

  Future<String?> uploadFile({
    required String filePath,
    required String fileName,
  }) async {
    final file = File(filePath);
    final stat = await file.stat();
    final isInternetAvailable = await InternetUtils.isConnected();
    String fileObjectName = "$bucketName/logos/$fileName.png";
    AppLogger.i("bucket object - $fileObjectName");

    if (isInternetAvailable) {
      try {
        final res = await minio.putObject(
          bucketName,
          fileObjectName,
          Stream<Uint8List>.value(file.readAsBytesSync()),
          size: stat.size,
          // metadata: {
          //   'content-type': fileType,
          // },
        );
        AppLogger.i(
            "uploaded file on S3  folder - $fileObjectName and response is - $res");
        return fileObjectName;
      } catch (e) {
        AppLogger.e(e);
      }
    } else {
      EasyLoading.showToast("No internet connection!");
      return null;
    }
    return null;
  }

  Future<String?> getFileById({required String id}) async {
    AppLogger.i('bucket name - $bucketName');
    if (await InternetUtils.isConnected()) {
      final data = await loadDocument(id);
      return data;
    } else {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/$id');
      if (await file.exists()) {
        return file.path;
      } else {
        return null;
      }
    }
  }

  Future<String?> loadDocument(String docId) async {
    try {
      final stream = await minio.getObject(bucketName, docId);
      AppLogger.i(" Content Length: ${stream.contentLength}");
      final appDir = await sys_paths.getTemporaryDirectory();
      File file = File(
          '${appDir.path}/${DateTime.now().microsecondsSinceEpoch}.${docId.split(".").last}');
      await stream.pipe(file.openWrite());
      AppLogger.i("File length: ${await file.length()}");
      return file.path;
    } catch (ex, stackTrace) {
      AppLogger.e(
        "#136 $ex",
        stackTrace: stackTrace,
      );
      return null;
    }
  }
}
