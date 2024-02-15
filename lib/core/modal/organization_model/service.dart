import 'dart:convert';

import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final String? service;

  const Service({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.service,
  });

  factory Service.fromMap(Map<String, dynamic> data) => Service(
        id: data['id'] as int?,
        creationTimestamp: data['creationTimestamp'] == null
            ? null
            : DateTime.parse(data['creationTimestamp'] as String),
        lastUpdatedTimestamp: data['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(data['lastUpdatedTimestamp'] as String),
        service: data['service'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'service': service,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Service].
  factory Service.fromJson(String data) {
    return Service.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Service] to a JSON string.
  String toJson() => json.encode(toMap());

  Service copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    String? service,
  }) {
    return Service(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      service: service ?? this.service,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      service,
    ];
  }
}
