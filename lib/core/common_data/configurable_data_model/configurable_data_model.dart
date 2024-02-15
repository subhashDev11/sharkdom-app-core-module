import 'dart:convert';

import 'package:equatable/equatable.dart';

class ConfigurableDataModel extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final String? type;
  final String? key;
  final String? value;
  final bool? webApplicable;
  final bool? appApplicable;
  final bool? backendApplicable;
  final bool? active;

  const ConfigurableDataModel({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.type,
    this.key,
    this.value,
    this.webApplicable,
    this.appApplicable,
    this.backendApplicable,
    this.active,
  });

  factory ConfigurableDataModel.fromMap(Map<String, dynamic> data) {
    return ConfigurableDataModel(
      id: data['id'] as int?,
      creationTimestamp: data['creationTimestamp'] == null
          ? null
          : DateTime.parse(data['creationTimestamp'] as String),
      lastUpdatedTimestamp: data['lastUpdatedTimestamp'] == null
          ? null
          : DateTime.parse(data['lastUpdatedTimestamp'] as String),
      type: data['type'] as String?,
      key: data['key'] as String?,
      value: data['value'] as String?,
      webApplicable: data['webApplicable'] as bool?,
      appApplicable: data['appApplicable'] as bool?,
      backendApplicable: data['backendApplicable'] as bool?,
      active: data['active'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'type': type,
        'key': key,
        'value': value,
        'webApplicable': webApplicable,
        'appApplicable': appApplicable,
        'backendApplicable': backendApplicable,
        'active': active,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ConfigurableDataModel].
  factory ConfigurableDataModel.fromJson(String data) {
    return ConfigurableDataModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ConfigurableDataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ConfigurableDataModel copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    String? type,
    String? key,
    String? value,
    bool? webApplicable,
    bool? appApplicable,
    bool? backendApplicable,
    bool? active,
  }) {
    return ConfigurableDataModel(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      type: type ?? this.type,
      key: key ?? this.key,
      value: value ?? this.value,
      webApplicable: webApplicable ?? this.webApplicable,
      appApplicable: appApplicable ?? this.appApplicable,
      backendApplicable: backendApplicable ?? this.backendApplicable,
      active: active ?? this.active,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      type,
      key,
      value,
      webApplicable,
      appApplicable,
      backendApplicable,
      active,
    ];
  }
}
