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

class $ScholarshipTemplatesTable extends ScholarshipTemplates
    with TableInfo<$ScholarshipTemplatesTable, ScholarshipTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScholarshipTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerNameMeta = const VerificationMeta(
    'providerName',
  );
  @override
  late final GeneratedColumn<String> providerName = GeneratedColumn<String>(
    'provider_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _studyLevelsMeta = const VerificationMeta(
    'studyLevels',
  );
  @override
  late final GeneratedColumn<String> studyLevels = GeneratedColumn<String>(
    'study_levels',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldsOfStudyMeta = const VerificationMeta(
    'fieldsOfStudy',
  );
  @override
  late final GeneratedColumn<String> fieldsOfStudy = GeneratedColumn<String>(
    'fields_of_study',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetCountriesMeta = const VerificationMeta(
    'targetCountries',
  );
  @override
  late final GeneratedColumn<String> targetCountries = GeneratedColumn<String>(
    'target_countries',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    providerName,
    logoUrl,
    studyLevels,
    fieldsOfStudy,
    targetCountries,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scholarship_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScholarshipTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('provider_name')) {
      context.handle(
        _providerNameMeta,
        providerName.isAcceptableOrUnknown(
          data['provider_name']!,
          _providerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_providerNameMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    if (data.containsKey('study_levels')) {
      context.handle(
        _studyLevelsMeta,
        studyLevels.isAcceptableOrUnknown(
          data['study_levels']!,
          _studyLevelsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studyLevelsMeta);
    }
    if (data.containsKey('fields_of_study')) {
      context.handle(
        _fieldsOfStudyMeta,
        fieldsOfStudy.isAcceptableOrUnknown(
          data['fields_of_study']!,
          _fieldsOfStudyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fieldsOfStudyMeta);
    }
    if (data.containsKey('target_countries')) {
      context.handle(
        _targetCountriesMeta,
        targetCountries.isAcceptableOrUnknown(
          data['target_countries']!,
          _targetCountriesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetCountriesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScholarshipTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScholarshipTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      providerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_name'],
      )!,
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      studyLevels: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_levels'],
      )!,
      fieldsOfStudy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fields_of_study'],
      )!,
      targetCountries: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_countries'],
      )!,
    );
  }

  @override
  $ScholarshipTemplatesTable createAlias(String alias) {
    return $ScholarshipTemplatesTable(attachedDatabase, alias);
  }
}

class ScholarshipTemplate extends DataClass
    implements Insertable<ScholarshipTemplate> {
  final String id;
  final String name;
  final String providerName;
  final String? logoUrl;
  final String studyLevels;
  final String fieldsOfStudy;
  final String targetCountries;
  const ScholarshipTemplate({
    required this.id,
    required this.name,
    required this.providerName,
    this.logoUrl,
    required this.studyLevels,
    required this.fieldsOfStudy,
    required this.targetCountries,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['provider_name'] = Variable<String>(providerName);
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    map['study_levels'] = Variable<String>(studyLevels);
    map['fields_of_study'] = Variable<String>(fieldsOfStudy);
    map['target_countries'] = Variable<String>(targetCountries);
    return map;
  }

  ScholarshipTemplatesCompanion toCompanion(bool nullToAbsent) {
    return ScholarshipTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      providerName: Value(providerName),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      studyLevels: Value(studyLevels),
      fieldsOfStudy: Value(fieldsOfStudy),
      targetCountries: Value(targetCountries),
    );
  }

  factory ScholarshipTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScholarshipTemplate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      providerName: serializer.fromJson<String>(json['providerName']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      studyLevels: serializer.fromJson<String>(json['studyLevels']),
      fieldsOfStudy: serializer.fromJson<String>(json['fieldsOfStudy']),
      targetCountries: serializer.fromJson<String>(json['targetCountries']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'providerName': serializer.toJson<String>(providerName),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'studyLevels': serializer.toJson<String>(studyLevels),
      'fieldsOfStudy': serializer.toJson<String>(fieldsOfStudy),
      'targetCountries': serializer.toJson<String>(targetCountries),
    };
  }

  ScholarshipTemplate copyWith({
    String? id,
    String? name,
    String? providerName,
    Value<String?> logoUrl = const Value.absent(),
    String? studyLevels,
    String? fieldsOfStudy,
    String? targetCountries,
  }) => ScholarshipTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    providerName: providerName ?? this.providerName,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    studyLevels: studyLevels ?? this.studyLevels,
    fieldsOfStudy: fieldsOfStudy ?? this.fieldsOfStudy,
    targetCountries: targetCountries ?? this.targetCountries,
  );
  ScholarshipTemplate copyWithCompanion(ScholarshipTemplatesCompanion data) {
    return ScholarshipTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      providerName: data.providerName.present
          ? data.providerName.value
          : this.providerName,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      studyLevels: data.studyLevels.present
          ? data.studyLevels.value
          : this.studyLevels,
      fieldsOfStudy: data.fieldsOfStudy.present
          ? data.fieldsOfStudy.value
          : this.fieldsOfStudy,
      targetCountries: data.targetCountries.present
          ? data.targetCountries.value
          : this.targetCountries,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScholarshipTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('providerName: $providerName, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('studyLevels: $studyLevels, ')
          ..write('fieldsOfStudy: $fieldsOfStudy, ')
          ..write('targetCountries: $targetCountries')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    providerName,
    logoUrl,
    studyLevels,
    fieldsOfStudy,
    targetCountries,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScholarshipTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.providerName == this.providerName &&
          other.logoUrl == this.logoUrl &&
          other.studyLevels == this.studyLevels &&
          other.fieldsOfStudy == this.fieldsOfStudy &&
          other.targetCountries == this.targetCountries);
}

class ScholarshipTemplatesCompanion
    extends UpdateCompanion<ScholarshipTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> providerName;
  final Value<String?> logoUrl;
  final Value<String> studyLevels;
  final Value<String> fieldsOfStudy;
  final Value<String> targetCountries;
  final Value<int> rowid;
  const ScholarshipTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.providerName = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.studyLevels = const Value.absent(),
    this.fieldsOfStudy = const Value.absent(),
    this.targetCountries = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScholarshipTemplatesCompanion.insert({
    required String id,
    required String name,
    required String providerName,
    this.logoUrl = const Value.absent(),
    required String studyLevels,
    required String fieldsOfStudy,
    required String targetCountries,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       providerName = Value(providerName),
       studyLevels = Value(studyLevels),
       fieldsOfStudy = Value(fieldsOfStudy),
       targetCountries = Value(targetCountries);
  static Insertable<ScholarshipTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? providerName,
    Expression<String>? logoUrl,
    Expression<String>? studyLevels,
    Expression<String>? fieldsOfStudy,
    Expression<String>? targetCountries,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (providerName != null) 'provider_name': providerName,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (studyLevels != null) 'study_levels': studyLevels,
      if (fieldsOfStudy != null) 'fields_of_study': fieldsOfStudy,
      if (targetCountries != null) 'target_countries': targetCountries,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScholarshipTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? providerName,
    Value<String?>? logoUrl,
    Value<String>? studyLevels,
    Value<String>? fieldsOfStudy,
    Value<String>? targetCountries,
    Value<int>? rowid,
  }) {
    return ScholarshipTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      providerName: providerName ?? this.providerName,
      logoUrl: logoUrl ?? this.logoUrl,
      studyLevels: studyLevels ?? this.studyLevels,
      fieldsOfStudy: fieldsOfStudy ?? this.fieldsOfStudy,
      targetCountries: targetCountries ?? this.targetCountries,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (providerName.present) {
      map['provider_name'] = Variable<String>(providerName.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (studyLevels.present) {
      map['study_levels'] = Variable<String>(studyLevels.value);
    }
    if (fieldsOfStudy.present) {
      map['fields_of_study'] = Variable<String>(fieldsOfStudy.value);
    }
    if (targetCountries.present) {
      map['target_countries'] = Variable<String>(targetCountries.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScholarshipTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('providerName: $providerName, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('studyLevels: $studyLevels, ')
          ..write('fieldsOfStudy: $fieldsOfStudy, ')
          ..write('targetCountries: $targetCountries, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $ScholarshipTemplatesTable scholarshipTemplates =
      $ScholarshipTemplatesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    scholarshipTemplates,
  ];
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
typedef $$ScholarshipTemplatesTableCreateCompanionBuilder =
    ScholarshipTemplatesCompanion Function({
      required String id,
      required String name,
      required String providerName,
      Value<String?> logoUrl,
      required String studyLevels,
      required String fieldsOfStudy,
      required String targetCountries,
      Value<int> rowid,
    });
typedef $$ScholarshipTemplatesTableUpdateCompanionBuilder =
    ScholarshipTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> providerName,
      Value<String?> logoUrl,
      Value<String> studyLevels,
      Value<String> fieldsOfStudy,
      Value<String> targetCountries,
      Value<int> rowid,
    });

class $$ScholarshipTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $ScholarshipTemplatesTable> {
  $$ScholarshipTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studyLevels => $composableBuilder(
    column: $table.studyLevels,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldsOfStudy => $composableBuilder(
    column: $table.fieldsOfStudy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetCountries => $composableBuilder(
    column: $table.targetCountries,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScholarshipTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $ScholarshipTemplatesTable> {
  $$ScholarshipTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studyLevels => $composableBuilder(
    column: $table.studyLevels,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldsOfStudy => $composableBuilder(
    column: $table.fieldsOfStudy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetCountries => $composableBuilder(
    column: $table.targetCountries,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScholarshipTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScholarshipTemplatesTable> {
  $$ScholarshipTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get studyLevels => $composableBuilder(
    column: $table.studyLevels,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fieldsOfStudy => $composableBuilder(
    column: $table.fieldsOfStudy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetCountries => $composableBuilder(
    column: $table.targetCountries,
    builder: (column) => column,
  );
}

class $$ScholarshipTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScholarshipTemplatesTable,
          ScholarshipTemplate,
          $$ScholarshipTemplatesTableFilterComposer,
          $$ScholarshipTemplatesTableOrderingComposer,
          $$ScholarshipTemplatesTableAnnotationComposer,
          $$ScholarshipTemplatesTableCreateCompanionBuilder,
          $$ScholarshipTemplatesTableUpdateCompanionBuilder,
          (
            ScholarshipTemplate,
            BaseReferences<
              _$AppDatabase,
              $ScholarshipTemplatesTable,
              ScholarshipTemplate
            >,
          ),
          ScholarshipTemplate,
          PrefetchHooks Function()
        > {
  $$ScholarshipTemplatesTableTableManager(
    _$AppDatabase db,
    $ScholarshipTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScholarshipTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScholarshipTemplatesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ScholarshipTemplatesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> providerName = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<String> studyLevels = const Value.absent(),
                Value<String> fieldsOfStudy = const Value.absent(),
                Value<String> targetCountries = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScholarshipTemplatesCompanion(
                id: id,
                name: name,
                providerName: providerName,
                logoUrl: logoUrl,
                studyLevels: studyLevels,
                fieldsOfStudy: fieldsOfStudy,
                targetCountries: targetCountries,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String providerName,
                Value<String?> logoUrl = const Value.absent(),
                required String studyLevels,
                required String fieldsOfStudy,
                required String targetCountries,
                Value<int> rowid = const Value.absent(),
              }) => ScholarshipTemplatesCompanion.insert(
                id: id,
                name: name,
                providerName: providerName,
                logoUrl: logoUrl,
                studyLevels: studyLevels,
                fieldsOfStudy: fieldsOfStudy,
                targetCountries: targetCountries,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScholarshipTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScholarshipTemplatesTable,
      ScholarshipTemplate,
      $$ScholarshipTemplatesTableFilterComposer,
      $$ScholarshipTemplatesTableOrderingComposer,
      $$ScholarshipTemplatesTableAnnotationComposer,
      $$ScholarshipTemplatesTableCreateCompanionBuilder,
      $$ScholarshipTemplatesTableUpdateCompanionBuilder,
      (
        ScholarshipTemplate,
        BaseReferences<
          _$AppDatabase,
          $ScholarshipTemplatesTable,
          ScholarshipTemplate
        >,
      ),
      ScholarshipTemplate,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$ScholarshipTemplatesTableTableManager get scholarshipTemplates =>
      $$ScholarshipTemplatesTableTableManager(_db, _db.scholarshipTemplates);
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
String _$scholarshipTemplateRepositoryHash() =>
    r'e280cb424dd55f28f116ed53b9fd56a2c5f451a0';

/// See also [scholarshipTemplateRepository].
@ProviderFor(scholarshipTemplateRepository)
final scholarshipTemplateRepositoryProvider =
    AutoDisposeProvider<ScholarshipTemplateRepository>.internal(
      scholarshipTemplateRepository,
      name: r'scholarshipTemplateRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$scholarshipTemplateRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ScholarshipTemplateRepositoryRef =
    AutoDisposeProviderRef<ScholarshipTemplateRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
