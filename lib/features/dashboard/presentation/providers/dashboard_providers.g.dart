// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeApplicationsCountHash() =>
    r'1de67bf2259886c3f888ef8f0e42f43fb994dfaa';

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
String _$overdueTasksCountHash() => r'f69ade7da24063410b4c23d4089eb7ad32f9f4e7';

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
String _$nextMilestoneDeadlineHash() =>
    r'b90ccff8d9f04542cc7bdc947761a980a2af144a';

/// See also [nextMilestoneDeadline].
@ProviderFor(nextMilestoneDeadline)
final nextMilestoneDeadlineProvider =
    AutoDisposeStreamProvider<UserMilestone?>.internal(
      nextMilestoneDeadline,
      name: r'nextMilestoneDeadlineProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$nextMilestoneDeadlineHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NextMilestoneDeadlineRef = AutoDisposeStreamProviderRef<UserMilestone?>;
String _$todaysFocusHash() => r'91f7d0fa46c46fc4dedd1f6174e558b31e2add92';

/// See also [todaysFocus].
@ProviderFor(todaysFocus)
final todaysFocusProvider = AutoDisposeFutureProvider<List<FocusTask>>.internal(
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
typedef TodaysFocusRef = AutoDisposeFutureProviderRef<List<FocusTask>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
