// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeApplicationsCountHash() =>
    r'bb15badf9af2bcd7841df2a1b54a8f7a89f99de5';

/// See also [activeApplicationsCount].
@ProviderFor(activeApplicationsCount)
final activeApplicationsCountProvider = AutoDisposeStreamProvider<int>.internal(
  activeApplicationsCount,
  name: r'activeApplicationsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeApplicationsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveApplicationsCountRef = AutoDisposeStreamProviderRef<int>;
String _$nextDeadlineHash() => r'61ba77b49fc8604d042b9fa6e0017b3f0cc1212c';

/// See also [nextDeadline].
@ProviderFor(nextDeadline)
final nextDeadlineProvider = AutoDisposeStreamProvider<Application?>.internal(
  nextDeadline,
  name: r'nextDeadlineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nextDeadlineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NextDeadlineRef = AutoDisposeStreamProviderRef<Application?>;
String _$todaysFocusTasksHash() => r'a7fb900ab715aaad59f6d91580ccd3b6869eeec5';

/// See also [todaysFocusTasks].
@ProviderFor(todaysFocusTasks)
final todaysFocusTasksProvider = AutoDisposeStreamProvider<List<Task>>.internal(
  todaysFocusTasks,
  name: r'todaysFocusTasksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todaysFocusTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodaysFocusTasksRef = AutoDisposeStreamProviderRef<List<Task>>;
String _$overdueTasksCountHash() => r'4329b8c645a0a5374439971f53dc55862590ebe9';

/// See also [overdueTasksCount].
@ProviderFor(overdueTasksCount)
final overdueTasksCountProvider = AutoDisposeStreamProvider<int>.internal(
  overdueTasksCount,
  name: r'overdueTasksCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$overdueTasksCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OverdueTasksCountRef = AutoDisposeStreamProviderRef<int>;
String _$todaysFocusHash() => r'21d1989d9793520eebc83bd784752cc6dd377e0f';

/// See also [todaysFocus].
@ProviderFor(todaysFocus)
final todaysFocusProvider =
    AutoDisposeStreamProvider<List<TaskWithApplicationInfo>>.internal(
      todaysFocus,
      name: r'todaysFocusProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todaysFocusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodaysFocusRef =
    AutoDisposeStreamProviderRef<List<TaskWithApplicationInfo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
