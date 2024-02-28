import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'preferred_sector.dart';
import 'service.dart';
import 'signatory.dart';
import 'social_media.dart';

class OrganizationModel extends Equatable {
  final int? id;
  final DateTime? creationTimestamp;
  final DateTime? lastUpdatedTimestamp;
  final List<Service>? services;
  final List<SocialMedia>? socialMedias;
  final String? code;
  final String? name;
  final String? about;
  final String? briefDescription;
  final int? inceptionYear;
  final String? registrationType;
  final String? sector;
  final String? stage;
  final String? city;
  final String? state;
  final String? additionalDetails;
  final String? primaryEmail;
  final String? primaryEmailVerified;
  final String? domain;
  final String? domainVerified;
  final String? website;
  final String? status;
  final bool? verified;
  final String? verifiedBy;
  final DateTime? verifiedOn;
  final String? address;
  final bool? trialPeriodProcured;
  final String? companyType;
  final String? legalName;
  final String? contactNumber;
  final String? targetMarket;
  final String? funding;
  final List<dynamic>? preferredPartnershipTypes;
  final String? partnershipRestrictions;
  final String? cin;
  final DateTime? lastActivityAtTimestamp;
  final String? verificationResponse;
  final String? source;
  final DateTime? incorporationDate;
  final bool? openForPartnership;
  final List<PreferredSector>? preferredSectors;
  final List<Signatory>? signatories;

  const OrganizationModel({
    this.id,
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.services,
    this.socialMedias,
    this.code,
    this.name,
    this.about,
    this.briefDescription,
    this.inceptionYear,
    this.registrationType,
    this.sector,
    this.stage,
    this.city,
    this.state,
    this.additionalDetails,
    this.primaryEmail,
    this.primaryEmailVerified,
    this.domain,
    this.domainVerified,
    this.website,
    this.status,
    this.verified,
    this.verifiedBy,
    this.verifiedOn,
    this.address,
    this.trialPeriodProcured,
    this.companyType,
    this.legalName,
    this.contactNumber,
    this.targetMarket,
    this.funding,
    this.preferredPartnershipTypes,
    this.partnershipRestrictions,
    this.cin,
    this.lastActivityAtTimestamp,
    this.verificationResponse,
    this.source,
    this.incorporationDate,
    this.openForPartnership,
    this.preferredSectors,
    this.signatories,
  });

