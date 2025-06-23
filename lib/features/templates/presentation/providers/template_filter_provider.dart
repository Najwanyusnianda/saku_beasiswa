//lib/features/templates/presentation/providers/template_filter_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_browser_providers.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_matching_provider.dart';


part 'template_filter_provider.g.dart';

// --- State Providers for UI Controls ---

@riverpod
class TemplateSearchQuery extends _$TemplateSearchQuery {
  @override
  String build() => '';

  void setSearchQuery(String query) {
    state = query;
  }
}

@riverpod
class TemplateRegionFilter extends _$TemplateRegionFilter {
  @override
  String build() => 'All'; // Default filter value

  void setFilter(String region) {
    state = region;
  }
}

class TemplateWithStatus {
  final ScholarshipTemplate template;
  final bool isAdded;

  TemplateWithStatus({required this.template, required this.isAdded});
}


@riverpod
Stream<List<TemplateWithStatus>> filteredTemplates(Ref ref) {

  final allTemplatesAsync = ref.watch(allTemplatesProvider);
  final myApplicationsAsync = ref.watch(myApplicationsProvider);
  final searchQuery = ref.watch(templateSearchQueryProvider);
  final regionFilter = ref.watch(templateRegionFilterProvider);

  // We need to handle the loading/error states of our dependencies
  if (allTemplatesAsync.isLoading || myApplicationsAsync.isLoading) {
    return Stream.value([]); // Return empty list while loading
  }

  if (allTemplatesAsync.hasError || myApplicationsAsync.hasError) {
    throw Exception('Failed to load data for filtering.');
  }
  
  final templates = allTemplatesAsync.value!;
  final applications = myApplicationsAsync.value!;
  final addedTemplateIds = applications.map((app) => app.template.id).toSet();
  final filtered = templates.where((template) {
    // Region Filter Logic
    //final regionMatch = regionFilter == 'All' || template.region == regionFilter;

    // Search Query Filter Logic
    final searchMatch = searchQuery.isEmpty ||
                        template.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                        template.providerName.toLowerCase().contains(searchQuery.toLowerCase());
    
    return searchMatch;
  }).toList();

  // Map the final list to our new data class with the "added" status
  final result = filtered.map((template) {
    return TemplateWithStatus(
      template: template,
      isAdded: addedTemplateIds.contains(template.id),
    );
  }).toList();
  
  // Return the result as a stream for the UI
  return Stream.value(result);
}

// --- Provider for "For You" section ---
@riverpod
Future<List<TemplateWithStatus>> recommendedTemplates(Ref ref) async {
  // Watch the matching templates future
  final matchingTemplates = await ref.watch(matchingTemplatesProvider.future);
  
  // Watch the current applications to determine 'isAdded' status
  // Using .future to await the initial list
  final myApplications = await ref.watch(myApplicationsProvider.future);
    final addedTemplateIds = myApplications.map((app) => app.template.id).toSet();

  // Map to the TemplateWithStatus class
  final result = matchingTemplates.map((template) {
    return TemplateWithStatus(
      template: template,
      isAdded: addedTemplateIds.contains(template.id),
    );
  }).toList();

  return result;
}
