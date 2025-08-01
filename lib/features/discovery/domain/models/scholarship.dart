import 'package:freezed_annotation/freezed_annotation.dart';

part 'scholarship.freezed.dart';
part 'scholarship.g.dart';

/// Main scholarship model containing all scholarship information
/// This mirrors the rich JSON structure from your scholarship data
@freezed
abstract class Scholarship with _$Scholarship {
  const factory Scholarship({
    required String id,
    required String title,
    required String provider,
    @JsonKey(name: 'provider_country') required String providerCountry,
    @JsonKey(name: 'basic_info') required BasicInfo basicInfo,
    required Dates dates,
    required Requirements requirements,
    @JsonKey(name: 'financial_details')
    required FinancialDetails financialDetails,
    @JsonKey(name: 'application_process')
    required ApplicationProcess applicationProcess,
    required Contact contact,
    @Default([]) List<String> tags,
    @JsonKey(name: 'additional_info') AdditionalInfo? additionalInfo,
  }) = _Scholarship;

  factory Scholarship.fromJson(Map<String, dynamic> json) =>
      _$ScholarshipFromJson(json);
}

/// Basic information about the scholarship
@freezed
abstract class BasicInfo with _$BasicInfo {
  const factory BasicInfo({
    required String description,
    @JsonKey(name: 'funding_type') required String fundingType,
    @JsonKey(name: 'target_degree_levels')
    required List<String> targetDegreeLevels,
    @JsonKey(name: 'subject_areas') List<String>? subjectAreas,
    @JsonKey(name: 'study_countries') List<String>? studyCountries,
    @JsonKey(name: 'scholarship_duration') String? scholarshipDuration,
    @JsonKey(name: 'number_of_awards') int? numberOfAwards,
  }) = _BasicInfo;

  factory BasicInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoFromJson(json);
}

/// Important dates for the scholarship
@freezed
abstract class Dates with _$Dates {
  const factory Dates({
    @JsonKey(name: 'application_deadline') required String applicationDeadline,
    @JsonKey(name: 'notification_date') String? notificationDate,
    @JsonKey(name: 'program_start_date') String? programStartDate,
    @JsonKey(name: 'program_end_date') String? programEndDate,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

/// Requirements for the scholarship application
@freezed
abstract class Requirements with _$Requirements {
  const factory Requirements({
    required Academic academic,
    @JsonKey(name: 'personal_criteria') PersonalCriteria? personalCriteria,
    @JsonKey(name: 'application_documents') List<String>? applicationDocuments,
    @JsonKey(name: 'additional_requirements')
    List<String>? additionalRequirements,
  }) = _Requirements;

  factory Requirements.fromJson(Map<String, dynamic> json) =>
      _$RequirementsFromJson(json);
}

/// Academic requirements
@freezed
abstract class Academic with _$Academic {
  const factory Academic({
    @JsonKey(name: 'minimum_gpa') dynamic minimumGpa, // Can be double or string
    @JsonKey(name: 'education_level') String? educationLevel,
    @JsonKey(name: 'language_requirements')
    Map<String, dynamic>? languageRequirements,
    @JsonKey(name: 'academic_field') List<String>? academicField,
    @JsonKey(name: 'institution_requirements') String? institutionRequirements,
  }) = _Academic;

  factory Academic.fromJson(Map<String, dynamic> json) =>
      _$AcademicFromJson(json);
}

/// Personal criteria requirements
@freezed
abstract class PersonalCriteria with _$PersonalCriteria {
  const factory PersonalCriteria({
    @JsonKey(name: 'age_limit') String? ageLimit,
    @JsonKey(name: 'nationality_restrictions')
    List<String>? nationalityRestrictions,
    @JsonKey(name: 'work_experience') String? workExperience,
    @JsonKey(name: 'other_criteria') List<String>? otherCriteria,
  }) = _PersonalCriteria;

  factory PersonalCriteria.fromJson(Map<String, dynamic> json) =>
      _$PersonalCriteriaFromJson(json);
}

/// Financial details of the scholarship
@freezed
abstract class FinancialDetails with _$FinancialDetails {
  const factory FinancialDetails({
    @JsonKey(name: 'coverage_amount') String? coverageAmount,
    @JsonKey(name: 'what_is_covered') List<String>? whatIsCovered,
    @JsonKey(name: 'additional_benefits') List<String>? additionalBenefits,
    @JsonKey(name: 'funding_duration') String? fundingDuration,
  }) = _FinancialDetails;

  factory FinancialDetails.fromJson(Map<String, dynamic> json) =>
      _$FinancialDetailsFromJson(json);
}

/// Application process information
@freezed
abstract class ApplicationProcess with _$ApplicationProcess {
  const factory ApplicationProcess({
    @JsonKey(name: 'application_steps') List<String>? applicationSteps,
    @JsonKey(name: 'selection_process') List<String>? selectionProcess,
    @JsonKey(name: 'application_fee') String? applicationFee,
    @JsonKey(name: 'interview_required') bool? interviewRequired,
    @JsonKey(name: 'application_tips') List<String>? applicationTips,
  }) = _ApplicationProcess;

  factory ApplicationProcess.fromJson(Map<String, dynamic> json) =>
      _$ApplicationProcessFromJson(json);
}

/// Contact information
@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    String? email,
    String? phone,
    String? website,
    String? address,
    @JsonKey(name: 'contact_person') String? contactPerson,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

/// Additional information
@freezed
abstract class AdditionalInfo with _$AdditionalInfo {
  const factory AdditionalInfo({
    @JsonKey(name: 'success_stories') List<String>? successStories,
    @JsonKey(name: 'alumni_network') String? alumniNetwork,
    @JsonKey(name: 'special_programs') List<String>? specialPrograms,
    @JsonKey(name: 'external_links') List<String>? externalLinks,
  }) = _AdditionalInfo;

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoFromJson(json);
}
