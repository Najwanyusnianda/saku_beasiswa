// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_score_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchTestScoresHash() => r'e2b3842731c7eac11a8e628c900ff05a177aa0dc';

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

/// See also [watchTestScores].
@ProviderFor(watchTestScores)
const watchTestScoresProvider = WatchTestScoresFamily();

/// See also [watchTestScores].
class WatchTestScoresFamily extends Family<AsyncValue<List<TestScore>>> {
  /// See also [watchTestScores].
  const WatchTestScoresFamily();

  /// See also [watchTestScores].
  WatchTestScoresProvider call(int userId) {
    return WatchTestScoresProvider(userId);
  }

  @override
  WatchTestScoresProvider getProviderOverride(
    covariant WatchTestScoresProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchTestScoresProvider';
}

/// See also [watchTestScores].
class WatchTestScoresProvider
    extends AutoDisposeStreamProvider<List<TestScore>> {
  /// See also [watchTestScores].
  WatchTestScoresProvider(int userId)
    : this._internal(
        (ref) => watchTestScores(ref as WatchTestScoresRef, userId),
        from: watchTestScoresProvider,
        name: r'watchTestScoresProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$watchTestScoresHash,
        dependencies: WatchTestScoresFamily._dependencies,
        allTransitiveDependencies:
            WatchTestScoresFamily._allTransitiveDependencies,
        userId: userId,
      );

  WatchTestScoresProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    Stream<List<TestScore>> Function(WatchTestScoresRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchTestScoresProvider._internal(
        (ref) => create(ref as WatchTestScoresRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<TestScore>> createElement() {
    return _WatchTestScoresProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchTestScoresProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchTestScoresRef on AutoDisposeStreamProviderRef<List<TestScore>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _WatchTestScoresProviderElement
    extends AutoDisposeStreamProviderElement<List<TestScore>>
    with WatchTestScoresRef {
  _WatchTestScoresProviderElement(super.provider);

  @override
  int get userId => (origin as WatchTestScoresProvider).userId;
}

String _$testScoreNotifierHash() => r'9a90d5eff4b4de7e34b883794574cbcd2adc248c';

abstract class _$TestScoreNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<TestScore>> {
  late final int userId;

  FutureOr<List<TestScore>> build(int userId);
}

/// See also [TestScoreNotifier].
@ProviderFor(TestScoreNotifier)
const testScoreNotifierProvider = TestScoreNotifierFamily();

/// See also [TestScoreNotifier].
class TestScoreNotifierFamily extends Family<AsyncValue<List<TestScore>>> {
  /// See also [TestScoreNotifier].
  const TestScoreNotifierFamily();

  /// See also [TestScoreNotifier].
  TestScoreNotifierProvider call(int userId) {
    return TestScoreNotifierProvider(userId);
  }

  @override
  TestScoreNotifierProvider getProviderOverride(
    covariant TestScoreNotifierProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'testScoreNotifierProvider';
}

/// See also [TestScoreNotifier].
class TestScoreNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          TestScoreNotifier,
          List<TestScore>
        > {
  /// See also [TestScoreNotifier].
  TestScoreNotifierProvider(int userId)
    : this._internal(
        () => TestScoreNotifier()..userId = userId,
        from: testScoreNotifierProvider,
        name: r'testScoreNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$testScoreNotifierHash,
        dependencies: TestScoreNotifierFamily._dependencies,
        allTransitiveDependencies:
            TestScoreNotifierFamily._allTransitiveDependencies,
        userId: userId,
      );

  TestScoreNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  FutureOr<List<TestScore>> runNotifierBuild(
    covariant TestScoreNotifier notifier,
  ) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(TestScoreNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TestScoreNotifierProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TestScoreNotifier, List<TestScore>>
  createElement() {
    return _TestScoreNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TestScoreNotifierProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TestScoreNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<TestScore>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _TestScoreNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          TestScoreNotifier,
          List<TestScore>
        >
    with TestScoreNotifierRef {
  _TestScoreNotifierProviderElement(super.provider);

  @override
  int get userId => (origin as TestScoreNotifierProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
