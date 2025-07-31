// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scholarship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Scholarship _$ScholarshipFromJson(Map<String, dynamic> json) => _Scholarship(
  id: json['id'] as String,
  title: json['title'] as String,
  provider: json['provider'] as String,
  providerCountry: json['provider_country'] as String,
  basicInfo: BasicInfo.fromJson(json['basic_info'] as Map<String, dynamic>),
  dates: Dates.fromJson(json['dates'] as Map<String, dynamic>),
  requirements: Requirements.fromJson(
    json['requirements'] as Map<String, dynamic>,
  ),
  financialDetails: FinancialDetails.fromJson(
    json['financial_details'] as Map<String, dynamic>,
  ),
  applicationProcess: ApplicationProcess.fromJson(
    json['application_process'] as Map<String, dynamic>,
  ),
  contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  additionalInfo: json['additional_info'] == null
      ? null
      : AdditionalInfo.fromJson(
          json['additional_info'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ScholarshipToJson(_Scholarship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'provider': instance.provider,
      'provider_country': instance.providerCountry,
      'basic_info': instance.basicInfo,
      'dates': instance.dates,
      'requirements': instance.requirements,
      'financial_details': instance.financialDetails,
      'application_process': instance.applicationProcess,
      'contact': instance.contact,
      'tags': instance.tags,
      'additional_info': instance.additionalInfo,
    };

_BasicInfo _$BasicInfoFromJson(Map<String, dynamic> json) => _BasicInfo(
  description: json['description'] as String,
  fundingType: json['funding_type'] as String,
  targetDegreeLevels: (json['target_degree_levels'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  subjectAreas: (json['subject_areas'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  studyCountries: (json['study_countries'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  scholarshipDuration: json['scholarship_duration'] as String?,
  numberOfAwards: (json['number_of_awards'] as num?)?.toInt(),
);

Map<String, dynamic> _$BasicInfoToJson(_BasicInfo instance) =>
    <String, dynamic>{
      'description': instance.description,
      'funding_type': instance.fundingType,
      'target_degree_levels': instance.targetDegreeLevels,
      'subject_areas': instance.subjectAreas,
      'study_countries': instance.studyCountries,
      'scholarship_duration': instance.scholarshipDuration,
      'number_of_awards': instance.numberOfAwards,
    };

_Dates _$DatesFromJson(Map<String, dynamic> json) => _Dates(
  applicationDeadline: json['application_deadline'] as String,
  notificationDate: json['notification_date'] as String?,
  programStartDate: json['program_start_date'] as String?,
  programEndDate: json['program_end_date'] as String?,
);

Map<String, dynamic> _$DatesToJson(_Dates instance) => <String, dynamic>{
  'application_deadline': instance.applicationDeadline,
  'notification_date': instance.notificationDate,
  'program_start_date': instance.programStartDate,
  'program_end_date': instance.programEndDate,
};

_Requirements _$RequirementsFromJson(Map<String, dynamic> json) =>
    _Requirements(
      academic: Academic.fromJson(json['academic'] as Map<String, dynamic>),
      personalCriteria: json['personal_criteria'] == null
          ? null
          : PersonalCriteria.fromJson(
              json['personal_criteria'] as Map<String, dynamic>,
            ),
      applicationDocuments: (json['application_documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additionalRequirements:
          (json['additional_requirements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$RequirementsToJson(_Requirements instance) =>
    <String, dynamic>{
      'academic': instance.academic,
      'personal_criteria': instance.personalCriteria,
      'application_documents': instance.applicationDocuments,
      'additional_requirements': instance.additionalRequirements,
    };

_Academic _$AcademicFromJson(Map<String, dynamic> json) => _Academic(
  minimumGpa: json['minimum_gpa'],
  educationLevel: json['education_level'] as String?,
  languageRequirements: json['language_requirements'] as Map<String, dynamic>?,
  academicField: (json['academic_field'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  institutionRequirements: json['institution_requirements'] as String?,
);

Map<String, dynamic> _$AcademicToJson(_Academic instance) => <String, dynamic>{
  'minimum_gpa': instance.minimumGpa,
  'education_level': instance.educationLevel,
  'language_requirements': instance.languageRequirements,
  'academic_field': instance.academicField,
  'institution_requirements': instance.institutionRequirements,
};

_PersonalCriteria _$PersonalCriteriaFromJson(Map<String, dynamic> json) =>
    _PersonalCriteria(
      ageLimit: json['age_limit'] as String?,
      nationalityRestrictions:
          (json['nationality_restrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      workExperience: json['work_experience'] as String?,
      otherCriteria: (json['other_criteria'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PersonalCriteriaToJson(_PersonalCriteria instance) =>
    <String, dynamic>{
      'age_limit': instance.ageLimit,
      'nationality_restrictions': instance.nationalityRestrictions,
      'work_experience': instance.workExperience,
      'other_criteria': instance.otherCriteria,
    };

_FinancialDetails _$FinancialDetailsFromJson(Map<String, dynamic> json) =>
    _FinancialDetails(
      coverageAmount: json['coverage_amount'] as String?,
      whatIsCovered: (json['what_is_covered'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additionalBenefits: (json['additional_benefits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fundingDuration: json['funding_duration'] as String?,
    );

Map<String, dynamic> _$FinancialDetailsToJson(_FinancialDetails instance) =>
    <String, dynamic>{
      'coverage_amount': instance.coverageAmount,
      'what_is_covered': instance.whatIsCovered,
      'additional_benefits': instance.additionalBenefits,
      'funding_duration': instance.fundingDuration,
    };

_ApplicationProcess _$ApplicationProcessFromJson(Map<String, dynamic> json) =>
    _ApplicationProcess(
      applicationSteps: (json['application_steps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      selectionProcess: (json['selection_process'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      applicationFee: json['application_fee'] as String?,
      interviewRequired: json['interview_required'] as bool?,
      applicationTips: (json['application_tips'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ApplicationProcessToJson(_ApplicationProcess instance) =>
    <String, dynamic>{
      'application_steps': instance.applicationSteps,
      'selection_process': instance.selectionProcess,
      'application_fee': instance.applicationFee,
      'interview_required': instance.interviewRequired,
      'application_tips': instance.applicationTips,
    };

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  website: json['website'] as String?,
  address: json['address'] as String?,
  contactPerson: json['contact_person'] as String?,
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'email': instance.email,
  'phone': instance.phone,
  'website': instance.website,
  'address': instance.address,
  'contact_person': instance.contactPerson,
};

_AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    _AdditionalInfo(
      successStories: (json['success_stories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      alumniNetwork: json['alumni_network'] as String?,
      specialPrograms: (json['special_programs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      externalLinks: (json['external_links'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AdditionalInfoToJson(_AdditionalInfo instance) =>
    <String, dynamic>{
      'success_stories': instance.successStories,
      'alumni_network': instance.alumniNetwork,
      'special_programs': instance.specialPrograms,
      'external_links': instance.externalLinks,
    };
