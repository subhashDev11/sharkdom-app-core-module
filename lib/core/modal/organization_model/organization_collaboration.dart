import 'package:equatable/equatable.dart';

class OrganizationCollaboration extends Equatable {
  final int? organizationId;
  final String? organizationName;

  const OrganizationCollaboration({
    this.organizationId,
    this.organizationName,
  });

  factory OrganizationCollaboration.fromJson(Map<String, dynamic> json) {
    return OrganizationCollaboration(
      organizationId: json['organizationId'] as int?,
      organizationName: json['organizationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'organizationId': organizationId,
        'organizationName': organizationName,
      };

  OrganizationCollaboration copyWith({
    int? organizationId,
    String? organizationName,
  }) {
    return OrganizationCollaboration(
      organizationId: organizationId ?? this.organizationId,
      organizationName: organizationName ?? this.organizationName,
    );
  }

  @override
  List<Object?> get props => [organizationId, organizationName];
}
