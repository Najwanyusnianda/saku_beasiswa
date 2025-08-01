import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/models/scholarship_filter.dart';
import '../domain/models/scholarship_match.dart';
import '../domain/i_scholarship_repository.dart';
import '../infrastructure/providers/discovery_providers.dart';
import 'dtos/scholarship_card_dto.dart';
import 'dtos/scholarship_filter_dto.dart';

part 'discovery_notifier.g.dart';

/// State for the scholarship discovery screen using DTOs
/// This prevents presentation layer from importing domain models directly
class DiscoveryState {
  const DiscoveryState({
    this.scholarships = const [],
    this.filter = const ScholarshipFilterDto(),
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  final List<ScholarshipCardDto> scholarships;
  final ScholarshipFilterDto filter;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  DiscoveryState copyWith({
    List<ScholarshipCardDto>? scholarships,
    ScholarshipFilterDto? filter,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return DiscoveryState(
      scholarships: scholarships ?? this.scholarships,
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error ?? this.error,
    );
  }
}

/// Notifier for managing scholarship discovery state
/// This is the main business logic controller for the discovery feature
@riverpod
class DiscoveryNotifier extends _$DiscoveryNotifier {
  @override
  DiscoveryState build() {
    return const DiscoveryState();
  }

  /// Get repository instance through dependency injection
  IScholarshipRepository get _repository =>
      ref.read(scholarshipRepositoryProvider);

  /// Convert DTO filter to domain filter for repository calls
  ScholarshipFilter _dtoToDomainFilter(ScholarshipFilterDto dto) {
    return ScholarshipFilter(
      searchQuery: dto.searchQuery,
      educationLevels: dto.educationLevels,
      targetCountries: dto.targetCountries,
      subjectAreas: dto.subjectAreas,
      fundingType: _mapFundingTypeToModel(dto.fundingType),
      sortBy: _mapSortOptionToModel(dto.sortOption),
      sortDirection: _mapSortDirectionToModel(dto.sortDirection),
    );
  }

  /// Convert domain scholarship card data to DTO for presentation layer
  List<ScholarshipCardDto> _domainToDto(List<ScholarshipCardData> domainCards) {
    return domainCards.map((card) => ScholarshipCardDto(
      id: card.id,
      title: card.title,
      provider: card.provider,
      providerCountry: card.providerCountry,
      countryFlag: card.countryFlag,
      fundingType: card.fundingType,
      fundingAmount: card.fundingAmount,
      degreeLevel: card.degreeLevel,
      applicationDeadline: card.applicationDeadline,
      matchScore: card.matchScore,
      isSaved: card.isSaved,
      isInApplicationPlan: card.isInApplicationPlan,
      scholarshipEmoji: card.scholarshipEmoji,
      quickTags: card.quickTags,
      subjectAreas: card.subjectAreas,
    )).toList();
  }

  /// Convert DTO filter to domain filter for filter updates
  ScholarshipFilterDto _domainToFilterDto(ScholarshipFilter domainFilter) {
    return ScholarshipFilterDto(
      searchQuery: domainFilter.searchQuery,
      educationLevels: domainFilter.educationLevels,
      targetCountries: domainFilter.targetCountries,
      subjectAreas: domainFilter.subjectAreas,
      fundingType: _mapFundingTypeToDto(domainFilter.fundingType),
      sortOption: _mapSortOptionToDto(domainFilter.sortBy),
      sortDirection: _mapSortDirectionToDto(domainFilter.sortDirection),
    );
  }

  FundingTypeFilter? _mapFundingTypeToModel(FundingTypeFilterDto? dto) {
    switch (dto) {
      case FundingTypeFilterDto.all:
        return FundingTypeFilter.all;
      case FundingTypeFilterDto.fullFunding:
        return FundingTypeFilter.fullFunding;
      case FundingTypeFilterDto.partialFunding:
        return FundingTypeFilter.partialFunding;
      case null:
        return null;
    }
  }

  FundingTypeFilterDto? _mapFundingTypeToDto(FundingTypeFilter? model) {
    switch (model) {
      case FundingTypeFilter.all:
        return FundingTypeFilterDto.all;
      case FundingTypeFilter.fullFunding:
        return FundingTypeFilterDto.fullFunding;
      case FundingTypeFilter.partialFunding:
        return FundingTypeFilterDto.partialFunding;
      case null:
        return null;
    }
  }

  SortOption _mapSortOptionToModel(SortOptionDto dto) {
    switch (dto) {
      case SortOptionDto.deadline:
        return SortOption.deadline;
      case SortOptionDto.matchScore:
        return SortOption.matchScore;
      case SortOptionDto.fundingAmount:
        return SortOption.fundingAmount;
      case SortOptionDto.title:
        return SortOption.alphabetical;
      case SortOptionDto.provider:
        return SortOption.alphabetical;
      case SortOptionDto.createdAt:
        return SortOption.newest;
    }
  }

  SortOptionDto _mapSortOptionToDto(SortOption model) {
    switch (model) {
      case SortOption.deadline:
        return SortOptionDto.deadline;
      case SortOption.matchScore:
        return SortOptionDto.matchScore;
      case SortOption.fundingAmount:
        return SortOptionDto.fundingAmount;
      case SortOption.alphabetical:
        return SortOptionDto.title;
      case SortOption.newest:
        return SortOptionDto.createdAt;
    }
  }

  SortDirection _mapSortDirectionToModel(SortDirectionDto dto) {
    switch (dto) {
      case SortDirectionDto.ascending:
        return SortDirection.ascending;
      case SortDirectionDto.descending:
        return SortDirection.descending;
    }
  }

  SortDirectionDto _mapSortDirectionToDto(SortDirection model) {
    switch (model) {
      case SortDirection.ascending:
        return SortDirectionDto.ascending;
      case SortDirection.descending:
        return SortDirectionDto.descending;
    }
  }

  /// Load initial scholarships
  Future<void> loadScholarships() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Convert DTO filter to domain filter for repository call
      final domainFilter = _dtoToDomainFilter(state.filter);
      
      // Load real scholarship data from the compiled index
      final scholarships = await _repository.getScholarshipCards(
        filter: domainFilter,
        limit: 20,
      );

      state = state.copyWith(
        scholarships: _domainToDto(scholarships),
        isLoading: false,
        hasMore: scholarships.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load scholarships: $e',
      );
    }
  }

  /// Load more scholarships (pagination)
  Future<void> loadMoreScholarships() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);