  factory OrganizationModel.fromMap(Map<String, dynamic> data) {
    return OrganizationModel(
      id: data['id'] as int?,
      creationTimestamp: data['creationTimestamp'] == null
          ? null
          : DateTime.parse(data['creationTimestamp'] as String),
      lastUpdatedTimestamp: data['lastUpdatedTimestamp'] == null
          ? null
          : DateTime.parse(data['lastUpdatedTimestamp'] as String),
      services: (data['services'] as List<dynamic>?)
          ?.map((e) => Service.fromMap(e as Map<String, dynamic>))
          .toList(),
      socialMedias: (data['socialMedias'] as List<dynamic>?)
          ?.map((e) => SocialMedia.fromMap(e as Map<String, dynamic>))
          .toList(),
      code: data['code'] as String?,
      name: data['name'] as String?,
      about: data['about'] as String?,
      briefDescription: data['briefDescription'] as String?,
      inceptionYear: data['inceptionYear'] as int?,
      registrationType: data['registrationType'] as String?,
      sector: data['sector'] as String?,
      stage: data['stage'] as String?,
      city: data['city'] as String?,
      state: data['state'] as String?,
      additionalDetails: data['additionalDetails'] as String?,
      primaryEmail: data['primaryEmail'] as String?,
      primaryEmailVerified: data['primaryEmailVerified'] as String?,
      domain: data['domain'] as String?,
      domainVerified: data['domainVerified'] as String?,
      website: data['website'] as String?,
      status: data['status'] as String?,
      verified: data['verified'] as bool?,
      verifiedBy: data['verifiedBy'] as String?,
      verifiedOn: data['verifiedOn'] == null
          ? null
          : DateTime.parse(data['verifiedOn'] as String),
      address: data['address'] as String?,
      trialPeriodProcured: data['trialPeriodProcured'] as bool?,
      companyType: data['companyType'] as String?,
      legalName: data['legalName'] as String?,
      contactNumber: data['contactNumber'] as String?,
      targetMarket: data['targetMarket'] as String?,
      funding: data['funding'] as String?,
      preferredPartnershipTypes:
          data['preferredPartnershipTypes'] as List<dynamic>?,
      partnershipRestrictions: data['partnershipRestrictions'] as String?,
      cin: data['cin'] as String?,
      lastActivityAtTimestamp: data['lastActivityAtTimestamp'] == null
          ? null
          : DateTime.parse(data['lastActivityAtTimestamp'] as String),
      verificationResponse: data['verificationResponse'] as String?,
      source: data['source'] as String?,
      incorporationDate: data['incorporationDate'] == null
          ? null
          : DateTime.parse(data['incorporationDate'] as String),
      openForPartnership: data['openForPartnership'] as bool?,
      preferredSectors: (data['preferredSectors'] as List<dynamic>?)
          ?.map((e) => PreferredSector.fromMap(e as Map<String, dynamic>))
          .toList(),
      signatories: (data['signatories'] as List<dynamic>?)
          ?.map((e) => Signatory.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'services': services?.map((e) => e.toMap()).toList(),
        'socialMedias': socialMedias?.map((e) => e.toMap()).toList(),
        'code': code,
        'name': name,
        'about': about,
        'briefDescription': briefDescription,
        'inceptionYear': inceptionYear,
        'registrationType': registrationType,
        'sector': sector,
        'stage': stage,
        'city': city,
        'state': state,
        'additionalDetails': additionalDetails,
        'primaryEmail': primaryEmail,
        'primaryEmailVerified': primaryEmailVerified,
        'domain': domain,
        'domainVerified': domainVerified,
        'website': website,
        'status': status,
        'verified': verified,
        'verifiedBy': verifiedBy,
        'verifiedOn': verifiedOn?.toIso8601String(),
        'address': address,
        'trialPeriodProcured': trialPeriodProcured,
        'companyType': companyType,
        'legalName': legalName,
        'contactNumber': contactNumber,
        'targetMarket': targetMarket,
        'funding': funding,
        'preferredPartnershipTypes': preferredPartnershipTypes,
        'partnershipRestrictions': partnershipRestrictions,
        'cin': cin,
        'lastActivityAtTimestamp': lastActivityAtTimestamp?.toIso8601String(),
        'verificationResponse': verificationResponse,
        'source': source,
        'incorporationDate': incorporationDate?.toIso8601String(),
        'openForPartnership': openForPartnership,
        'preferredSectors': preferredSectors?.map((e) => e.toMap()).toList(),
        'signatories': signatories?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrganizationModel].
  factory OrganizationModel.fromJson(String data) {
    return OrganizationModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrganizationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  OrganizationModel copyWith({
    int? id,
    DateTime? creationTimestamp,
    DateTime? lastUpdatedTimestamp,
    List<Service>? services,
    List<SocialMedia>? socialMedias,
    String? code,
    String? name,
    String? about,
    String? briefDescription,
    int? inceptionYear,
    String? registrationType,
    String? sector,
    String? stage,
    String? city,
    String? state,
    String? additionalDetails,
    String? primaryEmail,
    String? primaryEmailVerified,
    String? domain,
    String? domainVerified,
    String? website,
    String? status,
    bool? verified,
    String? verifiedBy,
    DateTime? verifiedOn,
    String? address,
    bool? trialPeriodProcured,
    String? companyType,
    String? legalName,
    String? contactNumber,
    String? targetMarket,
    String? funding,
    List<dynamic>? preferredPartnershipTypes,
    String? partnershipRestrictions,
    String? cin,
    DateTime? lastActivityAtTimestamp,
    String? verificationResponse,
    String? source,
    DateTime? incorporationDate,
    bool? openForPartnership,
    List<PreferredSector>? preferredSectors,
    List<Signatory>? signatories,
  }) {
    return OrganizationModel(
      id: id ?? this.id,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastUpdatedTimestamp: lastUpdatedTimestamp ?? this.lastUpdatedTimestamp,
      services: services ?? this.services,
      socialMedias: socialMedias ?? this.socialMedias,
      code: code ?? this.code,
      name: name ?? this.name,
      about: about ?? this.about,
      briefDescription: briefDescription ?? this.briefDescription,
      inceptionYear: inceptionYear ?? this.inceptionYear,
      registrationType: registrationType ?? this.registrationType,
      sector: sector ?? this.sector,
      stage: stage ?? this.stage,
      city: city ?? this.city,
      state: state ?? this.state,
      additionalDetails: additionalDetails ?? this.additionalDetails,
      primaryEmail: primaryEmail ?? this.primaryEmail,
      primaryEmailVerified: primaryEmailVerified ?? this.primaryEmailVerified,
      domain: domain ?? this.domain,
      domainVerified: domainVerified ?? this.domainVerified,
      website: website ?? this.website,
      status: status ?? this.status,
      verified: verified ?? this.verified,
      verifiedBy: verifiedBy ?? this.verifiedBy,
      verifiedOn: verifiedOn ?? this.verifiedOn,
      address: address ?? this.address,
      trialPeriodProcured: trialPeriodProcured ?? this.trialPeriodProcured,
      companyType: companyType ?? this.companyType,
      legalName: legalName ?? this.legalName,
      contactNumber: contactNumber ?? this.contactNumber,
      targetMarket: targetMarket ?? this.targetMarket,
      funding: funding ?? this.funding,
      preferredPartnershipTypes:
          preferredPartnershipTypes ?? this.preferredPartnershipTypes,
      partnershipRestrictions:
          partnershipRestrictions ?? this.partnershipRestrictions,
      cin: cin ?? this.cin,
      lastActivityAtTimestamp:
          lastActivityAtTimestamp ?? this.lastActivityAtTimestamp,
      verificationResponse: verificationResponse ?? this.verificationResponse,
      source: source ?? this.source,
      incorporationDate: incorporationDate ?? this.incorporationDate,
      openForPartnership: openForPartnership ?? this.openForPartnership,
      preferredSectors: preferredSectors ?? this.preferredSectors,
      signatories: signatories ?? this.signatories,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationTimestamp,
      lastUpdatedTimestamp,
      services,
      socialMedias,
      code,
      name,
      about,
      briefDescription,
      inceptionYear,
      registrationType,
      sector,
      stage,
      city,
      state,
      additionalDetails,
      primaryEmail,
      primaryEmailVerified,
      domain,
      domainVerified,
      website,
      status,
      verified,
      verifiedBy,
      verifiedOn,
      address,
      trialPeriodProcured,
      companyType,
      legalName,
      contactNumber,
      targetMarket,
      funding,
      preferredPartnershipTypes,
      partnershipRestrictions,
      cin,
      lastActivityAtTimestamp,
      verificationResponse,
      source,
      incorporationDate,
      openForPartnership,
      preferredSectors,
      signatories,
    ];
  }
}
