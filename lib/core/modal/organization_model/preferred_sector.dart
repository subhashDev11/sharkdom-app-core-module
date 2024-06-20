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

  factory PreferredSector.fromJson(Map<String, dynamic> json) {
    return PreferredSector(
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
