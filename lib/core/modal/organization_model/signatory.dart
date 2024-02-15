import 'dart:convert';

import 'package:equatable/equatable.dart';

class Signatory extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final String? name;
  final String? signatory;
  final String? endDate;
  final String? surrenderedDin;
  final String? dinOrPanNumber;
  final String? beginDate;

  const Signatory({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.name,
    this.signatory,
    this.endDate,
    this.surrenderedDin,
    this.dinOrPanNumber,
    this.beginDate,
  });

  factory Signatory.fromMap(Map<String, dynamic> data) => Signatory(
        id: data['id'] as int?,
        creationTimestamp: data['creationTimestamp'] == null
            ? null
            : DateTime.parse(data['creationTimestamp'] as String),
        lastUpdatedTimestamp: data['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(data['lastUpdatedTimestamp'] as String),
        name: data['name'] as String?,
        signatory: data['signatory'] as String?,
        endDate: data['endDate'] as String?,
        surrenderedDin: data['surrenderedDin'] as String?,
        dinOrPanNumber: data['dinOrPanNumber'] as String?,
        beginDate: data['beginDate'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'name': name,
        'signatory': signatory,
        'endDate': endDate,
        'surrenderedDin': surrenderedDin,
        'dinOrPanNumber': dinOrPanNumber,
        'beginDate': beginDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Signatory].
  factory Signatory.fromJson(String data) {
    return Signatory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Signatory] to a JSON string.
  String toJson() => json.encode(toMap());

  Signatory copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    String? name,
    String? signatory,
    String? endDate,
    String? surrenderedDin,
    String? dinOrPanNumber,
    String? beginDate,
  }) {
    return Signatory(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      name: name ?? this.name,
      signatory: signatory ?? this.signatory,
      endDate: endDate ?? this.endDate,
      surrenderedDin: surrenderedDin ?? this.surrenderedDin,
      dinOrPanNumber: dinOrPanNumber ?? this.dinOrPanNumber,
      beginDate: beginDate ?? this.beginDate,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      name,
      signatory,
      endDate,
      surrenderedDin,
      dinOrPanNumber,
      beginDate,
    ];
  }
}
