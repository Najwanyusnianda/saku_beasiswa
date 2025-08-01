/// Data Transfer Object for scholarship filtering
/// This prevents the presentation layer from directly importing domain models
/// Following Clean Architecture: Presentation → Application layer only
class ScholarshipFilterDto {
  final String searchQuery;
  final FundingTypeFilterDto? fundingType;
  final List<String> educationLevels;
  final List<String> targetCountries;
  final List<String> subjectAreas;
  final SortOptionDto sortOption;
  final SortDirectionDto sortDirection;
  final double? minMatchScore;
  final DateTime? maxDeadline;

  const ScholarshipFilterDto({
    this.searchQuery = '',
    this.fundingType,
    this.educationLevels = const [],
    this.targetCountries = const [],
    this.subjectAreas = const [],
    this.sortOption = SortOptionDto.deadline,
    this.sortDirection = SortDirectionDto.ascending,
    this.minMatchScore,
    this.maxDeadline,
  });

  ScholarshipFilterDto copyWith({
    String? searchQuery,
    FundingTypeFilterDto? fundingType,
    List<String>? educationLevels,
    List<String>? targetCountries,
    List<String>? subjectAreas,
    SortOptionDto? sortOption,
    SortDirectionDto? sortDirection,
    double? minMatchScore,
    DateTime? maxDeadline,
  }) {
    return ScholarshipFilterDto(
      searchQuery: searchQuery ?? this.searchQuery,
      fundingType: fundingType ?? this.fundingType,
      educationLevels: educationLevels ?? this.educationLevels,
      targetCountries: targetCountries ?? this.targetCountries,
      subjectAreas: subjectAreas ?? this.subjectAreas,
      sortOption: sortOption ?? this.sortOption,
      sortDirection: sortDirection ?? this.sortDirection,
      minMatchScore: minMatchScore ?? this.minMatchScore,
      maxDeadline: maxDeadline ?? this.maxDeadline,
    );
  }
}

enum FundingTypeFilterDto {
  all,
  fullFunding,
  partialFunding,
}

enum SortOptionDto {
  deadline,
  matchScore,
  fundingAmount,
  title,
  provider,
  createdAt,
}

enum SortDirectionDto {
  ascending,
  descending,
}
