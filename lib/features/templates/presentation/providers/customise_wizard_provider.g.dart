// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customise_wizard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customiseWizardHash() => r'b4d6e2d28b47f72e813ab9f40e26cf4fdde7b41a';

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

abstract class _$CustomiseWizard
    extends BuildlessAutoDisposeAsyncNotifier<CustomiseWizardState> {
  late final String templateId;

  FutureOr<CustomiseWizardState> build(String templateId);
}

/// See also [CustomiseWizard].
@ProviderFor(CustomiseWizard)
const customiseWizardProvider = CustomiseWizardFamily();

/// See also [CustomiseWizard].
class CustomiseWizardFamily extends Family<AsyncValue<CustomiseWizardState>> {
  /// See also [CustomiseWizard].
  const CustomiseWizardFamily();

  /// See also [CustomiseWizard].
  CustomiseWizardProvider call(String templateId) {
    return CustomiseWizardProvider(templateId);
  }

  @override
  CustomiseWizardProvider getProviderOverride(
    covariant CustomiseWizardProvider provider,
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
  String? get name => r'customiseWizardProvider';
}

/// See also [CustomiseWizard].
class CustomiseWizardProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          CustomiseWizard,
          CustomiseWizardState
        > {
  /// See also [CustomiseWizard].
  CustomiseWizardProvider(String templateId)
    : this._internal(
        () => CustomiseWizard()..templateId = templateId,
        from: customiseWizardProvider,
        name: r'customiseWizardProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$customiseWizardHash,
        dependencies: CustomiseWizardFamily._dependencies,
        allTransitiveDependencies:
            CustomiseWizardFamily._allTransitiveDependencies,
        templateId: templateId,
      );

  CustomiseWizardProvider._internal(
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
  FutureOr<CustomiseWizardState> runNotifierBuild(
    covariant CustomiseWizard notifier,
  ) {
    return notifier.build(templateId);
  }

  @override
  Override overrideWith(CustomiseWizard Function() create) {
    return ProviderOverride(
      origin: this,
      override: CustomiseWizardProvider._internal(
        () => create()..templateId = templateId,
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
  AutoDisposeAsyncNotifierProviderElement<CustomiseWizard, CustomiseWizardState>
  createElement() {
    return _CustomiseWizardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomiseWizardProvider && other.templateId == templateId;
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
mixin CustomiseWizardRef
    on AutoDisposeAsyncNotifierProviderRef<CustomiseWizardState> {
  /// The parameter `templateId` of this provider.
  String get templateId;
}

class _CustomiseWizardProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CustomiseWizard,
          CustomiseWizardState
        >
    with CustomiseWizardRef {
  _CustomiseWizardProviderElement(super.provider);

  @override
  String get templateId => (origin as CustomiseWizardProvider).templateId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
