// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_applications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$applicationStatusHash() => r'77e8dc5083a37a37ac283cdebe960f23606b5796';

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

/// See also [applicationStatus].
@ProviderFor(applicationStatus)
const applicationStatusProvider = ApplicationStatusFamily();

/// See also [applicationStatus].
class ApplicationStatusFamily extends Family<ApplicationStatus> {
  /// See also [applicationStatus].
  const ApplicationStatusFamily();

  /// See also [applicationStatus].
  ApplicationStatusProvider call(int applicationId) {
    return ApplicationStatusProvider(applicationId);
  }

  @override
  ApplicationStatusProvider getProviderOverride(
    covariant ApplicationStatusProvider provider,
  ) {
    return call(provider.applicationId);
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
class ApplicationStatusProvider extends AutoDisposeProvider<ApplicationStatus> {
  /// See also [applicationStatus].
  ApplicationStatusProvider(int applicationId)
    : this._internal(
        (ref) => applicationStatus(ref as ApplicationStatusRef, applicationId),
        from: applicationStatusProvider,
        name: r'applicationStatusProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationStatusHash,
        dependencies: ApplicationStatusFamily._dependencies,
        allTransitiveDependencies:
            ApplicationStatusFamily._allTransitiveDependencies,
        applicationId: applicationId,
      );

  ApplicationStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final int applicationId;

  @override
  Override overrideWith(
    ApplicationStatus Function(ApplicationStatusRef provider) create,
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
        applicationId: applicationId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ApplicationStatus> createElement() {
    return _ApplicationStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationStatusProvider &&
        other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationStatusRef on AutoDisposeProviderRef<ApplicationStatus> {
  /// The parameter `applicationId` of this provider.
  int get applicationId;
}

class _ApplicationStatusProviderElement
    extends AutoDisposeProviderElement<ApplicationStatus>
    with ApplicationStatusRef {
  _ApplicationStatusProviderElement(super.provider);

  @override
  int get applicationId => (origin as ApplicationStatusProvider).applicationId;
}

String _$myApplicationsHash() => r'17aef9a6eba5b7fd68ffa6f128aa051d66099ea1';

/// See also [myApplications].
@ProviderFor(myApplications)
final myApplicationsProvider =
    AutoDisposeStreamProvider<List<ApplicationWithTemplate>>.internal(
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
    AutoDisposeStreamProviderRef<List<ApplicationWithTemplate>>;
String _$applicationDetailHash() => r'4b7922fa4a991091e63abe076e4ef0e373c87444';

/// See also [applicationDetail].
@ProviderFor(applicationDetail)
const applicationDetailProvider = ApplicationDetailFamily();

/// See also [applicationDetail].
class ApplicationDetailFamily
    extends Family<AsyncValue<ApplicationWithTemplate>> {
  /// See also [applicationDetail].
  const ApplicationDetailFamily();

  /// See also [applicationDetail].
  ApplicationDetailProvider call(int id) {
    return ApplicationDetailProvider(id);
  }

  @override
  ApplicationDetailProvider getProviderOverride(
    covariant ApplicationDetailProvider provider,
  ) {
    return call(provider.id);
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
    extends AutoDisposeStreamProvider<ApplicationWithTemplate> {
  /// See also [applicationDetail].
  ApplicationDetailProvider(int id)
    : this._internal(
        (ref) => applicationDetail(ref as ApplicationDetailRef, id),
        from: applicationDetailProvider,
        name: r'applicationDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationDetailHash,
        dependencies: ApplicationDetailFamily._dependencies,
        allTransitiveDependencies:
            ApplicationDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ApplicationDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    Stream<ApplicationWithTemplate> Function(ApplicationDetailRef provider)
    create,
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
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ApplicationWithTemplate> createElement() {
    return _ApplicationDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationDetailRef
    on AutoDisposeStreamProviderRef<ApplicationWithTemplate> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ApplicationDetailProviderElement
    extends AutoDisposeStreamProviderElement<ApplicationWithTemplate>
    with ApplicationDetailRef {
  _ApplicationDetailProviderElement(super.provider);

  @override
  int get id => (origin as ApplicationDetailProvider).id;
}

String _$applicationTasksHash() => r'd2bf67e9dc4a6aba610aa8983192deb152995e2e';

/// See also [applicationTasks].
@ProviderFor(applicationTasks)
const applicationTasksProvider = ApplicationTasksFamily();

/// See also [applicationTasks].
class ApplicationTasksFamily extends Family<AsyncValue<List<Task>>> {
  /// See also [applicationTasks].
  const ApplicationTasksFamily();

  /// See also [applicationTasks].
  ApplicationTasksProvider call(int applicationId) {
    return ApplicationTasksProvider(applicationId);
  }

  @override
  ApplicationTasksProvider getProviderOverride(
    covariant ApplicationTasksProvider provider,
  ) {
    return call(provider.applicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationTasksProvider';
}

/// See also [applicationTasks].
class ApplicationTasksProvider extends AutoDisposeStreamProvider<List<Task>> {
  /// See also [applicationTasks].
  ApplicationTasksProvider(int applicationId)
    : this._internal(
        (ref) => applicationTasks(ref as ApplicationTasksRef, applicationId),
        from: applicationTasksProvider,
        name: r'applicationTasksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationTasksHash,
        dependencies: ApplicationTasksFamily._dependencies,
        allTransitiveDependencies:
            ApplicationTasksFamily._allTransitiveDependencies,
        applicationId: applicationId,
      );

  ApplicationTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final int applicationId;

  @override
  Override overrideWith(
    Stream<List<Task>> Function(ApplicationTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationTasksProvider._internal(
        (ref) => create(ref as ApplicationTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        applicationId: applicationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Task>> createElement() {
    return _ApplicationTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationTasksProvider &&
        other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationTasksRef on AutoDisposeStreamProviderRef<List<Task>> {
  /// The parameter `applicationId` of this provider.
  int get applicationId;
}

class _ApplicationTasksProviderElement
    extends AutoDisposeStreamProviderElement<List<Task>>
    with ApplicationTasksRef {
  _ApplicationTasksProviderElement(super.provider);

  @override
  int get applicationId => (origin as ApplicationTasksProvider).applicationId;
}

String _$nextUpcomingTaskHash() => r'ba05431490466fdbe493bc1bb20668c6dff5cc8a';

/// See also [nextUpcomingTask].
@ProviderFor(nextUpcomingTask)
const nextUpcomingTaskProvider = NextUpcomingTaskFamily();

/// See also [nextUpcomingTask].
class NextUpcomingTaskFamily extends Family<AsyncValue<Task?>> {
  /// See also [nextUpcomingTask].
  const NextUpcomingTaskFamily();

  /// See also [nextUpcomingTask].
  NextUpcomingTaskProvider call(int applicationId) {
    return NextUpcomingTaskProvider(applicationId);
  }

  @override
  NextUpcomingTaskProvider getProviderOverride(
    covariant NextUpcomingTaskProvider provider,
  ) {
    return call(provider.applicationId);
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
class NextUpcomingTaskProvider extends AutoDisposeFutureProvider<Task?> {
  /// See also [nextUpcomingTask].
  NextUpcomingTaskProvider(int applicationId)
    : this._internal(
        (ref) => nextUpcomingTask(ref as NextUpcomingTaskRef, applicationId),
        from: nextUpcomingTaskProvider,
        name: r'nextUpcomingTaskProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$nextUpcomingTaskHash,
        dependencies: NextUpcomingTaskFamily._dependencies,
        allTransitiveDependencies:
            NextUpcomingTaskFamily._allTransitiveDependencies,
        applicationId: applicationId,
      );

  NextUpcomingTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final int applicationId;

  @override
  Override overrideWith(
    FutureOr<Task?> Function(NextUpcomingTaskRef provider) create,
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
        applicationId: applicationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Task?> createElement() {
    return _NextUpcomingTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NextUpcomingTaskProvider &&
        other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NextUpcomingTaskRef on AutoDisposeFutureProviderRef<Task?> {
  /// The parameter `applicationId` of this provider.
  int get applicationId;
}

class _NextUpcomingTaskProviderElement
    extends AutoDisposeFutureProviderElement<Task?>
    with NextUpcomingTaskRef {
  _NextUpcomingTaskProviderElement(super.provider);

  @override
  int get applicationId => (origin as NextUpcomingTaskProvider).applicationId;
}

String _$applicationTimelineHash() =>
    r'dd6aa9569270faf2fd345f71890d1469ab95d387';

/// See also [applicationTimeline].
@ProviderFor(applicationTimeline)
const applicationTimelineProvider = ApplicationTimelineFamily();

/// See also [applicationTimeline].
class ApplicationTimelineFamily
    extends Family<AsyncValue<List<TimelineEvent>>> {
  /// See also [applicationTimeline].
  const ApplicationTimelineFamily();

  /// See also [applicationTimeline].
  ApplicationTimelineProvider call(int applicationId) {
    return ApplicationTimelineProvider(applicationId);
  }

  @override
  ApplicationTimelineProvider getProviderOverride(
    covariant ApplicationTimelineProvider provider,
  ) {
    return call(provider.applicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationTimelineProvider';
}

/// See also [applicationTimeline].
class ApplicationTimelineProvider
    extends AutoDisposeFutureProvider<List<TimelineEvent>> {
  /// See also [applicationTimeline].
  ApplicationTimelineProvider(int applicationId)
    : this._internal(
        (ref) =>
            applicationTimeline(ref as ApplicationTimelineRef, applicationId),
        from: applicationTimelineProvider,
        name: r'applicationTimelineProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationTimelineHash,
        dependencies: ApplicationTimelineFamily._dependencies,
        allTransitiveDependencies:
            ApplicationTimelineFamily._allTransitiveDependencies,
        applicationId: applicationId,
      );

  ApplicationTimelineProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final int applicationId;

  @override
  Override overrideWith(
    FutureOr<List<TimelineEvent>> Function(ApplicationTimelineRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationTimelineProvider._internal(
        (ref) => create(ref as ApplicationTimelineRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        applicationId: applicationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TimelineEvent>> createElement() {
    return _ApplicationTimelineProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationTimelineProvider &&
        other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationTimelineRef
    on AutoDisposeFutureProviderRef<List<TimelineEvent>> {
  /// The parameter `applicationId` of this provider.
  int get applicationId;
}

class _ApplicationTimelineProviderElement
    extends AutoDisposeFutureProviderElement<List<TimelineEvent>>
    with ApplicationTimelineRef {
  _ApplicationTimelineProviderElement(super.provider);

  @override
  int get applicationId =>
      (origin as ApplicationTimelineProvider).applicationId;
}

String _$applicationCompletionPercentageHash() =>
    r'55b86b3d658d92062a543d389a05d1e495e5eb46';

/// See also [applicationCompletionPercentage].
@ProviderFor(applicationCompletionPercentage)
const applicationCompletionPercentageProvider =
    ApplicationCompletionPercentageFamily();

/// See also [applicationCompletionPercentage].
class ApplicationCompletionPercentageFamily extends Family<AsyncValue<double>> {
  /// See also [applicationCompletionPercentage].
  const ApplicationCompletionPercentageFamily();

  /// See also [applicationCompletionPercentage].
  ApplicationCompletionPercentageProvider call(int applicationId) {
    return ApplicationCompletionPercentageProvider(applicationId);
  }

  @override
  ApplicationCompletionPercentageProvider getProviderOverride(
    covariant ApplicationCompletionPercentageProvider provider,
  ) {
    return call(provider.applicationId);
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
  ApplicationCompletionPercentageProvider(int applicationId)
    : this._internal(
        (ref) => applicationCompletionPercentage(
          ref as ApplicationCompletionPercentageRef,
          applicationId,
        ),
        from: applicationCompletionPercentageProvider,
        name: r'applicationCompletionPercentageProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationCompletionPercentageHash,
        dependencies: ApplicationCompletionPercentageFamily._dependencies,
        allTransitiveDependencies:
            ApplicationCompletionPercentageFamily._allTransitiveDependencies,
        applicationId: applicationId,
      );

  ApplicationCompletionPercentageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final int applicationId;

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
        applicationId: applicationId,
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
        other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationCompletionPercentageRef
    on AutoDisposeStreamProviderRef<double> {
  /// The parameter `applicationId` of this provider.
  int get applicationId;
}

class _ApplicationCompletionPercentageProviderElement
    extends AutoDisposeStreamProviderElement<double>
    with ApplicationCompletionPercentageRef {
  _ApplicationCompletionPercentageProviderElement(super.provider);

  @override
  int get applicationId =>
      (origin as ApplicationCompletionPercentageProvider).applicationId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
