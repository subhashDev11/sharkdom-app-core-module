import 'dart:convert';

import 'package:equatable/equatable.dart';

class PreferredSector extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final String? area;

  const PreferredSector({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.area,
  });

  factory PreferredSector.fromMap(Map<String, dynamic> data) {
    return PreferredSector(
      id: data['id'] as int?,
      creationTimestamp: data['creationTimestamp'] == null
          ? null
          : DateTime.parse(data['creationTimestamp'] as String),
      lastUpdatedTimestamp: data['lastUpdatedTimestamp'] == null
          ? null
          : DateTime.parse(data['lastUpdatedTimestamp'] as String),
      area: data['area'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'area': area,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PreferredSector].
  factory PreferredSector.fromJson(String data) {
    return PreferredSector.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PreferredSector] to a JSON string.
  String toJson() => json.encode(toMap());

  PreferredSector copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    String? area,
  }) {
    return PreferredSector(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      area: area ?? this.area,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      area,
    ];
  }
}
