import 'dart:async';
import 'dart:convert';

import 'package:app_core_module/core/api_routes.dart';
import 'package:app_core_module/core/hive_db_provider.dart';
import 'package:app_core_module/core/utils/network_service.dart';

import 'configurable_data_model/configurable_data_model.dart';
import 'package:flutter/cupertino.dart';

class CommonDataProvider extends ChangeNotifier {
  Future<void> init() async {
    Completer completer = Completer();
    Future.wait([
      fetchPreferredSectors(),
      fetchTrendingStartups(),
      fetchResources(),
      fetchBenefitsSubs(),
      fetchPlaygrounds(),
      fetchSubscriptionPlans(),
      fetchBenefits(),
      fetchUserDesignation(),
      fetchPayments(),
    ]);
    completer.complete();
    notifyListeners();
    return completer.future;
  }

  List<ConfigurableDataModel> _preferredSectors = [];
  List<ConfigurableDataModel> _trendingStartups = [];
  List<ConfigurableDataModel> _resources = [];
  List<ConfigurableDataModel> _benefitsSubs = [];
  List<ConfigurableDataModel> _playgrounds = [];

  List<ConfigurableDataModel> get resources => _resources;

  List<ConfigurableDataModel> get preferredSectors => _preferredSectors;

  List<ConfigurableDataModel> get trendingStartups => _trendingStartups;

  List<ConfigurableDataModel> get benefitsSubs => _benefitsSubs;

  List<ConfigurableDataModel> get playgrounds => _playgrounds;
  List<ConfigurableDataModel> _subscriptionPlans = [];

  List<ConfigurableDataModel> get subscriptionPlans => _subscriptionPlans;
  List<ConfigurableDataModel> _userDesignation = [];

  List<ConfigurableDataModel> get userDesignation => _userDesignation;
  List<ConfigurableDataModel> _payments = [];

  List<ConfigurableDataModel> get payments => _payments;
  List<ConfigurableDataModel> _benefits = [];

  List<ConfigurableDataModel> get benefits => _benefits;

  Future<List<ConfigurableDataModel>> getFromServerCache(String key) async {
    List<ConfigurableDataModel>? result;
    var fromHive = await HiveDBProvider.get(key);
    if (fromHive != null && fromHive is String) {
      var decodedRes = jsonDecode(fromHive);
      if (decodedRes != null && decodedRes is List) {
        result =
            decodedRes.map((e) => ConfigurableDataModel.fromMap(e)).toList();
      }
    } else {
      var response = await NetworkService.get(
        url: "${APIRoutes.baseUrl}${APIRoutes.configurableData}?type=$key",
      );
      if (response.statusCode == 200) {
        await HiveDBProvider.create(key, response.body);
        var decodedRes = jsonDecode(response.body);
        if (decodedRes != null && decodedRes is List) {
          result =
              decodedRes.map((e) => ConfigurableDataModel.fromMap(e)).toList();
        }
      }
    }
    return result ?? [];
  }

  Future<void> fetchPreferredSectors() async {
    _preferredSectors = await getFromServerCache("PREFERRED_SECTORS");
  }

  Future<void> fetchTrendingStartups() async {
    _trendingStartups = await getFromServerCache("TRENDING_STARTUP");
  }

  Future<void> fetchResources() async {
    _resources = await getFromServerCache("RESOURCES");
  }

  Future<void> fetchBenefitsSubs() async {
    _benefitsSubs = await getFromServerCache("BENEFIT_SUBS");
  }

  Future<void> fetchPlaygrounds() async {
    _playgrounds = await getFromServerCache("PLAYGROUND");
  }

  Future<void> fetchSubscriptionPlans() async {
    _subscriptionPlans = await getFromServerCache("SUBSCRIPTION_PLAN");
  }

  Future<void> fetchBenefits() async {
    _benefits = await getFromServerCache("BENEFITS");
  }

  Future<void> fetchUserDesignation() async {
    _userDesignation = await getFromServerCache("USER_DESIGNATION");
  }

  Future<void> fetchPayments() async {
    _payments = await getFromServerCache("PAYMENT");
  }

  ExtractedResourcesModel extractResourceData(String input) {
    RegExp imageRegExp = RegExp(r'https://[^\s`]+\.jpeg');
    RegExp sourceRegExp = RegExp(r'https://[^\s`]+');
    RegExp contentRegExp = RegExp(r'`([^`]*)`');

    String imageUrl = imageRegExp.firstMatch(input)?.group(0) ?? '';
    String sourceUrl = sourceRegExp.allMatches(input).last.group(0) ??
        ''; // Assuming the source URL is always the last URL in the string
    String content = contentRegExp.firstMatch(input)?.group(1) ?? '';

    return ExtractedResourcesModel(
        imageUrl: imageUrl, sourceUrl: sourceUrl, content: content);
  }
}

class ExtractedResourcesModel {
  final String imageUrl;
  final String sourceUrl;
  final String content;

  ExtractedResourcesModel({
    required this.imageUrl,
    required this.sourceUrl,
    required this.content,
  });
}
