import 'package:equatable/equatable.dart';

import 'credits.dart';
import 'organization_collaboration.dart';
import 'preferred_partnership_type.dart';
import 'preferred_sector.dart';
import 'schedule.dart';
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
  final String? dateOfIncorporation;
  final String? verificationApplicationStatus;
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
  final List<PreferredPartnershipType>? preferredPartnershipTypes;
  final String? partnershipRestrictions;
  final String? cin;
  final DateTime? lastActivityAtTimestamp;
  final String? verificationResponse;
  final String? source;
  final DateTime? incorporationDate;
  final List<PreferredSector>? preferredSectors;
  final List<Signatory>? signatories;
  final bool? openForPartnership;
  final Credits? credits;
  final List<Schedule>? schedules;
  final bool? referralProgram;
  final bool? brandResources;
  final String? documentPath;
  final List<OrganizationCollaboration>? organizationCollaborations;
  final int? acknowledgmentTime;
  final String? referralCode;
  final String? planCode;
  final bool? subscribed;

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
    this.dateOfIncorporation,
    this.verificationApplicationStatus,
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
    this.preferredSectors,
    this.signatories,
    this.openForPartnership,
    this.credits,
    this.schedules,
    this.referralProgram,
    this.brandResources,
    this.documentPath,
    this.organizationCollaborations,
    this.acknowledgmentTime,
    this.referralCode,
    this.planCode,
    this.subscribed,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) {
    return OrganizationModel(
      id: json['id'] as int?,
      creationTimestamp: json['creationTimestamp'] == null
          ? null
          : DateTime.parse(json['creationTimestamp'] as String),
      lastUpdatedTimestamp: json['lastUpdatedTimestamp'] == null
          ? null
          : DateTime.parse(json['lastUpdatedTimestamp'] as String),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedias: (json['socialMedias'] as List<dynamic>?)
          ?.map((e) => SocialMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      about: json['about'] as String?,
      briefDescription: json['briefDescription'] as String?,
      inceptionYear: json['inceptionYear'] as int?,
      registrationType: json['registrationType'] as String?,
      sector: json['sector'] as String?,
      stage: json['stage'] as String?,
      dateOfIncorporation: json['dateOfIncorporation'] as String?,
      verificationApplicationStatus:
          json['verificationApplicationStatus'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      additionalDetails: json['additionalDetails'] as String?,
      primaryEmail: json['primaryEmail'] as String?,
      primaryEmailVerified: json['primaryEmailVerified'] as String?,
      domain: json['domain'] as String?,
      domainVerified: json['domainVerified'] as String?,
      website: json['website'] as String?,
      status: json['status'] as String?,
      verified: json['verified'] as bool?,
      verifiedBy: json['verifiedBy'] as String?,
      verifiedOn: json['verifiedOn'] == null
          ? null
          : DateTime.parse(json['verifiedOn'] as String),
      address: json['address'] as String?,
      trialPeriodProcured: json['trialPeriodProcured'] as bool?,
      companyType: json['companyType'] as String?,
      legalName: json['legalName'] as String?,
      contactNumber: json['contactNumber'] as String?,
      targetMarket: json['targetMarket'] as String?,
      funding: json['funding'] as String?,
      preferredPartnershipTypes:
          (json['preferredPartnershipTypes'] as List<dynamic>?)
              ?.map((e) =>
                  PreferredPartnershipType.fromJson(e as Map<String, dynamic>))
              .toList(),
      partnershipRestrictions: json['partnershipRestrictions'] as String?,
      cin: json['cin'] as String?,
      lastActivityAtTimestamp: json['lastActivityAtTimestamp'] == null
          ? null
          : DateTime.parse(json['lastActivityAtTimestamp'] as String),
      verificationResponse: json['verificationResponse'] as String?,
      source: json['source'] as String?,
      incorporationDate: json['incorporationDate'] == null
          ? null
          : DateTime.parse(json['incorporationDate'] as String),
      preferredSectors: (json['preferredSectors'] as List<dynamic>?)
          ?.map((e) => PreferredSector.fromJson(e as Map<String, dynamic>))
          .toList(),
      signatories: (json['signatories'] as List<dynamic>?)
          ?.map((e) => Signatory.fromJson(e as Map<String, dynamic>))
          .toList(),
      openForPartnership: json['openForPartnership'] as bool?,
      credits: json['credits'] == null
          ? null
          : Credits.fromJson(json['credits'] as Map<String, dynamic>),
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      referralProgram: json['referralProgram'] as bool?,
      brandResources: json['brandResources'] as bool?,
      documentPath: json['documentPath'] as String?,
      organizationCollaborations:
          (json['organizationCollaborations'] as List<dynamic>?)
              ?.map((e) =>
                  OrganizationCollaboration.fromJson(e as Map<String, dynamic>))
              .toList(),
      acknowledgmentTime: json['acknowledgmentTime'] as int?,
      referralCode: json['referralCode'] as String?,
      planCode: json['planCode'] as String?,
      subscribed: json['subscribed'] as bool?,
    );
  }

  String getOrgFileLogoName() {
    return "${name}_$id";
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTimestamp': creationTimestamp?.toIso8601String(),
        'lastUpdatedTimestamp': lastUpdatedTimestamp?.toIso8601String(),
        'services': services?.map((e) => e.toJson()).toList(),
        'socialMedias': socialMedias?.map((e) => e.toJson()).toList(),
        'code': code,
        'name': name,
        'about': about,
        'briefDescription': briefDescription,
        'inceptionYear': inceptionYear,
        'registrationType': registrationType,
        'sector': sector,
        'stage': stage,
        'dateOfIncorporation': dateOfIncorporation,
        'verificationApplicationStatus': verificationApplicationStatus,
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
        'preferredPartnershipTypes':
            preferredPartnershipTypes?.map((e) => e.toJson()).toList(),
        'partnershipRestrictions': partnershipRestrictions,
        'cin': cin,
        'lastActivityAtTimestamp': lastActivityAtTimestamp?.toIso8601String(),
        'verificationResponse': verificationResponse,
        'source': source,
        'incorporationDate': incorporationDate?.toIso8601String(),
        'preferredSectors': preferredSectors?.map((e) => e.toJson()).toList(),
        'signatories': signatories?.map((e) => e.toJson()).toList(),
        'openForPartnership': openForPartnership,
        'credits': credits?.toJson(),
        'schedules': schedules?.map((e) => e.toJson()).toList(),
        'referralProgram': referralProgram,
        'brandResources': brandResources,
        'documentPath': documentPath,
        'organizationCollaborations':
            organizationCollaborations?.map((e) => e.toJson()).toList(),
        'acknowledgmentTime': acknowledgmentTime,
        'referralCode': referralCode,
        'planCode': planCode,
        'subscribed': subscribed,
      };

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
    String? dateOfIncorporation,
    String? verificationApplicationStatus,
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
    List<PreferredPartnershipType>? preferredPartnershipTypes,
    String? partnershipRestrictions,
    String? cin,
    DateTime? lastActivityAtTimestamp,
    String? verificationResponse,
    String? source,
    DateTime? incorporationDate,
    List<PreferredSector>? preferredSectors,
    List<Signatory>? signatories,
    bool? openForPartnership,
    Credits? credits,
    List<Schedule>? schedules,
    bool? referralProgram,
    bool? brandResources,
    String? documentPath,
    List<OrganizationCollaboration>? organizationCollaborations,
    int? acknowledgmentTime,
    String? referralCode,
    String? planCode,
    bool? subscribed,
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
      dateOfIncorporation: dateOfIncorporation ?? this.dateOfIncorporation,
      verificationApplicationStatus:
          verificationApplicationStatus ?? this.verificationApplicationStatus,
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
      preferredSectors: preferredSectors ?? this.preferredSectors,
      signatories: signatories ?? this.signatories,
      openForPartnership: openForPartnership ?? this.openForPartnership,
      credits: credits ?? this.credits,
      schedules: schedules ?? this.schedules,
      referralProgram: referralProgram ?? this.referralProgram,
      brandResources: brandResources ?? this.brandResources,
      documentPath: documentPath ?? this.documentPath,
      organizationCollaborations:
          organizationCollaborations ?? this.organizationCollaborations,
      acknowledgmentTime: acknowledgmentTime ?? this.acknowledgmentTime,
      referralCode: referralCode ?? this.referralCode,
      planCode: planCode ?? this.planCode,
      subscribed: subscribed ?? this.subscribed,
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
      dateOfIncorporation,
      verificationApplicationStatus,
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
      preferredSectors,
      signatories,
      openForPartnership,
      credits,
      schedules,
      referralProgram,
      brandResources,
      documentPath,
      organizationCollaborations,
      acknowledgmentTime,
      referralCode,
      planCode,
      subscribed,
    ];
  }
}
