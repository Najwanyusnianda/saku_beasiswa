// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scholarship_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScholarshipFilter _$ScholarshipFilterFromJson(Map<String, dynamic> json) =>
    _ScholarshipFilter(
      searchQuery: json['searchQuery'] as String? ?? '',
      educationLevels:
          (json['educationLevels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      targetCountries:
          (json['targetCountries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subjectAreas:
          (json['subjectAreas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fundingType: $enumDecodeNullable(
        _$FundingTypeFilterEnumMap,
        json['fundingType'],
      ),
      deadlineFilter: $enumDecodeNullable(
        _$DeadlineFilterEnumMap,
        json['deadlineFilter'],
      ),
      minGpa: (json['minGpa'] as num?)?.toDouble(),
      maxGpa: (json['maxGpa'] as num?)?.toDouble(),
      languageRequirements:
          (json['languageRequirements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sortBy:
          $enumDecodeNullable(_$SortOptionEnumMap, json['sortBy']) ??
          SortOption.matchScore,
      sortDirection:
          $enumDecodeNullable(_$SortDirectionEnumMap, json['sortDirection']) ??
          SortDirection.descending,
    );

Map<String, dynamic> _$ScholarshipFilterToJson(_ScholarshipFilter instance) =>
    <String, dynamic>{
      'searchQuery': instance.searchQuery,
      'educationLevels': instance.educationLevels,
      'targetCountries': instance.targetCountries,
      'subjectAreas': instance.subjectAreas,
      'fundingType': _$FundingTypeFilterEnumMap[instance.fundingType],
      'deadlineFilter': _$DeadlineFilterEnumMap[instance.deadlineFilter],
      'minGpa': instance.minGpa,
      'maxGpa': instance.maxGpa,
      'languageRequirements': instance.languageRequirements,
      'sortBy': _$SortOptionEnumMap[instance.sortBy]!,
      'sortDirection': _$SortDirectionEnumMap[instance.sortDirection]!,
    };

const _$FundingTypeFilterEnumMap = {
  FundingTypeFilter.all: 'all',
  FundingTypeFilter.fullFunding: 'full',
  FundingTypeFilter.partialFunding: 'partial',
};

const _$DeadlineFilterEnumMap = {
  DeadlineFilter.next30Days: '30_days',
  DeadlineFilter.next3Months: '3_months',
  DeadlineFilter.next6Months: '6_months',
  DeadlineFilter.custom: 'custom',
};

const _$SortOptionEnumMap = {
  SortOption.matchScore: 'match_score',
  SortOption.deadline: 'deadline',
  SortOption.fundingAmount: 'funding_amount',
  SortOption.alphabetical: 'alphabetical',
  SortOption.newest: 'newest',
};

const _$SortDirectionEnumMap = {
  SortDirection.ascending: 'asc',
  SortDirection.descending: 'desc',
};

_QuickFilter _$QuickFilterFromJson(Map<String, dynamic> json) => _QuickFilter(
  id: json['id'] as String,
  label: json['label'] as String,
  emoji: json['emoji'] as String,
  isSelected: json['isSelected'] as bool? ?? false,
  type: $enumDecode(_$QuickFilterTypeEnumMap, json['type']),
  value: json['value'] as String?,
);

Map<String, dynamic> _$QuickFilterToJson(_QuickFilter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'emoji': instance.emoji,
      'isSelected': instance.isSelected,
      'type': _$QuickFilterTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$QuickFilterTypeEnumMap = {
  QuickFilterType.all: 'all',
  QuickFilterType.educationLevel: 'education_level',
  QuickFilterType.country: 'country',
  QuickFilterType.subject: 'subject',
  QuickFilterType.funding: 'funding',
  QuickFilterType.deadline: 'deadline',
};
