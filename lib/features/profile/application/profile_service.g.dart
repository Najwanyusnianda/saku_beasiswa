// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'68c9ad772c198d1a34d2dcccc0a6a35f43092fd5';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = AutoDisposeProviderRef<AppDatabase>;
String _$profileDaoHash() => r'9d9651216765556a29eea260e41b4a42e5c7d8bd';

/// See also [profileDao].
@ProviderFor(profileDao)
final profileDaoProvider = AutoDisposeProvider<ProfileDao>.internal(
  profileDao,
  name: r'profileDaoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileDaoRef = AutoDisposeProviderRef<ProfileDao>;
String _$profileRepositoryHash() => r'6a75769f39862589dbef24e8e58ba18221f7b6c4';

/// See also [profileRepository].
@ProviderFor(profileRepository)
final profileRepositoryProvider =
    AutoDisposeProvider<IProfileRepository>.internal(
      profileRepository,
      name: r'profileRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileRepositoryRef = AutoDisposeProviderRef<IProfileRepository>;
String _$watchProfileHash() => r'5cafce2ac752cec1435db03163a29772890f0c84';

/// See also [watchProfile].
@ProviderFor(watchProfile)
final watchProfileProvider = AutoDisposeStreamProvider<UserProfile?>.internal(
  watchProfile,
  name: r'watchProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchProfileRef = AutoDisposeStreamProviderRef<UserProfile?>;
String _$profileNotifierHash() => r'6ed2d53af59e8688a4b9f6c86f935eff6bc90d28';

/// See also [ProfileNotifier].
@ProviderFor(ProfileNotifier)
final profileNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProfileNotifier, UserProfile?>.internal(
      ProfileNotifier.new,
      name: r'profileNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProfileNotifier = AutoDisposeAsyncNotifier<UserProfile?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
