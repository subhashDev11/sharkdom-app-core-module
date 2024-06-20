import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final int? meetingDetailsId;
  final DateTime? time;
  final int? scheduledWith;
  final String? title;
  final String? description;
  final String? status;
  final String? meetingLink;
  final String? meetingStatus;

  const Schedule({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.meetingDetailsId,
    this.time,
    this.scheduledWith,
    this.title,
    this.description,
    this.status,
    this.meetingLink,
    this.meetingStatus,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json['id'] as int?,
        creationTimestamp: json['creationTimestamp'] == null
            ? null
            : DateTime.parse(json['creationTimestamp'] as String),
        lastUpdatedTimestamp: json['lastUpdatedTimestamp'] == null
            ? null
            : DateTime.parse(json['lastUpdatedTimestamp'] as String),
        meetingDetailsId: json['meetingDetailsId'] as int?,
        time: json['time'] == null
            ? null
            : DateTime.parse(json['time'] as String),
        scheduledWith: json['scheduledWith'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        status: json['status'] as String?,
        meetingLink: json['meetingLink'] as String?,
        meetingStatus: json['meetingStatus'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'meetingDetailsId': meetingDetailsId,
        'time': time?.toIso8601String(),
        'scheduledWith': scheduledWith,
        'title': title,
        'description': description,
        'status': status,
        'meetingLink': meetingLink,
        'meetingStatus': meetingStatus,
      };

  Schedule copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    int? meetingDetailsId,
    DateTime? time,
    int? scheduledWith,
    String? title,
    String? description,
    String? status,
    String? meetingLink,
    String? meetingStatus,
  }) {
    return Schedule(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      meetingDetailsId: meetingDetailsId ?? this.meetingDetailsId,
      time: time ?? this.time,
      scheduledWith: scheduledWith ?? this.scheduledWith,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      meetingLink: meetingLink ?? this.meetingLink,
      meetingStatus: meetingStatus ?? this.meetingStatus,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      meetingDetailsId,
      time,
      scheduledWith,
      title,
      description,
      status,
      meetingLink,
      meetingStatus,
    ];
  }
}
