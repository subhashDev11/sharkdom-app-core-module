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

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        id: json['id'] as int?,
        creationTimestamp: json['creationTimestamp'] == null
            ? null
            : DateTime.parse(json['creationTimestamp'] as String),
        lastUpdatedTimestamp: json['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(json['lastUpdatedTimestamp'] as String),
        name: json['name'] as String?,
        url: json['url'] as String?,
        showOnUi: json['showOnUi'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'name': name,
        'url': url,
        'showOnUi': showOnUi,
      };

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
