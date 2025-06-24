// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_applications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myApplicationsHash() => r'af757baeb19b799f7a38938bdf3c26441f16b3e7';

/// See also [myApplications].
@ProviderFor(myApplications)
final myApplicationsProvider =
    AutoDisposeStreamProvider<List<FullUserApplication>>.internal(
      myApplications,
      name: r'myApplicationsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myApplicationsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyApplicationsRef =
    AutoDisposeStreamProviderRef<List<FullUserApplication>>;
String _$watchTasksForApplicationHash() =>
    r'f2d7ef964fc0e5350585dc9d6c86fb9ab9e70f57';

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

/// See also [watchTasksForApplication].
@ProviderFor(watchTasksForApplication)
const watchTasksForApplicationProvider = WatchTasksForApplicationFamily();

/// See also [watchTasksForApplication].
class WatchTasksForApplicationFamily
    extends Family<AsyncValue<List<UserTask>>> {
  /// See also [watchTasksForApplication].
  const WatchTasksForApplicationFamily();

  /// See also [watchTasksForApplication].
  WatchTasksForApplicationProvider call(int userApplicationId) {
    return WatchTasksForApplicationProvider(userApplicationId);
  }

  @override
  WatchTasksForApplicationProvider getProviderOverride(
    covariant WatchTasksForApplicationProvider provider,
  ) {
    return call(provider.userApplicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchTasksForApplicationProvider';
}

/// See also [watchTasksForApplication].
class WatchTasksForApplicationProvider
    extends AutoDisposeStreamProvider<List<UserTask>> {
  /// See also [watchTasksForApplication].
  WatchTasksForApplicationProvider(int userApplicationId)
    : this._internal(
        (ref) => watchTasksForApplication(
          ref as WatchTasksForApplicationRef,
          userApplicationId,
        ),
        from: watchTasksForApplicationProvider,
        name: r'watchTasksForApplicationProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$watchTasksForApplicationHash,
        dependencies: WatchTasksForApplicationFamily._dependencies,
        allTransitiveDependencies:
            WatchTasksForApplicationFamily._allTransitiveDependencies,
        userApplicationId: userApplicationId,
      );

  WatchTasksForApplicationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userApplicationId,
  }) : super.internal();

  final int userApplicationId;

  @override
  Override overrideWith(
    Stream<List<UserTask>> Function(WatchTasksForApplicationRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchTasksForApplicationProvider._internal(
        (ref) => create(ref as WatchTasksForApplicationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userApplicationId: userApplicationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<UserTask>> createElement() {
    return _WatchTasksForApplicationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchTasksForApplicationProvider &&
        other.userApplicationId == userApplicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userApplicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchTasksForApplicationRef
    on AutoDisposeStreamProviderRef<List<UserTask>> {
  /// The parameter `userApplicationId` of this provider.
  int get userApplicationId;
}

class _WatchTasksForApplicationProviderElement
    extends AutoDisposeStreamProviderElement<List<UserTask>>
    with WatchTasksForApplicationRef {
  _WatchTasksForApplicationProviderElement(super.provider);

  @override
  int get userApplicationId =>
      (origin as WatchTasksForApplicationProvider).userApplicationId;
}

String _$nextUpcomingTaskHash() => r'3a6d120017eed84ea1884d2ddca6efd3fd56535f';

/// See also [nextUpcomingTask].
@ProviderFor(nextUpcomingTask)
const nextUpcomingTaskProvider = NextUpcomingTaskFamily();

/// See also [nextUpcomingTask].
class NextUpcomingTaskFamily extends Family<AsyncValue<UserTask?>> {
  /// See also [nextUpcomingTask].
  const NextUpcomingTaskFamily();

  /// See also [nextUpcomingTask].
  NextUpcomingTaskProvider call(int userApplicationId) {
    return NextUpcomingTaskProvider(userApplicationId);
  }

  @override
  NextUpcomingTaskProvider getProviderOverride(
    covariant NextUpcomingTaskProvider provider,
  ) {
    return call(provider.userApplicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nextUpcomingTaskProvider';
}

/// See also [nextUpcomingTask].
class NextUpcomingTaskProvider extends AutoDisposeFutureProvider<UserTask?> {
  /// See also [nextUpcomingTask].
  NextUpcomingTaskProvider(int userApplicationId)
    : this._internal(
        (ref) =>
            nextUpcomingTask(ref as NextUpcomingTaskRef, userApplicationId),
        from: nextUpcomingTaskProvider,
        name: r'nextUpcomingTaskProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$nextUpcomingTaskHash,
        dependencies: NextUpcomingTaskFamily._dependencies,
        allTransitiveDependencies:
            NextUpcomingTaskFamily._allTransitiveDependencies,
        userApplicationId: userApplicationId,
      );

  NextUpcomingTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userApplicationId,
  }) : super.internal();

  final int userApplicationId;

  @override
  Override overrideWith(
    FutureOr<UserTask?> Function(NextUpcomingTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NextUpcomingTaskProvider._internal(
        (ref) => create(ref as NextUpcomingTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userApplicationId: userApplicationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserTask?> createElement() {
    return _NextUpcomingTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NextUpcomingTaskProvider &&
        other.userApplicationId == userApplicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userApplicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NextUpcomingTaskRef on AutoDisposeFutureProviderRef<UserTask?> {
  /// The parameter `userApplicationId` of this provider.
  int get userApplicationId;
}

class _NextUpcomingTaskProviderElement
    extends AutoDisposeFutureProviderElement<UserTask?>
    with NextUpcomingTaskRef {
  _NextUpcomingTaskProviderElement(super.provider);

  @override
  int get userApplicationId =>
      (origin as NextUpcomingTaskProvider).userApplicationId;
}

String _$applicationStatusHash() => r'35ec9916db69aae1a9b363c4bce1d95993e9e7cc';

/// See also [applicationStatus].
@ProviderFor(applicationStatus)
const applicationStatusProvider = ApplicationStatusFamily();

/// See also [applicationStatus].
class ApplicationStatusFamily extends Family<AsyncValue<ApplicationStatus>> {
  /// See also [applicationStatus].
  const ApplicationStatusFamily();

  /// See also [applicationStatus].
  ApplicationStatusProvider call(int userApplicationId) {
    return ApplicationStatusProvider(userApplicationId);
  }

  @override
  ApplicationStatusProvider getProviderOverride(
    covariant ApplicationStatusProvider provider,
  ) {
    return call(provider.userApplicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationStatusProvider';
}

/// See also [applicationStatus].
class ApplicationStatusProvider
    extends AutoDisposeFutureProvider<ApplicationStatus> {
  /// See also [applicationStatus].
  ApplicationStatusProvider(int userApplicationId)
    : this._internal(
        (ref) =>
            applicationStatus(ref as ApplicationStatusRef, userApplicationId),
        from: applicationStatusProvider,
        name: r'applicationStatusProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationStatusHash,
        dependencies: ApplicationStatusFamily._dependencies,
        allTransitiveDependencies:
            ApplicationStatusFamily._allTransitiveDependencies,
        userApplicationId: userApplicationId,
      );

  ApplicationStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userApplicationId,
  }) : super.internal();

  final int userApplicationId;

  @override
  Override overrideWith(
    FutureOr<ApplicationStatus> Function(ApplicationStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationStatusProvider._internal(
        (ref) => create(ref as ApplicationStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userApplicationId: userApplicationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ApplicationStatus> createElement() {
    return _ApplicationStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationStatusProvider &&
        other.userApplicationId == userApplicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userApplicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationStatusRef on AutoDisposeFutureProviderRef<ApplicationStatus> {
  /// The parameter `userApplicationId` of this provider.
  int get userApplicationId;
}

class _ApplicationStatusProviderElement
    extends AutoDisposeFutureProviderElement<ApplicationStatus>
    with ApplicationStatusRef {
  _ApplicationStatusProviderElement(super.provider);

  @override
  int get userApplicationId =>
      (origin as ApplicationStatusProvider).userApplicationId;
}

String _$applicationCompletionPercentageHash() =>
    r'3f433690e37cadd9102e9ef789cf8077cc21167f';

/// See also [applicationCompletionPercentage].
@ProviderFor(applicationCompletionPercentage)
const applicationCompletionPercentageProvider =
    ApplicationCompletionPercentageFamily();

/// See also [applicationCompletionPercentage].
class ApplicationCompletionPercentageFamily extends Family<AsyncValue<double>> {
  /// See also [applicationCompletionPercentage].
  const ApplicationCompletionPercentageFamily();

  /// See also [applicationCompletionPercentage].
  ApplicationCompletionPercentageProvider call(int userApplicationId) {
    return ApplicationCompletionPercentageProvider(userApplicationId);
  }

  @override
  ApplicationCompletionPercentageProvider getProviderOverride(
    covariant ApplicationCompletionPercentageProvider provider,
  ) {
    return call(provider.userApplicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationCompletionPercentageProvider';
}

/// See also [applicationCompletionPercentage].
class ApplicationCompletionPercentageProvider
    extends AutoDisposeStreamProvider<double> {
  /// See also [applicationCompletionPercentage].
  ApplicationCompletionPercentageProvider(int userApplicationId)
    : this._internal(
        (ref) => applicationCompletionPercentage(
          ref as ApplicationCompletionPercentageRef,
          userApplicationId,
        ),
        from: applicationCompletionPercentageProvider,
        name: r'applicationCompletionPercentageProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationCompletionPercentageHash,
        dependencies: ApplicationCompletionPercentageFamily._dependencies,
        allTransitiveDependencies:
            ApplicationCompletionPercentageFamily._allTransitiveDependencies,
        userApplicationId: userApplicationId,
      );

  ApplicationCompletionPercentageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userApplicationId,
  }) : super.internal();

  final int userApplicationId;

  @override
  Override overrideWith(
    Stream<double> Function(ApplicationCompletionPercentageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationCompletionPercentageProvider._internal(
        (ref) => create(ref as ApplicationCompletionPercentageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userApplicationId: userApplicationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<double> createElement() {
    return _ApplicationCompletionPercentageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationCompletionPercentageProvider &&
        other.userApplicationId == userApplicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userApplicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationCompletionPercentageRef
    on AutoDisposeStreamProviderRef<double> {
  /// The parameter `userApplicationId` of this provider.
  int get userApplicationId;
}

class _ApplicationCompletionPercentageProviderElement
    extends AutoDisposeStreamProviderElement<double>
    with ApplicationCompletionPercentageRef {
  _ApplicationCompletionPercentageProviderElement(super.provider);

  @override
  int get userApplicationId =>
      (origin as ApplicationCompletionPercentageProvider).userApplicationId;
}

String _$applicationDetailHash() => r'24ef11d20962d0dce2546af8db2c8482b4c44f1d';

/// See also [applicationDetail].
@ProviderFor(applicationDetail)
const applicationDetailProvider = ApplicationDetailFamily();

/// See also [applicationDetail].
class ApplicationDetailFamily extends Family<AsyncValue<FullUserApplication>> {
  /// See also [applicationDetail].
  const ApplicationDetailFamily();

  /// See also [applicationDetail].
  ApplicationDetailProvider call(int userApplicationId) {
    return ApplicationDetailProvider(userApplicationId);
  }

  @override
  ApplicationDetailProvider getProviderOverride(
    covariant ApplicationDetailProvider provider,
  ) {
    return call(provider.userApplicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationDetailProvider';
}

/// See also [applicationDetail].
class ApplicationDetailProvider
    extends AutoDisposeStreamProvider<FullUserApplication> {
  /// See also [applicationDetail].
  ApplicationDetailProvider(int userApplicationId)
    : this._internal(
        (ref) =>
            applicationDetail(ref as ApplicationDetailRef, userApplicationId),
        from: applicationDetailProvider,
        name: r'applicationDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationDetailHash,
        dependencies: ApplicationDetailFamily._dependencies,
        allTransitiveDependencies:
            ApplicationDetailFamily._allTransitiveDependencies,
        userApplicationId: userApplicationId,
      );

  ApplicationDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userApplicationId,
  }) : super.internal();

  final int userApplicationId;

  @override
  Override overrideWith(
    Stream<FullUserApplication> Function(ApplicationDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationDetailProvider._internal(
        (ref) => create(ref as ApplicationDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userApplicationId: userApplicationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<FullUserApplication> createElement() {
    return _ApplicationDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationDetailProvider &&
        other.userApplicationId == userApplicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userApplicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationDetailRef
    on AutoDisposeStreamProviderRef<FullUserApplication> {
  /// The parameter `userApplicationId` of this provider.
  int get userApplicationId;
}

class _ApplicationDetailProviderElement
    extends AutoDisposeStreamProviderElement<FullUserApplication>
    with ApplicationDetailRef {
  _ApplicationDetailProviderElement(super.provider);

  @override
  int get userApplicationId =>
      (origin as ApplicationDetailProvider).userApplicationId;
}

String _$applicationMilestonesWithTasksHash() =>
    r'f2dd913cca61812b31f6cf674a7c508141c37ede';

/// See also [applicationMilestonesWithTasks].
@ProviderFor(applicationMilestonesWithTasks)
const applicationMilestonesWithTasksProvider =
    ApplicationMilestonesWithTasksFamily();

/// See also [applicationMilestonesWithTasks].
class ApplicationMilestonesWithTasksFamily
    extends Family<AsyncValue<Map<UserMilestone, List<UserTask>>>> {
  /// See also [applicationMilestonesWithTasks].
  const ApplicationMilestonesWithTasksFamily();

  /// See also [applicationMilestonesWithTasks].
  ApplicationMilestonesWithTasksProvider call(int userApplicationId) {
    return ApplicationMilestonesWithTasksProvider(userApplicationId);
  }

  @override
  ApplicationMilestonesWithTasksProvider getProviderOverride(
    covariant ApplicationMilestonesWithTasksProvider provider,
  ) {
    return call(provider.userApplicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationMilestonesWithTasksProvider';
}

/// See also [applicationMilestonesWithTasks].
class ApplicationMilestonesWithTasksProvider
    extends AutoDisposeStreamProvider<Map<UserMilestone, List<UserTask>>> {
  /// See also [applicationMilestonesWithTasks].
  ApplicationMilestonesWithTasksProvider(int userApplicationId)
    : this._internal(
        (ref) => applicationMilestonesWithTasks(
          ref as ApplicationMilestonesWithTasksRef,
          userApplicationId,
        ),
        from: applicationMilestonesWithTasksProvider,
        name: r'applicationMilestonesWithTasksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationMilestonesWithTasksHash,
        dependencies: ApplicationMilestonesWithTasksFamily._dependencies,
        allTransitiveDependencies:
            ApplicationMilestonesWithTasksFamily._allTransitiveDependencies,
        userApplicationId: userApplicationId,
      );

  ApplicationMilestonesWithTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userApplicationId,
  }) : super.internal();

  final int userApplicationId;

  @override
  Override overrideWith(
    Stream<Map<UserMilestone, List<UserTask>>> Function(
      ApplicationMilestonesWithTasksRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationMilestonesWithTasksProvider._internal(
        (ref) => create(ref as ApplicationMilestonesWithTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userApplicationId: userApplicationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Map<UserMilestone, List<UserTask>>>
  createElement() {
    return _ApplicationMilestonesWithTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationMilestonesWithTasksProvider &&
        other.userApplicationId == userApplicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userApplicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationMilestonesWithTasksRef
    on AutoDisposeStreamProviderRef<Map<UserMilestone, List<UserTask>>> {
  /// The parameter `userApplicationId` of this provider.
  int get userApplicationId;
}

class _ApplicationMilestonesWithTasksProviderElement
    extends AutoDisposeStreamProviderElement<Map<UserMilestone, List<UserTask>>>
    with ApplicationMilestonesWithTasksRef {
  _ApplicationMilestonesWithTasksProviderElement(super.provider);

  @override
  int get userApplicationId =>
      (origin as ApplicationMilestonesWithTasksProvider).userApplicationId;
}

String _$isSavingHash() => r'fe15992c6c4490a761e280b5a3f077561651f2a5';

/// See also [IsSaving].
@ProviderFor(IsSaving)
final isSavingProvider = AutoDisposeNotifierProvider<IsSaving, bool>.internal(
  IsSaving.new,
  name: r'isSavingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isSavingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsSaving = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
