import 'package:freezed_annotation/freezed_annotation.dart';

part 'scholarship_filter.freezed.dart';
part 'scholarship_filter.g.dart';

/// Filter criteria for scholarship discovery
/// This supports the advanced filtering UI shown in your wireframe
@freezed
abstract class ScholarshipFilter with _$ScholarshipFilter {
  const factory ScholarshipFilter({
    // Search query
    @Default('') String searchQuery,
    
    // Education level filters
    @Default([]) List<String> educationLevels, // ['S1', 'S2', 'S3']
    
    // Target countries
    @Default([]) List<String> targetCountries, // ['USA', 'UK', 'Australia']
    
    // Subject areas/fields of study
    @Default([]) List<String> subjectAreas, // ['Engineering', 'Computer Science']
    
    // Funding type filter
    FundingTypeFilter? fundingType,
    
    // Deadline filter
    DeadlineFilter? deadlineFilter,
    
    // GPA range
    double? minGpa,
    double? maxGpa,
    
    // Language requirements
    @Default([]) List<String> languageRequirements, // ['IELTS', 'TOEFL']
    
    // Sort options
    @Default(SortOption.matchScore) SortOption sortBy,
    @Default(SortDirection.descending) SortDirection sortDirection,
  }) = _ScholarshipFilter;

  factory ScholarshipFilter.fromJson(Map<String, dynamic> json) => _$ScholarshipFilterFromJson(json);
}

/// Funding type filter options
enum FundingTypeFilter {
  @JsonValue('all')
  all,
  @JsonValue('full')
  fullFunding,
  @JsonValue('partial')
  partialFunding,
}

/// Deadline filter options
enum DeadlineFilter {
  @JsonValue('30_days')
  next30Days,
  @JsonValue('3_months')
  next3Months,
  @JsonValue('6_months')
  next6Months,
  @JsonValue('custom')
  custom,
}

/// Sort options for scholarship list
enum SortOption {
  @JsonValue('match_score')
  matchScore,
  @JsonValue('deadline')
  deadline,
  @JsonValue('funding_amount')
  fundingAmount,
  @JsonValue('alphabetical')
  alphabetical,
  @JsonValue('newest')
  newest,
}

/// Sort direction
enum SortDirection {
  @JsonValue('asc')
  ascending,
  @JsonValue('desc')
  descending,
}

/// Quick filter chips for the horizontal scrollable filter bar
@freezed
abstract class QuickFilter with _$QuickFilter {
  const factory QuickFilter({
    required String id,
    required String label,
    required String emoji,
    @Default(false) bool isSelected,
    required QuickFilterType type,
    String? value, // The actual filter value
  }) = _QuickFilter;

  factory QuickFilter.fromJson(Map<String, dynamic> json) => _$QuickFilterFromJson(json);
}

/// Types of quick filters
enum QuickFilterType {
  @JsonValue('all')
  all,
  @JsonValue('education_level')
  educationLevel,
  @JsonValue('country')
  country,
  @JsonValue('subject')
  subject,
  @JsonValue('funding')
  funding,
  @JsonValue('deadline')
  deadline,
}

/// Predefined quick filters for common use cases
class QuickFilters {
  static const List<QuickFilter> defaultFilters = [
    QuickFilter(
      id: 'all',
      label: 'All',
      emoji: '🌟',
      type: QuickFilterType.all,
    ),
    QuickFilter(
      id: 's1',
      label: 'S1',
      emoji: '🎓',
      type: QuickFilterType.educationLevel,
      value: 'Bachelor',
    ),
    QuickFilter(
      id: 's2',
      label: 'S2',
      emoji: '📚',
      type: QuickFilterType.educationLevel,
      value: 'Master',
    ),
    QuickFilter(
      id: 's3',
      label: 'S3',
      emoji: '👨‍🎓',
      type: QuickFilterType.educationLevel,
      value: 'PhD',
    ),
    QuickFilter(
      id: 'usa',
      label: 'USA',
      emoji: '🇺🇸',
      type: QuickFilterType.country,
      value: 'United States',
    ),
    QuickFilter(
      id: 'uk',
      label: 'UK',
      emoji: '🇬🇧',
      type: QuickFilterType.country,
      value: 'United Kingdom',
    ),
    QuickFilter(
      id: 'aus',
      label: 'AUS',
      emoji: '🇦🇺',
      type: QuickFilterType.country,
      value: 'Australia',
    ),
    QuickFilter(
      id: 'tech',
      label: 'Tech',
      emoji: '💻',
      type: QuickFilterType.subject,
      value: 'Computer Science',
    ),
    QuickFilter(
      id: 'eng',
      label: 'Eng',
      emoji: '⚙️',
      type: QuickFilterType.subject,
      value: 'Engineering',
    ),
    QuickFilter(
      id: 'full',
      label: 'Full',
      emoji: '💰',
      type: QuickFilterType.funding,
      value: 'Full Scholarship',
    ),
    QuickFilter(
      id: 'urgent',
      label: 'Urgent',
      emoji: '⏰',
      type: QuickFilterType.deadline,
      value: '30_days',
    ),
  ];
}
