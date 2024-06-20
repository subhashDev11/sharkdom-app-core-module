import 'package:equatable/equatable.dart';

class Credits extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final int? playgroundCredits;
  final int? aiProposalCredits;

  const Credits({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.playgroundCredits,
    this.aiProposalCredits,
  });

  factory Credits.fromJson(Map<String, dynamic> json) => Credits(
        id: json['id'] as int?,
        creationTimestamp: json['creationTimestamp'] == null
            ? null
            : DateTime.parse(json['creationTimestamp'] as String),
        lastUpdatedTimestamp: json['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(json['lastUpdatedTimestamp'] as String),
        playgroundCredits: json['playgroundCredits'] as int?,
        aiProposalCredits: json['aiProposalCredits'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'playgroundCredits': playgroundCredits,
        'aiProposalCredits': aiProposalCredits,
      };

  Credits copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    int? playgroundCredits,
    int? aiProposalCredits,
  }) {
    return Credits(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      playgroundCredits: playgroundCredits ?? this.playgroundCredits,
      aiProposalCredits: aiProposalCredits ?? this.aiProposalCredits,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      playgroundCredits,
      aiProposalCredits,
    ];
  }
}
