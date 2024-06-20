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

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as int?,
        creationTimestamp: json['creationTimestamp'] == null
            ? null
            : DateTime.parse(json['creationTimestamp'] as String),
        lastUpdatedTimestamp: json['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(json['lastUpdatedTimestamp'] as String),
        service: json['service'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'service': service,
      };

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
