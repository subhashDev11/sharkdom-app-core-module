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

  factory Signatory.fromJson(Map<String, dynamic> json) => Signatory(
        id: json['id'] as int?,
        creationTimestamp: json['creationTimestamp'] == null
            ? null
            : DateTime.parse(json['creationTimestamp'] as String),
        lastUpdatedTimestamp: json['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(json['lastUpdatedTimestamp'] as String),
        name: json['name'] as String?,
        signatory: json['signatory'] as String?,
        endDate: json['endDate'] as String?,
        surrenderedDin: json['surrenderedDin'] as String?,
        dinOrPanNumber: json['dinOrPanNumber'] as String?,
        beginDate: json['beginDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
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
