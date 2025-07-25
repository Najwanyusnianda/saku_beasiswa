// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
  static const VerificationMeta _shortDescriptionMeta = const VerificationMeta(
    'shortDescription',
  );
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
    'short_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longDescriptionMeta = const VerificationMeta(
    'longDescription',
  );
  @override
  late final GeneratedColumn<String> longDescription = GeneratedColumn<String>(
    'long_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _studyLevelMeta = const VerificationMeta(
    'studyLevel',
  );
  @override
  late final GeneratedColumn<String> studyLevel = GeneratedColumn<String>(
    'study_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _fundingTypeMeta = const VerificationMeta(
    'fundingType',
  );
  @override
  late final GeneratedColumn<String> fundingType = GeneratedColumn<String>(
    'funding_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fundingAmountMeta = const VerificationMeta(
    'fundingAmount',
  );
  @override
  late final GeneratedColumn<String> fundingAmount = GeneratedColumn<String>(
    'funding_amount',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'default_color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'official_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usageCountMeta = const VerificationMeta(
    'usageCount',
  );
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
    'usage_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _successRateMeta = const VerificationMeta(
    'successRate',
  );
  @override
  late final GeneratedColumn<int> successRate = GeneratedColumn<int>(
    'success_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _averageMatchScoreMeta = const VerificationMeta(
    'averageMatchScore',
  );
  @override
  late final GeneratedColumn<double> averageMatchScore =
      GeneratedColumn<double>(
        'average_match_score',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isFeaturedMeta = const VerificationMeta(
    'isFeatured',
  );
  @override
  late final GeneratedColumn<bool> isFeatured = GeneratedColumn<bool>(
    'is_featured',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_featured" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    providerName,
    shortDescription,
    longDescription,
    country,
    studyLevel,
    fieldOfStudy,
    fundingType,
    fundingAmount,
    color,
    icon,
    website,
    version,
    lastUpdated,
    author,
    usageCount,
    successRate,
    averageMatchScore,
    isActive,
    isFeatured,
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
    if (data.containsKey('short_description')) {
      context.handle(
        _shortDescriptionMeta,
        shortDescription.isAcceptableOrUnknown(
          data['short_description']!,
          _shortDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('long_description')) {
      context.handle(
        _longDescriptionMeta,
        longDescription.isAcceptableOrUnknown(
          data['long_description']!,
          _longDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('study_level')) {
      context.handle(
        _studyLevelMeta,
        studyLevel.isAcceptableOrUnknown(data['study_level']!, _studyLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_studyLevelMeta);
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
    if (data.containsKey('funding_type')) {
      context.handle(
        _fundingTypeMeta,
        fundingType.isAcceptableOrUnknown(
          data['funding_type']!,
          _fundingTypeMeta,
        ),
      );
    }
    if (data.containsKey('funding_amount')) {
      context.handle(
        _fundingAmountMeta,
        fundingAmount.isAcceptableOrUnknown(
          data['funding_amount']!,
          _fundingAmountMeta,
        ),
      );
    }
    if (data.containsKey('default_color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['default_color']!, _colorMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('official_url')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['official_url']!, _websiteMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('usage_count')) {
      context.handle(
        _usageCountMeta,
        usageCount.isAcceptableOrUnknown(data['usage_count']!, _usageCountMeta),
      );
    }
    if (data.containsKey('success_rate')) {
      context.handle(
        _successRateMeta,
        successRate.isAcceptableOrUnknown(
          data['success_rate']!,
          _successRateMeta,
        ),
      );
    }
    if (data.containsKey('average_match_score')) {
      context.handle(
        _averageMatchScoreMeta,
        averageMatchScore.isAcceptableOrUnknown(
          data['average_match_score']!,
          _averageMatchScoreMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_featured')) {
      context.handle(
        _isFeaturedMeta,
        isFeatured.isAcceptableOrUnknown(data['is_featured']!, _isFeaturedMeta),
      );
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
      shortDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_description'],
      ),
      longDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}long_description'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      studyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_level'],
      )!,
      fieldOfStudy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_of_study'],
      ),
      fundingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}funding_type'],
      ),
      fundingAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}funding_amount'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_color'],
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}official_url'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      usageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usage_count'],
      ),
      successRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}success_rate'],
      ),
      averageMatchScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}average_match_score'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isFeatured: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_featured'],
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
  final String? shortDescription;
  final String? longDescription;
  final String? country;
  final String studyLevel;
  final String? fieldOfStudy;
  final String? fundingType;
  final String? fundingAmount;
  final String? color;
  final String? icon;
  final String? website;
  final int version;
  final DateTime? lastUpdated;
  final String? author;
  final int? usageCount;
  final int? successRate;
  final double? averageMatchScore;
  final bool isActive;
  final bool isFeatured;
  const ScholarshipTemplate({
    required this.id,
    required this.name,
    required this.providerName,
    this.shortDescription,
    this.longDescription,
    this.country,
    required this.studyLevel,
    this.fieldOfStudy,
    this.fundingType,
    this.fundingAmount,
    this.color,
    this.icon,
    this.website,
    required this.version,
    this.lastUpdated,
    this.author,
    this.usageCount,
    this.successRate,
    this.averageMatchScore,
    required this.isActive,
    required this.isFeatured,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['provider_name'] = Variable<String>(providerName);
    if (!nullToAbsent || shortDescription != null) {
      map['short_description'] = Variable<String>(shortDescription);
    }
    if (!nullToAbsent || longDescription != null) {
      map['long_description'] = Variable<String>(longDescription);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    map['study_level'] = Variable<String>(studyLevel);
    if (!nullToAbsent || fieldOfStudy != null) {
      map['field_of_study'] = Variable<String>(fieldOfStudy);
    }
    if (!nullToAbsent || fundingType != null) {
      map['funding_type'] = Variable<String>(fundingType);
    }
    if (!nullToAbsent || fundingAmount != null) {
      map['funding_amount'] = Variable<String>(fundingAmount);
    }
    if (!nullToAbsent || color != null) {
      map['default_color'] = Variable<String>(color);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || website != null) {
      map['official_url'] = Variable<String>(website);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || usageCount != null) {
      map['usage_count'] = Variable<int>(usageCount);
    }
    if (!nullToAbsent || successRate != null) {
      map['success_rate'] = Variable<int>(successRate);
    }
    if (!nullToAbsent || averageMatchScore != null) {
      map['average_match_score'] = Variable<double>(averageMatchScore);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_featured'] = Variable<bool>(isFeatured);
    return map;
  }

  ScholarshipTemplatesCompanion toCompanion(bool nullToAbsent) {
    return ScholarshipTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      providerName: Value(providerName),
      shortDescription: shortDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(shortDescription),
      longDescription: longDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(longDescription),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      studyLevel: Value(studyLevel),
      fieldOfStudy: fieldOfStudy == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldOfStudy),
      fundingType: fundingType == null && nullToAbsent
          ? const Value.absent()
          : Value(fundingType),
      fundingAmount: fundingAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(fundingAmount),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      version: Value(version),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      usageCount: usageCount == null && nullToAbsent
          ? const Value.absent()
          : Value(usageCount),
      successRate: successRate == null && nullToAbsent
          ? const Value.absent()
          : Value(successRate),
      averageMatchScore: averageMatchScore == null && nullToAbsent
          ? const Value.absent()
          : Value(averageMatchScore),
      isActive: Value(isActive),
      isFeatured: Value(isFeatured),
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
      shortDescription: serializer.fromJson<String?>(json['shortDescription']),
      longDescription: serializer.fromJson<String?>(json['longDescription']),
      country: serializer.fromJson<String?>(json['country']),
      studyLevel: serializer.fromJson<String>(json['studyLevel']),
      fieldOfStudy: serializer.fromJson<String?>(json['fieldOfStudy']),
      fundingType: serializer.fromJson<String?>(json['fundingType']),
      fundingAmount: serializer.fromJson<String?>(json['fundingAmount']),
      color: serializer.fromJson<String?>(json['color']),
      icon: serializer.fromJson<String?>(json['icon']),
      website: serializer.fromJson<String?>(json['website']),
      version: serializer.fromJson<int>(json['version']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
      author: serializer.fromJson<String?>(json['author']),
      usageCount: serializer.fromJson<int?>(json['usageCount']),
      successRate: serializer.fromJson<int?>(json['successRate']),
      averageMatchScore: serializer.fromJson<double?>(
        json['averageMatchScore'],
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isFeatured: serializer.fromJson<bool>(json['isFeatured']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'providerName': serializer.toJson<String>(providerName),
      'shortDescription': serializer.toJson<String?>(shortDescription),
      'longDescription': serializer.toJson<String?>(longDescription),
      'country': serializer.toJson<String?>(country),
      'studyLevel': serializer.toJson<String>(studyLevel),
      'fieldOfStudy': serializer.toJson<String?>(fieldOfStudy),
      'fundingType': serializer.toJson<String?>(fundingType),
      'fundingAmount': serializer.toJson<String?>(fundingAmount),
      'color': serializer.toJson<String?>(color),
      'icon': serializer.toJson<String?>(icon),
      'website': serializer.toJson<String?>(website),
      'version': serializer.toJson<int>(version),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'author': serializer.toJson<String?>(author),
      'usageCount': serializer.toJson<int?>(usageCount),
      'successRate': serializer.toJson<int?>(successRate),
      'averageMatchScore': serializer.toJson<double?>(averageMatchScore),
      'isActive': serializer.toJson<bool>(isActive),
      'isFeatured': serializer.toJson<bool>(isFeatured),
    };
  }

  ScholarshipTemplate copyWith({
    String? id,
    String? name,
    String? providerName,
    Value<String?> shortDescription = const Value.absent(),
    Value<String?> longDescription = const Value.absent(),
    Value<String?> country = const Value.absent(),
    String? studyLevel,
    Value<String?> fieldOfStudy = const Value.absent(),
    Value<String?> fundingType = const Value.absent(),
    Value<String?> fundingAmount = const Value.absent(),
    Value<String?> color = const Value.absent(),
    Value<String?> icon = const Value.absent(),
    Value<String?> website = const Value.absent(),
    int? version,
    Value<DateTime?> lastUpdated = const Value.absent(),
    Value<String?> author = const Value.absent(),
    Value<int?> usageCount = const Value.absent(),
    Value<int?> successRate = const Value.absent(),
    Value<double?> averageMatchScore = const Value.absent(),
    bool? isActive,
    bool? isFeatured,
  }) => ScholarshipTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    providerName: providerName ?? this.providerName,
    shortDescription: shortDescription.present
        ? shortDescription.value
        : this.shortDescription,
    longDescription: longDescription.present
        ? longDescription.value
        : this.longDescription,
    country: country.present ? country.value : this.country,
    studyLevel: studyLevel ?? this.studyLevel,
    fieldOfStudy: fieldOfStudy.present ? fieldOfStudy.value : this.fieldOfStudy,
    fundingType: fundingType.present ? fundingType.value : this.fundingType,
    fundingAmount: fundingAmount.present
        ? fundingAmount.value
        : this.fundingAmount,
    color: color.present ? color.value : this.color,
    icon: icon.present ? icon.value : this.icon,
    website: website.present ? website.value : this.website,
    version: version ?? this.version,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
    author: author.present ? author.value : this.author,
    usageCount: usageCount.present ? usageCount.value : this.usageCount,
    successRate: successRate.present ? successRate.value : this.successRate,
    averageMatchScore: averageMatchScore.present
        ? averageMatchScore.value
        : this.averageMatchScore,
    isActive: isActive ?? this.isActive,
    isFeatured: isFeatured ?? this.isFeatured,
  );
  ScholarshipTemplate copyWithCompanion(ScholarshipTemplatesCompanion data) {
    return ScholarshipTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      providerName: data.providerName.present
          ? data.providerName.value
          : this.providerName,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      longDescription: data.longDescription.present
          ? data.longDescription.value
          : this.longDescription,
      country: data.country.present ? data.country.value : this.country,
      studyLevel: data.studyLevel.present
          ? data.studyLevel.value
          : this.studyLevel,
      fieldOfStudy: data.fieldOfStudy.present
          ? data.fieldOfStudy.value
          : this.fieldOfStudy,
      fundingType: data.fundingType.present
          ? data.fundingType.value
          : this.fundingType,
      fundingAmount: data.fundingAmount.present
          ? data.fundingAmount.value
          : this.fundingAmount,
      color: data.color.present ? data.color.value : this.color,
      icon: data.icon.present ? data.icon.value : this.icon,
      website: data.website.present ? data.website.value : this.website,
      version: data.version.present ? data.version.value : this.version,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      author: data.author.present ? data.author.value : this.author,
      usageCount: data.usageCount.present
          ? data.usageCount.value
          : this.usageCount,
      successRate: data.successRate.present
          ? data.successRate.value
          : this.successRate,
      averageMatchScore: data.averageMatchScore.present
          ? data.averageMatchScore.value
          : this.averageMatchScore,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isFeatured: data.isFeatured.present
          ? data.isFeatured.value
          : this.isFeatured,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScholarshipTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('providerName: $providerName, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('longDescription: $longDescription, ')
          ..write('country: $country, ')
          ..write('studyLevel: $studyLevel, ')
          ..write('fieldOfStudy: $fieldOfStudy, ')
          ..write('fundingType: $fundingType, ')
          ..write('fundingAmount: $fundingAmount, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('website: $website, ')
          ..write('version: $version, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('author: $author, ')
          ..write('usageCount: $usageCount, ')
          ..write('successRate: $successRate, ')
          ..write('averageMatchScore: $averageMatchScore, ')
          ..write('isActive: $isActive, ')
          ..write('isFeatured: $isFeatured')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    providerName,
    shortDescription,
    longDescription,
    country,
    studyLevel,
    fieldOfStudy,
    fundingType,
    fundingAmount,
    color,
    icon,
    website,
    version,
    lastUpdated,
    author,
    usageCount,
    successRate,
    averageMatchScore,
    isActive,
    isFeatured,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScholarshipTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.providerName == this.providerName &&
          other.shortDescription == this.shortDescription &&
          other.longDescription == this.longDescription &&
          other.country == this.country &&
          other.studyLevel == this.studyLevel &&
          other.fieldOfStudy == this.fieldOfStudy &&
          other.fundingType == this.fundingType &&
          other.fundingAmount == this.fundingAmount &&
          other.color == this.color &&
          other.icon == this.icon &&
          other.website == this.website &&
          other.version == this.version &&
          other.lastUpdated == this.lastUpdated &&
          other.author == this.author &&
          other.usageCount == this.usageCount &&
          other.successRate == this.successRate &&
          other.averageMatchScore == this.averageMatchScore &&
          other.isActive == this.isActive &&
          other.isFeatured == this.isFeatured);
}

class ScholarshipTemplatesCompanion
    extends UpdateCompanion<ScholarshipTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> providerName;
  final Value<String?> shortDescription;
  final Value<String?> longDescription;
  final Value<String?> country;
  final Value<String> studyLevel;
  final Value<String?> fieldOfStudy;
  final Value<String?> fundingType;
  final Value<String?> fundingAmount;
  final Value<String?> color;
  final Value<String?> icon;
  final Value<String?> website;
  final Value<int> version;
  final Value<DateTime?> lastUpdated;
  final Value<String?> author;
  final Value<int?> usageCount;
  final Value<int?> successRate;
  final Value<double?> averageMatchScore;
  final Value<bool> isActive;
  final Value<bool> isFeatured;
  final Value<int> rowid;
  const ScholarshipTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.providerName = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.longDescription = const Value.absent(),
    this.country = const Value.absent(),
    this.studyLevel = const Value.absent(),
    this.fieldOfStudy = const Value.absent(),
    this.fundingType = const Value.absent(),
    this.fundingAmount = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.website = const Value.absent(),
    this.version = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.author = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.successRate = const Value.absent(),
    this.averageMatchScore = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isFeatured = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScholarshipTemplatesCompanion.insert({
    required String id,
    required String name,
    required String providerName,
    this.shortDescription = const Value.absent(),
    this.longDescription = const Value.absent(),
    this.country = const Value.absent(),
    required String studyLevel,
    this.fieldOfStudy = const Value.absent(),
    this.fundingType = const Value.absent(),
    this.fundingAmount = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.website = const Value.absent(),
    this.version = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.author = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.successRate = const Value.absent(),
    this.averageMatchScore = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isFeatured = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       providerName = Value(providerName),
       studyLevel = Value(studyLevel);
  static Insertable<ScholarshipTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? providerName,
    Expression<String>? shortDescription,
    Expression<String>? longDescription,
    Expression<String>? country,
    Expression<String>? studyLevel,
    Expression<String>? fieldOfStudy,
    Expression<String>? fundingType,
    Expression<String>? fundingAmount,
    Expression<String>? color,
    Expression<String>? icon,
    Expression<String>? website,
    Expression<int>? version,
    Expression<DateTime>? lastUpdated,
    Expression<String>? author,
    Expression<int>? usageCount,
    Expression<int>? successRate,
    Expression<double>? averageMatchScore,
    Expression<bool>? isActive,
    Expression<bool>? isFeatured,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (providerName != null) 'provider_name': providerName,
      if (shortDescription != null) 'short_description': shortDescription,
      if (longDescription != null) 'long_description': longDescription,
      if (country != null) 'country': country,
      if (studyLevel != null) 'study_level': studyLevel,
      if (fieldOfStudy != null) 'field_of_study': fieldOfStudy,
      if (fundingType != null) 'funding_type': fundingType,
      if (fundingAmount != null) 'funding_amount': fundingAmount,
      if (color != null) 'default_color': color,
      if (icon != null) 'icon': icon,
      if (website != null) 'official_url': website,
      if (version != null) 'version': version,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (author != null) 'author': author,
      if (usageCount != null) 'usage_count': usageCount,
      if (successRate != null) 'success_rate': successRate,
      if (averageMatchScore != null) 'average_match_score': averageMatchScore,
      if (isActive != null) 'is_active': isActive,
      if (isFeatured != null) 'is_featured': isFeatured,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScholarshipTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? providerName,
    Value<String?>? shortDescription,
    Value<String?>? longDescription,
    Value<String?>? country,
    Value<String>? studyLevel,
    Value<String?>? fieldOfStudy,
    Value<String?>? fundingType,
    Value<String?>? fundingAmount,
    Value<String?>? color,
    Value<String?>? icon,
    Value<String?>? website,
    Value<int>? version,
    Value<DateTime?>? lastUpdated,
    Value<String?>? author,
    Value<int?>? usageCount,
    Value<int?>? successRate,
    Value<double?>? averageMatchScore,
    Value<bool>? isActive,
    Value<bool>? isFeatured,
    Value<int>? rowid,
  }) {
    return ScholarshipTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      providerName: providerName ?? this.providerName,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      country: country ?? this.country,
      studyLevel: studyLevel ?? this.studyLevel,
      fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
      fundingType: fundingType ?? this.fundingType,
      fundingAmount: fundingAmount ?? this.fundingAmount,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      website: website ?? this.website,
      version: version ?? this.version,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      author: author ?? this.author,
      usageCount: usageCount ?? this.usageCount,
      successRate: successRate ?? this.successRate,
      averageMatchScore: averageMatchScore ?? this.averageMatchScore,
      isActive: isActive ?? this.isActive,
      isFeatured: isFeatured ?? this.isFeatured,
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
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (longDescription.present) {
      map['long_description'] = Variable<String>(longDescription.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (studyLevel.present) {
      map['study_level'] = Variable<String>(studyLevel.value);
    }
    if (fieldOfStudy.present) {
      map['field_of_study'] = Variable<String>(fieldOfStudy.value);
    }
    if (fundingType.present) {
      map['funding_type'] = Variable<String>(fundingType.value);
    }
    if (fundingAmount.present) {
      map['funding_amount'] = Variable<String>(fundingAmount.value);
    }
    if (color.present) {
      map['default_color'] = Variable<String>(color.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (website.present) {
      map['official_url'] = Variable<String>(website.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (successRate.present) {
      map['success_rate'] = Variable<int>(successRate.value);
    }
    if (averageMatchScore.present) {
      map['average_match_score'] = Variable<double>(averageMatchScore.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isFeatured.present) {
      map['is_featured'] = Variable<bool>(isFeatured.value);
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
          ..write('shortDescription: $shortDescription, ')
          ..write('longDescription: $longDescription, ')
          ..write('country: $country, ')
          ..write('studyLevel: $studyLevel, ')
          ..write('fieldOfStudy: $fieldOfStudy, ')
          ..write('fundingType: $fundingType, ')
          ..write('fundingAmount: $fundingAmount, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('website: $website, ')
          ..write('version: $version, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('author: $author, ')
          ..write('usageCount: $usageCount, ')
          ..write('successRate: $successRate, ')
          ..write('averageMatchScore: $averageMatchScore, ')
          ..write('isActive: $isActive, ')
          ..write('isFeatured: $isFeatured, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TemplateDocumentsTable extends TemplateDocuments
    with TableInfo<$TemplateDocumentsTable, TemplateDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateDocumentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isOptionalMeta = const VerificationMeta(
    'isOptional',
  );
  @override
  late final GeneratedColumn<bool> isOptional = GeneratedColumn<bool>(
    'is_optional',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_optional" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DocumentSubmissionType, int>
  submissionType =
      GeneratedColumn<int>(
        'submission_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(1),
      ).withConverter<DocumentSubmissionType>(
        $TemplateDocumentsTable.$convertersubmissionType,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    templateId,
    name,
    isOptional,
    submissionType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'template_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<TemplateDocument> instance, {
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_optional')) {
      context.handle(
        _isOptionalMeta,
        isOptional.isAcceptableOrUnknown(data['is_optional']!, _isOptionalMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemplateDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplateDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isOptional: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_optional'],
      )!,
      submissionType: $TemplateDocumentsTable.$convertersubmissionType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}submission_type'],
        )!,
      ),
    );
  }

  @override
  $TemplateDocumentsTable createAlias(String alias) {
    return $TemplateDocumentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DocumentSubmissionType, int, int>
  $convertersubmissionType = const EnumIndexConverter<DocumentSubmissionType>(
    DocumentSubmissionType.values,
  );
}

class TemplateDocument extends DataClass
    implements Insertable<TemplateDocument> {
  final int id;
  final String templateId;
  final String name;
  final bool isOptional;
  final DocumentSubmissionType submissionType;
  const TemplateDocument({
    required this.id,
    required this.templateId,
    required this.name,
    required this.isOptional,
    required this.submissionType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['template_id'] = Variable<String>(templateId);
    map['name'] = Variable<String>(name);
    map['is_optional'] = Variable<bool>(isOptional);
    {
      map['submission_type'] = Variable<int>(
        $TemplateDocumentsTable.$convertersubmissionType.toSql(submissionType),
      );
    }
    return map;
  }

  TemplateDocumentsCompanion toCompanion(bool nullToAbsent) {
    return TemplateDocumentsCompanion(
      id: Value(id),
      templateId: Value(templateId),
      name: Value(name),
      isOptional: Value(isOptional),
      submissionType: Value(submissionType),
    );
  }

  factory TemplateDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplateDocument(
      id: serializer.fromJson<int>(json['id']),
      templateId: serializer.fromJson<String>(json['templateId']),
      name: serializer.fromJson<String>(json['name']),
      isOptional: serializer.fromJson<bool>(json['isOptional']),
      submissionType: $TemplateDocumentsTable.$convertersubmissionType.fromJson(
        serializer.fromJson<int>(json['submissionType']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templateId': serializer.toJson<String>(templateId),
      'name': serializer.toJson<String>(name),
      'isOptional': serializer.toJson<bool>(isOptional),
      'submissionType': serializer.toJson<int>(
        $TemplateDocumentsTable.$convertersubmissionType.toJson(submissionType),
      ),
    };
  }

  TemplateDocument copyWith({
    int? id,
    String? templateId,
    String? name,
    bool? isOptional,
    DocumentSubmissionType? submissionType,
  }) => TemplateDocument(
    id: id ?? this.id,
    templateId: templateId ?? this.templateId,
    name: name ?? this.name,
    isOptional: isOptional ?? this.isOptional,
    submissionType: submissionType ?? this.submissionType,
  );
  TemplateDocument copyWithCompanion(TemplateDocumentsCompanion data) {
    return TemplateDocument(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      name: data.name.present ? data.name.value : this.name,
      isOptional: data.isOptional.present
          ? data.isOptional.value
          : this.isOptional,
      submissionType: data.submissionType.present
          ? data.submissionType.value
          : this.submissionType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TemplateDocument(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('name: $name, ')
          ..write('isOptional: $isOptional, ')
          ..write('submissionType: $submissionType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, templateId, name, isOptional, submissionType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplateDocument &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.name == this.name &&
          other.isOptional == this.isOptional &&
          other.submissionType == this.submissionType);
}

class TemplateDocumentsCompanion extends UpdateCompanion<TemplateDocument> {
  final Value<int> id;
  final Value<String> templateId;
  final Value<String> name;
  final Value<bool> isOptional;
  final Value<DocumentSubmissionType> submissionType;
  const TemplateDocumentsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.name = const Value.absent(),
    this.isOptional = const Value.absent(),
    this.submissionType = const Value.absent(),
  });
  TemplateDocumentsCompanion.insert({
    this.id = const Value.absent(),
    required String templateId,
    required String name,
    this.isOptional = const Value.absent(),
    this.submissionType = const Value.absent(),
  }) : templateId = Value(templateId),
       name = Value(name);
  static Insertable<TemplateDocument> custom({
    Expression<int>? id,
    Expression<String>? templateId,
    Expression<String>? name,
    Expression<bool>? isOptional,
    Expression<int>? submissionType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (name != null) 'name': name,
      if (isOptional != null) 'is_optional': isOptional,
      if (submissionType != null) 'submission_type': submissionType,
    });
  }

  TemplateDocumentsCompanion copyWith({
    Value<int>? id,
    Value<String>? templateId,
    Value<String>? name,
    Value<bool>? isOptional,
    Value<DocumentSubmissionType>? submissionType,
  }) {
    return TemplateDocumentsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      name: name ?? this.name,
      isOptional: isOptional ?? this.isOptional,
      submissionType: submissionType ?? this.submissionType,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isOptional.present) {
      map['is_optional'] = Variable<bool>(isOptional.value);
    }
    if (submissionType.present) {
      map['submission_type'] = Variable<int>(
        $TemplateDocumentsTable.$convertersubmissionType.toSql(
          submissionType.value,
        ),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('name: $name, ')
          ..write('isOptional: $isOptional, ')
          ..write('submissionType: $submissionType')
          ..write(')'))
        .toString();
  }
}

class $MilestoneTemplatesTable extends MilestoneTemplates
    with TableInfo<$MilestoneTemplatesTable, MilestoneTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MilestoneTemplatesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guideIdMeta = const VerificationMeta(
    'guideId',
  );
  @override
  late final GeneratedColumn<String> guideId = GeneratedColumn<String>(
    'guide_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    guideId,
    isCustom,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'milestone_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<MilestoneTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('guide_id')) {
      context.handle(
        _guideIdMeta,
        guideId.isAcceptableOrUnknown(data['guide_id']!, _guideIdMeta),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MilestoneTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MilestoneTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      guideId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guide_id'],
      ),
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
    );
  }

  @override
  $MilestoneTemplatesTable createAlias(String alias) {
    return $MilestoneTemplatesTable(attachedDatabase, alias);
  }
}

class MilestoneTemplate extends DataClass
    implements Insertable<MilestoneTemplate> {
  final int id;
  final String name;
  final String? description;
  final String? guideId;
  final bool isCustom;
  const MilestoneTemplate({
    required this.id,
    required this.name,
    this.description,
    this.guideId,
    required this.isCustom,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || guideId != null) {
      map['guide_id'] = Variable<String>(guideId);
    }
    map['is_custom'] = Variable<bool>(isCustom);
    return map;
  }

  MilestoneTemplatesCompanion toCompanion(bool nullToAbsent) {
    return MilestoneTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      guideId: guideId == null && nullToAbsent
          ? const Value.absent()
          : Value(guideId),
      isCustom: Value(isCustom),
    );
  }

  factory MilestoneTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MilestoneTemplate(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      guideId: serializer.fromJson<String?>(json['guideId']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'guideId': serializer.toJson<String?>(guideId),
      'isCustom': serializer.toJson<bool>(isCustom),
    };
  }

  MilestoneTemplate copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> guideId = const Value.absent(),
    bool? isCustom,
  }) => MilestoneTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    guideId: guideId.present ? guideId.value : this.guideId,
    isCustom: isCustom ?? this.isCustom,
  );
  MilestoneTemplate copyWithCompanion(MilestoneTemplatesCompanion data) {
    return MilestoneTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      guideId: data.guideId.present ? data.guideId.value : this.guideId,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MilestoneTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('guideId: $guideId, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, guideId, isCustom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MilestoneTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.guideId == this.guideId &&
          other.isCustom == this.isCustom);
}

class MilestoneTemplatesCompanion extends UpdateCompanion<MilestoneTemplate> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> guideId;
  final Value<bool> isCustom;
  const MilestoneTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.guideId = const Value.absent(),
    this.isCustom = const Value.absent(),
  });
  MilestoneTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.guideId = const Value.absent(),
    this.isCustom = const Value.absent(),
  }) : name = Value(name);
  static Insertable<MilestoneTemplate> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? guideId,
    Expression<bool>? isCustom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (guideId != null) 'guide_id': guideId,
      if (isCustom != null) 'is_custom': isCustom,
    });
  }

  MilestoneTemplatesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? guideId,
    Value<bool>? isCustom,
  }) {
    return MilestoneTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      guideId: guideId ?? this.guideId,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (guideId.present) {
      map['guide_id'] = Variable<String>(guideId.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MilestoneTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('guideId: $guideId, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }
}

class $TaskTemplatesTable extends TaskTemplates
    with TableInfo<$TaskTemplatesTable, TaskTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTemplatesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _milestoneTemplateIdMeta =
      const VerificationMeta('milestoneTemplateId');
  @override
  late final GeneratedColumn<int> milestoneTemplateId = GeneratedColumn<int>(
    'milestone_template_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES milestone_templates (id)',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultOffsetDaysMeta = const VerificationMeta(
    'defaultOffsetDays',
  );
  @override
  late final GeneratedColumn<int> defaultOffsetDays = GeneratedColumn<int>(
    'default_offset_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isRequiredMeta = const VerificationMeta(
    'isRequired',
  );
  @override
  late final GeneratedColumn<bool> isRequired = GeneratedColumn<bool>(
    'is_required',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_required" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    milestoneTemplateId,
    label,
    defaultOffsetDays,
    displayOrder,
    isRequired,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('milestone_template_id')) {
      context.handle(
        _milestoneTemplateIdMeta,
        milestoneTemplateId.isAcceptableOrUnknown(
          data['milestone_template_id']!,
          _milestoneTemplateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_milestoneTemplateIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('default_offset_days')) {
      context.handle(
        _defaultOffsetDaysMeta,
        defaultOffsetDays.isAcceptableOrUnknown(
          data['default_offset_days']!,
          _defaultOffsetDaysMeta,
        ),
      );
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    }
    if (data.containsKey('is_required')) {
      context.handle(
        _isRequiredMeta,
        isRequired.isAcceptableOrUnknown(data['is_required']!, _isRequiredMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      milestoneTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}milestone_template_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      defaultOffsetDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_offset_days'],
      )!,
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
      isRequired: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_required'],
      )!,
    );
  }

  @override
  $TaskTemplatesTable createAlias(String alias) {
    return $TaskTemplatesTable(attachedDatabase, alias);
  }
}

class TaskTemplate extends DataClass implements Insertable<TaskTemplate> {
  final int id;
  final int milestoneTemplateId;
  final String label;
  final int defaultOffsetDays;
  final int displayOrder;
  final bool isRequired;
  const TaskTemplate({
    required this.id,
    required this.milestoneTemplateId,
    required this.label,
    required this.defaultOffsetDays,
    required this.displayOrder,
    required this.isRequired,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['milestone_template_id'] = Variable<int>(milestoneTemplateId);
    map['label'] = Variable<String>(label);
    map['default_offset_days'] = Variable<int>(defaultOffsetDays);
    map['display_order'] = Variable<int>(displayOrder);
    map['is_required'] = Variable<bool>(isRequired);
    return map;
  }

  TaskTemplatesCompanion toCompanion(bool nullToAbsent) {
    return TaskTemplatesCompanion(
      id: Value(id),
      milestoneTemplateId: Value(milestoneTemplateId),
      label: Value(label),
      defaultOffsetDays: Value(defaultOffsetDays),
      displayOrder: Value(displayOrder),
      isRequired: Value(isRequired),
    );
  }

  factory TaskTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTemplate(
      id: serializer.fromJson<int>(json['id']),
      milestoneTemplateId: serializer.fromJson<int>(
        json['milestoneTemplateId'],
      ),
      label: serializer.fromJson<String>(json['label']),
      defaultOffsetDays: serializer.fromJson<int>(json['defaultOffsetDays']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      isRequired: serializer.fromJson<bool>(json['isRequired']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'milestoneTemplateId': serializer.toJson<int>(milestoneTemplateId),
      'label': serializer.toJson<String>(label),
      'defaultOffsetDays': serializer.toJson<int>(defaultOffsetDays),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'isRequired': serializer.toJson<bool>(isRequired),
    };
  }

  TaskTemplate copyWith({
    int? id,
    int? milestoneTemplateId,
    String? label,
    int? defaultOffsetDays,
    int? displayOrder,
    bool? isRequired,
  }) => TaskTemplate(
    id: id ?? this.id,
    milestoneTemplateId: milestoneTemplateId ?? this.milestoneTemplateId,
    label: label ?? this.label,
    defaultOffsetDays: defaultOffsetDays ?? this.defaultOffsetDays,
    displayOrder: displayOrder ?? this.displayOrder,
    isRequired: isRequired ?? this.isRequired,
  );
  TaskTemplate copyWithCompanion(TaskTemplatesCompanion data) {
    return TaskTemplate(
      id: data.id.present ? data.id.value : this.id,
      milestoneTemplateId: data.milestoneTemplateId.present
          ? data.milestoneTemplateId.value
          : this.milestoneTemplateId,
      label: data.label.present ? data.label.value : this.label,
      defaultOffsetDays: data.defaultOffsetDays.present
          ? data.defaultOffsetDays.value
          : this.defaultOffsetDays,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      isRequired: data.isRequired.present
          ? data.isRequired.value
          : this.isRequired,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTemplate(')
          ..write('id: $id, ')
          ..write('milestoneTemplateId: $milestoneTemplateId, ')
          ..write('label: $label, ')
          ..write('defaultOffsetDays: $defaultOffsetDays, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('isRequired: $isRequired')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    milestoneTemplateId,
    label,
    defaultOffsetDays,
    displayOrder,
    isRequired,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTemplate &&
          other.id == this.id &&
          other.milestoneTemplateId == this.milestoneTemplateId &&
          other.label == this.label &&
          other.defaultOffsetDays == this.defaultOffsetDays &&
          other.displayOrder == this.displayOrder &&
          other.isRequired == this.isRequired);
}

class TaskTemplatesCompanion extends UpdateCompanion<TaskTemplate> {
  final Value<int> id;
  final Value<int> milestoneTemplateId;
  final Value<String> label;
  final Value<int> defaultOffsetDays;
  final Value<int> displayOrder;
  final Value<bool> isRequired;
  const TaskTemplatesCompanion({
    this.id = const Value.absent(),
    this.milestoneTemplateId = const Value.absent(),
    this.label = const Value.absent(),
    this.defaultOffsetDays = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.isRequired = const Value.absent(),
  });
  TaskTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required int milestoneTemplateId,
    required String label,
    this.defaultOffsetDays = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.isRequired = const Value.absent(),
  }) : milestoneTemplateId = Value(milestoneTemplateId),
       label = Value(label);
  static Insertable<TaskTemplate> custom({
    Expression<int>? id,
    Expression<int>? milestoneTemplateId,
    Expression<String>? label,
    Expression<int>? defaultOffsetDays,
    Expression<int>? displayOrder,
    Expression<bool>? isRequired,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (milestoneTemplateId != null)
        'milestone_template_id': milestoneTemplateId,
      if (label != null) 'label': label,
      if (defaultOffsetDays != null) 'default_offset_days': defaultOffsetDays,
      if (displayOrder != null) 'display_order': displayOrder,
      if (isRequired != null) 'is_required': isRequired,
    });
  }

  TaskTemplatesCompanion copyWith({
    Value<int>? id,
    Value<int>? milestoneTemplateId,
    Value<String>? label,
    Value<int>? defaultOffsetDays,
    Value<int>? displayOrder,
    Value<bool>? isRequired,
  }) {
    return TaskTemplatesCompanion(
      id: id ?? this.id,
      milestoneTemplateId: milestoneTemplateId ?? this.milestoneTemplateId,
      label: label ?? this.label,
      defaultOffsetDays: defaultOffsetDays ?? this.defaultOffsetDays,
      displayOrder: displayOrder ?? this.displayOrder,
      isRequired: isRequired ?? this.isRequired,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (milestoneTemplateId.present) {
      map['milestone_template_id'] = Variable<int>(milestoneTemplateId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (defaultOffsetDays.present) {
      map['default_offset_days'] = Variable<int>(defaultOffsetDays.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (isRequired.present) {
      map['is_required'] = Variable<bool>(isRequired.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('milestoneTemplateId: $milestoneTemplateId, ')
          ..write('label: $label, ')
          ..write('defaultOffsetDays: $defaultOffsetDays, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('isRequired: $isRequired')
          ..write(')'))
        .toString();
  }
}

class $ScholarshipMilestoneLinksTable extends ScholarshipMilestoneLinks
    with TableInfo<$ScholarshipMilestoneLinksTable, ScholarshipMilestoneLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScholarshipMilestoneLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _scholarshipTemplateIdMeta =
      const VerificationMeta('scholarshipTemplateId');
  @override
  late final GeneratedColumn<String> scholarshipTemplateId =
      GeneratedColumn<String>(
        'scholarship_template_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES scholarship_templates (id)',
        ),
      );
  static const VerificationMeta _milestoneTemplateIdMeta =
      const VerificationMeta('milestoneTemplateId');
  @override
  late final GeneratedColumn<int> milestoneTemplateId = GeneratedColumn<int>(
    'milestone_template_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES milestone_templates (id)',
    ),
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateOffsetDaysMeta =
      const VerificationMeta('startDateOffsetDays');
  @override
  late final GeneratedColumn<int> startDateOffsetDays = GeneratedColumn<int>(
    'start_date_offset_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateOffsetDaysMeta = const VerificationMeta(
    'endDateOffsetDays',
  );
  @override
  late final GeneratedColumn<int> endDateOffsetDays = GeneratedColumn<int>(
    'end_date_offset_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    scholarshipTemplateId,
    milestoneTemplateId,
    order,
    startDateOffsetDays,
    endDateOffsetDays,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scholarship_milestone_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScholarshipMilestoneLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('scholarship_template_id')) {
      context.handle(
        _scholarshipTemplateIdMeta,
        scholarshipTemplateId.isAcceptableOrUnknown(
          data['scholarship_template_id']!,
          _scholarshipTemplateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scholarshipTemplateIdMeta);
    }
    if (data.containsKey('milestone_template_id')) {
      context.handle(
        _milestoneTemplateIdMeta,
        milestoneTemplateId.isAcceptableOrUnknown(
          data['milestone_template_id']!,
          _milestoneTemplateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_milestoneTemplateIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('start_date_offset_days')) {
      context.handle(
        _startDateOffsetDaysMeta,
        startDateOffsetDays.isAcceptableOrUnknown(
          data['start_date_offset_days']!,
          _startDateOffsetDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startDateOffsetDaysMeta);
    }
    if (data.containsKey('end_date_offset_days')) {
      context.handle(
        _endDateOffsetDaysMeta,
        endDateOffsetDays.isAcceptableOrUnknown(
          data['end_date_offset_days']!,
          _endDateOffsetDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_endDateOffsetDaysMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    scholarshipTemplateId,
    milestoneTemplateId,
  };
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {scholarshipTemplateId, order},
  ];
  @override
  ScholarshipMilestoneLink map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScholarshipMilestoneLink(
      scholarshipTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scholarship_template_id'],
      )!,
      milestoneTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}milestone_template_id'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      )!,
      startDateOffsetDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_date_offset_days'],
      )!,
      endDateOffsetDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_date_offset_days'],
      )!,
    );
  }

  @override
  $ScholarshipMilestoneLinksTable createAlias(String alias) {
    return $ScholarshipMilestoneLinksTable(attachedDatabase, alias);
  }
}

class ScholarshipMilestoneLink extends DataClass
    implements Insertable<ScholarshipMilestoneLink> {
  final String scholarshipTemplateId;
  final int milestoneTemplateId;
  final int order;
  final int startDateOffsetDays;
  final int endDateOffsetDays;
  const ScholarshipMilestoneLink({
    required this.scholarshipTemplateId,
    required this.milestoneTemplateId,
    required this.order,
    required this.startDateOffsetDays,
    required this.endDateOffsetDays,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['scholarship_template_id'] = Variable<String>(scholarshipTemplateId);
    map['milestone_template_id'] = Variable<int>(milestoneTemplateId);
    map['order'] = Variable<int>(order);
    map['start_date_offset_days'] = Variable<int>(startDateOffsetDays);
    map['end_date_offset_days'] = Variable<int>(endDateOffsetDays);
    return map;
  }

  ScholarshipMilestoneLinksCompanion toCompanion(bool nullToAbsent) {
    return ScholarshipMilestoneLinksCompanion(
      scholarshipTemplateId: Value(scholarshipTemplateId),
      milestoneTemplateId: Value(milestoneTemplateId),
      order: Value(order),
      startDateOffsetDays: Value(startDateOffsetDays),
      endDateOffsetDays: Value(endDateOffsetDays),
    );
  }

  factory ScholarshipMilestoneLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScholarshipMilestoneLink(
      scholarshipTemplateId: serializer.fromJson<String>(
        json['scholarshipTemplateId'],
      ),
      milestoneTemplateId: serializer.fromJson<int>(
        json['milestoneTemplateId'],
      ),
      order: serializer.fromJson<int>(json['order']),
      startDateOffsetDays: serializer.fromJson<int>(
        json['startDateOffsetDays'],
      ),
      endDateOffsetDays: serializer.fromJson<int>(json['endDateOffsetDays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scholarshipTemplateId': serializer.toJson<String>(scholarshipTemplateId),
      'milestoneTemplateId': serializer.toJson<int>(milestoneTemplateId),
      'order': serializer.toJson<int>(order),
      'startDateOffsetDays': serializer.toJson<int>(startDateOffsetDays),
      'endDateOffsetDays': serializer.toJson<int>(endDateOffsetDays),
    };
  }

  ScholarshipMilestoneLink copyWith({
    String? scholarshipTemplateId,
    int? milestoneTemplateId,
    int? order,
    int? startDateOffsetDays,
    int? endDateOffsetDays,
  }) => ScholarshipMilestoneLink(
    scholarshipTemplateId: scholarshipTemplateId ?? this.scholarshipTemplateId,
    milestoneTemplateId: milestoneTemplateId ?? this.milestoneTemplateId,
    order: order ?? this.order,
    startDateOffsetDays: startDateOffsetDays ?? this.startDateOffsetDays,
    endDateOffsetDays: endDateOffsetDays ?? this.endDateOffsetDays,
  );
  ScholarshipMilestoneLink copyWithCompanion(
    ScholarshipMilestoneLinksCompanion data,
  ) {
    return ScholarshipMilestoneLink(
      scholarshipTemplateId: data.scholarshipTemplateId.present
          ? data.scholarshipTemplateId.value
          : this.scholarshipTemplateId,
      milestoneTemplateId: data.milestoneTemplateId.present
          ? data.milestoneTemplateId.value
          : this.milestoneTemplateId,
      order: data.order.present ? data.order.value : this.order,
      startDateOffsetDays: data.startDateOffsetDays.present
          ? data.startDateOffsetDays.value
          : this.startDateOffsetDays,
      endDateOffsetDays: data.endDateOffsetDays.present
          ? data.endDateOffsetDays.value
          : this.endDateOffsetDays,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScholarshipMilestoneLink(')
          ..write('scholarshipTemplateId: $scholarshipTemplateId, ')
          ..write('milestoneTemplateId: $milestoneTemplateId, ')
          ..write('order: $order, ')
          ..write('startDateOffsetDays: $startDateOffsetDays, ')
          ..write('endDateOffsetDays: $endDateOffsetDays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    scholarshipTemplateId,
    milestoneTemplateId,
    order,
    startDateOffsetDays,
    endDateOffsetDays,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScholarshipMilestoneLink &&
          other.scholarshipTemplateId == this.scholarshipTemplateId &&
          other.milestoneTemplateId == this.milestoneTemplateId &&
          other.order == this.order &&
          other.startDateOffsetDays == this.startDateOffsetDays &&
          other.endDateOffsetDays == this.endDateOffsetDays);
}

class ScholarshipMilestoneLinksCompanion
    extends UpdateCompanion<ScholarshipMilestoneLink> {
  final Value<String> scholarshipTemplateId;
  final Value<int> milestoneTemplateId;
  final Value<int> order;
  final Value<int> startDateOffsetDays;
  final Value<int> endDateOffsetDays;
  final Value<int> rowid;
  const ScholarshipMilestoneLinksCompanion({
    this.scholarshipTemplateId = const Value.absent(),
    this.milestoneTemplateId = const Value.absent(),
    this.order = const Value.absent(),
    this.startDateOffsetDays = const Value.absent(),
    this.endDateOffsetDays = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScholarshipMilestoneLinksCompanion.insert({
    required String scholarshipTemplateId,
    required int milestoneTemplateId,
    required int order,
    required int startDateOffsetDays,
    required int endDateOffsetDays,
    this.rowid = const Value.absent(),
  }) : scholarshipTemplateId = Value(scholarshipTemplateId),
       milestoneTemplateId = Value(milestoneTemplateId),
       order = Value(order),
       startDateOffsetDays = Value(startDateOffsetDays),
       endDateOffsetDays = Value(endDateOffsetDays);
  static Insertable<ScholarshipMilestoneLink> custom({
    Expression<String>? scholarshipTemplateId,
    Expression<int>? milestoneTemplateId,
    Expression<int>? order,
    Expression<int>? startDateOffsetDays,
    Expression<int>? endDateOffsetDays,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (scholarshipTemplateId != null)
        'scholarship_template_id': scholarshipTemplateId,
      if (milestoneTemplateId != null)
        'milestone_template_id': milestoneTemplateId,
      if (order != null) 'order': order,
      if (startDateOffsetDays != null)
        'start_date_offset_days': startDateOffsetDays,
      if (endDateOffsetDays != null) 'end_date_offset_days': endDateOffsetDays,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScholarshipMilestoneLinksCompanion copyWith({
    Value<String>? scholarshipTemplateId,
    Value<int>? milestoneTemplateId,
    Value<int>? order,
    Value<int>? startDateOffsetDays,
    Value<int>? endDateOffsetDays,
    Value<int>? rowid,
  }) {
    return ScholarshipMilestoneLinksCompanion(
      scholarshipTemplateId:
          scholarshipTemplateId ?? this.scholarshipTemplateId,
      milestoneTemplateId: milestoneTemplateId ?? this.milestoneTemplateId,
      order: order ?? this.order,
      startDateOffsetDays: startDateOffsetDays ?? this.startDateOffsetDays,
      endDateOffsetDays: endDateOffsetDays ?? this.endDateOffsetDays,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scholarshipTemplateId.present) {
      map['scholarship_template_id'] = Variable<String>(
        scholarshipTemplateId.value,
      );
    }
    if (milestoneTemplateId.present) {
      map['milestone_template_id'] = Variable<int>(milestoneTemplateId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (startDateOffsetDays.present) {
      map['start_date_offset_days'] = Variable<int>(startDateOffsetDays.value);
    }
    if (endDateOffsetDays.present) {
      map['end_date_offset_days'] = Variable<int>(endDateOffsetDays.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScholarshipMilestoneLinksCompanion(')
          ..write('scholarshipTemplateId: $scholarshipTemplateId, ')
          ..write('milestoneTemplateId: $milestoneTemplateId, ')
          ..write('order: $order, ')
          ..write('startDateOffsetDays: $startDateOffsetDays, ')
          ..write('endDateOffsetDays: $endDateOffsetDays, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserApplicationsTable extends UserApplications
    with TableInfo<$UserApplicationsTable, UserApplication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserApplicationsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _customNameMeta = const VerificationMeta(
    'customName',
  );
  @override
  late final GeneratedColumn<String> customName = GeneratedColumn<String>(
    'custom_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customColorMeta = const VerificationMeta(
    'customColor',
  );
  @override
  late final GeneratedColumn<String> customColor = GeneratedColumn<String>(
    'custom_color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    templateId,
    customName,
    customColor,
    notes,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_applications';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserApplication> instance, {
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
    if (data.containsKey('custom_name')) {
      context.handle(
        _customNameMeta,
        customName.isAcceptableOrUnknown(data['custom_name']!, _customNameMeta),
      );
    } else if (isInserting) {
      context.missing(_customNameMeta);
    }
    if (data.containsKey('custom_color')) {
      context.handle(
        _customColorMeta,
        customColor.isAcceptableOrUnknown(
          data['custom_color']!,
          _customColorMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserApplication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserApplication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      )!,
      customName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_name'],
      )!,
      customColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_color'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserApplicationsTable createAlias(String alias) {
    return $UserApplicationsTable(attachedDatabase, alias);
  }
}

class UserApplication extends DataClass implements Insertable<UserApplication> {
  final int id;
  final String templateId;
  final String customName;
  final String? customColor;
  final String? notes;
  final String status;
  final DateTime createdAt;
  const UserApplication({
    required this.id,
    required this.templateId,
    required this.customName,
    this.customColor,
    this.notes,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['template_id'] = Variable<String>(templateId);
    map['custom_name'] = Variable<String>(customName);
    if (!nullToAbsent || customColor != null) {
      map['custom_color'] = Variable<String>(customColor);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserApplicationsCompanion toCompanion(bool nullToAbsent) {
    return UserApplicationsCompanion(
      id: Value(id),
      templateId: Value(templateId),
      customName: Value(customName),
      customColor: customColor == null && nullToAbsent
          ? const Value.absent()
          : Value(customColor),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory UserApplication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserApplication(
      id: serializer.fromJson<int>(json['id']),
      templateId: serializer.fromJson<String>(json['templateId']),
      customName: serializer.fromJson<String>(json['customName']),
      customColor: serializer.fromJson<String?>(json['customColor']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templateId': serializer.toJson<String>(templateId),
      'customName': serializer.toJson<String>(customName),
      'customColor': serializer.toJson<String?>(customColor),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserApplication copyWith({
    int? id,
    String? templateId,
    String? customName,
    Value<String?> customColor = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? status,
    DateTime? createdAt,
  }) => UserApplication(
    id: id ?? this.id,
    templateId: templateId ?? this.templateId,
    customName: customName ?? this.customName,
    customColor: customColor.present ? customColor.value : this.customColor,
    notes: notes.present ? notes.value : this.notes,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  UserApplication copyWithCompanion(UserApplicationsCompanion data) {
    return UserApplication(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      customName: data.customName.present
          ? data.customName.value
          : this.customName,
      customColor: data.customColor.present
          ? data.customColor.value
          : this.customColor,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserApplication(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('customName: $customName, ')
          ..write('customColor: $customColor, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    templateId,
    customName,
    customColor,
    notes,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserApplication &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.customName == this.customName &&
          other.customColor == this.customColor &&
          other.notes == this.notes &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class UserApplicationsCompanion extends UpdateCompanion<UserApplication> {
  final Value<int> id;
  final Value<String> templateId;
  final Value<String> customName;
  final Value<String?> customColor;
  final Value<String?> notes;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const UserApplicationsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.customName = const Value.absent(),
    this.customColor = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UserApplicationsCompanion.insert({
    this.id = const Value.absent(),
    required String templateId,
    required String customName,
    this.customColor = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : templateId = Value(templateId),
       customName = Value(customName);
  static Insertable<UserApplication> custom({
    Expression<int>? id,
    Expression<String>? templateId,
    Expression<String>? customName,
    Expression<String>? customColor,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (customName != null) 'custom_name': customName,
      if (customColor != null) 'custom_color': customColor,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UserApplicationsCompanion copyWith({
    Value<int>? id,
    Value<String>? templateId,
    Value<String>? customName,
    Value<String?>? customColor,
    Value<String?>? notes,
    Value<String>? status,
    Value<DateTime>? createdAt,
  }) {
    return UserApplicationsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      customName: customName ?? this.customName,
      customColor: customColor ?? this.customColor,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
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
    if (customName.present) {
      map['custom_name'] = Variable<String>(customName.value);
    }
    if (customColor.present) {
      map['custom_color'] = Variable<String>(customColor.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserApplicationsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('customName: $customName, ')
          ..write('customColor: $customColor, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserMilestonesTable extends UserMilestones
    with TableInfo<$UserMilestonesTable, UserMilestone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserMilestonesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _userApplicationIdMeta = const VerificationMeta(
    'userApplicationId',
  );
  @override
  late final GeneratedColumn<int> userApplicationId = GeneratedColumn<int>(
    'user_application_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_applications (id)',
    ),
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
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userApplicationId,
    name,
    startDate,
    endDate,
    isCompleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_milestones';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserMilestone> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_application_id')) {
      context.handle(
        _userApplicationIdMeta,
        userApplicationId.isAcceptableOrUnknown(
          data['user_application_id']!,
          _userApplicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userApplicationIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserMilestone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserMilestone(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userApplicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_application_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
    );
  }

  @override
  $UserMilestonesTable createAlias(String alias) {
    return $UserMilestonesTable(attachedDatabase, alias);
  }
}

class UserMilestone extends DataClass implements Insertable<UserMilestone> {
  final int id;
  final int userApplicationId;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;
  const UserMilestone({
    required this.id,
    required this.userApplicationId,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_application_id'] = Variable<int>(userApplicationId);
    map['name'] = Variable<String>(name);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['is_completed'] = Variable<bool>(isCompleted);
    return map;
  }

  UserMilestonesCompanion toCompanion(bool nullToAbsent) {
    return UserMilestonesCompanion(
      id: Value(id),
      userApplicationId: Value(userApplicationId),
      name: Value(name),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isCompleted: Value(isCompleted),
    );
  }

  factory UserMilestone.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserMilestone(
      id: serializer.fromJson<int>(json['id']),
      userApplicationId: serializer.fromJson<int>(json['userApplicationId']),
      name: serializer.fromJson<String>(json['name']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userApplicationId': serializer.toJson<int>(userApplicationId),
      'name': serializer.toJson<String>(name),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  UserMilestone copyWith({
    int? id,
    int? userApplicationId,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    bool? isCompleted,
  }) => UserMilestone(
    id: id ?? this.id,
    userApplicationId: userApplicationId ?? this.userApplicationId,
    name: name ?? this.name,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    isCompleted: isCompleted ?? this.isCompleted,
  );
  UserMilestone copyWithCompanion(UserMilestonesCompanion data) {
    return UserMilestone(
      id: data.id.present ? data.id.value : this.id,
      userApplicationId: data.userApplicationId.present
          ? data.userApplicationId.value
          : this.userApplicationId,
      name: data.name.present ? data.name.value : this.name,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserMilestone(')
          ..write('id: $id, ')
          ..write('userApplicationId: $userApplicationId, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userApplicationId, name, startDate, endDate, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserMilestone &&
          other.id == this.id &&
          other.userApplicationId == this.userApplicationId &&
          other.name == this.name &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isCompleted == this.isCompleted);
}

class UserMilestonesCompanion extends UpdateCompanion<UserMilestone> {
  final Value<int> id;
  final Value<int> userApplicationId;
  final Value<String> name;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isCompleted;
  const UserMilestonesCompanion({
    this.id = const Value.absent(),
    this.userApplicationId = const Value.absent(),
    this.name = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  UserMilestonesCompanion.insert({
    this.id = const Value.absent(),
    required int userApplicationId,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    this.isCompleted = const Value.absent(),
  }) : userApplicationId = Value(userApplicationId),
       name = Value(name),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<UserMilestone> custom({
    Expression<int>? id,
    Expression<int>? userApplicationId,
    Expression<String>? name,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userApplicationId != null) 'user_application_id': userApplicationId,
      if (name != null) 'name': name,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  UserMilestonesCompanion copyWith({
    Value<int>? id,
    Value<int>? userApplicationId,
    Value<String>? name,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<bool>? isCompleted,
  }) {
    return UserMilestonesCompanion(
      id: id ?? this.id,
      userApplicationId: userApplicationId ?? this.userApplicationId,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userApplicationId.present) {
      map['user_application_id'] = Variable<int>(userApplicationId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserMilestonesCompanion(')
          ..write('id: $id, ')
          ..write('userApplicationId: $userApplicationId, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

class $UserTasksTable extends UserTasks
    with TableInfo<$UserTasksTable, UserTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTasksTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _userMilestoneIdMeta = const VerificationMeta(
    'userMilestoneId',
  );
  @override
  late final GeneratedColumn<int> userMilestoneId = GeneratedColumn<int>(
    'user_milestone_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_milestones (id)',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userMilestoneId,
    label,
    isCompleted,
    dueDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_milestone_id')) {
      context.handle(
        _userMilestoneIdMeta,
        userMilestoneId.isAcceptableOrUnknown(
          data['user_milestone_id']!,
          _userMilestoneIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userMilestoneIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTask(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userMilestoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_milestone_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
    );
  }

  @override
  $UserTasksTable createAlias(String alias) {
    return $UserTasksTable(attachedDatabase, alias);
  }
}

class UserTask extends DataClass implements Insertable<UserTask> {
  final int id;
  final int userMilestoneId;
  final String label;
  final bool isCompleted;
  final DateTime dueDate;
  const UserTask({
    required this.id,
    required this.userMilestoneId,
    required this.label,
    required this.isCompleted,
    required this.dueDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_milestone_id'] = Variable<int>(userMilestoneId);
    map['label'] = Variable<String>(label);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['due_date'] = Variable<DateTime>(dueDate);
    return map;
  }

  UserTasksCompanion toCompanion(bool nullToAbsent) {
    return UserTasksCompanion(
      id: Value(id),
      userMilestoneId: Value(userMilestoneId),
      label: Value(label),
      isCompleted: Value(isCompleted),
      dueDate: Value(dueDate),
    );
  }

  factory UserTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTask(
      id: serializer.fromJson<int>(json['id']),
      userMilestoneId: serializer.fromJson<int>(json['userMilestoneId']),
      label: serializer.fromJson<String>(json['label']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userMilestoneId': serializer.toJson<int>(userMilestoneId),
      'label': serializer.toJson<String>(label),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'dueDate': serializer.toJson<DateTime>(dueDate),
    };
  }

  UserTask copyWith({
    int? id,
    int? userMilestoneId,
    String? label,
    bool? isCompleted,
    DateTime? dueDate,
  }) => UserTask(
    id: id ?? this.id,
    userMilestoneId: userMilestoneId ?? this.userMilestoneId,
    label: label ?? this.label,
    isCompleted: isCompleted ?? this.isCompleted,
    dueDate: dueDate ?? this.dueDate,
  );
  UserTask copyWithCompanion(UserTasksCompanion data) {
    return UserTask(
      id: data.id.present ? data.id.value : this.id,
      userMilestoneId: data.userMilestoneId.present
          ? data.userMilestoneId.value
          : this.userMilestoneId,
      label: data.label.present ? data.label.value : this.label,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTask(')
          ..write('id: $id, ')
          ..write('userMilestoneId: $userMilestoneId, ')
          ..write('label: $label, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userMilestoneId, label, isCompleted, dueDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTask &&
          other.id == this.id &&
          other.userMilestoneId == this.userMilestoneId &&
          other.label == this.label &&
          other.isCompleted == this.isCompleted &&
          other.dueDate == this.dueDate);
}

class UserTasksCompanion extends UpdateCompanion<UserTask> {
  final Value<int> id;
  final Value<int> userMilestoneId;
  final Value<String> label;
  final Value<bool> isCompleted;
  final Value<DateTime> dueDate;
  const UserTasksCompanion({
    this.id = const Value.absent(),
    this.userMilestoneId = const Value.absent(),
    this.label = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dueDate = const Value.absent(),
  });
  UserTasksCompanion.insert({
    this.id = const Value.absent(),
    required int userMilestoneId,
    required String label,
    this.isCompleted = const Value.absent(),
    required DateTime dueDate,
  }) : userMilestoneId = Value(userMilestoneId),
       label = Value(label),
       dueDate = Value(dueDate);
  static Insertable<UserTask> custom({
    Expression<int>? id,
    Expression<int>? userMilestoneId,
    Expression<String>? label,
    Expression<bool>? isCompleted,
    Expression<DateTime>? dueDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userMilestoneId != null) 'user_milestone_id': userMilestoneId,
      if (label != null) 'label': label,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (dueDate != null) 'due_date': dueDate,
    });
  }

  UserTasksCompanion copyWith({
    Value<int>? id,
    Value<int>? userMilestoneId,
    Value<String>? label,
    Value<bool>? isCompleted,
    Value<DateTime>? dueDate,
  }) {
    return UserTasksCompanion(
      id: id ?? this.id,
      userMilestoneId: userMilestoneId ?? this.userMilestoneId,
      label: label ?? this.label,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userMilestoneId.present) {
      map['user_milestone_id'] = Variable<int>(userMilestoneId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTasksCompanion(')
          ..write('id: $id, ')
          ..write('userMilestoneId: $userMilestoneId, ')
          ..write('label: $label, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }
}

class $UserDocumentsTable extends UserDocuments
    with TableInfo<$UserDocumentsTable, UserDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDocumentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _userApplicationIdMeta = const VerificationMeta(
    'userApplicationId',
  );
  @override
  late final GeneratedColumn<int> userApplicationId = GeneratedColumn<int>(
    'user_application_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_applications (id)',
    ),
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
  @override
  late final GeneratedColumnWithTypeConverter<DocumentStatus, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<DocumentStatus>($UserDocumentsTable.$converterstatus);
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
    userApplicationId,
    name,
    status,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_application_id')) {
      context.handle(
        _userApplicationIdMeta,
        userApplicationId.isAcceptableOrUnknown(
          data['user_application_id']!,
          _userApplicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userApplicationIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  UserDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userApplicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_application_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      status: $UserDocumentsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $UserDocumentsTable createAlias(String alias) {
    return $UserDocumentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DocumentStatus, int, int> $converterstatus =
      const EnumIndexConverter<DocumentStatus>(DocumentStatus.values);
}

class UserDocument extends DataClass implements Insertable<UserDocument> {
  final int id;
  final int userApplicationId;
  final String name;
  final DocumentStatus status;
  final String? notes;
  const UserDocument({
    required this.id,
    required this.userApplicationId,
    required this.name,
    required this.status,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_application_id'] = Variable<int>(userApplicationId);
    map['name'] = Variable<String>(name);
    {
      map['status'] = Variable<int>(
        $UserDocumentsTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  UserDocumentsCompanion toCompanion(bool nullToAbsent) {
    return UserDocumentsCompanion(
      id: Value(id),
      userApplicationId: Value(userApplicationId),
      name: Value(name),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory UserDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDocument(
      id: serializer.fromJson<int>(json['id']),
      userApplicationId: serializer.fromJson<int>(json['userApplicationId']),
      name: serializer.fromJson<String>(json['name']),
      status: $UserDocumentsTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userApplicationId': serializer.toJson<int>(userApplicationId),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<int>(
        $UserDocumentsTable.$converterstatus.toJson(status),
      ),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  UserDocument copyWith({
    int? id,
    int? userApplicationId,
    String? name,
    DocumentStatus? status,
    Value<String?> notes = const Value.absent(),
  }) => UserDocument(
    id: id ?? this.id,
    userApplicationId: userApplicationId ?? this.userApplicationId,
    name: name ?? this.name,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
  );
  UserDocument copyWithCompanion(UserDocumentsCompanion data) {
    return UserDocument(
      id: data.id.present ? data.id.value : this.id,
      userApplicationId: data.userApplicationId.present
          ? data.userApplicationId.value
          : this.userApplicationId,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDocument(')
          ..write('id: $id, ')
          ..write('userApplicationId: $userApplicationId, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userApplicationId, name, status, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDocument &&
          other.id == this.id &&
          other.userApplicationId == this.userApplicationId &&
          other.name == this.name &&
          other.status == this.status &&
          other.notes == this.notes);
}

class UserDocumentsCompanion extends UpdateCompanion<UserDocument> {
  final Value<int> id;
  final Value<int> userApplicationId;
  final Value<String> name;
  final Value<DocumentStatus> status;
  final Value<String?> notes;
  const UserDocumentsCompanion({
    this.id = const Value.absent(),
    this.userApplicationId = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
  });
  UserDocumentsCompanion.insert({
    this.id = const Value.absent(),
    required int userApplicationId,
    required String name,
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
  }) : userApplicationId = Value(userApplicationId),
       name = Value(name);
  static Insertable<UserDocument> custom({
    Expression<int>? id,
    Expression<int>? userApplicationId,
    Expression<String>? name,
    Expression<int>? status,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userApplicationId != null) 'user_application_id': userApplicationId,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
    });
  }

  UserDocumentsCompanion copyWith({
    Value<int>? id,
    Value<int>? userApplicationId,
    Value<String>? name,
    Value<DocumentStatus>? status,
    Value<String?>? notes,
  }) {
    return UserDocumentsCompanion(
      id: id ?? this.id,
      userApplicationId: userApplicationId ?? this.userApplicationId,
      name: name ?? this.name,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userApplicationId.present) {
      map['user_application_id'] = Variable<int>(userApplicationId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $UserDocumentsTable.$converterstatus.toSql(status.value),
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('userApplicationId: $userApplicationId, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

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
  late final $ScholarshipTemplatesTable scholarshipTemplates =
      $ScholarshipTemplatesTable(this);
  late final $TemplateDocumentsTable templateDocuments =
      $TemplateDocumentsTable(this);
  late final $MilestoneTemplatesTable milestoneTemplates =
      $MilestoneTemplatesTable(this);
  late final $TaskTemplatesTable taskTemplates = $TaskTemplatesTable(this);
  late final $ScholarshipMilestoneLinksTable scholarshipMilestoneLinks =
      $ScholarshipMilestoneLinksTable(this);
  late final $UserApplicationsTable userApplications = $UserApplicationsTable(
    this,
  );
  late final $UserMilestonesTable userMilestones = $UserMilestonesTable(this);
  late final $UserTasksTable userTasks = $UserTasksTable(this);
  late final $UserDocumentsTable userDocuments = $UserDocumentsTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    scholarshipTemplates,
    templateDocuments,
    milestoneTemplates,
    taskTemplates,
    scholarshipMilestoneLinks,
    userApplications,
    userMilestones,
    userTasks,
    userDocuments,
    userProfiles,
  ];
}

typedef $$ScholarshipTemplatesTableCreateCompanionBuilder =
    ScholarshipTemplatesCompanion Function({
      required String id,
      required String name,
      required String providerName,
      Value<String?> shortDescription,
      Value<String?> longDescription,
      Value<String?> country,
      required String studyLevel,
      Value<String?> fieldOfStudy,
      Value<String?> fundingType,
      Value<String?> fundingAmount,
      Value<String?> color,
      Value<String?> icon,
      Value<String?> website,
      Value<int> version,
      Value<DateTime?> lastUpdated,
      Value<String?> author,
      Value<int?> usageCount,
      Value<int?> successRate,
      Value<double?> averageMatchScore,
      Value<bool> isActive,
      Value<bool> isFeatured,
      Value<int> rowid,
    });
typedef $$ScholarshipTemplatesTableUpdateCompanionBuilder =
    ScholarshipTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> providerName,
      Value<String?> shortDescription,
      Value<String?> longDescription,
      Value<String?> country,
      Value<String> studyLevel,
      Value<String?> fieldOfStudy,
      Value<String?> fundingType,
      Value<String?> fundingAmount,
      Value<String?> color,
      Value<String?> icon,
      Value<String?> website,
      Value<int> version,
      Value<DateTime?> lastUpdated,
      Value<String?> author,
      Value<int?> usageCount,
      Value<int?> successRate,
      Value<double?> averageMatchScore,
      Value<bool> isActive,
      Value<bool> isFeatured,
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

  static MultiTypedResultKey<$TemplateDocumentsTable, List<TemplateDocument>>
  _templateDocumentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.templateDocuments,
        aliasName: $_aliasNameGenerator(
          db.scholarshipTemplates.id,
          db.templateDocuments.templateId,
        ),
      );

  $$TemplateDocumentsTableProcessedTableManager get templateDocumentsRefs {
    final manager = $$TemplateDocumentsTableTableManager(
      $_db,
      $_db.templateDocuments,
    ).filter((f) => f.templateId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _templateDocumentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ScholarshipMilestoneLinksTable,
    List<ScholarshipMilestoneLink>
  >
  _scholarshipMilestoneLinksRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scholarshipMilestoneLinks,
        aliasName: $_aliasNameGenerator(
          db.scholarshipTemplates.id,
          db.scholarshipMilestoneLinks.scholarshipTemplateId,
        ),
      );

  $$ScholarshipMilestoneLinksTableProcessedTableManager
  get scholarshipMilestoneLinksRefs {
    final manager =
        $$ScholarshipMilestoneLinksTableTableManager(
          $_db,
          $_db.scholarshipMilestoneLinks,
        ).filter(
          (f) =>
              f.scholarshipTemplateId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _scholarshipMilestoneLinksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserApplicationsTable, List<UserApplication>>
  _userApplicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userApplications,
    aliasName: $_aliasNameGenerator(
      db.scholarshipTemplates.id,
      db.userApplications.templateId,
    ),
  );

  $$UserApplicationsTableProcessedTableManager get userApplicationsRefs {
    final manager = $$UserApplicationsTableTableManager(
      $_db,
      $_db.userApplications,
    ).filter((f) => f.templateId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userApplicationsRefsTable($_db),
    );
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

  ColumnFilters<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get longDescription => $composableBuilder(
    column: $table.longDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
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

  ColumnFilters<String> get fundingType => $composableBuilder(
    column: $table.fundingType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fundingAmount => $composableBuilder(
    column: $table.fundingAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get successRate => $composableBuilder(
    column: $table.successRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get averageMatchScore => $composableBuilder(
    column: $table.averageMatchScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFeatured => $composableBuilder(
    column: $table.isFeatured,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> templateDocumentsRefs(
    Expression<bool> Function($$TemplateDocumentsTableFilterComposer f) f,
  ) {
    final $$TemplateDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.templateDocuments,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.templateDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scholarshipMilestoneLinksRefs(
    Expression<bool> Function($$ScholarshipMilestoneLinksTableFilterComposer f)
    f,
  ) {
    final $$ScholarshipMilestoneLinksTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scholarshipMilestoneLinks,
          getReferencedColumn: (t) => t.scholarshipTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScholarshipMilestoneLinksTableFilterComposer(
                $db: $db,
                $table: $db.scholarshipMilestoneLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> userApplicationsRefs(
    Expression<bool> Function($$UserApplicationsTableFilterComposer f) f,
  ) {
    final $$UserApplicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableFilterComposer(
            $db: $db,
            $table: $db.userApplications,
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

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get longDescription => $composableBuilder(
    column: $table.longDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
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

  ColumnOrderings<String> get fundingType => $composableBuilder(
    column: $table.fundingType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fundingAmount => $composableBuilder(
    column: $table.fundingAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get successRate => $composableBuilder(
    column: $table.successRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get averageMatchScore => $composableBuilder(
    column: $table.averageMatchScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFeatured => $composableBuilder(
    column: $table.isFeatured,
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

  GeneratedColumn<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get longDescription => $composableBuilder(
    column: $table.longDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get studyLevel => $composableBuilder(
    column: $table.studyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fieldOfStudy => $composableBuilder(
    column: $table.fieldOfStudy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fundingType => $composableBuilder(
    column: $table.fundingType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fundingAmount => $composableBuilder(
    column: $table.fundingAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get successRate => $composableBuilder(
    column: $table.successRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get averageMatchScore => $composableBuilder(
    column: $table.averageMatchScore,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isFeatured => $composableBuilder(
    column: $table.isFeatured,
    builder: (column) => column,
  );

  Expression<T> templateDocumentsRefs<T extends Object>(
    Expression<T> Function($$TemplateDocumentsTableAnnotationComposer a) f,
  ) {
    final $$TemplateDocumentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.templateDocuments,
          getReferencedColumn: (t) => t.templateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TemplateDocumentsTableAnnotationComposer(
                $db: $db,
                $table: $db.templateDocuments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> scholarshipMilestoneLinksRefs<T extends Object>(
    Expression<T> Function($$ScholarshipMilestoneLinksTableAnnotationComposer a)
    f,
  ) {
    final $$ScholarshipMilestoneLinksTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scholarshipMilestoneLinks,
          getReferencedColumn: (t) => t.scholarshipTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScholarshipMilestoneLinksTableAnnotationComposer(
                $db: $db,
                $table: $db.scholarshipMilestoneLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> userApplicationsRefs<T extends Object>(
    Expression<T> Function($$UserApplicationsTableAnnotationComposer a) f,
  ) {
    final $$UserApplicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.userApplications,
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
          PrefetchHooks Function({
            bool templateDocumentsRefs,
            bool scholarshipMilestoneLinksRefs,
            bool userApplicationsRefs,
          })
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
                Value<String?> shortDescription = const Value.absent(),
                Value<String?> longDescription = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String> studyLevel = const Value.absent(),
                Value<String?> fieldOfStudy = const Value.absent(),
                Value<String?> fundingType = const Value.absent(),
                Value<String?> fundingAmount = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<int?> usageCount = const Value.absent(),
                Value<int?> successRate = const Value.absent(),
                Value<double?> averageMatchScore = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isFeatured = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScholarshipTemplatesCompanion(
                id: id,
                name: name,
                providerName: providerName,
                shortDescription: shortDescription,
                longDescription: longDescription,
                country: country,
                studyLevel: studyLevel,
                fieldOfStudy: fieldOfStudy,
                fundingType: fundingType,
                fundingAmount: fundingAmount,
                color: color,
                icon: icon,
                website: website,
                version: version,
                lastUpdated: lastUpdated,
                author: author,
                usageCount: usageCount,
                successRate: successRate,
                averageMatchScore: averageMatchScore,
                isActive: isActive,
                isFeatured: isFeatured,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String providerName,
                Value<String?> shortDescription = const Value.absent(),
                Value<String?> longDescription = const Value.absent(),
                Value<String?> country = const Value.absent(),
                required String studyLevel,
                Value<String?> fieldOfStudy = const Value.absent(),
                Value<String?> fundingType = const Value.absent(),
                Value<String?> fundingAmount = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<int?> usageCount = const Value.absent(),
                Value<int?> successRate = const Value.absent(),
                Value<double?> averageMatchScore = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isFeatured = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScholarshipTemplatesCompanion.insert(
                id: id,
                name: name,
                providerName: providerName,
                shortDescription: shortDescription,
                longDescription: longDescription,
                country: country,
                studyLevel: studyLevel,
                fieldOfStudy: fieldOfStudy,
                fundingType: fundingType,
                fundingAmount: fundingAmount,
                color: color,
                icon: icon,
                website: website,
                version: version,
                lastUpdated: lastUpdated,
                author: author,
                usageCount: usageCount,
                successRate: successRate,
                averageMatchScore: averageMatchScore,
                isActive: isActive,
                isFeatured: isFeatured,
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
          prefetchHooksCallback:
              ({
                templateDocumentsRefs = false,
                scholarshipMilestoneLinksRefs = false,
                userApplicationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (templateDocumentsRefs) db.templateDocuments,
                    if (scholarshipMilestoneLinksRefs)
                      db.scholarshipMilestoneLinks,
                    if (userApplicationsRefs) db.userApplications,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (templateDocumentsRefs)
                        await $_getPrefetchedData<
                          ScholarshipTemplate,
                          $ScholarshipTemplatesTable,
                          TemplateDocument
                        >(
                          currentTable: table,
                          referencedTable: $$ScholarshipTemplatesTableReferences
                              ._templateDocumentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScholarshipTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).templateDocumentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.templateId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scholarshipMilestoneLinksRefs)
                        await $_getPrefetchedData<
                          ScholarshipTemplate,
                          $ScholarshipTemplatesTable,
                          ScholarshipMilestoneLink
                        >(
                          currentTable: table,
                          referencedTable: $$ScholarshipTemplatesTableReferences
                              ._scholarshipMilestoneLinksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScholarshipTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).scholarshipMilestoneLinksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.scholarshipTemplateId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userApplicationsRefs)
                        await $_getPrefetchedData<
                          ScholarshipTemplate,
                          $ScholarshipTemplatesTable,
                          UserApplication
                        >(
                          currentTable: table,
                          referencedTable: $$ScholarshipTemplatesTableReferences
                              ._userApplicationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScholarshipTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).userApplicationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.templateId == item.id,
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
      PrefetchHooks Function({
        bool templateDocumentsRefs,
        bool scholarshipMilestoneLinksRefs,
        bool userApplicationsRefs,
      })
    >;
typedef $$TemplateDocumentsTableCreateCompanionBuilder =
    TemplateDocumentsCompanion Function({
      Value<int> id,
      required String templateId,
      required String name,
      Value<bool> isOptional,
      Value<DocumentSubmissionType> submissionType,
    });
typedef $$TemplateDocumentsTableUpdateCompanionBuilder =
    TemplateDocumentsCompanion Function({
      Value<int> id,
      Value<String> templateId,
      Value<String> name,
      Value<bool> isOptional,
      Value<DocumentSubmissionType> submissionType,
    });

final class $$TemplateDocumentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TemplateDocumentsTable,
          TemplateDocument
        > {
  $$TemplateDocumentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ScholarshipTemplatesTable _templateIdTable(_$AppDatabase db) =>
      db.scholarshipTemplates.createAlias(
        $_aliasNameGenerator(
          db.templateDocuments.templateId,
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
}

class $$TemplateDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $TemplateDocumentsTable> {
  $$TemplateDocumentsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    DocumentSubmissionType,
    DocumentSubmissionType,
    int
  >
  get submissionType => $composableBuilder(
    column: $table.submissionType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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
}

class $$TemplateDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $TemplateDocumentsTable> {
  $$TemplateDocumentsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get submissionType => $composableBuilder(
    column: $table.submissionType,
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

class $$TemplateDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TemplateDocumentsTable> {
  $$TemplateDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DocumentSubmissionType, int>
  get submissionType => $composableBuilder(
    column: $table.submissionType,
    builder: (column) => column,
  );

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
}

class $$TemplateDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TemplateDocumentsTable,
          TemplateDocument,
          $$TemplateDocumentsTableFilterComposer,
          $$TemplateDocumentsTableOrderingComposer,
          $$TemplateDocumentsTableAnnotationComposer,
          $$TemplateDocumentsTableCreateCompanionBuilder,
          $$TemplateDocumentsTableUpdateCompanionBuilder,
          (TemplateDocument, $$TemplateDocumentsTableReferences),
          TemplateDocument,
          PrefetchHooks Function({bool templateId})
        > {
  $$TemplateDocumentsTableTableManager(
    _$AppDatabase db,
    $TemplateDocumentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplateDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplateDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplateDocumentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> templateId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isOptional = const Value.absent(),
                Value<DocumentSubmissionType> submissionType =
                    const Value.absent(),
              }) => TemplateDocumentsCompanion(
                id: id,
                templateId: templateId,
                name: name,
                isOptional: isOptional,
                submissionType: submissionType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String templateId,
                required String name,
                Value<bool> isOptional = const Value.absent(),
                Value<DocumentSubmissionType> submissionType =
                    const Value.absent(),
              }) => TemplateDocumentsCompanion.insert(
                id: id,
                templateId: templateId,
                name: name,
                isOptional: isOptional,
                submissionType: submissionType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TemplateDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({templateId = false}) {
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
                    if (templateId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.templateId,
                                referencedTable:
                                    $$TemplateDocumentsTableReferences
                                        ._templateIdTable(db),
                                referencedColumn:
                                    $$TemplateDocumentsTableReferences
                                        ._templateIdTable(db)
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

typedef $$TemplateDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TemplateDocumentsTable,
      TemplateDocument,
      $$TemplateDocumentsTableFilterComposer,
      $$TemplateDocumentsTableOrderingComposer,
      $$TemplateDocumentsTableAnnotationComposer,
      $$TemplateDocumentsTableCreateCompanionBuilder,
      $$TemplateDocumentsTableUpdateCompanionBuilder,
      (TemplateDocument, $$TemplateDocumentsTableReferences),
      TemplateDocument,
      PrefetchHooks Function({bool templateId})
    >;
typedef $$MilestoneTemplatesTableCreateCompanionBuilder =
    MilestoneTemplatesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<String?> guideId,
      Value<bool> isCustom,
    });
typedef $$MilestoneTemplatesTableUpdateCompanionBuilder =
    MilestoneTemplatesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> guideId,
      Value<bool> isCustom,
    });

final class $$MilestoneTemplatesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MilestoneTemplatesTable,
          MilestoneTemplate
        > {
  $$MilestoneTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TaskTemplatesTable, List<TaskTemplate>>
  _taskTemplatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.taskTemplates,
    aliasName: $_aliasNameGenerator(
      db.milestoneTemplates.id,
      db.taskTemplates.milestoneTemplateId,
    ),
  );

  $$TaskTemplatesTableProcessedTableManager get taskTemplatesRefs {
    final manager = $$TaskTemplatesTableTableManager($_db, $_db.taskTemplates)
        .filter(
          (f) => f.milestoneTemplateId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_taskTemplatesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ScholarshipMilestoneLinksTable,
    List<ScholarshipMilestoneLink>
  >
  _scholarshipMilestoneLinksRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scholarshipMilestoneLinks,
        aliasName: $_aliasNameGenerator(
          db.milestoneTemplates.id,
          db.scholarshipMilestoneLinks.milestoneTemplateId,
        ),
      );

  $$ScholarshipMilestoneLinksTableProcessedTableManager
  get scholarshipMilestoneLinksRefs {
    final manager =
        $$ScholarshipMilestoneLinksTableTableManager(
          $_db,
          $_db.scholarshipMilestoneLinks,
        ).filter(
          (f) => f.milestoneTemplateId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _scholarshipMilestoneLinksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MilestoneTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $MilestoneTemplatesTable> {
  $$MilestoneTemplatesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guideId => $composableBuilder(
    column: $table.guideId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> taskTemplatesRefs(
    Expression<bool> Function($$TaskTemplatesTableFilterComposer f) f,
  ) {
    final $$TaskTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskTemplates,
      getReferencedColumn: (t) => t.milestoneTemplateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.taskTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scholarshipMilestoneLinksRefs(
    Expression<bool> Function($$ScholarshipMilestoneLinksTableFilterComposer f)
    f,
  ) {
    final $$ScholarshipMilestoneLinksTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scholarshipMilestoneLinks,
          getReferencedColumn: (t) => t.milestoneTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScholarshipMilestoneLinksTableFilterComposer(
                $db: $db,
                $table: $db.scholarshipMilestoneLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MilestoneTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $MilestoneTemplatesTable> {
  $$MilestoneTemplatesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guideId => $composableBuilder(
    column: $table.guideId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MilestoneTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MilestoneTemplatesTable> {
  $$MilestoneTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guideId =>
      $composableBuilder(column: $table.guideId, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  Expression<T> taskTemplatesRefs<T extends Object>(
    Expression<T> Function($$TaskTemplatesTableAnnotationComposer a) f,
  ) {
    final $$TaskTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskTemplates,
      getReferencedColumn: (t) => t.milestoneTemplateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.taskTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scholarshipMilestoneLinksRefs<T extends Object>(
    Expression<T> Function($$ScholarshipMilestoneLinksTableAnnotationComposer a)
    f,
  ) {
    final $$ScholarshipMilestoneLinksTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scholarshipMilestoneLinks,
          getReferencedColumn: (t) => t.milestoneTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScholarshipMilestoneLinksTableAnnotationComposer(
                $db: $db,
                $table: $db.scholarshipMilestoneLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MilestoneTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MilestoneTemplatesTable,
          MilestoneTemplate,
          $$MilestoneTemplatesTableFilterComposer,
          $$MilestoneTemplatesTableOrderingComposer,
          $$MilestoneTemplatesTableAnnotationComposer,
          $$MilestoneTemplatesTableCreateCompanionBuilder,
          $$MilestoneTemplatesTableUpdateCompanionBuilder,
          (MilestoneTemplate, $$MilestoneTemplatesTableReferences),
          MilestoneTemplate,
          PrefetchHooks Function({
            bool taskTemplatesRefs,
            bool scholarshipMilestoneLinksRefs,
          })
        > {
  $$MilestoneTemplatesTableTableManager(
    _$AppDatabase db,
    $MilestoneTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MilestoneTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MilestoneTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MilestoneTemplatesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> guideId = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
              }) => MilestoneTemplatesCompanion(
                id: id,
                name: name,
                description: description,
                guideId: guideId,
                isCustom: isCustom,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> guideId = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
              }) => MilestoneTemplatesCompanion.insert(
                id: id,
                name: name,
                description: description,
                guideId: guideId,
                isCustom: isCustom,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MilestoneTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                taskTemplatesRefs = false,
                scholarshipMilestoneLinksRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (taskTemplatesRefs) db.taskTemplates,
                    if (scholarshipMilestoneLinksRefs)
                      db.scholarshipMilestoneLinks,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (taskTemplatesRefs)
                        await $_getPrefetchedData<
                          MilestoneTemplate,
                          $MilestoneTemplatesTable,
                          TaskTemplate
                        >(
                          currentTable: table,
                          referencedTable: $$MilestoneTemplatesTableReferences
                              ._taskTemplatesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilestoneTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).taskTemplatesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.milestoneTemplateId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scholarshipMilestoneLinksRefs)
                        await $_getPrefetchedData<
                          MilestoneTemplate,
                          $MilestoneTemplatesTable,
                          ScholarshipMilestoneLink
                        >(
                          currentTable: table,
                          referencedTable: $$MilestoneTemplatesTableReferences
                              ._scholarshipMilestoneLinksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilestoneTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).scholarshipMilestoneLinksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.milestoneTemplateId == item.id,
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

typedef $$MilestoneTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MilestoneTemplatesTable,
      MilestoneTemplate,
      $$MilestoneTemplatesTableFilterComposer,
      $$MilestoneTemplatesTableOrderingComposer,
      $$MilestoneTemplatesTableAnnotationComposer,
      $$MilestoneTemplatesTableCreateCompanionBuilder,
      $$MilestoneTemplatesTableUpdateCompanionBuilder,
      (MilestoneTemplate, $$MilestoneTemplatesTableReferences),
      MilestoneTemplate,
      PrefetchHooks Function({
        bool taskTemplatesRefs,
        bool scholarshipMilestoneLinksRefs,
      })
    >;
typedef $$TaskTemplatesTableCreateCompanionBuilder =
    TaskTemplatesCompanion Function({
      Value<int> id,
      required int milestoneTemplateId,
      required String label,
      Value<int> defaultOffsetDays,
      Value<int> displayOrder,
      Value<bool> isRequired,
    });
typedef $$TaskTemplatesTableUpdateCompanionBuilder =
    TaskTemplatesCompanion Function({
      Value<int> id,
      Value<int> milestoneTemplateId,
      Value<String> label,
      Value<int> defaultOffsetDays,
      Value<int> displayOrder,
      Value<bool> isRequired,
    });

final class $$TaskTemplatesTableReferences
    extends BaseReferences<_$AppDatabase, $TaskTemplatesTable, TaskTemplate> {
  $$TaskTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilestoneTemplatesTable _milestoneTemplateIdTable(_$AppDatabase db) =>
      db.milestoneTemplates.createAlias(
        $_aliasNameGenerator(
          db.taskTemplates.milestoneTemplateId,
          db.milestoneTemplates.id,
        ),
      );

  $$MilestoneTemplatesTableProcessedTableManager get milestoneTemplateId {
    final $_column = $_itemColumn<int>('milestone_template_id')!;

    final manager = $$MilestoneTemplatesTableTableManager(
      $_db,
      $_db.milestoneTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_milestoneTemplateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TaskTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTemplatesTable> {
  $$TaskTemplatesTableFilterComposer({
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

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultOffsetDays => $composableBuilder(
    column: $table.defaultOffsetDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => ColumnFilters(column),
  );

  $$MilestoneTemplatesTableFilterComposer get milestoneTemplateId {
    final $$MilestoneTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.milestoneTemplateId,
      referencedTable: $db.milestoneTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilestoneTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.milestoneTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTemplatesTable> {
  $$TaskTemplatesTableOrderingComposer({
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

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultOffsetDays => $composableBuilder(
    column: $table.defaultOffsetDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilestoneTemplatesTableOrderingComposer get milestoneTemplateId {
    final $$MilestoneTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.milestoneTemplateId,
      referencedTable: $db.milestoneTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilestoneTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.milestoneTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTemplatesTable> {
  $$TaskTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<int> get defaultOffsetDays => $composableBuilder(
    column: $table.defaultOffsetDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => column,
  );

  $$MilestoneTemplatesTableAnnotationComposer get milestoneTemplateId {
    final $$MilestoneTemplatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.milestoneTemplateId,
          referencedTable: $db.milestoneTemplates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MilestoneTemplatesTableAnnotationComposer(
                $db: $db,
                $table: $db.milestoneTemplates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TaskTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskTemplatesTable,
          TaskTemplate,
          $$TaskTemplatesTableFilterComposer,
          $$TaskTemplatesTableOrderingComposer,
          $$TaskTemplatesTableAnnotationComposer,
          $$TaskTemplatesTableCreateCompanionBuilder,
          $$TaskTemplatesTableUpdateCompanionBuilder,
          (TaskTemplate, $$TaskTemplatesTableReferences),
          TaskTemplate,
          PrefetchHooks Function({bool milestoneTemplateId})
        > {
  $$TaskTemplatesTableTableManager(_$AppDatabase db, $TaskTemplatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> milestoneTemplateId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int> defaultOffsetDays = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<bool> isRequired = const Value.absent(),
              }) => TaskTemplatesCompanion(
                id: id,
                milestoneTemplateId: milestoneTemplateId,
                label: label,
                defaultOffsetDays: defaultOffsetDays,
                displayOrder: displayOrder,
                isRequired: isRequired,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int milestoneTemplateId,
                required String label,
                Value<int> defaultOffsetDays = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<bool> isRequired = const Value.absent(),
              }) => TaskTemplatesCompanion.insert(
                id: id,
                milestoneTemplateId: milestoneTemplateId,
                label: label,
                defaultOffsetDays: defaultOffsetDays,
                displayOrder: displayOrder,
                isRequired: isRequired,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TaskTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({milestoneTemplateId = false}) {
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
                    if (milestoneTemplateId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.milestoneTemplateId,
                                referencedTable: $$TaskTemplatesTableReferences
                                    ._milestoneTemplateIdTable(db),
                                referencedColumn: $$TaskTemplatesTableReferences
                                    ._milestoneTemplateIdTable(db)
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

typedef $$TaskTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskTemplatesTable,
      TaskTemplate,
      $$TaskTemplatesTableFilterComposer,
      $$TaskTemplatesTableOrderingComposer,
      $$TaskTemplatesTableAnnotationComposer,
      $$TaskTemplatesTableCreateCompanionBuilder,
      $$TaskTemplatesTableUpdateCompanionBuilder,
      (TaskTemplate, $$TaskTemplatesTableReferences),
      TaskTemplate,
      PrefetchHooks Function({bool milestoneTemplateId})
    >;
typedef $$ScholarshipMilestoneLinksTableCreateCompanionBuilder =
    ScholarshipMilestoneLinksCompanion Function({
      required String scholarshipTemplateId,
      required int milestoneTemplateId,
      required int order,
      required int startDateOffsetDays,
      required int endDateOffsetDays,
      Value<int> rowid,
    });
typedef $$ScholarshipMilestoneLinksTableUpdateCompanionBuilder =
    ScholarshipMilestoneLinksCompanion Function({
      Value<String> scholarshipTemplateId,
      Value<int> milestoneTemplateId,
      Value<int> order,
      Value<int> startDateOffsetDays,
      Value<int> endDateOffsetDays,
      Value<int> rowid,
    });

final class $$ScholarshipMilestoneLinksTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ScholarshipMilestoneLinksTable,
          ScholarshipMilestoneLink
        > {
  $$ScholarshipMilestoneLinksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ScholarshipTemplatesTable _scholarshipTemplateIdTable(
    _$AppDatabase db,
  ) => db.scholarshipTemplates.createAlias(
    $_aliasNameGenerator(
      db.scholarshipMilestoneLinks.scholarshipTemplateId,
      db.scholarshipTemplates.id,
    ),
  );

  $$ScholarshipTemplatesTableProcessedTableManager get scholarshipTemplateId {
    final $_column = $_itemColumn<String>('scholarship_template_id')!;

    final manager = $$ScholarshipTemplatesTableTableManager(
      $_db,
      $_db.scholarshipTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _scholarshipTemplateIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MilestoneTemplatesTable _milestoneTemplateIdTable(_$AppDatabase db) =>
      db.milestoneTemplates.createAlias(
        $_aliasNameGenerator(
          db.scholarshipMilestoneLinks.milestoneTemplateId,
          db.milestoneTemplates.id,
        ),
      );

  $$MilestoneTemplatesTableProcessedTableManager get milestoneTemplateId {
    final $_column = $_itemColumn<int>('milestone_template_id')!;

    final manager = $$MilestoneTemplatesTableTableManager(
      $_db,
      $_db.milestoneTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_milestoneTemplateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScholarshipMilestoneLinksTableFilterComposer
    extends Composer<_$AppDatabase, $ScholarshipMilestoneLinksTable> {
  $$ScholarshipMilestoneLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startDateOffsetDays => $composableBuilder(
    column: $table.startDateOffsetDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endDateOffsetDays => $composableBuilder(
    column: $table.endDateOffsetDays,
    builder: (column) => ColumnFilters(column),
  );

  $$ScholarshipTemplatesTableFilterComposer get scholarshipTemplateId {
    final $$ScholarshipTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scholarshipTemplateId,
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

  $$MilestoneTemplatesTableFilterComposer get milestoneTemplateId {
    final $$MilestoneTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.milestoneTemplateId,
      referencedTable: $db.milestoneTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilestoneTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.milestoneTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScholarshipMilestoneLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $ScholarshipMilestoneLinksTable> {
  $$ScholarshipMilestoneLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startDateOffsetDays => $composableBuilder(
    column: $table.startDateOffsetDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endDateOffsetDays => $composableBuilder(
    column: $table.endDateOffsetDays,
    builder: (column) => ColumnOrderings(column),
  );

  $$ScholarshipTemplatesTableOrderingComposer get scholarshipTemplateId {
    final $$ScholarshipTemplatesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.scholarshipTemplateId,
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

  $$MilestoneTemplatesTableOrderingComposer get milestoneTemplateId {
    final $$MilestoneTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.milestoneTemplateId,
      referencedTable: $db.milestoneTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilestoneTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.milestoneTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScholarshipMilestoneLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScholarshipMilestoneLinksTable> {
  $$ScholarshipMilestoneLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<int> get startDateOffsetDays => $composableBuilder(
    column: $table.startDateOffsetDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endDateOffsetDays => $composableBuilder(
    column: $table.endDateOffsetDays,
    builder: (column) => column,
  );

  $$ScholarshipTemplatesTableAnnotationComposer get scholarshipTemplateId {
    final $$ScholarshipTemplatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.scholarshipTemplateId,
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

  $$MilestoneTemplatesTableAnnotationComposer get milestoneTemplateId {
    final $$MilestoneTemplatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.milestoneTemplateId,
          referencedTable: $db.milestoneTemplates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MilestoneTemplatesTableAnnotationComposer(
                $db: $db,
                $table: $db.milestoneTemplates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ScholarshipMilestoneLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScholarshipMilestoneLinksTable,
          ScholarshipMilestoneLink,
          $$ScholarshipMilestoneLinksTableFilterComposer,
          $$ScholarshipMilestoneLinksTableOrderingComposer,
          $$ScholarshipMilestoneLinksTableAnnotationComposer,
          $$ScholarshipMilestoneLinksTableCreateCompanionBuilder,
          $$ScholarshipMilestoneLinksTableUpdateCompanionBuilder,
          (
            ScholarshipMilestoneLink,
            $$ScholarshipMilestoneLinksTableReferences,
          ),
          ScholarshipMilestoneLink,
          PrefetchHooks Function({
            bool scholarshipTemplateId,
            bool milestoneTemplateId,
          })
        > {
  $$ScholarshipMilestoneLinksTableTableManager(
    _$AppDatabase db,
    $ScholarshipMilestoneLinksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScholarshipMilestoneLinksTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ScholarshipMilestoneLinksTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ScholarshipMilestoneLinksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> scholarshipTemplateId = const Value.absent(),
                Value<int> milestoneTemplateId = const Value.absent(),
                Value<int> order = const Value.absent(),
                Value<int> startDateOffsetDays = const Value.absent(),
                Value<int> endDateOffsetDays = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScholarshipMilestoneLinksCompanion(
                scholarshipTemplateId: scholarshipTemplateId,
                milestoneTemplateId: milestoneTemplateId,
                order: order,
                startDateOffsetDays: startDateOffsetDays,
                endDateOffsetDays: endDateOffsetDays,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String scholarshipTemplateId,
                required int milestoneTemplateId,
                required int order,
                required int startDateOffsetDays,
                required int endDateOffsetDays,
                Value<int> rowid = const Value.absent(),
              }) => ScholarshipMilestoneLinksCompanion.insert(
                scholarshipTemplateId: scholarshipTemplateId,
                milestoneTemplateId: milestoneTemplateId,
                order: order,
                startDateOffsetDays: startDateOffsetDays,
                endDateOffsetDays: endDateOffsetDays,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScholarshipMilestoneLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({scholarshipTemplateId = false, milestoneTemplateId = false}) {
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
                        if (scholarshipTemplateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.scholarshipTemplateId,
                                    referencedTable:
                                        $$ScholarshipMilestoneLinksTableReferences
                                            ._scholarshipTemplateIdTable(db),
                                    referencedColumn:
                                        $$ScholarshipMilestoneLinksTableReferences
                                            ._scholarshipTemplateIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (milestoneTemplateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.milestoneTemplateId,
                                    referencedTable:
                                        $$ScholarshipMilestoneLinksTableReferences
                                            ._milestoneTemplateIdTable(db),
                                    referencedColumn:
                                        $$ScholarshipMilestoneLinksTableReferences
                                            ._milestoneTemplateIdTable(db)
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

typedef $$ScholarshipMilestoneLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScholarshipMilestoneLinksTable,
      ScholarshipMilestoneLink,
      $$ScholarshipMilestoneLinksTableFilterComposer,
      $$ScholarshipMilestoneLinksTableOrderingComposer,
      $$ScholarshipMilestoneLinksTableAnnotationComposer,
      $$ScholarshipMilestoneLinksTableCreateCompanionBuilder,
      $$ScholarshipMilestoneLinksTableUpdateCompanionBuilder,
      (ScholarshipMilestoneLink, $$ScholarshipMilestoneLinksTableReferences),
      ScholarshipMilestoneLink,
      PrefetchHooks Function({
        bool scholarshipTemplateId,
        bool milestoneTemplateId,
      })
    >;
typedef $$UserApplicationsTableCreateCompanionBuilder =
    UserApplicationsCompanion Function({
      Value<int> id,
      required String templateId,
      required String customName,
      Value<String?> customColor,
      Value<String?> notes,
      Value<String> status,
      Value<DateTime> createdAt,
    });
typedef $$UserApplicationsTableUpdateCompanionBuilder =
    UserApplicationsCompanion Function({
      Value<int> id,
      Value<String> templateId,
      Value<String> customName,
      Value<String?> customColor,
      Value<String?> notes,
      Value<String> status,
      Value<DateTime> createdAt,
    });

final class $$UserApplicationsTableReferences
    extends
        BaseReferences<_$AppDatabase, $UserApplicationsTable, UserApplication> {
  $$UserApplicationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ScholarshipTemplatesTable _templateIdTable(_$AppDatabase db) =>
      db.scholarshipTemplates.createAlias(
        $_aliasNameGenerator(
          db.userApplications.templateId,
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

  static MultiTypedResultKey<$UserMilestonesTable, List<UserMilestone>>
  _userMilestonesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userMilestones,
    aliasName: $_aliasNameGenerator(
      db.userApplications.id,
      db.userMilestones.userApplicationId,
    ),
  );

  $$UserMilestonesTableProcessedTableManager get userMilestonesRefs {
    final manager = $$UserMilestonesTableTableManager(
      $_db,
      $_db.userMilestones,
    ).filter((f) => f.userApplicationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userMilestonesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserDocumentsTable, List<UserDocument>>
  _userDocumentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userDocuments,
    aliasName: $_aliasNameGenerator(
      db.userApplications.id,
      db.userDocuments.userApplicationId,
    ),
  );

  $$UserDocumentsTableProcessedTableManager get userDocumentsRefs {
    final manager = $$UserDocumentsTableTableManager(
      $_db,
      $_db.userDocuments,
    ).filter((f) => f.userApplicationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userDocumentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserApplicationsTableFilterComposer
    extends Composer<_$AppDatabase, $UserApplicationsTable> {
  $$UserApplicationsTableFilterComposer({
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

  ColumnFilters<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customColor => $composableBuilder(
    column: $table.customColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  Expression<bool> userMilestonesRefs(
    Expression<bool> Function($$UserMilestonesTableFilterComposer f) f,
  ) {
    final $$UserMilestonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userMilestones,
      getReferencedColumn: (t) => t.userApplicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserMilestonesTableFilterComposer(
            $db: $db,
            $table: $db.userMilestones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userDocumentsRefs(
    Expression<bool> Function($$UserDocumentsTableFilterComposer f) f,
  ) {
    final $$UserDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDocuments,
      getReferencedColumn: (t) => t.userApplicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.userDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserApplicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserApplicationsTable> {
  $$UserApplicationsTableOrderingComposer({
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

  ColumnOrderings<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customColor => $composableBuilder(
    column: $table.customColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

class $$UserApplicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserApplicationsTable> {
  $$UserApplicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customColor => $composableBuilder(
    column: $table.customColor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

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

  Expression<T> userMilestonesRefs<T extends Object>(
    Expression<T> Function($$UserMilestonesTableAnnotationComposer a) f,
  ) {
    final $$UserMilestonesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userMilestones,
      getReferencedColumn: (t) => t.userApplicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserMilestonesTableAnnotationComposer(
            $db: $db,
            $table: $db.userMilestones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userDocumentsRefs<T extends Object>(
    Expression<T> Function($$UserDocumentsTableAnnotationComposer a) f,
  ) {
    final $$UserDocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDocuments,
      getReferencedColumn: (t) => t.userApplicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.userDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserApplicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserApplicationsTable,
          UserApplication,
          $$UserApplicationsTableFilterComposer,
          $$UserApplicationsTableOrderingComposer,
          $$UserApplicationsTableAnnotationComposer,
          $$UserApplicationsTableCreateCompanionBuilder,
          $$UserApplicationsTableUpdateCompanionBuilder,
          (UserApplication, $$UserApplicationsTableReferences),
          UserApplication,
          PrefetchHooks Function({
            bool templateId,
            bool userMilestonesRefs,
            bool userDocumentsRefs,
          })
        > {
  $$UserApplicationsTableTableManager(
    _$AppDatabase db,
    $UserApplicationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserApplicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserApplicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserApplicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> templateId = const Value.absent(),
                Value<String> customName = const Value.absent(),
                Value<String?> customColor = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UserApplicationsCompanion(
                id: id,
                templateId: templateId,
                customName: customName,
                customColor: customColor,
                notes: notes,
                status: status,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String templateId,
                required String customName,
                Value<String?> customColor = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UserApplicationsCompanion.insert(
                id: id,
                templateId: templateId,
                customName: customName,
                customColor: customColor,
                notes: notes,
                status: status,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserApplicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                templateId = false,
                userMilestonesRefs = false,
                userDocumentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userMilestonesRefs) db.userMilestones,
                    if (userDocumentsRefs) db.userDocuments,
                  ],
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
                                    referencedTable:
                                        $$UserApplicationsTableReferences
                                            ._templateIdTable(db),
                                    referencedColumn:
                                        $$UserApplicationsTableReferences
                                            ._templateIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userMilestonesRefs)
                        await $_getPrefetchedData<
                          UserApplication,
                          $UserApplicationsTable,
                          UserMilestone
                        >(
                          currentTable: table,
                          referencedTable: $$UserApplicationsTableReferences
                              ._userMilestonesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserApplicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).userMilestonesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userApplicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userDocumentsRefs)
                        await $_getPrefetchedData<
                          UserApplication,
                          $UserApplicationsTable,
                          UserDocument
                        >(
                          currentTable: table,
                          referencedTable: $$UserApplicationsTableReferences
                              ._userDocumentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserApplicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).userDocumentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userApplicationId == item.id,
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

typedef $$UserApplicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserApplicationsTable,
      UserApplication,
      $$UserApplicationsTableFilterComposer,
      $$UserApplicationsTableOrderingComposer,
      $$UserApplicationsTableAnnotationComposer,
      $$UserApplicationsTableCreateCompanionBuilder,
      $$UserApplicationsTableUpdateCompanionBuilder,
      (UserApplication, $$UserApplicationsTableReferences),
      UserApplication,
      PrefetchHooks Function({
        bool templateId,
        bool userMilestonesRefs,
        bool userDocumentsRefs,
      })
    >;
typedef $$UserMilestonesTableCreateCompanionBuilder =
    UserMilestonesCompanion Function({
      Value<int> id,
      required int userApplicationId,
      required String name,
      required DateTime startDate,
      required DateTime endDate,
      Value<bool> isCompleted,
    });
typedef $$UserMilestonesTableUpdateCompanionBuilder =
    UserMilestonesCompanion Function({
      Value<int> id,
      Value<int> userApplicationId,
      Value<String> name,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<bool> isCompleted,
    });

final class $$UserMilestonesTableReferences
    extends BaseReferences<_$AppDatabase, $UserMilestonesTable, UserMilestone> {
  $$UserMilestonesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserApplicationsTable _userApplicationIdTable(_$AppDatabase db) =>
      db.userApplications.createAlias(
        $_aliasNameGenerator(
          db.userMilestones.userApplicationId,
          db.userApplications.id,
        ),
      );

  $$UserApplicationsTableProcessedTableManager get userApplicationId {
    final $_column = $_itemColumn<int>('user_application_id')!;

    final manager = $$UserApplicationsTableTableManager(
      $_db,
      $_db.userApplications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userApplicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$UserTasksTable, List<UserTask>>
  _userTasksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userTasks,
    aliasName: $_aliasNameGenerator(
      db.userMilestones.id,
      db.userTasks.userMilestoneId,
    ),
  );

  $$UserTasksTableProcessedTableManager get userTasksRefs {
    final manager = $$UserTasksTableTableManager(
      $_db,
      $_db.userTasks,
    ).filter((f) => f.userMilestoneId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userTasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserMilestonesTableFilterComposer
    extends Composer<_$AppDatabase, $UserMilestonesTable> {
  $$UserMilestonesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  $$UserApplicationsTableFilterComposer get userApplicationId {
    final $$UserApplicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userApplicationId,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableFilterComposer(
            $db: $db,
            $table: $db.userApplications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> userTasksRefs(
    Expression<bool> Function($$UserTasksTableFilterComposer f) f,
  ) {
    final $$UserTasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userTasks,
      getReferencedColumn: (t) => t.userMilestoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTasksTableFilterComposer(
            $db: $db,
            $table: $db.userTasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserMilestonesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserMilestonesTable> {
  $$UserMilestonesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserApplicationsTableOrderingComposer get userApplicationId {
    final $$UserApplicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userApplicationId,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableOrderingComposer(
            $db: $db,
            $table: $db.userApplications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserMilestonesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserMilestonesTable> {
  $$UserMilestonesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  $$UserApplicationsTableAnnotationComposer get userApplicationId {
    final $$UserApplicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userApplicationId,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.userApplications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> userTasksRefs<T extends Object>(
    Expression<T> Function($$UserTasksTableAnnotationComposer a) f,
  ) {
    final $$UserTasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userTasks,
      getReferencedColumn: (t) => t.userMilestoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTasksTableAnnotationComposer(
            $db: $db,
            $table: $db.userTasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserMilestonesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserMilestonesTable,
          UserMilestone,
          $$UserMilestonesTableFilterComposer,
          $$UserMilestonesTableOrderingComposer,
          $$UserMilestonesTableAnnotationComposer,
          $$UserMilestonesTableCreateCompanionBuilder,
          $$UserMilestonesTableUpdateCompanionBuilder,
          (UserMilestone, $$UserMilestonesTableReferences),
          UserMilestone,
          PrefetchHooks Function({bool userApplicationId, bool userTasksRefs})
        > {
  $$UserMilestonesTableTableManager(
    _$AppDatabase db,
    $UserMilestonesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserMilestonesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserMilestonesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserMilestonesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userApplicationId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
              }) => UserMilestonesCompanion(
                id: id,
                userApplicationId: userApplicationId,
                name: name,
                startDate: startDate,
                endDate: endDate,
                isCompleted: isCompleted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userApplicationId,
                required String name,
                required DateTime startDate,
                required DateTime endDate,
                Value<bool> isCompleted = const Value.absent(),
              }) => UserMilestonesCompanion.insert(
                id: id,
                userApplicationId: userApplicationId,
                name: name,
                startDate: startDate,
                endDate: endDate,
                isCompleted: isCompleted,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserMilestonesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userApplicationId = false, userTasksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (userTasksRefs) db.userTasks],
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
                        if (userApplicationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userApplicationId,
                                    referencedTable:
                                        $$UserMilestonesTableReferences
                                            ._userApplicationIdTable(db),
                                    referencedColumn:
                                        $$UserMilestonesTableReferences
                                            ._userApplicationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userTasksRefs)
                        await $_getPrefetchedData<
                          UserMilestone,
                          $UserMilestonesTable,
                          UserTask
                        >(
                          currentTable: table,
                          referencedTable: $$UserMilestonesTableReferences
                              ._userTasksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserMilestonesTableReferences(
                                db,
                                table,
                                p0,
                              ).userTasksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userMilestoneId == item.id,
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

typedef $$UserMilestonesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserMilestonesTable,
      UserMilestone,
      $$UserMilestonesTableFilterComposer,
      $$UserMilestonesTableOrderingComposer,
      $$UserMilestonesTableAnnotationComposer,
      $$UserMilestonesTableCreateCompanionBuilder,
      $$UserMilestonesTableUpdateCompanionBuilder,
      (UserMilestone, $$UserMilestonesTableReferences),
      UserMilestone,
      PrefetchHooks Function({bool userApplicationId, bool userTasksRefs})
    >;
typedef $$UserTasksTableCreateCompanionBuilder =
    UserTasksCompanion Function({
      Value<int> id,
      required int userMilestoneId,
      required String label,
      Value<bool> isCompleted,
      required DateTime dueDate,
    });
typedef $$UserTasksTableUpdateCompanionBuilder =
    UserTasksCompanion Function({
      Value<int> id,
      Value<int> userMilestoneId,
      Value<String> label,
      Value<bool> isCompleted,
      Value<DateTime> dueDate,
    });

final class $$UserTasksTableReferences
    extends BaseReferences<_$AppDatabase, $UserTasksTable, UserTask> {
  $$UserTasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserMilestonesTable _userMilestoneIdTable(_$AppDatabase db) =>
      db.userMilestones.createAlias(
        $_aliasNameGenerator(
          db.userTasks.userMilestoneId,
          db.userMilestones.id,
        ),
      );

  $$UserMilestonesTableProcessedTableManager get userMilestoneId {
    final $_column = $_itemColumn<int>('user_milestone_id')!;

    final manager = $$UserMilestonesTableTableManager(
      $_db,
      $_db.userMilestones,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userMilestoneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserTasksTableFilterComposer
    extends Composer<_$AppDatabase, $UserTasksTable> {
  $$UserTasksTableFilterComposer({
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

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  $$UserMilestonesTableFilterComposer get userMilestoneId {
    final $$UserMilestonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userMilestoneId,
      referencedTable: $db.userMilestones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserMilestonesTableFilterComposer(
            $db: $db,
            $table: $db.userMilestones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTasksTable> {
  $$UserTasksTableOrderingComposer({
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

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserMilestonesTableOrderingComposer get userMilestoneId {
    final $$UserMilestonesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userMilestoneId,
      referencedTable: $db.userMilestones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserMilestonesTableOrderingComposer(
            $db: $db,
            $table: $db.userMilestones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTasksTable> {
  $$UserTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  $$UserMilestonesTableAnnotationComposer get userMilestoneId {
    final $$UserMilestonesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userMilestoneId,
      referencedTable: $db.userMilestones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserMilestonesTableAnnotationComposer(
            $db: $db,
            $table: $db.userMilestones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTasksTable,
          UserTask,
          $$UserTasksTableFilterComposer,
          $$UserTasksTableOrderingComposer,
          $$UserTasksTableAnnotationComposer,
          $$UserTasksTableCreateCompanionBuilder,
          $$UserTasksTableUpdateCompanionBuilder,
          (UserTask, $$UserTasksTableReferences),
          UserTask,
          PrefetchHooks Function({bool userMilestoneId})
        > {
  $$UserTasksTableTableManager(_$AppDatabase db, $UserTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userMilestoneId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
              }) => UserTasksCompanion(
                id: id,
                userMilestoneId: userMilestoneId,
                label: label,
                isCompleted: isCompleted,
                dueDate: dueDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userMilestoneId,
                required String label,
                Value<bool> isCompleted = const Value.absent(),
                required DateTime dueDate,
              }) => UserTasksCompanion.insert(
                id: id,
                userMilestoneId: userMilestoneId,
                label: label,
                isCompleted: isCompleted,
                dueDate: dueDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserTasksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userMilestoneId = false}) {
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
                    if (userMilestoneId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userMilestoneId,
                                referencedTable: $$UserTasksTableReferences
                                    ._userMilestoneIdTable(db),
                                referencedColumn: $$UserTasksTableReferences
                                    ._userMilestoneIdTable(db)
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

typedef $$UserTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTasksTable,
      UserTask,
      $$UserTasksTableFilterComposer,
      $$UserTasksTableOrderingComposer,
      $$UserTasksTableAnnotationComposer,
      $$UserTasksTableCreateCompanionBuilder,
      $$UserTasksTableUpdateCompanionBuilder,
      (UserTask, $$UserTasksTableReferences),
      UserTask,
      PrefetchHooks Function({bool userMilestoneId})
    >;
typedef $$UserDocumentsTableCreateCompanionBuilder =
    UserDocumentsCompanion Function({
      Value<int> id,
      required int userApplicationId,
      required String name,
      Value<DocumentStatus> status,
      Value<String?> notes,
    });
typedef $$UserDocumentsTableUpdateCompanionBuilder =
    UserDocumentsCompanion Function({
      Value<int> id,
      Value<int> userApplicationId,
      Value<String> name,
      Value<DocumentStatus> status,
      Value<String?> notes,
    });

final class $$UserDocumentsTableReferences
    extends BaseReferences<_$AppDatabase, $UserDocumentsTable, UserDocument> {
  $$UserDocumentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserApplicationsTable _userApplicationIdTable(_$AppDatabase db) =>
      db.userApplications.createAlias(
        $_aliasNameGenerator(
          db.userDocuments.userApplicationId,
          db.userApplications.id,
        ),
      );

  $$UserApplicationsTableProcessedTableManager get userApplicationId {
    final $_column = $_itemColumn<int>('user_application_id')!;

    final manager = $$UserApplicationsTableTableManager(
      $_db,
      $_db.userApplications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userApplicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $UserDocumentsTable> {
  $$UserDocumentsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DocumentStatus, DocumentStatus, int>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$UserApplicationsTableFilterComposer get userApplicationId {
    final $$UserApplicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userApplicationId,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableFilterComposer(
            $db: $db,
            $table: $db.userApplications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDocumentsTable> {
  $$UserDocumentsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserApplicationsTableOrderingComposer get userApplicationId {
    final $$UserApplicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userApplicationId,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableOrderingComposer(
            $db: $db,
            $table: $db.userApplications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDocumentsTable> {
  $$UserDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DocumentStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$UserApplicationsTableAnnotationComposer get userApplicationId {
    final $$UserApplicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userApplicationId,
      referencedTable: $db.userApplications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserApplicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.userApplications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserDocumentsTable,
          UserDocument,
          $$UserDocumentsTableFilterComposer,
          $$UserDocumentsTableOrderingComposer,
          $$UserDocumentsTableAnnotationComposer,
          $$UserDocumentsTableCreateCompanionBuilder,
          $$UserDocumentsTableUpdateCompanionBuilder,
          (UserDocument, $$UserDocumentsTableReferences),
          UserDocument,
          PrefetchHooks Function({bool userApplicationId})
        > {
  $$UserDocumentsTableTableManager(_$AppDatabase db, $UserDocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userApplicationId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DocumentStatus> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => UserDocumentsCompanion(
                id: id,
                userApplicationId: userApplicationId,
                name: name,
                status: status,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userApplicationId,
                required String name,
                Value<DocumentStatus> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => UserDocumentsCompanion.insert(
                id: id,
                userApplicationId: userApplicationId,
                name: name,
                status: status,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userApplicationId = false}) {
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
                    if (userApplicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userApplicationId,
                                referencedTable: $$UserDocumentsTableReferences
                                    ._userApplicationIdTable(db),
                                referencedColumn: $$UserDocumentsTableReferences
                                    ._userApplicationIdTable(db)
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

typedef $$UserDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserDocumentsTable,
      UserDocument,
      $$UserDocumentsTableFilterComposer,
      $$UserDocumentsTableOrderingComposer,
      $$UserDocumentsTableAnnotationComposer,
      $$UserDocumentsTableCreateCompanionBuilder,
      $$UserDocumentsTableUpdateCompanionBuilder,
      (UserDocument, $$UserDocumentsTableReferences),
      UserDocument,
      PrefetchHooks Function({bool userApplicationId})
    >;
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
  $$ScholarshipTemplatesTableTableManager get scholarshipTemplates =>
      $$ScholarshipTemplatesTableTableManager(_db, _db.scholarshipTemplates);
  $$TemplateDocumentsTableTableManager get templateDocuments =>
      $$TemplateDocumentsTableTableManager(_db, _db.templateDocuments);
  $$MilestoneTemplatesTableTableManager get milestoneTemplates =>
      $$MilestoneTemplatesTableTableManager(_db, _db.milestoneTemplates);
  $$TaskTemplatesTableTableManager get taskTemplates =>
      $$TaskTemplatesTableTableManager(_db, _db.taskTemplates);
  $$ScholarshipMilestoneLinksTableTableManager get scholarshipMilestoneLinks =>
      $$ScholarshipMilestoneLinksTableTableManager(
        _db,
        _db.scholarshipMilestoneLinks,
      );
  $$UserApplicationsTableTableManager get userApplications =>
      $$UserApplicationsTableTableManager(_db, _db.userApplications);
  $$UserMilestonesTableTableManager get userMilestones =>
      $$UserMilestonesTableTableManager(_db, _db.userMilestones);
  $$UserTasksTableTableManager get userTasks =>
      $$UserTasksTableTableManager(_db, _db.userTasks);
  $$UserDocumentsTableTableManager get userDocuments =>
      $$UserDocumentsTableTableManager(_db, _db.userDocuments);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
