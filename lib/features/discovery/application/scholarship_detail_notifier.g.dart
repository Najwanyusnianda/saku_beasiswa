// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scholarship_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scholarshipDetailNotifierHash() =>
    r'a62c4259e31c334cf0da1f9c1882ae4abb25c792';

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

abstract class _$ScholarshipDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Scholarship> {
  late final String scholarshipId;

  FutureOr<Scholarship> build(String scholarshipId);
}

/// Notifier for managing individual scholarship detail state
/// This loads rich scholarship data from individual JSON files
///
/// Copied from [ScholarshipDetailNotifier].
@ProviderFor(ScholarshipDetailNotifier)
const scholarshipDetailNotifierProvider = ScholarshipDetailNotifierFamily();

/// Notifier for managing individual scholarship detail state
/// This loads rich scholarship data from individual JSON files
///
/// Copied from [ScholarshipDetailNotifier].
class ScholarshipDetailNotifierFamily extends Family<AsyncValue<Scholarship>> {
  /// Notifier for managing individual scholarship detail state
  /// This loads rich scholarship data from individual JSON files
  ///
  /// Copied from [ScholarshipDetailNotifier].
  const ScholarshipDetailNotifierFamily();

  /// Notifier for managing individual scholarship detail state
  /// This loads rich scholarship data from individual JSON files
  ///
  /// Copied from [ScholarshipDetailNotifier].
  ScholarshipDetailNotifierProvider call(String scholarshipId) {
    return ScholarshipDetailNotifierProvider(scholarshipId);
  }

  @override
  ScholarshipDetailNotifierProvider getProviderOverride(
    covariant ScholarshipDetailNotifierProvider provider,
  ) {
    return call(provider.scholarshipId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scholarshipDetailNotifierProvider';
}

/// Notifier for managing individual scholarship detail state
/// This loads rich scholarship data from individual JSON files
///
/// Copied from [ScholarshipDetailNotifier].
class ScholarshipDetailNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ScholarshipDetailNotifier,
          Scholarship
        > {
  /// Notifier for managing individual scholarship detail state
  /// This loads rich scholarship data from individual JSON files
  ///
  /// Copied from [ScholarshipDetailNotifier].
  ScholarshipDetailNotifierProvider(String scholarshipId)
    : this._internal(
        () => ScholarshipDetailNotifier()..scholarshipId = scholarshipId,
        from: scholarshipDetailNotifierProvider,
        name: r'scholarshipDetailNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$scholarshipDetailNotifierHash,
        dependencies: ScholarshipDetailNotifierFamily._dependencies,
        allTransitiveDependencies:
            ScholarshipDetailNotifierFamily._allTransitiveDependencies,
        scholarshipId: scholarshipId,
      );

  ScholarshipDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scholarshipId,
  }) : super.internal();

  final String scholarshipId;

  @override
  FutureOr<Scholarship> runNotifierBuild(
    covariant ScholarshipDetailNotifier notifier,
  ) {
    return notifier.build(scholarshipId);
  }

  @override
  Override overrideWith(ScholarshipDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ScholarshipDetailNotifierProvider._internal(
        () => create()..scholarshipId = scholarshipId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scholarshipId: scholarshipId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ScholarshipDetailNotifier,
    Scholarship
  >
  createElement() {
    return _ScholarshipDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScholarshipDetailNotifierProvider &&
        other.scholarshipId == scholarshipId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scholarshipId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ScholarshipDetailNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Scholarship> {
  /// The parameter `scholarshipId` of this provider.
  String get scholarshipId;
}

class _ScholarshipDetailNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ScholarshipDetailNotifier,
          Scholarship
        >
    with ScholarshipDetailNotifierRef {
  _ScholarshipDetailNotifierProviderElement(super.provider);

  @override
  String get scholarshipId =>
      (origin as ScholarshipDetailNotifierProvider).scholarshipId;
}

String _$savedScholarshipsDetailNotifierHash() =>
    r'b943855c407330f03b9978f8bb153a1d435bccec';

abstract class _$SavedScholarshipsDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Scholarship>> {
  late final List<String> scholarshipIds;

  FutureOr<List<Scholarship>> build(List<String> scholarshipIds);
}

/// Provider for getting saved scholarship details
///
/// Copied from [SavedScholarshipsDetailNotifier].
@ProviderFor(SavedScholarshipsDetailNotifier)
const savedScholarshipsDetailNotifierProvider =
    SavedScholarshipsDetailNotifierFamily();

/// Provider for getting saved scholarship details
///
/// Copied from [SavedScholarshipsDetailNotifier].
class SavedScholarshipsDetailNotifierFamily
    extends Family<AsyncValue<List<Scholarship>>> {
  /// Provider for getting saved scholarship details
  ///
  /// Copied from [SavedScholarshipsDetailNotifier].
  const SavedScholarshipsDetailNotifierFamily();

  /// Provider for getting saved scholarship details
  ///
  /// Copied from [SavedScholarshipsDetailNotifier].
  SavedScholarshipsDetailNotifierProvider call(List<String> scholarshipIds) {
    return SavedScholarshipsDetailNotifierProvider(scholarshipIds);
  }

  @override
  SavedScholarshipsDetailNotifierProvider getProviderOverride(
    covariant SavedScholarshipsDetailNotifierProvider provider,
  ) {
    return call(provider.scholarshipIds);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savedScholarshipsDetailNotifierProvider';
}

/// Provider for getting saved scholarship details
///
/// Copied from [SavedScholarshipsDetailNotifier].
class SavedScholarshipsDetailNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          SavedScholarshipsDetailNotifier,
          List<Scholarship>
        > {
  /// Provider for getting saved scholarship details
  ///
  /// Copied from [SavedScholarshipsDetailNotifier].
  SavedScholarshipsDetailNotifierProvider(List<String> scholarshipIds)
    : this._internal(
        () =>
            SavedScholarshipsDetailNotifier()..scholarshipIds = scholarshipIds,
        from: savedScholarshipsDetailNotifierProvider,
        name: r'savedScholarshipsDetailNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$savedScholarshipsDetailNotifierHash,
        dependencies: SavedScholarshipsDetailNotifierFamily._dependencies,
        allTransitiveDependencies:
            SavedScholarshipsDetailNotifierFamily._allTransitiveDependencies,
        scholarshipIds: scholarshipIds,
      );

  SavedScholarshipsDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scholarshipIds,
  }) : super.internal();

  final List<String> scholarshipIds;

  @override
  FutureOr<List<Scholarship>> runNotifierBuild(
    covariant SavedScholarshipsDetailNotifier notifier,
  ) {
    return notifier.build(scholarshipIds);
  }

  @override
  Override overrideWith(SavedScholarshipsDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SavedScholarshipsDetailNotifierProvider._internal(
        () => create()..scholarshipIds = scholarshipIds,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scholarshipIds: scholarshipIds,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    SavedScholarshipsDetailNotifier,
    List<Scholarship>
  >
  createElement() {
    return _SavedScholarshipsDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavedScholarshipsDetailNotifierProvider &&
        other.scholarshipIds == scholarshipIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scholarshipIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SavedScholarshipsDetailNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Scholarship>> {
  /// The parameter `scholarshipIds` of this provider.
  List<String> get scholarshipIds;
}

class _SavedScholarshipsDetailNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          SavedScholarshipsDetailNotifier,
          List<Scholarship>
        >
    with SavedScholarshipsDetailNotifierRef {
  _SavedScholarshipsDetailNotifierProviderElement(super.provider);

  @override
  List<String> get scholarshipIds =>
      (origin as SavedScholarshipsDetailNotifierProvider).scholarshipIds;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