    try {
      // Convert DTO filter to domain filter for repository call
      final domainFilter = _dtoToDomainFilter(state.filter);
      
      // Load more scholarships with offset
      final moreScholarships = await _repository.getScholarshipCards(
        filter: domainFilter,
        limit: 20,
        offset: state.scholarships.length,
      );

      state = state.copyWith(
        scholarships: [...state.scholarships, ..._domainToDto(moreScholarships)],
        isLoading: false,
        hasMore: moreScholarships.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load more scholarships: $e',
      );
    }
  }

  /// Apply filter to scholarship results
  Future<void> applyFilter(ScholarshipFilterDto filter) async {
    state = state.copyWith(filter: filter, isLoading: true);

    try {
      // Convert DTO filter to domain filter for repository call
      final domainFilter = _dtoToDomainFilter(filter);
      
      // Apply real filtering through repository
      final filteredScholarships = await _repository.getScholarshipCards(
        filter: domainFilter,
      );

      state = state.copyWith(
        scholarships: _domainToDto(filteredScholarships),
        isLoading: false,
        hasMore: filteredScholarships.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to filter scholarships: $e',
      );
    }
  }

  /// Search scholarships by query
  Future<void> searchScholarships(String query) async {
    state = state.copyWith(isLoading: true);

    try {
      // Use repository search functionality
      final searchResults = await _repository.searchScholarshipCards(query);

      state = state.copyWith(
        scholarships: _domainToDto(searchResults),
        isLoading: false,
        hasMore: false, // Search results don't support pagination
        filter: state.filter.copyWith(searchQuery: query),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to search scholarships: $e',
      );
    }
  }

  /// Toggle saved status of a scholarship
  Future<void> toggleSavedStatus(String scholarshipId) async {
    try {
      // Find the scholarship in current state
      final scholarship = state.scholarships.firstWhere(
        (s) => s.id == scholarshipId,
        orElse: () => throw Exception('Scholarship not found'),
      );

      // Toggle in repository (need userId - using 1 for now)
      const userId = 1; // TODO: Get from user session
      if (scholarship.isSaved) {
        await _repository.unsaveScholarship(userId, scholarshipId);
      } else {
        await _repository.saveScholarship(userId, scholarshipId);
      }

      // Update local state
      final updatedScholarships = state.scholarships.map((scholarship) {
        if (scholarship.id == scholarshipId) {
          return scholarship.copyWith(isSaved: !scholarship.isSaved);
        }
        return scholarship;
      }).toList();

      state = state.copyWith(scholarships: updatedScholarships);
    } catch (e) {
      state = state.copyWith(error: 'Failed to update saved status: $e');
    }
  }

  /// Update search query and filter results
  void updateSearchQuery(String query) {
    final updatedFilter = state.filter.copyWith(searchQuery: query);
    applyFilter(updatedFilter);
  }

  /// Toggle quick filter
  void toggleQuickFilter(QuickFilter filter) {
    // For now, just update the search - this can be expanded for specific filter types
    if (filter.type == QuickFilterType.all) {
      clearFilters();
    } else {
      // Apply specific filter based on type
      final updatedFilter = _applyQuickFilterDto(state.filter, filter);
      applyFilter(updatedFilter);
    }
  }

  /// Clear all filters
  void clearFilters() {
    applyFilter(const ScholarshipFilterDto());
  }

  /// Refresh scholarships (pull to refresh)
  Future<void> refreshScholarships() async {
    await loadScholarships();
  }

  ScholarshipFilterDto _applyQuickFilterDto(
    ScholarshipFilterDto currentFilter,
    QuickFilter quickFilter,
  ) {
    switch (quickFilter.type) {
      case QuickFilterType.educationLevel:
        return currentFilter.copyWith(
          educationLevels: [quickFilter.value ?? quickFilter.label],
        );
      case QuickFilterType.country:
        return currentFilter.copyWith(
          targetCountries: [quickFilter.value ?? quickFilter.label],
        );
      case QuickFilterType.subject:
        return currentFilter.copyWith(
          subjectAreas: [quickFilter.value ?? quickFilter.label],
        );
      case QuickFilterType.funding:
        return currentFilter.copyWith(
          fundingType: quickFilter.value == 'Full Scholarship'
              ? FundingTypeFilterDto.fullFunding
              : FundingTypeFilterDto.partialFunding,
        );
      case QuickFilterType.deadline:
        // Note: DTO doesn't have deadline filter, so we skip this for now
        return currentFilter;
      case QuickFilterType.all:
        return const ScholarshipFilterDto();
    }
  }

  /// Clear current error
  void clearError() {
    state = state.copyWith(error: null);
  }
}
