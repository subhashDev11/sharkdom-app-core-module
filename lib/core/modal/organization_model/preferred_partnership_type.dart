import 'package:equatable/equatable.dart';

class PreferredPartnershipType extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final String? area;

  const PreferredPartnershipType({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.area,
  });

  factory PreferredPartnershipType.fromJson(Map<String, dynamic> json) {
    return PreferredPartnershipType(
      id: json['id'] as int?,
      creationTimestamp: json['creationTimestamp'] == null
          ? null
          : DateTime.parse(json['creationTimestamp'] as String),
      lastUpdatedTimestamp: json['lastUpdatedTimestamp'] == null
          ? null
          : DateTime.parse(json['lastUpdatedTimestamp'] as String),
      area: json['area'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'area': area,
      };

  PreferredPartnershipType copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    String? area,
  }) {
    return PreferredPartnershipType(
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
