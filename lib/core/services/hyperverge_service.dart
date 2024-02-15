import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hyperkyc_flutter/hyperkyc_config.dart';
import 'package:hyperkyc_flutter/hyperkyc_result.dart';
import 'package:app_core_module/core/app_constants.dart';
import 'package:hyperkyc_flutter/hyperkyc_flutter.dart';
import 'package:app_core_module/core/utils/app_logger.dart';

class HyperVergeServices {
  HyperKycConfig get hyperKycConfig => HyperKycConfig.fromAppIdAppKey(
        appId: AppConstants.hyperAppId,
        appKey: AppConstants.hyperAppKey,
        workflowId: AppConstants.workflowId1,
        transactionId:
            "Sharkdom-${AppConstants.workflowId1}-transaction-${DateTime.now().toIso8601String()}",
      );

  Future<HyperKycResult> launchHyperVerge() async {
    HyperKycResult hyperKycResult = await HyperKyc.launch(
      hyperKycConfig: hyperKycConfig,
    );
    String? status = hyperKycResult.status?.value;
    AppLogger.i("Hyper verge data - ${hyperKycResult.details}");
    switch (status) {
      case 'auto_approved':
        EasyLoading.showToast("Successfully verified");
        AppLogger.i('workflow successful - auto approved');
      case 'auto_declined':
        EasyLoading.showToast("Successfully declined");
        AppLogger.d('workflow successful - auto declined');
      case 'needs_review':
        EasyLoading.showToast(
            "Documents submitted successfully and will review it asap");
        AppLogger.d('workflow successful - needs review');
      case 'error':
        EasyLoading.showToast(
            hyperKycResult.errorMessage ?? "Error on verification");
        AppLogger.e('failure');
      case 'user_cancelled':
        // user cancelled
        AppLogger.d('user cancelled');
      default:
        AppLogger.d('contact HyperVerge for more details');
    }
    return hyperKycResult;
  }
}
