import 'package:get_it/get_it.dart';
import 'package:app_core_module/core/services/app_pref_service.dart';
import 'package:app_core_module/core/services/hyperverge_service.dart';
import 'package:app_core_module/core/services/navigator_service.dart';
import 'package:app_core_module/core/services/notification_service.dart';
import 'package:app_core_module/core/services/s3_file_uploader_service.dart';

import 'services/token_service.dart';

final getIt = GetIt.instance;

void getItLocator({
  required S3Config s3config,
}) {
  getIt.registerSingleton<AppPrefService>(AppPrefService());
  getIt.registerSingleton<NavigatorService>(NavigatorService());
  getIt.registerSingleton<HyperVergeServices>(HyperVergeServices());
  getIt.registerSingleton<AuthTokenService>(AuthTokenService());
  getIt.registerSingleton<NotificationService>(NotificationService());
  getIt<AppPrefService>().init();
  getIt<AuthTokenService>().getToken();
  getIt<NotificationService>().init();
  getIt.registerSingleton<MinioUploadService>(
    MinioUploadService(
      endPoint: s3config.endPoint,
      accessKey: s3config.accessKey,
      secretKey: s3config.secretKey,
      region: s3config.region,
      bucketName: s3config.bucketName,
      projectId: s3config.projectId,
      envName: s3config.envName,
    ),
  );
}

/*
      endPoint: 's3.amazonaws.com',
      accessKey: 'AKIAV2A7YBIXZMOHPI4Z',
      secretKey: '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',
      region: 'ap-south-1',
      bucketName: "sharkdom.co.in",
      projectId: "sharkdom",
      envName: "dev",
 */

class S3Config {
  final String accessKey;
  final String secretKey;
  final String envName;
  final String projectId;
  final String bucketName;
  final String region;
  final String endPoint;

  S3Config(
      {required this.accessKey,
      required this.secretKey,
      required this.envName,
      required this.projectId,
      required this.bucketName,
      required this.region,
      required this.endPoint});
}
