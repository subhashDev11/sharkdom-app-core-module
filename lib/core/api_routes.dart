import 'package:app_core_module/app_core_module.dart';

class APIRoutes {
  static String baseUrl = "";
  static const String configurableData = "configuration/allByType";
  static const String organization = "organization";
  static const String allOrganizationsByUserId =
      "orgUserMapping/allOrganizationsByUserId";
  static const String getUserByUID = "user/userId";
  static const String user = "user";
  static const String orgUserMapping = "orgUserMapping";
  static const String organizationSearch = "organization/search";
  static const String organizationCollaboration = "organizationCollaboration";

  static void setBaseURL(String url){
    baseUrl = url;
    print("Provided base URL - $baseUrl");
  }
}

class WebUrl{
  static const String helpURL = "https://sharkdom.com/help";
}
