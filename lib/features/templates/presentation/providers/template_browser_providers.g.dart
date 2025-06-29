// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_browser_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allTemplatesHash() => r'feda8dd0650802fb9b616143a2b3978217798e96';

/// See also [allTemplates].
@ProviderFor(allTemplates)
final allTemplatesProvider =
    AutoDisposeStreamProvider<List<ScholarshipTemplate>>.internal(
      allTemplates,
      name: r'allTemplatesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$allTemplatesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllTemplatesRef =
    AutoDisposeStreamProviderRef<List<ScholarshipTemplate>>;
String _$templateDetailHash() => r'7dd4142a2dd6fb8f44274ae095880496773eee20';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [templateDetail].
@ProviderFor(templateDetail)
const templateDetailProvider = TemplateDetailFamily();

/// See also [templateDetail].
class TemplateDetailFamily extends Family<AsyncValue<FullTemplatePlan>> {
  /// See also [templateDetail].
  const TemplateDetailFamily();

  /// See also [templateDetail].
  TemplateDetailProvider call(String templateId) {
    return TemplateDetailProvider(templateId);
  }

  @override
  TemplateDetailProvider getProviderOverride(
    covariant TemplateDetailProvider provider,
  ) {
    return call(provider.templateId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'templateDetailProvider';
}

/// See also [templateDetail].
class TemplateDetailProvider
    extends AutoDisposeFutureProvider<FullTemplatePlan> {
  /// See also [templateDetail].
  TemplateDetailProvider(String templateId)
    : this._internal(
        (ref) => templateDetail(ref as TemplateDetailRef, templateId),
        from: templateDetailProvider,
        name: r'templateDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$templateDetailHash,
        dependencies: TemplateDetailFamily._dependencies,
        allTransitiveDependencies:
            TemplateDetailFamily._allTransitiveDependencies,
        templateId: templateId,
      );

  TemplateDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.templateId,
  }) : super.internal();

  final String templateId;

  @override
  Override overrideWith(
    FutureOr<FullTemplatePlan> Function(TemplateDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TemplateDetailProvider._internal(
        (ref) => create(ref as TemplateDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        templateId: templateId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FullTemplatePlan> createElement() {
    return _TemplateDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TemplateDetailProvider && other.templateId == templateId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, templateId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TemplateDetailRef on AutoDisposeFutureProviderRef<FullTemplatePlan> {
  /// The parameter `templateId` of this provider.
  String get templateId;
}

class _TemplateDetailProviderElement
    extends AutoDisposeFutureProviderElement<FullTemplatePlan>
    with TemplateDetailRef {
  _TemplateDetailProviderElement(super.provider);

  @override
  String get templateId => (origin as TemplateDetailProvider).templateId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
