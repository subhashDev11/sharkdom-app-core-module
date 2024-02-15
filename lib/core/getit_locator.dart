import 'package:get_it/get_it.dart';
import 'package:app_core_module/core/services/app_pref_service.dart';
import 'package:app_core_module/core/services/hyperverge_service.dart';
import 'package:app_core_module/core/services/navigator_service.dart';
import 'package:app_core_module/core/services/notification_service.dart';
import 'package:app_core_module/core/services/s3_file_uploader_service.dart';

import 'services/token_service.dart';

final getIt = GetIt.instance;

void getItLocator() {
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
      endPoint: 's3.amazonaws.com',
      accessKey: 'AKIAV2A7YBIXZMOHPI4Z',
      secretKey: '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',
      region: 'ap-south-1',
      bucketName: "sharkdom.co.in",
      projectId: "sharkdom",
      envName: "dev",
    ),
  );
}
