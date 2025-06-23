// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTemplatesHash() => r'c8343db6157c821686eb04146896947fb33c7147';

/// See also [filteredTemplates].
@ProviderFor(filteredTemplates)
final filteredTemplatesProvider =
    AutoDisposeStreamProvider<List<TemplateWithStatus>>.internal(
      filteredTemplates,
      name: r'filteredTemplatesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$filteredTemplatesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTemplatesRef =
    AutoDisposeStreamProviderRef<List<TemplateWithStatus>>;
String _$recommendedTemplatesHash() =>
    r'a1afa94aac256cab8a3a00f23f717aa7e8f0a506';

/// See also [recommendedTemplates].
@ProviderFor(recommendedTemplates)
final recommendedTemplatesProvider =
    AutoDisposeFutureProvider<List<TemplateWithStatus>>.internal(
      recommendedTemplates,
      name: r'recommendedTemplatesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recommendedTemplatesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecommendedTemplatesRef =
    AutoDisposeFutureProviderRef<List<TemplateWithStatus>>;
String _$templateSearchQueryHash() =>
    r'4e73117aa4bf5ec5de2be2a9578f1a08d77ac3ed';

/// See also [TemplateSearchQuery].
@ProviderFor(TemplateSearchQuery)
final templateSearchQueryProvider =
    AutoDisposeNotifierProvider<TemplateSearchQuery, String>.internal(
      TemplateSearchQuery.new,
      name: r'templateSearchQueryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$templateSearchQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TemplateSearchQuery = AutoDisposeNotifier<String>;
String _$templateRegionFilterHash() =>
    r'c76bc4983415a3740a67c47984bcca56426bbe2f';

/// See also [TemplateRegionFilter].
@ProviderFor(TemplateRegionFilter)
final templateRegionFilterProvider =
    AutoDisposeNotifierProvider<TemplateRegionFilter, String>.internal(
      TemplateRegionFilter.new,
      name: r'templateRegionFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$templateRegionFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TemplateRegionFilter = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
