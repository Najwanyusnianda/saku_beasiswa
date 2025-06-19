// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _studyLevelMeta = const VerificationMeta(
    'studyLevel',
  );
  @override
  late final GeneratedColumn<String> studyLevel = GeneratedColumn<String>(
    'study_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fieldOfStudyMeta = const VerificationMeta(
    'fieldOfStudy',
  );
  @override
  late final GeneratedColumn<String> fieldOfStudy = GeneratedColumn<String>(
    'field_of_study',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetCountriesMeta = const VerificationMeta(
    'targetCountries',
  );
  @override
  late final GeneratedColumn<String> targetCountries = GeneratedColumn<String>(
    'target_countries',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studyLevel,
    fieldOfStudy,
    targetCountries,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('study_level')) {
      context.handle(
        _studyLevelMeta,
        studyLevel.isAcceptableOrUnknown(data['study_level']!, _studyLevelMeta),
      );
    }
    if (data.containsKey('field_of_study')) {
      context.handle(
        _fieldOfStudyMeta,
        fieldOfStudy.isAcceptableOrUnknown(
          data['field_of_study']!,
          _fieldOfStudyMeta,
        ),
      );
    }
    if (data.containsKey('target_countries')) {
      context.handle(
        _targetCountriesMeta,
        targetCountries.isAcceptableOrUnknown(
          data['target_countries']!,
          _targetCountriesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_level'],
      ),
      fieldOfStudy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_of_study'],
      ),
      targetCountries: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_countries'],
      ),
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;
  final String? studyLevel;
  final String? fieldOfStudy;
  final String? targetCountries;
  const UserProfile({
    required this.id,
    this.studyLevel,
    this.fieldOfStudy,
    this.targetCountries,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || studyLevel != null) {
      map['study_level'] = Variable<String>(studyLevel);
    }
    if (!nullToAbsent || fieldOfStudy != null) {
      map['field_of_study'] = Variable<String>(fieldOfStudy);
    }
    if (!nullToAbsent || targetCountries != null) {
      map['target_countries'] = Variable<String>(targetCountries);
    }
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      studyLevel: studyLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(studyLevel),
      fieldOfStudy: fieldOfStudy == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldOfStudy),
      targetCountries: targetCountries == null && nullToAbsent
          ? const Value.absent()
          : Value(targetCountries),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      studyLevel: serializer.fromJson<String?>(json['studyLevel']),
      fieldOfStudy: serializer.fromJson<String?>(json['fieldOfStudy']),
      targetCountries: serializer.fromJson<String?>(json['targetCountries']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studyLevel': serializer.toJson<String?>(studyLevel),
      'fieldOfStudy': serializer.toJson<String?>(fieldOfStudy),
      'targetCountries': serializer.toJson<String?>(targetCountries),
    };
  }

  UserProfile copyWith({
    int? id,
    Value<String?> studyLevel = const Value.absent(),
    Value<String?> fieldOfStudy = const Value.absent(),
    Value<String?> targetCountries = const Value.absent(),
  }) => UserProfile(
    id: id ?? this.id,
    studyLevel: studyLevel.present ? studyLevel.value : this.studyLevel,
    fieldOfStudy: fieldOfStudy.present ? fieldOfStudy.value : this.fieldOfStudy,
    targetCountries: targetCountries.present
        ? targetCountries.value
        : this.targetCountries,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      studyLevel: data.studyLevel.present
          ? data.studyLevel.value
          : this.studyLevel,
      fieldOfStudy: data.fieldOfStudy.present
          ? data.fieldOfStudy.value
          : this.fieldOfStudy,
      targetCountries: data.targetCountries.present
          ? data.targetCountries.value
          : this.targetCountries,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('studyLevel: $studyLevel, ')
          ..write('fieldOfStudy: $fieldOfStudy, ')
          ..write('targetCountries: $targetCountries')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, studyLevel, fieldOfStudy, targetCountries);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.studyLevel == this.studyLevel &&
          other.fieldOfStudy == this.fieldOfStudy &&
          other.targetCountries == this.targetCountries);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<String?> studyLevel;
  final Value<String?> fieldOfStudy;
  final Value<String?> targetCountries;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.studyLevel = const Value.absent(),
    this.fieldOfStudy = const Value.absent(),
    this.targetCountries = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.studyLevel = const Value.absent(),
    this.fieldOfStudy = const Value.absent(),
    this.targetCountries = const Value.absent(),
  });
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<String>? studyLevel,
    Expression<String>? fieldOfStudy,
    Expression<String>? targetCountries,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studyLevel != null) 'study_level': studyLevel,
      if (fieldOfStudy != null) 'field_of_study': fieldOfStudy,
      if (targetCountries != null) 'target_countries': targetCountries,
    });
  }

  UserProfilesCompanion copyWith({
    Value<int>? id,
    Value<String?>? studyLevel,
    Value<String?>? fieldOfStudy,
    Value<String?>? targetCountries,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      studyLevel: studyLevel ?? this.studyLevel,
      fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
      targetCountries: targetCountries ?? this.targetCountries,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studyLevel.present) {
      map['study_level'] = Variable<String>(studyLevel.value);
    }
    if (fieldOfStudy.present) {
      map['field_of_study'] = Variable<String>(fieldOfStudy.value);
    }
    if (targetCountries.present) {
      map['target_countries'] = Variable<String>(targetCountries.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('studyLevel: $studyLevel, ')
          ..write('fieldOfStudy: $fieldOfStudy, ')
          ..write('targetCountries: $targetCountries')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userProfiles];
}

typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String?> studyLevel,
      Value<String?> fieldOfStudy,
      Value<String?> targetCountries,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String?> studyLevel,
      Value<String?> fieldOfStudy,
      Value<String?> targetCountries,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studyLevel => $composableBuilder(
    column: $table.studyLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldOfStudy => $composableBuilder(
    column: $table.fieldOfStudy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetCountries => $composableBuilder(
    column: $table.targetCountries,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studyLevel => $composableBuilder(
    column: $table.studyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldOfStudy => $composableBuilder(
    column: $table.fieldOfStudy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetCountries => $composableBuilder(
    column: $table.targetCountries,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get studyLevel => $composableBuilder(
    column: $table.studyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fieldOfStudy => $composableBuilder(
    column: $table.fieldOfStudy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetCountries => $composableBuilder(
    column: $table.targetCountries,
    builder: (column) => column,
  );
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            UserProfile,
            BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
          ),
          UserProfile,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> studyLevel = const Value.absent(),
                Value<String?> fieldOfStudy = const Value.absent(),
                Value<String?> targetCountries = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                studyLevel: studyLevel,
                fieldOfStudy: fieldOfStudy,
                targetCountries: targetCountries,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> studyLevel = const Value.absent(),
                Value<String?> fieldOfStudy = const Value.absent(),
                Value<String?> targetCountries = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                studyLevel: studyLevel,
                fieldOfStudy: fieldOfStudy,
                targetCountries: targetCountries,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        UserProfile,
        BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
      ),
      UserProfile,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'3d3a397d2ea952fc020fce0506793a5564e93530';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
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
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$userProfileRepositoryHash() =>
    r'74026ac43c0505f92e874b43a0c1eca7a2dfc137';

/// See also [userProfileRepository].
@ProviderFor(userProfileRepository)
final userProfileRepositoryProvider =
    AutoDisposeProvider<UserProfileRepository>.internal(
      userProfileRepository,
      name: r'userProfileRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userProfileRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserProfileRepositoryRef =
    AutoDisposeProviderRef<UserProfileRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
