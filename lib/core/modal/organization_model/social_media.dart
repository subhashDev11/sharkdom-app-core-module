import 'dart:convert';

import 'package:equatable/equatable.dart';

class SocialMedia extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final String? name;
  final String? url;
  final bool? showOnUi;

  const SocialMedia({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.name,
    this.url,
    this.showOnUi,
  });

  factory SocialMedia.fromMap(Map<String, dynamic> data) => SocialMedia(
        id: data['id'] as int?,
        creationTimestamp: data['creationTimestamp'] == null
            ? null
            : DateTime.parse(data['creationTimestamp'] as String),
        lastUpdatedTimestamp: data['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(data['lastUpdatedTimestamp'] as String),
        name: data['name'] as String?,
        url: data['url'] as String?,
        showOnUi: data['showOnUi'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'name': name,
        'url': url,
        'showOnUi': showOnUi,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SocialMedia].
  factory SocialMedia.fromJson(String data) {
    return SocialMedia.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SocialMedia] to a JSON string.
  String toJson() => json.encode(toMap());

  SocialMedia copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    String? name,
    String? url,
    bool? showOnUi,
  }) {
    return SocialMedia(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      name: name ?? this.name,
      url: url ?? this.url,
      showOnUi: showOnUi ?? this.showOnUi,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      name,
      url,
      showOnUi,
    ];
  }
}
