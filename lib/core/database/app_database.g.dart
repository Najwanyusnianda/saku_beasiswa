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

class $ApplicationsTable extends Applications
    with TableInfo<$ApplicationsTable, Application> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApplicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES scholarship_templates (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('in_progress'),
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    templateId,
    status,
    deadline,
    createdAt,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'applications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Application> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Application map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Application(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ApplicationsTable createAlias(String alias) {
    return $ApplicationsTable(attachedDatabase, alias);
  }
}

class Application extends DataClass implements Insertable<Application> {
  final int id;
  final String templateId;
  final String status;
  final DateTime deadline;
  final DateTime createdAt;
  final String? notes;
  const Application({
    required this.id,
    required this.templateId,
    required this.status,
    required this.deadline,
    required this.createdAt,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['template_id'] = Variable<String>(templateId);
    map['status'] = Variable<String>(status);
    map['deadline'] = Variable<DateTime>(deadline);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ApplicationsCompanion toCompanion(bool nullToAbsent) {
    return ApplicationsCompanion(
      id: Value(id),
      templateId: Value(templateId),
      status: Value(status),
      deadline: Value(deadline),
      createdAt: Value(createdAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Application.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Application(
      id: serializer.fromJson<int>(json['id']),
      templateId: serializer.fromJson<String>(json['templateId']),
      status: serializer.fromJson<String>(json['status']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templateId': serializer.toJson<String>(templateId),
      'status': serializer.toJson<String>(status),
      'deadline': serializer.toJson<DateTime>(deadline),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Application copyWith({
    int? id,
    String? templateId,
    String? status,
    DateTime? deadline,
    DateTime? createdAt,
    Value<String?> notes = const Value.absent(),
  }) => Application(
    id: id ?? this.id,
    templateId: templateId ?? this.templateId,
    status: status ?? this.status,
    deadline: deadline ?? this.deadline,
    createdAt: createdAt ?? this.createdAt,
    notes: notes.present ? notes.value : this.notes,
  );
  Application copyWithCompanion(ApplicationsCompanion data) {
    return Application(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      status: data.status.present ? data.status.value : this.status,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Application(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('status: $status, ')
          ..write('deadline: $deadline, ')
          ..write('createdAt: $createdAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, templateId, status, deadline, createdAt, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Application &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.status == this.status &&
          other.deadline == this.deadline &&
          other.createdAt == this.createdAt &&
          other.notes == this.notes);
}

class ApplicationsCompanion extends UpdateCompanion<Application> {
  final Value<int> id;
  final Value<String> templateId;
  final Value<String> status;
  final Value<DateTime> deadline;
  final Value<DateTime> createdAt;
  final Value<String?> notes;
  const ApplicationsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.status = const Value.absent(),
    this.deadline = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ApplicationsCompanion.insert({
    this.id = const Value.absent(),
    required String templateId,
    this.status = const Value.absent(),
    required DateTime deadline,
    this.createdAt = const Value.absent(),
    this.notes = const Value.absent(),
  }) : templateId = Value(templateId),
       deadline = Value(deadline);
  static Insertable<Application> custom({
    Expression<int>? id,
    Expression<String>? templateId,
    Expression<String>? status,
    Expression<DateTime>? deadline,
    Expression<DateTime>? createdAt,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (status != null) 'status': status,
      if (deadline != null) 'deadline': deadline,
      if (createdAt != null) 'created_at': createdAt,
      if (notes != null) 'notes': notes,
    });
  }

  ApplicationsCompanion copyWith({
    Value<int>? id,
    Value<String>? templateId,
    Value<String>? status,
    Value<DateTime>? deadline,
    Value<DateTime>? createdAt,
    Value<String?>? notes,
  }) {
    return ApplicationsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      status: status ?? this.status,
      deadline: deadline ?? this.deadline,
      createdAt: createdAt ?? this.createdAt,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApplicationsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('status: $status, ')
          ..write('deadline: $deadline, ')
          ..write('createdAt: $createdAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _applicationIdMeta = const VerificationMeta(
    'applicationId',
  );
  @override
  late final GeneratedColumn<int> applicationId = GeneratedColumn<int>(
    'application_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES applications (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Other'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    applicationId,
    title,
    status,
    dueDate,
    category,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('application_id')) {
      context.handle(
        _applicationIdMeta,
        applicationId.isAcceptableOrUnknown(
          data['application_id']!,
          _applicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_applicationIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      applicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}application_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final int applicationId;
  final String title;
  final String status;
  final DateTime? dueDate;
  final String category;
  const Task({
    required this.id,
    required this.applicationId,
    required this.title,
    required this.status,
    this.dueDate,
    required this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['application_id'] = Variable<int>(applicationId);
    map['title'] = Variable<String>(title);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['category'] = Variable<String>(category);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      applicationId: Value(applicationId),
      title: Value(title),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      category: Value(category),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      applicationId: serializer.fromJson<int>(json['applicationId']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'applicationId': serializer.toJson<int>(applicationId),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'category': serializer.toJson<String>(category),
    };
  }

  Task copyWith({
    int? id,
    int? applicationId,
    String? title,
    String? status,
    Value<DateTime?> dueDate = const Value.absent(),
    String? category,
  }) => Task(
    id: id ?? this.id,
    applicationId: applicationId ?? this.applicationId,
    title: title ?? this.title,
    status: status ?? this.status,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    category: category ?? this.category,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      applicationId: data.applicationId.present
          ? data.applicationId.value
          : this.applicationId,
      title: data.title.present ? data.title.value : this.title,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('applicationId: $applicationId, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, applicationId, title, status, dueDate, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.applicationId == this.applicationId &&
          other.title == this.title &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.category == this.category);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<int> applicationId;
  final Value<String> title;
  final Value<String> status;
  final Value<DateTime?> dueDate;
  final Value<String> category;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.applicationId = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.category = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required int applicationId,
    required String title,
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.category = const Value.absent(),
  }) : applicationId = Value(applicationId),
       title = Value(title);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<int>? applicationId,
    Expression<String>? title,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (applicationId != null) 'application_id': applicationId,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (category != null) 'category': category,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<int>? applicationId,
    Value<String>? title,
    Value<String>? status,
    Value<DateTime?>? dueDate,
    Value<String>? category,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      applicationId: applicationId ?? this.applicationId,
      title: title ?? this.title,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (applicationId.present) {
      map['application_id'] = Variable<int>(applicationId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('applicationId: $applicationId, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('category: $category')
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
  late final $ApplicationsTable applications = $ApplicationsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    scholarshipTemplates,
    applications,
    tasks,
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

final class $$ScholarshipTemplatesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ScholarshipTemplatesTable,
          ScholarshipTemplate
        > {
  $$ScholarshipTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ApplicationsTable, List<Application>>
  _applicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.applications,
    aliasName: $_aliasNameGenerator(
      db.scholarshipTemplates.id,
      db.applications.templateId,
    ),
  );

  $$ApplicationsTableProcessedTableManager get applicationsRefs {
    final manager = $$ApplicationsTableTableManager(
      $_db,
      $_db.applications,
    ).filter((f) => f.templateId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_applicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> applicationsRefs(
    Expression<bool> Function($$ApplicationsTableFilterComposer f) f,
  ) {
    final $$ApplicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.applications,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApplicationsTableFilterComposer(
            $db: $db,
            $table: $db.applications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> applicationsRefs<T extends Object>(
    Expression<T> Function($$ApplicationsTableAnnotationComposer a) f,
  ) {
    final $$ApplicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.applications,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApplicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.applications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (ScholarshipTemplate, $$ScholarshipTemplatesTableReferences),
          ScholarshipTemplate,
          PrefetchHooks Function({bool applicationsRefs})
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScholarshipTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({applicationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (applicationsRefs) db.applications],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (applicationsRefs)
                    await $_getPrefetchedData<
                      ScholarshipTemplate,
                      $ScholarshipTemplatesTable,
                      Application
                    >(
                      currentTable: table,
                      referencedTable: $$ScholarshipTemplatesTableReferences
                          ._applicationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ScholarshipTemplatesTableReferences(
                            db,
                            table,
                            p0,
                          ).applicationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.templateId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (ScholarshipTemplate, $$ScholarshipTemplatesTableReferences),
      ScholarshipTemplate,
      PrefetchHooks Function({bool applicationsRefs})
    >;
typedef $$ApplicationsTableCreateCompanionBuilder =
    ApplicationsCompanion Function({
      Value<int> id,
      required String templateId,
      Value<String> status,
      required DateTime deadline,
      Value<DateTime> createdAt,
      Value<String?> notes,
    });
typedef $$ApplicationsTableUpdateCompanionBuilder =
    ApplicationsCompanion Function({
      Value<int> id,
      Value<String> templateId,
      Value<String> status,
      Value<DateTime> deadline,
      Value<DateTime> createdAt,
      Value<String?> notes,
    });

final class $$ApplicationsTableReferences
    extends BaseReferences<_$AppDatabase, $ApplicationsTable, Application> {
  $$ApplicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ScholarshipTemplatesTable _templateIdTable(_$AppDatabase db) =>
      db.scholarshipTemplates.createAlias(
        $_aliasNameGenerator(
          db.applications.templateId,
          db.scholarshipTemplates.id,
        ),
      );

  $$ScholarshipTemplatesTableProcessedTableManager get templateId {
    final $_column = $_itemColumn<String>('template_id')!;

    final manager = $$ScholarshipTemplatesTableTableManager(
      $_db,
      $_db.scholarshipTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_templateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.applications.id, db.tasks.applicationId),
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.applicationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ApplicationsTableFilterComposer
    extends Composer<_$AppDatabase, $ApplicationsTable> {
  $$ApplicationsTableFilterComposer({
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$ScholarshipTemplatesTableFilterComposer get templateId {
    final $$ScholarshipTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.scholarshipTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScholarshipTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.scholarshipTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.applicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApplicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ApplicationsTable> {
  $$ApplicationsTableOrderingComposer({
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$ScholarshipTemplatesTableOrderingComposer get templateId {
    final $$ScholarshipTemplatesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.templateId,
          referencedTable: $db.scholarshipTemplates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScholarshipTemplatesTableOrderingComposer(
                $db: $db,
                $table: $db.scholarshipTemplates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ApplicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ApplicationsTable> {
  $$ApplicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$ScholarshipTemplatesTableAnnotationComposer get templateId {
    final $$ScholarshipTemplatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.templateId,
          referencedTable: $db.scholarshipTemplates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScholarshipTemplatesTableAnnotationComposer(
                $db: $db,
                $table: $db.scholarshipTemplates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.applicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ApplicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ApplicationsTable,
          Application,
          $$ApplicationsTableFilterComposer,
          $$ApplicationsTableOrderingComposer,
          $$ApplicationsTableAnnotationComposer,
          $$ApplicationsTableCreateCompanionBuilder,
          $$ApplicationsTableUpdateCompanionBuilder,
          (Application, $$ApplicationsTableReferences),
          Application,
          PrefetchHooks Function({bool templateId, bool tasksRefs})
        > {
  $$ApplicationsTableTableManager(_$AppDatabase db, $ApplicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ApplicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ApplicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ApplicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> templateId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> deadline = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => ApplicationsCompanion(
                id: id,
                templateId: templateId,
                status: status,
                deadline: deadline,
                createdAt: createdAt,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String templateId,
                Value<String> status = const Value.absent(),
                required DateTime deadline,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => ApplicationsCompanion.insert(
                id: id,
                templateId: templateId,
                status: status,
                deadline: deadline,
                createdAt: createdAt,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ApplicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({templateId = false, tasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tasksRefs) db.tasks],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (templateId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.templateId,
                                referencedTable: $$ApplicationsTableReferences
                                    ._templateIdTable(db),
                                referencedColumn: $$ApplicationsTableReferences
                                    ._templateIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksRefs)
                    await $_getPrefetchedData<
                      Application,
                      $ApplicationsTable,
                      Task
                    >(
                      currentTable: table,
                      referencedTable: $$ApplicationsTableReferences
                          ._tasksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ApplicationsTableReferences(
                            db,
                            table,
                            p0,
                          ).tasksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.applicationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ApplicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ApplicationsTable,
      Application,
      $$ApplicationsTableFilterComposer,
      $$ApplicationsTableOrderingComposer,
      $$ApplicationsTableAnnotationComposer,
      $$ApplicationsTableCreateCompanionBuilder,
      $$ApplicationsTableUpdateCompanionBuilder,
      (Application, $$ApplicationsTableReferences),
      Application,
      PrefetchHooks Function({bool templateId, bool tasksRefs})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required int applicationId,
      required String title,
      Value<String> status,
      Value<DateTime?> dueDate,
      Value<String> category,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<int> applicationId,
      Value<String> title,
      Value<String> status,
      Value<DateTime?> dueDate,
      Value<String> category,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ApplicationsTable _applicationIdTable(_$AppDatabase db) =>
      db.applications.createAlias(
        $_aliasNameGenerator(db.tasks.applicationId, db.applications.id),
      );

  $$ApplicationsTableProcessedTableManager get applicationId {
    final $_column = $_itemColumn<int>('application_id')!;

    final manager = $$ApplicationsTableTableManager(
      $_db,
      $_db.applications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_applicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  $$ApplicationsTableFilterComposer get applicationId {
    final $$ApplicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.applicationId,
      referencedTable: $db.applications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApplicationsTableFilterComposer(
            $db: $db,
            $table: $db.applications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  $$ApplicationsTableOrderingComposer get applicationId {
    final $$ApplicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.applicationId,
      referencedTable: $db.applications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApplicationsTableOrderingComposer(
            $db: $db,
            $table: $db.applications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  $$ApplicationsTableAnnotationComposer get applicationId {
    final $$ApplicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.applicationId,
      referencedTable: $db.applications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ApplicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.applications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({bool applicationId})
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> applicationId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> category = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                applicationId: applicationId,
                title: title,
                status: status,
                dueDate: dueDate,
                category: category,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int applicationId,
                required String title,
                Value<String> status = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> category = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                applicationId: applicationId,
                title: title,
                status: status,
                dueDate: dueDate,
                category: category,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TasksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({applicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (applicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.applicationId,
                                referencedTable: $$TasksTableReferences
                                    ._applicationIdTable(db),
                                referencedColumn: $$TasksTableReferences
                                    ._applicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({bool applicationId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$ScholarshipTemplatesTableTableManager get scholarshipTemplates =>
      $$ScholarshipTemplatesTableTableManager(_db, _db.scholarshipTemplates);
  $$ApplicationsTableTableManager get applications =>
      $$ApplicationsTableTableManager(_db, _db.applications);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'8c69eb46d45206533c176c88a926608e79ca927d';

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
    r'562ca02ce728655b8b2dd547763ba5b00522728d';

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
    r'e1206a6741ded01e43e86eedabf55c0f4b612b9a';

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
String _$applicationRepositoryHash() =>
    r'3f98f11a5a7132b35b822871b5b74b487c588c46';

/// See also [applicationRepository].
@ProviderFor(applicationRepository)
final applicationRepositoryProvider =
    AutoDisposeProvider<ApplicationRepository>.internal(
      applicationRepository,
      name: r'applicationRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$applicationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApplicationRepositoryRef =
    AutoDisposeProviderRef<ApplicationRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
