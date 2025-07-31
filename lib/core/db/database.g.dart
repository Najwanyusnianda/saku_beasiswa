// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentEducationLevelMeta =
      const VerificationMeta('currentEducationLevel');
  @override
  late final GeneratedColumn<String> currentEducationLevel =
      GeneratedColumn<String>(
        'current_education_level',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _institutionMeta = const VerificationMeta(
    'institution',
  );
  @override
  late final GeneratedColumn<String> institution = GeneratedColumn<String>(
    'institution',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _majorFieldMeta = const VerificationMeta(
    'majorField',
  );
  @override
  late final GeneratedColumn<String> majorField = GeneratedColumn<String>(
    'major_field',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentGpaMeta = const VerificationMeta(
    'currentGpa',
  );
  @override
  late final GeneratedColumn<double> currentGpa = GeneratedColumn<double>(
    'current_gpa',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expectedGraduationMeta =
      const VerificationMeta('expectedGraduation');
  @override
  late final GeneratedColumn<DateTime> expectedGraduation =
      GeneratedColumn<DateTime>(
        'expected_graduation',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _profilePhotoPathMeta = const VerificationMeta(
    'profilePhotoPath',
  );
  @override
  late final GeneratedColumn<String> profilePhotoPath = GeneratedColumn<String>(
    'profile_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    email,
    phoneNumber,
    dateOfBirth,
    city,
    currentEducationLevel,
    institution,
    majorField,
    currentGpa,
    expectedGraduation,
    profilePhotoPath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('current_education_level')) {
      context.handle(
        _currentEducationLevelMeta,
        currentEducationLevel.isAcceptableOrUnknown(
          data['current_education_level']!,
          _currentEducationLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentEducationLevelMeta);
    }
    if (data.containsKey('institution')) {
      context.handle(
        _institutionMeta,
        institution.isAcceptableOrUnknown(
          data['institution']!,
          _institutionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_institutionMeta);
    }
    if (data.containsKey('major_field')) {
      context.handle(
        _majorFieldMeta,
        majorField.isAcceptableOrUnknown(data['major_field']!, _majorFieldMeta),
      );
    } else if (isInserting) {
      context.missing(_majorFieldMeta);
    }
    if (data.containsKey('current_gpa')) {
      context.handle(
        _currentGpaMeta,
        currentGpa.isAcceptableOrUnknown(data['current_gpa']!, _currentGpaMeta),
      );
    }
    if (data.containsKey('expected_graduation')) {
      context.handle(
        _expectedGraduationMeta,
        expectedGraduation.isAcceptableOrUnknown(
          data['expected_graduation']!,
          _expectedGraduationMeta,
        ),
      );
    }
    if (data.containsKey('profile_photo_path')) {
      context.handle(
        _profilePhotoPathMeta,
        profilePhotoPath.isAcceptableOrUnknown(
          data['profile_photo_path']!,
          _profilePhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      currentEducationLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_education_level'],
      )!,
      institution: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution'],
      )!,
      majorField: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}major_field'],
      )!,
      currentGpa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_gpa'],
      ),
      expectedGraduation: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expected_graduation'],
      ),
      profilePhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_photo_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final String? city;
  final String currentEducationLevel;
  final String institution;
  final String majorField;
  final double? currentGpa;
  final DateTime? expectedGraduation;
  final String? profilePhotoPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const User({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.city,
    required this.currentEducationLevel,
    required this.institution,
    required this.majorField,
    this.currentGpa,
    this.expectedGraduation,
    this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['current_education_level'] = Variable<String>(currentEducationLevel);
    map['institution'] = Variable<String>(institution);
    map['major_field'] = Variable<String>(majorField);
    if (!nullToAbsent || currentGpa != null) {
      map['current_gpa'] = Variable<double>(currentGpa);
    }
    if (!nullToAbsent || expectedGraduation != null) {
      map['expected_graduation'] = Variable<DateTime>(expectedGraduation);
    }
    if (!nullToAbsent || profilePhotoPath != null) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      fullName: Value(fullName),
      email: Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      currentEducationLevel: Value(currentEducationLevel),
      institution: Value(institution),
      majorField: Value(majorField),
      currentGpa: currentGpa == null && nullToAbsent
          ? const Value.absent()
          : Value(currentGpa),
      expectedGraduation: expectedGraduation == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedGraduation),
      profilePhotoPath: profilePhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePhotoPath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      city: serializer.fromJson<String?>(json['city']),
      currentEducationLevel: serializer.fromJson<String>(
        json['currentEducationLevel'],
      ),
      institution: serializer.fromJson<String>(json['institution']),
      majorField: serializer.fromJson<String>(json['majorField']),
      currentGpa: serializer.fromJson<double?>(json['currentGpa']),
      expectedGraduation: serializer.fromJson<DateTime?>(
        json['expectedGraduation'],
      ),
      profilePhotoPath: serializer.fromJson<String?>(json['profilePhotoPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'city': serializer.toJson<String?>(city),
      'currentEducationLevel': serializer.toJson<String>(currentEducationLevel),
      'institution': serializer.toJson<String>(institution),
      'majorField': serializer.toJson<String>(majorField),
      'currentGpa': serializer.toJson<double?>(currentGpa),
      'expectedGraduation': serializer.toJson<DateTime?>(expectedGraduation),
      'profilePhotoPath': serializer.toJson<String?>(profilePhotoPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith({
    int? id,
    String? fullName,
    String? email,
    Value<String?> phoneNumber = const Value.absent(),
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> city = const Value.absent(),
    String? currentEducationLevel,
    String? institution,
    String? majorField,
    Value<double?> currentGpa = const Value.absent(),
    Value<DateTime?> expectedGraduation = const Value.absent(),
    Value<String?> profilePhotoPath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => User(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    city: city.present ? city.value : this.city,
    currentEducationLevel: currentEducationLevel ?? this.currentEducationLevel,
    institution: institution ?? this.institution,
    majorField: majorField ?? this.majorField,
    currentGpa: currentGpa.present ? currentGpa.value : this.currentGpa,
    expectedGraduation: expectedGraduation.present
        ? expectedGraduation.value
        : this.expectedGraduation,
    profilePhotoPath: profilePhotoPath.present
        ? profilePhotoPath.value
        : this.profilePhotoPath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      city: data.city.present ? data.city.value : this.city,
      currentEducationLevel: data.currentEducationLevel.present
          ? data.currentEducationLevel.value
          : this.currentEducationLevel,
      institution: data.institution.present
          ? data.institution.value
          : this.institution,
      majorField: data.majorField.present
          ? data.majorField.value
          : this.majorField,
      currentGpa: data.currentGpa.present
          ? data.currentGpa.value
          : this.currentGpa,
      expectedGraduation: data.expectedGraduation.present
          ? data.expectedGraduation.value
          : this.expectedGraduation,
      profilePhotoPath: data.profilePhotoPath.present
          ? data.profilePhotoPath.value
          : this.profilePhotoPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('city: $city, ')
          ..write('currentEducationLevel: $currentEducationLevel, ')
          ..write('institution: $institution, ')
          ..write('majorField: $majorField, ')
          ..write('currentGpa: $currentGpa, ')
          ..write('expectedGraduation: $expectedGraduation, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    email,
    phoneNumber,
    dateOfBirth,
    city,
    currentEducationLevel,
    institution,
    majorField,
    currentGpa,
    expectedGraduation,
    profilePhotoPath,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.dateOfBirth == this.dateOfBirth &&
          other.city == this.city &&
          other.currentEducationLevel == this.currentEducationLevel &&
          other.institution == this.institution &&
          other.majorField == this.majorField &&
          other.currentGpa == this.currentGpa &&
          other.expectedGraduation == this.expectedGraduation &&
          other.profilePhotoPath == this.profilePhotoPath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> email;
  final Value<String?> phoneNumber;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> city;
  final Value<String> currentEducationLevel;
  final Value<String> institution;
  final Value<String> majorField;
  final Value<double?> currentGpa;
  final Value<DateTime?> expectedGraduation;
  final Value<String?> profilePhotoPath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.city = const Value.absent(),
    this.currentEducationLevel = const Value.absent(),
    this.institution = const Value.absent(),
    this.majorField = const Value.absent(),
    this.currentGpa = const Value.absent(),
    this.expectedGraduation = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String email,
    this.phoneNumber = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.city = const Value.absent(),
    required String currentEducationLevel,
    required String institution,
    required String majorField,
    this.currentGpa = const Value.absent(),
    this.expectedGraduation = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : fullName = Value(fullName),
       email = Value(email),
       currentEducationLevel = Value(currentEducationLevel),
       institution = Value(institution),
       majorField = Value(majorField);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? city,
    Expression<String>? currentEducationLevel,
    Expression<String>? institution,
    Expression<String>? majorField,
    Expression<double>? currentGpa,
    Expression<DateTime>? expectedGraduation,
    Expression<String>? profilePhotoPath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (city != null) 'city': city,
      if (currentEducationLevel != null)
        'current_education_level': currentEducationLevel,
      if (institution != null) 'institution': institution,
      if (majorField != null) 'major_field': majorField,
      if (currentGpa != null) 'current_gpa': currentGpa,
      if (expectedGraduation != null) 'expected_graduation': expectedGraduation,
      if (profilePhotoPath != null) 'profile_photo_path': profilePhotoPath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? fullName,
    Value<String>? email,
    Value<String?>? phoneNumber,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? city,
    Value<String>? currentEducationLevel,
    Value<String>? institution,
    Value<String>? majorField,
    Value<double?>? currentGpa,
    Value<DateTime?>? expectedGraduation,
    Value<String?>? profilePhotoPath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      city: city ?? this.city,
      currentEducationLevel:
          currentEducationLevel ?? this.currentEducationLevel,
      institution: institution ?? this.institution,
      majorField: majorField ?? this.majorField,
      currentGpa: currentGpa ?? this.currentGpa,
      expectedGraduation: expectedGraduation ?? this.expectedGraduation,
      profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (currentEducationLevel.present) {
      map['current_education_level'] = Variable<String>(
        currentEducationLevel.value,
      );
    }
    if (institution.present) {
      map['institution'] = Variable<String>(institution.value);
    }
    if (majorField.present) {
      map['major_field'] = Variable<String>(majorField.value);
    }
    if (currentGpa.present) {
      map['current_gpa'] = Variable<double>(currentGpa.value);
    }
    if (expectedGraduation.present) {
      map['expected_graduation'] = Variable<DateTime>(expectedGraduation.value);
    }
    if (profilePhotoPath.present) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('city: $city, ')
          ..write('currentEducationLevel: $currentEducationLevel, ')
          ..write('institution: $institution, ')
          ..write('majorField: $majorField, ')
          ..write('currentGpa: $currentGpa, ')
          ..write('expectedGraduation: $expectedGraduation, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TestScoresTable extends TestScores
    with TableInfo<$TestScoresTable, TestScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestScoresTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _testTypeMeta = const VerificationMeta(
    'testType',
  );
  @override
  late final GeneratedColumn<String> testType = GeneratedColumn<String>(
    'test_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _overallScoreMeta = const VerificationMeta(
    'overallScore',
  );
  @override
  late final GeneratedColumn<double> overallScore = GeneratedColumn<double>(
    'overall_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testDateMeta = const VerificationMeta(
    'testDate',
  );
  @override
  late final GeneratedColumn<DateTime> testDate = GeneratedColumn<DateTime>(
    'test_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailedScoresMeta = const VerificationMeta(
    'detailedScores',
  );
  @override
  late final GeneratedColumn<String> detailedScores = GeneratedColumn<String>(
    'detailed_scores',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _certificateUrlMeta = const VerificationMeta(
    'certificateUrl',
  );
  @override
  late final GeneratedColumn<String> certificateUrl = GeneratedColumn<String>(
    'certificate_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    userId,
    testType,
    overallScore,
    testDate,
    detailedScores,
    certificateUrl,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_scores';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestScore> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('test_type')) {
      context.handle(
        _testTypeMeta,
        testType.isAcceptableOrUnknown(data['test_type']!, _testTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_testTypeMeta);
    }
    if (data.containsKey('overall_score')) {
      context.handle(
        _overallScoreMeta,
        overallScore.isAcceptableOrUnknown(
          data['overall_score']!,
          _overallScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_overallScoreMeta);
    }
    if (data.containsKey('test_date')) {
      context.handle(
        _testDateMeta,
        testDate.isAcceptableOrUnknown(data['test_date']!, _testDateMeta),
      );
    } else if (isInserting) {
      context.missing(_testDateMeta);
    }
    if (data.containsKey('detailed_scores')) {
      context.handle(
        _detailedScoresMeta,
        detailedScores.isAcceptableOrUnknown(
          data['detailed_scores']!,
          _detailedScoresMeta,
        ),
      );
    }
    if (data.containsKey('certificate_url')) {
      context.handle(
        _certificateUrlMeta,
        certificateUrl.isAcceptableOrUnknown(
          data['certificate_url']!,
          _certificateUrlMeta,
        ),
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
  TestScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestScore(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      testType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_type'],
      )!,
      overallScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}overall_score'],
      )!,
      testDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}test_date'],
      )!,
      detailedScores: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detailed_scores'],
      ),
      certificateUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certificate_url'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TestScoresTable createAlias(String alias) {
    return $TestScoresTable(attachedDatabase, alias);
  }
}

class TestScore extends DataClass implements Insertable<TestScore> {
  final int id;
  final int userId;
  final String testType;
  final double overallScore;
  final DateTime testDate;
  final String? detailedScores;
  final String? certificateUrl;
  final DateTime createdAt;
  const TestScore({
    required this.id,
    required this.userId,
    required this.testType,
    required this.overallScore,
    required this.testDate,
    this.detailedScores,
    this.certificateUrl,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['test_type'] = Variable<String>(testType);
    map['overall_score'] = Variable<double>(overallScore);
    map['test_date'] = Variable<DateTime>(testDate);
    if (!nullToAbsent || detailedScores != null) {
      map['detailed_scores'] = Variable<String>(detailedScores);
    }
    if (!nullToAbsent || certificateUrl != null) {
      map['certificate_url'] = Variable<String>(certificateUrl);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TestScoresCompanion toCompanion(bool nullToAbsent) {
    return TestScoresCompanion(
      id: Value(id),
      userId: Value(userId),
      testType: Value(testType),
      overallScore: Value(overallScore),
      testDate: Value(testDate),
      detailedScores: detailedScores == null && nullToAbsent
          ? const Value.absent()
          : Value(detailedScores),
      certificateUrl: certificateUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(certificateUrl),
      createdAt: Value(createdAt),
    );
  }

  factory TestScore.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestScore(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      testType: serializer.fromJson<String>(json['testType']),
      overallScore: serializer.fromJson<double>(json['overallScore']),
      testDate: serializer.fromJson<DateTime>(json['testDate']),
      detailedScores: serializer.fromJson<String?>(json['detailedScores']),
      certificateUrl: serializer.fromJson<String?>(json['certificateUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'testType': serializer.toJson<String>(testType),
      'overallScore': serializer.toJson<double>(overallScore),
      'testDate': serializer.toJson<DateTime>(testDate),
      'detailedScores': serializer.toJson<String?>(detailedScores),
      'certificateUrl': serializer.toJson<String?>(certificateUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TestScore copyWith({
    int? id,
    int? userId,
    String? testType,
    double? overallScore,
    DateTime? testDate,
    Value<String?> detailedScores = const Value.absent(),
    Value<String?> certificateUrl = const Value.absent(),
    DateTime? createdAt,
  }) => TestScore(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    testType: testType ?? this.testType,
    overallScore: overallScore ?? this.overallScore,
    testDate: testDate ?? this.testDate,
    detailedScores: detailedScores.present
        ? detailedScores.value
        : this.detailedScores,
    certificateUrl: certificateUrl.present
        ? certificateUrl.value
        : this.certificateUrl,
    createdAt: createdAt ?? this.createdAt,
  );
  TestScore copyWithCompanion(TestScoresCompanion data) {
    return TestScore(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      testType: data.testType.present ? data.testType.value : this.testType,
      overallScore: data.overallScore.present
          ? data.overallScore.value
          : this.overallScore,
      testDate: data.testDate.present ? data.testDate.value : this.testDate,
      detailedScores: data.detailedScores.present
          ? data.detailedScores.value
          : this.detailedScores,
      certificateUrl: data.certificateUrl.present
          ? data.certificateUrl.value
          : this.certificateUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestScore(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('testType: $testType, ')
          ..write('overallScore: $overallScore, ')
          ..write('testDate: $testDate, ')
          ..write('detailedScores: $detailedScores, ')
          ..write('certificateUrl: $certificateUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    testType,
    overallScore,
    testDate,
    detailedScores,
    certificateUrl,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestScore &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.testType == this.testType &&
          other.overallScore == this.overallScore &&
          other.testDate == this.testDate &&
          other.detailedScores == this.detailedScores &&
          other.certificateUrl == this.certificateUrl &&
          other.createdAt == this.createdAt);
}

class TestScoresCompanion extends UpdateCompanion<TestScore> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> testType;
  final Value<double> overallScore;
  final Value<DateTime> testDate;
  final Value<String?> detailedScores;
  final Value<String?> certificateUrl;
  final Value<DateTime> createdAt;
  const TestScoresCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.testType = const Value.absent(),
    this.overallScore = const Value.absent(),
    this.testDate = const Value.absent(),
    this.detailedScores = const Value.absent(),
    this.certificateUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TestScoresCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String testType,
    required double overallScore,
    required DateTime testDate,
    this.detailedScores = const Value.absent(),
    this.certificateUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : userId = Value(userId),
       testType = Value(testType),
       overallScore = Value(overallScore),
       testDate = Value(testDate);
  static Insertable<TestScore> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? testType,
    Expression<double>? overallScore,
    Expression<DateTime>? testDate,
    Expression<String>? detailedScores,
    Expression<String>? certificateUrl,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (testType != null) 'test_type': testType,
      if (overallScore != null) 'overall_score': overallScore,
      if (testDate != null) 'test_date': testDate,
      if (detailedScores != null) 'detailed_scores': detailedScores,
      if (certificateUrl != null) 'certificate_url': certificateUrl,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TestScoresCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? testType,
    Value<double>? overallScore,
    Value<DateTime>? testDate,
    Value<String?>? detailedScores,
    Value<String?>? certificateUrl,
    Value<DateTime>? createdAt,
  }) {
    return TestScoresCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      testType: testType ?? this.testType,
      overallScore: overallScore ?? this.overallScore,
      testDate: testDate ?? this.testDate,
      detailedScores: detailedScores ?? this.detailedScores,
      certificateUrl: certificateUrl ?? this.certificateUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (testType.present) {
      map['test_type'] = Variable<String>(testType.value);
    }
    if (overallScore.present) {
      map['overall_score'] = Variable<double>(overallScore.value);
    }
    if (testDate.present) {
      map['test_date'] = Variable<DateTime>(testDate.value);
    }
    if (detailedScores.present) {
      map['detailed_scores'] = Variable<String>(detailedScores.value);
    }
    if (certificateUrl.present) {
      map['certificate_url'] = Variable<String>(certificateUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestScoresCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('testType: $testType, ')
          ..write('overallScore: $overallScore, ')
          ..write('testDate: $testDate, ')
          ..write('detailedScores: $detailedScores, ')
          ..write('certificateUrl: $certificateUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ScholarshipsTable extends Scholarships
    with TableInfo<$ScholarshipsTable, Scholarship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScholarshipsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _jsonIdMeta = const VerificationMeta('jsonId');
  @override
  late final GeneratedColumn<String> jsonId = GeneratedColumn<String>(
    'json_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerCountryMeta = const VerificationMeta(
    'providerCountry',
  );
  @override
  late final GeneratedColumn<String> providerCountry = GeneratedColumn<String>(
    'provider_country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _applicationDeadlineMeta =
      const VerificationMeta('applicationDeadline');
  @override
  late final GeneratedColumn<DateTime> applicationDeadline =
      GeneratedColumn<DateTime>(
        'application_deadline',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fundingTypeMeta = const VerificationMeta(
    'fundingType',
  );
  @override
  late final GeneratedColumn<String> fundingType = GeneratedColumn<String>(
    'funding_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetDegreeLevelsMeta =
      const VerificationMeta('targetDegreeLevels');
  @override
  late final GeneratedColumn<String> targetDegreeLevels =
      GeneratedColumn<String>(
        'target_degree_levels',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _subjectAreasMeta = const VerificationMeta(
    'subjectAreas',
  );
  @override
  late final GeneratedColumn<String> subjectAreas = GeneratedColumn<String>(
    'subject_areas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _studyCountriesMeta = const VerificationMeta(
    'studyCountries',
  );
  @override
  late final GeneratedColumn<String> studyCountries = GeneratedColumn<String>(
    'study_countries',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minGpaMeta = const VerificationMeta('minGpa');
  @override
  late final GeneratedColumn<double> minGpa = GeneratedColumn<double>(
    'min_gpa',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageRequirementsMeta =
      const VerificationMeta('languageRequirements');
  @override
  late final GeneratedColumn<String> languageRequirements =
      GeneratedColumn<String>(
        'language_requirements',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _fullDataMeta = const VerificationMeta(
    'fullData',
  );
  @override
  late final GeneratedColumn<String> fullData = GeneratedColumn<String>(
    'full_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    jsonId,
    title,
    provider,
    providerCountry,
    applicationDeadline,
    fundingType,
    targetDegreeLevels,
    subjectAreas,
    studyCountries,
    minGpa,
    languageRequirements,
    fullData,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scholarships';
  @override
  VerificationContext validateIntegrity(
    Insertable<Scholarship> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('json_id')) {
      context.handle(
        _jsonIdMeta,
        jsonId.isAcceptableOrUnknown(data['json_id']!, _jsonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_jsonIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    } else if (isInserting) {
      context.missing(_providerMeta);
    }
    if (data.containsKey('provider_country')) {
      context.handle(
        _providerCountryMeta,
        providerCountry.isAcceptableOrUnknown(
          data['provider_country']!,
          _providerCountryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_providerCountryMeta);
    }
    if (data.containsKey('application_deadline')) {
      context.handle(
        _applicationDeadlineMeta,
        applicationDeadline.isAcceptableOrUnknown(
          data['application_deadline']!,
          _applicationDeadlineMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_applicationDeadlineMeta);
    }
    if (data.containsKey('funding_type')) {
      context.handle(
        _fundingTypeMeta,
        fundingType.isAcceptableOrUnknown(
          data['funding_type']!,
          _fundingTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fundingTypeMeta);
    }
    if (data.containsKey('target_degree_levels')) {
      context.handle(
        _targetDegreeLevelsMeta,
        targetDegreeLevels.isAcceptableOrUnknown(
          data['target_degree_levels']!,
          _targetDegreeLevelsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetDegreeLevelsMeta);
    }
    if (data.containsKey('subject_areas')) {
      context.handle(
        _subjectAreasMeta,
        subjectAreas.isAcceptableOrUnknown(
          data['subject_areas']!,
          _subjectAreasMeta,
        ),
      );
    }
    if (data.containsKey('study_countries')) {
      context.handle(
        _studyCountriesMeta,
        studyCountries.isAcceptableOrUnknown(
          data['study_countries']!,
          _studyCountriesMeta,
        ),
      );
    }
    if (data.containsKey('min_gpa')) {
      context.handle(
        _minGpaMeta,
        minGpa.isAcceptableOrUnknown(data['min_gpa']!, _minGpaMeta),
      );
    }
    if (data.containsKey('language_requirements')) {
      context.handle(
        _languageRequirementsMeta,
        languageRequirements.isAcceptableOrUnknown(
          data['language_requirements']!,
          _languageRequirementsMeta,
        ),
      );
    }
    if (data.containsKey('full_data')) {
      context.handle(
        _fullDataMeta,
        fullData.isAcceptableOrUnknown(data['full_data']!, _fullDataMeta),
      );
    } else if (isInserting) {
      context.missing(_fullDataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Scholarship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Scholarship(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      jsonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      )!,
      providerCountry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_country'],
      )!,
      applicationDeadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}application_deadline'],
      )!,
      fundingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}funding_type'],
      )!,
      targetDegreeLevels: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_degree_levels'],
      )!,
      subjectAreas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_areas'],
      ),
      studyCountries: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}study_countries'],
      ),
      minGpa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}min_gpa'],
      ),
      languageRequirements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_requirements'],
      ),
      fullData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ScholarshipsTable createAlias(String alias) {
    return $ScholarshipsTable(attachedDatabase, alias);
  }
}

class Scholarship extends DataClass implements Insertable<Scholarship> {
  /// Primary key
  final int id;

  /// Unique identifier from the JSON file (e.g., "scholarship_001")
  final String jsonId;

  /// Scholarship title for quick display and search
  final String title;

  /// Provider/Organization name (e.g., "University of Melbourne")
  final String provider;

  /// Provider country for filtering (e.g., "Australia", "United States")
  final String providerCountry;

  /// Application deadline for sorting and filtering
  final DateTime applicationDeadline;

  /// Funding type for filtering (e.g., "Full Scholarship", "Partial Funding")
  final String fundingType;

  /// Target degree levels as JSON array string for filtering
  /// (e.g., '["Undergraduate", "Master"]')
  final String targetDegreeLevels;

  /// Subject areas as JSON array string for filtering
  /// (e.g., '["Engineering", "Computer Science"]')
  final String? subjectAreas;

  /// Countries where the scholarship can be used
  /// (e.g., '["Australia", "New Zealand"]')
  final String? studyCountries;

  /// Minimum GPA requirement for quick filtering
  final double? minGpa;

  /// Language requirements as JSON string
  /// (e.g., '{"IELTS": 6.5, "TOEFL": 90}')
  final String? languageRequirements;

  /// Store the entire JSON object for the detail view
  /// This contains all the rich, nested data from the original JSON
  final String fullData;

  /// When this record was created in the database
  final DateTime createdAt;

  /// When this record was last updated
  final DateTime updatedAt;
  const Scholarship({
    required this.id,
    required this.jsonId,
    required this.title,
    required this.provider,
    required this.providerCountry,
    required this.applicationDeadline,
    required this.fundingType,
    required this.targetDegreeLevels,
    this.subjectAreas,
    this.studyCountries,
    this.minGpa,
    this.languageRequirements,
    required this.fullData,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['json_id'] = Variable<String>(jsonId);
    map['title'] = Variable<String>(title);
    map['provider'] = Variable<String>(provider);
    map['provider_country'] = Variable<String>(providerCountry);
    map['application_deadline'] = Variable<DateTime>(applicationDeadline);
    map['funding_type'] = Variable<String>(fundingType);
    map['target_degree_levels'] = Variable<String>(targetDegreeLevels);
    if (!nullToAbsent || subjectAreas != null) {
      map['subject_areas'] = Variable<String>(subjectAreas);
    }
    if (!nullToAbsent || studyCountries != null) {
      map['study_countries'] = Variable<String>(studyCountries);
    }
    if (!nullToAbsent || minGpa != null) {
      map['min_gpa'] = Variable<double>(minGpa);
    }
    if (!nullToAbsent || languageRequirements != null) {
      map['language_requirements'] = Variable<String>(languageRequirements);
    }
    map['full_data'] = Variable<String>(fullData);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ScholarshipsCompanion toCompanion(bool nullToAbsent) {
    return ScholarshipsCompanion(
      id: Value(id),
      jsonId: Value(jsonId),
      title: Value(title),
      provider: Value(provider),
      providerCountry: Value(providerCountry),
      applicationDeadline: Value(applicationDeadline),
      fundingType: Value(fundingType),
      targetDegreeLevels: Value(targetDegreeLevels),
      subjectAreas: subjectAreas == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectAreas),
      studyCountries: studyCountries == null && nullToAbsent
          ? const Value.absent()
          : Value(studyCountries),
      minGpa: minGpa == null && nullToAbsent
          ? const Value.absent()
          : Value(minGpa),
      languageRequirements: languageRequirements == null && nullToAbsent
          ? const Value.absent()
          : Value(languageRequirements),
      fullData: Value(fullData),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Scholarship.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Scholarship(
      id: serializer.fromJson<int>(json['id']),
      jsonId: serializer.fromJson<String>(json['jsonId']),
      title: serializer.fromJson<String>(json['title']),
      provider: serializer.fromJson<String>(json['provider']),
      providerCountry: serializer.fromJson<String>(json['providerCountry']),
      applicationDeadline: serializer.fromJson<DateTime>(
        json['applicationDeadline'],
      ),
      fundingType: serializer.fromJson<String>(json['fundingType']),
      targetDegreeLevels: serializer.fromJson<String>(
        json['targetDegreeLevels'],
      ),
      subjectAreas: serializer.fromJson<String?>(json['subjectAreas']),
      studyCountries: serializer.fromJson<String?>(json['studyCountries']),
      minGpa: serializer.fromJson<double?>(json['minGpa']),
      languageRequirements: serializer.fromJson<String?>(
        json['languageRequirements'],
      ),
      fullData: serializer.fromJson<String>(json['fullData']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jsonId': serializer.toJson<String>(jsonId),
      'title': serializer.toJson<String>(title),
      'provider': serializer.toJson<String>(provider),
      'providerCountry': serializer.toJson<String>(providerCountry),
      'applicationDeadline': serializer.toJson<DateTime>(applicationDeadline),
      'fundingType': serializer.toJson<String>(fundingType),
      'targetDegreeLevels': serializer.toJson<String>(targetDegreeLevels),
      'subjectAreas': serializer.toJson<String?>(subjectAreas),
      'studyCountries': serializer.toJson<String?>(studyCountries),
      'minGpa': serializer.toJson<double?>(minGpa),
      'languageRequirements': serializer.toJson<String?>(languageRequirements),
      'fullData': serializer.toJson<String>(fullData),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Scholarship copyWith({
    int? id,
    String? jsonId,
    String? title,
    String? provider,
    String? providerCountry,
    DateTime? applicationDeadline,
    String? fundingType,
    String? targetDegreeLevels,
    Value<String?> subjectAreas = const Value.absent(),
    Value<String?> studyCountries = const Value.absent(),
    Value<double?> minGpa = const Value.absent(),
    Value<String?> languageRequirements = const Value.absent(),
    String? fullData,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Scholarship(
    id: id ?? this.id,
    jsonId: jsonId ?? this.jsonId,
    title: title ?? this.title,
    provider: provider ?? this.provider,
    providerCountry: providerCountry ?? this.providerCountry,
    applicationDeadline: applicationDeadline ?? this.applicationDeadline,
    fundingType: fundingType ?? this.fundingType,
    targetDegreeLevels: targetDegreeLevels ?? this.targetDegreeLevels,
    subjectAreas: subjectAreas.present ? subjectAreas.value : this.subjectAreas,
    studyCountries: studyCountries.present
        ? studyCountries.value
        : this.studyCountries,
    minGpa: minGpa.present ? minGpa.value : this.minGpa,
    languageRequirements: languageRequirements.present
        ? languageRequirements.value
        : this.languageRequirements,
    fullData: fullData ?? this.fullData,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Scholarship copyWithCompanion(ScholarshipsCompanion data) {
    return Scholarship(
      id: data.id.present ? data.id.value : this.id,
      jsonId: data.jsonId.present ? data.jsonId.value : this.jsonId,
      title: data.title.present ? data.title.value : this.title,
      provider: data.provider.present ? data.provider.value : this.provider,
      providerCountry: data.providerCountry.present
          ? data.providerCountry.value
          : this.providerCountry,
      applicationDeadline: data.applicationDeadline.present
          ? data.applicationDeadline.value
          : this.applicationDeadline,
      fundingType: data.fundingType.present
          ? data.fundingType.value
          : this.fundingType,
      targetDegreeLevels: data.targetDegreeLevels.present
          ? data.targetDegreeLevels.value
          : this.targetDegreeLevels,
      subjectAreas: data.subjectAreas.present
          ? data.subjectAreas.value
          : this.subjectAreas,
      studyCountries: data.studyCountries.present
          ? data.studyCountries.value
          : this.studyCountries,
      minGpa: data.minGpa.present ? data.minGpa.value : this.minGpa,
      languageRequirements: data.languageRequirements.present
          ? data.languageRequirements.value
          : this.languageRequirements,
      fullData: data.fullData.present ? data.fullData.value : this.fullData,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Scholarship(')
          ..write('id: $id, ')
          ..write('jsonId: $jsonId, ')
          ..write('title: $title, ')
          ..write('provider: $provider, ')
          ..write('providerCountry: $providerCountry, ')
          ..write('applicationDeadline: $applicationDeadline, ')
          ..write('fundingType: $fundingType, ')
          ..write('targetDegreeLevels: $targetDegreeLevels, ')
          ..write('subjectAreas: $subjectAreas, ')
          ..write('studyCountries: $studyCountries, ')
          ..write('minGpa: $minGpa, ')
          ..write('languageRequirements: $languageRequirements, ')
          ..write('fullData: $fullData, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    jsonId,
    title,
    provider,
    providerCountry,
    applicationDeadline,
    fundingType,
    targetDegreeLevels,
    subjectAreas,
    studyCountries,
    minGpa,
    languageRequirements,
    fullData,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Scholarship &&
          other.id == this.id &&
          other.jsonId == this.jsonId &&
          other.title == this.title &&
          other.provider == this.provider &&
          other.providerCountry == this.providerCountry &&
          other.applicationDeadline == this.applicationDeadline &&
          other.fundingType == this.fundingType &&
          other.targetDegreeLevels == this.targetDegreeLevels &&
          other.subjectAreas == this.subjectAreas &&
          other.studyCountries == this.studyCountries &&
          other.minGpa == this.minGpa &&
          other.languageRequirements == this.languageRequirements &&
          other.fullData == this.fullData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ScholarshipsCompanion extends UpdateCompanion<Scholarship> {
  final Value<int> id;
  final Value<String> jsonId;
  final Value<String> title;
  final Value<String> provider;
  final Value<String> providerCountry;
  final Value<DateTime> applicationDeadline;
  final Value<String> fundingType;
  final Value<String> targetDegreeLevels;
  final Value<String?> subjectAreas;
  final Value<String?> studyCountries;
  final Value<double?> minGpa;
  final Value<String?> languageRequirements;
  final Value<String> fullData;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ScholarshipsCompanion({
    this.id = const Value.absent(),
    this.jsonId = const Value.absent(),
    this.title = const Value.absent(),
    this.provider = const Value.absent(),
    this.providerCountry = const Value.absent(),
    this.applicationDeadline = const Value.absent(),
    this.fundingType = const Value.absent(),
    this.targetDegreeLevels = const Value.absent(),
    this.subjectAreas = const Value.absent(),
    this.studyCountries = const Value.absent(),
    this.minGpa = const Value.absent(),
    this.languageRequirements = const Value.absent(),
    this.fullData = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ScholarshipsCompanion.insert({
    this.id = const Value.absent(),
    required String jsonId,
    required String title,
    required String provider,
    required String providerCountry,
    required DateTime applicationDeadline,
    required String fundingType,
    required String targetDegreeLevels,
    this.subjectAreas = const Value.absent(),
    this.studyCountries = const Value.absent(),
    this.minGpa = const Value.absent(),
    this.languageRequirements = const Value.absent(),
    required String fullData,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : jsonId = Value(jsonId),
       title = Value(title),
       provider = Value(provider),
       providerCountry = Value(providerCountry),
       applicationDeadline = Value(applicationDeadline),
       fundingType = Value(fundingType),
       targetDegreeLevels = Value(targetDegreeLevels),
       fullData = Value(fullData);
  static Insertable<Scholarship> custom({
    Expression<int>? id,
    Expression<String>? jsonId,
    Expression<String>? title,
    Expression<String>? provider,
    Expression<String>? providerCountry,
    Expression<DateTime>? applicationDeadline,
    Expression<String>? fundingType,
    Expression<String>? targetDegreeLevels,
    Expression<String>? subjectAreas,
    Expression<String>? studyCountries,
    Expression<double>? minGpa,
    Expression<String>? languageRequirements,
    Expression<String>? fullData,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jsonId != null) 'json_id': jsonId,
      if (title != null) 'title': title,
      if (provider != null) 'provider': provider,
      if (providerCountry != null) 'provider_country': providerCountry,
      if (applicationDeadline != null)
        'application_deadline': applicationDeadline,
      if (fundingType != null) 'funding_type': fundingType,
      if (targetDegreeLevels != null)
        'target_degree_levels': targetDegreeLevels,
      if (subjectAreas != null) 'subject_areas': subjectAreas,
      if (studyCountries != null) 'study_countries': studyCountries,
      if (minGpa != null) 'min_gpa': minGpa,
      if (languageRequirements != null)
        'language_requirements': languageRequirements,
      if (fullData != null) 'full_data': fullData,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ScholarshipsCompanion copyWith({
    Value<int>? id,
    Value<String>? jsonId,
    Value<String>? title,
    Value<String>? provider,
    Value<String>? providerCountry,
    Value<DateTime>? applicationDeadline,
    Value<String>? fundingType,
    Value<String>? targetDegreeLevels,
    Value<String?>? subjectAreas,
    Value<String?>? studyCountries,
    Value<double?>? minGpa,
    Value<String?>? languageRequirements,
    Value<String>? fullData,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ScholarshipsCompanion(
      id: id ?? this.id,
      jsonId: jsonId ?? this.jsonId,
      title: title ?? this.title,
      provider: provider ?? this.provider,
      providerCountry: providerCountry ?? this.providerCountry,
      applicationDeadline: applicationDeadline ?? this.applicationDeadline,
      fundingType: fundingType ?? this.fundingType,
      targetDegreeLevels: targetDegreeLevels ?? this.targetDegreeLevels,
      subjectAreas: subjectAreas ?? this.subjectAreas,
      studyCountries: studyCountries ?? this.studyCountries,
      minGpa: minGpa ?? this.minGpa,
      languageRequirements: languageRequirements ?? this.languageRequirements,
      fullData: fullData ?? this.fullData,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jsonId.present) {
      map['json_id'] = Variable<String>(jsonId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (providerCountry.present) {
      map['provider_country'] = Variable<String>(providerCountry.value);
    }
    if (applicationDeadline.present) {
      map['application_deadline'] = Variable<DateTime>(
        applicationDeadline.value,
      );
    }
    if (fundingType.present) {
      map['funding_type'] = Variable<String>(fundingType.value);
    }
    if (targetDegreeLevels.present) {
      map['target_degree_levels'] = Variable<String>(targetDegreeLevels.value);
    }
    if (subjectAreas.present) {
      map['subject_areas'] = Variable<String>(subjectAreas.value);
    }
    if (studyCountries.present) {
      map['study_countries'] = Variable<String>(studyCountries.value);
    }
    if (minGpa.present) {
      map['min_gpa'] = Variable<double>(minGpa.value);
    }
    if (languageRequirements.present) {
      map['language_requirements'] = Variable<String>(
        languageRequirements.value,
      );
    }
    if (fullData.present) {
      map['full_data'] = Variable<String>(fullData.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScholarshipsCompanion(')
          ..write('id: $id, ')
          ..write('jsonId: $jsonId, ')
          ..write('title: $title, ')
          ..write('provider: $provider, ')
          ..write('providerCountry: $providerCountry, ')
          ..write('applicationDeadline: $applicationDeadline, ')
          ..write('fundingType: $fundingType, ')
          ..write('targetDegreeLevels: $targetDegreeLevels, ')
          ..write('subjectAreas: $subjectAreas, ')
          ..write('studyCountries: $studyCountries, ')
          ..write('minGpa: $minGpa, ')
          ..write('languageRequirements: $languageRequirements, ')
          ..write('fullData: $fullData, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserSavedScholarshipsTable extends UserSavedScholarships
    with TableInfo<$UserSavedScholarshipsTable, UserSavedScholarship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSavedScholarshipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _scholarshipIdMeta = const VerificationMeta(
    'scholarshipId',
  );
  @override
  late final GeneratedColumn<int> scholarshipId = GeneratedColumn<int>(
    'scholarship_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES scholarships (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _savedAtMeta = const VerificationMeta(
    'savedAt',
  );
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
    'saved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [userId, scholarshipId, savedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_saved_scholarships';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSavedScholarship> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('scholarship_id')) {
      context.handle(
        _scholarshipIdMeta,
        scholarshipId.isAcceptableOrUnknown(
          data['scholarship_id']!,
          _scholarshipIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scholarshipIdMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(
        _savedAtMeta,
        savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, scholarshipId};
  @override
  UserSavedScholarship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSavedScholarship(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      scholarshipId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scholarship_id'],
      )!,
      savedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saved_at'],
      )!,
    );
  }

  @override
  $UserSavedScholarshipsTable createAlias(String alias) {
    return $UserSavedScholarshipsTable(attachedDatabase, alias);
  }
}

class UserSavedScholarship extends DataClass
    implements Insertable<UserSavedScholarship> {
  /// Reference to the user who saved the scholarship
  final int userId;

  /// Reference to the saved scholarship
  final int scholarshipId;

  /// When the user saved this scholarship
  final DateTime savedAt;
  const UserSavedScholarship({
    required this.userId,
    required this.scholarshipId,
    required this.savedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['scholarship_id'] = Variable<int>(scholarshipId);
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  UserSavedScholarshipsCompanion toCompanion(bool nullToAbsent) {
    return UserSavedScholarshipsCompanion(
      userId: Value(userId),
      scholarshipId: Value(scholarshipId),
      savedAt: Value(savedAt),
    );
  }

  factory UserSavedScholarship.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSavedScholarship(
      userId: serializer.fromJson<int>(json['userId']),
      scholarshipId: serializer.fromJson<int>(json['scholarshipId']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'scholarshipId': serializer.toJson<int>(scholarshipId),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  UserSavedScholarship copyWith({
    int? userId,
    int? scholarshipId,
    DateTime? savedAt,
  }) => UserSavedScholarship(
    userId: userId ?? this.userId,
    scholarshipId: scholarshipId ?? this.scholarshipId,
    savedAt: savedAt ?? this.savedAt,
  );
  UserSavedScholarship copyWithCompanion(UserSavedScholarshipsCompanion data) {
    return UserSavedScholarship(
      userId: data.userId.present ? data.userId.value : this.userId,
      scholarshipId: data.scholarshipId.present
          ? data.scholarshipId.value
          : this.scholarshipId,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSavedScholarship(')
          ..write('userId: $userId, ')
          ..write('scholarshipId: $scholarshipId, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, scholarshipId, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSavedScholarship &&
          other.userId == this.userId &&
          other.scholarshipId == this.scholarshipId &&
          other.savedAt == this.savedAt);
}

class UserSavedScholarshipsCompanion
    extends UpdateCompanion<UserSavedScholarship> {
  final Value<int> userId;
  final Value<int> scholarshipId;
  final Value<DateTime> savedAt;
  final Value<int> rowid;
  const UserSavedScholarshipsCompanion({
    this.userId = const Value.absent(),
    this.scholarshipId = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserSavedScholarshipsCompanion.insert({
    required int userId,
    required int scholarshipId,
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       scholarshipId = Value(scholarshipId);
  static Insertable<UserSavedScholarship> custom({
    Expression<int>? userId,
    Expression<int>? scholarshipId,
    Expression<DateTime>? savedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (scholarshipId != null) 'scholarship_id': scholarshipId,
      if (savedAt != null) 'saved_at': savedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserSavedScholarshipsCompanion copyWith({
    Value<int>? userId,
    Value<int>? scholarshipId,
    Value<DateTime>? savedAt,
    Value<int>? rowid,
  }) {
    return UserSavedScholarshipsCompanion(
      userId: userId ?? this.userId,
      scholarshipId: scholarshipId ?? this.scholarshipId,
      savedAt: savedAt ?? this.savedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (scholarshipId.present) {
      map['scholarship_id'] = Variable<int>(scholarshipId.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSavedScholarshipsCompanion(')
          ..write('userId: $userId, ')
          ..write('scholarshipId: $scholarshipId, ')
          ..write('savedAt: $savedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TestScoresTable testScores = $TestScoresTable(this);
  late final $ScholarshipsTable scholarships = $ScholarshipsTable(this);
  late final $UserSavedScholarshipsTable userSavedScholarships =
      $UserSavedScholarshipsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    testScores,
    scholarships,
    userSavedScholarships,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('test_scores', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('user_saved_scholarships', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'scholarships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('user_saved_scholarships', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String fullName,
      required String email,
      Value<String?> phoneNumber,
      Value<DateTime?> dateOfBirth,
      Value<String?> city,
      required String currentEducationLevel,
      required String institution,
      required String majorField,
      Value<double?> currentGpa,
      Value<DateTime?> expectedGraduation,
      Value<String?> profilePhotoPath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> fullName,
      Value<String> email,
      Value<String?> phoneNumber,
      Value<DateTime?> dateOfBirth,
      Value<String?> city,
      Value<String> currentEducationLevel,
      Value<String> institution,
      Value<String> majorField,
      Value<double?> currentGpa,
      Value<DateTime?> expectedGraduation,
      Value<String?> profilePhotoPath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TestScoresTable, List<TestScore>>
  _testScoresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testScores,
    aliasName: $_aliasNameGenerator(db.users.id, db.testScores.userId),
  );

  $$TestScoresTableProcessedTableManager get testScoresRefs {
    final manager = $$TestScoresTableTableManager(
      $_db,
      $_db.testScores,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_testScoresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $UserSavedScholarshipsTable,
    List<UserSavedScholarship>
  >
  _userSavedScholarshipsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userSavedScholarships,
        aliasName: $_aliasNameGenerator(
          db.users.id,
          db.userSavedScholarships.userId,
        ),
      );

  $$UserSavedScholarshipsTableProcessedTableManager
  get userSavedScholarshipsRefs {
    final manager = $$UserSavedScholarshipsTableTableManager(
      $_db,
      $_db.userSavedScholarships,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userSavedScholarshipsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
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

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentEducationLevel => $composableBuilder(
    column: $table.currentEducationLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get institution => $composableBuilder(
    column: $table.institution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get majorField => $composableBuilder(
    column: $table.majorField,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentGpa => $composableBuilder(
    column: $table.currentGpa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expectedGraduation => $composableBuilder(
    column: $table.expectedGraduation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> testScoresRefs(
    Expression<bool> Function($$TestScoresTableFilterComposer f) f,
  ) {
    final $$TestScoresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testScores,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestScoresTableFilterComposer(
            $db: $db,
            $table: $db.testScores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userSavedScholarshipsRefs(
    Expression<bool> Function($$UserSavedScholarshipsTableFilterComposer f) f,
  ) {
    final $$UserSavedScholarshipsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userSavedScholarships,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserSavedScholarshipsTableFilterComposer(
                $db: $db,
                $table: $db.userSavedScholarships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
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

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentEducationLevel => $composableBuilder(
    column: $table.currentEducationLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get institution => $composableBuilder(
    column: $table.institution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get majorField => $composableBuilder(
    column: $table.majorField,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentGpa => $composableBuilder(
    column: $table.currentGpa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expectedGraduation => $composableBuilder(
    column: $table.expectedGraduation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get currentEducationLevel => $composableBuilder(
    column: $table.currentEducationLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get institution => $composableBuilder(
    column: $table.institution,
    builder: (column) => column,
  );

  GeneratedColumn<String> get majorField => $composableBuilder(
    column: $table.majorField,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentGpa => $composableBuilder(
    column: $table.currentGpa,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expectedGraduation => $composableBuilder(
    column: $table.expectedGraduation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> testScoresRefs<T extends Object>(
    Expression<T> Function($$TestScoresTableAnnotationComposer a) f,
  ) {
    final $$TestScoresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testScores,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestScoresTableAnnotationComposer(
            $db: $db,
            $table: $db.testScores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userSavedScholarshipsRefs<T extends Object>(
    Expression<T> Function($$UserSavedScholarshipsTableAnnotationComposer a) f,
  ) {
    final $$UserSavedScholarshipsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userSavedScholarships,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserSavedScholarshipsTableAnnotationComposer(
                $db: $db,
                $table: $db.userSavedScholarships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool testScoresRefs,
            bool userSavedScholarshipsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String> currentEducationLevel = const Value.absent(),
                Value<String> institution = const Value.absent(),
                Value<String> majorField = const Value.absent(),
                Value<double?> currentGpa = const Value.absent(),
                Value<DateTime?> expectedGraduation = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                fullName: fullName,
                email: email,
                phoneNumber: phoneNumber,
                dateOfBirth: dateOfBirth,
                city: city,
                currentEducationLevel: currentEducationLevel,
                institution: institution,
                majorField: majorField,
                currentGpa: currentGpa,
                expectedGraduation: expectedGraduation,
                profilePhotoPath: profilePhotoPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fullName,
                required String email,
                Value<String?> phoneNumber = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> city = const Value.absent(),
                required String currentEducationLevel,
                required String institution,
                required String majorField,
                Value<double?> currentGpa = const Value.absent(),
                Value<DateTime?> expectedGraduation = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                fullName: fullName,
                email: email,
                phoneNumber: phoneNumber,
                dateOfBirth: dateOfBirth,
                city: city,
                currentEducationLevel: currentEducationLevel,
                institution: institution,
                majorField: majorField,
                currentGpa: currentGpa,
                expectedGraduation: expectedGraduation,
                profilePhotoPath: profilePhotoPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({testScoresRefs = false, userSavedScholarshipsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (testScoresRefs) db.testScores,
                    if (userSavedScholarshipsRefs) db.userSavedScholarships,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (testScoresRefs)
                        await $_getPrefetchedData<User, $UsersTable, TestScore>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._testScoresRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).testScoresRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userSavedScholarshipsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          UserSavedScholarship
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userSavedScholarshipsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userSavedScholarshipsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
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

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool testScoresRefs,
        bool userSavedScholarshipsRefs,
      })
    >;
typedef $$TestScoresTableCreateCompanionBuilder =
    TestScoresCompanion Function({
      Value<int> id,
      required int userId,
      required String testType,
      required double overallScore,
      required DateTime testDate,
      Value<String?> detailedScores,
      Value<String?> certificateUrl,
      Value<DateTime> createdAt,
    });
typedef $$TestScoresTableUpdateCompanionBuilder =
    TestScoresCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> testType,
      Value<double> overallScore,
      Value<DateTime> testDate,
      Value<String?> detailedScores,
      Value<String?> certificateUrl,
      Value<DateTime> createdAt,
    });

final class $$TestScoresTableReferences
    extends BaseReferences<_$AppDatabase, $TestScoresTable, TestScore> {
  $$TestScoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.testScores.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TestScoresTableFilterComposer
    extends Composer<_$AppDatabase, $TestScoresTable> {
  $$TestScoresTableFilterComposer({
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

  ColumnFilters<String> get testType => $composableBuilder(
    column: $table.testType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get overallScore => $composableBuilder(
    column: $table.overallScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detailedScores => $composableBuilder(
    column: $table.detailedScores,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get certificateUrl => $composableBuilder(
    column: $table.certificateUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $TestScoresTable> {
  $$TestScoresTableOrderingComposer({
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

  ColumnOrderings<String> get testType => $composableBuilder(
    column: $table.testType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get overallScore => $composableBuilder(
    column: $table.overallScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detailedScores => $composableBuilder(
    column: $table.detailedScores,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get certificateUrl => $composableBuilder(
    column: $table.certificateUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestScoresTable> {
  $$TestScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get testType =>
      $composableBuilder(column: $table.testType, builder: (column) => column);

  GeneratedColumn<double> get overallScore => $composableBuilder(
    column: $table.overallScore,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get testDate =>
      $composableBuilder(column: $table.testDate, builder: (column) => column);

  GeneratedColumn<String> get detailedScores => $composableBuilder(
    column: $table.detailedScores,
    builder: (column) => column,
  );

  GeneratedColumn<String> get certificateUrl => $composableBuilder(
    column: $table.certificateUrl,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestScoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestScoresTable,
          TestScore,
          $$TestScoresTableFilterComposer,
          $$TestScoresTableOrderingComposer,
          $$TestScoresTableAnnotationComposer,
          $$TestScoresTableCreateCompanionBuilder,
          $$TestScoresTableUpdateCompanionBuilder,
          (TestScore, $$TestScoresTableReferences),
          TestScore,
          PrefetchHooks Function({bool userId})
        > {
  $$TestScoresTableTableManager(_$AppDatabase db, $TestScoresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> testType = const Value.absent(),
                Value<double> overallScore = const Value.absent(),
                Value<DateTime> testDate = const Value.absent(),
                Value<String?> detailedScores = const Value.absent(),
                Value<String?> certificateUrl = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TestScoresCompanion(
                id: id,
                userId: userId,
                testType: testType,
                overallScore: overallScore,
                testDate: testDate,
                detailedScores: detailedScores,
                certificateUrl: certificateUrl,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String testType,
                required double overallScore,
                required DateTime testDate,
                Value<String?> detailedScores = const Value.absent(),
                Value<String?> certificateUrl = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TestScoresCompanion.insert(
                id: id,
                userId: userId,
                testType: testType,
                overallScore: overallScore,
                testDate: testDate,
                detailedScores: detailedScores,
                certificateUrl: certificateUrl,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TestScoresTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
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
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$TestScoresTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$TestScoresTableReferences
                                    ._userIdTable(db)
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

typedef $$TestScoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestScoresTable,
      TestScore,
      $$TestScoresTableFilterComposer,
      $$TestScoresTableOrderingComposer,
      $$TestScoresTableAnnotationComposer,
      $$TestScoresTableCreateCompanionBuilder,
      $$TestScoresTableUpdateCompanionBuilder,
      (TestScore, $$TestScoresTableReferences),
      TestScore,
      PrefetchHooks Function({bool userId})
    >;
typedef $$ScholarshipsTableCreateCompanionBuilder =
    ScholarshipsCompanion Function({
      Value<int> id,
      required String jsonId,
      required String title,
      required String provider,
      required String providerCountry,
      required DateTime applicationDeadline,
      required String fundingType,
      required String targetDegreeLevels,
      Value<String?> subjectAreas,
      Value<String?> studyCountries,
      Value<double?> minGpa,
      Value<String?> languageRequirements,
      required String fullData,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ScholarshipsTableUpdateCompanionBuilder =
    ScholarshipsCompanion Function({
      Value<int> id,
      Value<String> jsonId,
      Value<String> title,
      Value<String> provider,
      Value<String> providerCountry,
      Value<DateTime> applicationDeadline,
      Value<String> fundingType,
      Value<String> targetDegreeLevels,
      Value<String?> subjectAreas,
      Value<String?> studyCountries,
      Value<double?> minGpa,
      Value<String?> languageRequirements,
      Value<String> fullData,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ScholarshipsTableReferences
    extends BaseReferences<_$AppDatabase, $ScholarshipsTable, Scholarship> {
  $$ScholarshipsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $UserSavedScholarshipsTable,
    List<UserSavedScholarship>
  >
  _userSavedScholarshipsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userSavedScholarships,
        aliasName: $_aliasNameGenerator(
          db.scholarships.id,
          db.userSavedScholarships.scholarshipId,
        ),
      );

  $$UserSavedScholarshipsTableProcessedTableManager
  get userSavedScholarshipsRefs {
    final manager = $$UserSavedScholarshipsTableTableManager(
      $_db,
      $_db.userSavedScholarships,
    ).filter((f) => f.scholarshipId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userSavedScholarshipsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ScholarshipsTableFilterComposer
    extends Composer<_$AppDatabase, $ScholarshipsTable> {
  $$ScholarshipsTableFilterComposer({
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

  ColumnFilters<String> get jsonId => $composableBuilder(
    column: $table.jsonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerCountry => $composableBuilder(
    column: $table.providerCountry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get applicationDeadline => $composableBuilder(
    column: $table.applicationDeadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fundingType => $composableBuilder(
    column: $table.fundingType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetDegreeLevels => $composableBuilder(
    column: $table.targetDegreeLevels,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectAreas => $composableBuilder(
    column: $table.subjectAreas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studyCountries => $composableBuilder(
    column: $table.studyCountries,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minGpa => $composableBuilder(
    column: $table.minGpa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageRequirements => $composableBuilder(
    column: $table.languageRequirements,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullData => $composableBuilder(
    column: $table.fullData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userSavedScholarshipsRefs(
    Expression<bool> Function($$UserSavedScholarshipsTableFilterComposer f) f,
  ) {
    final $$UserSavedScholarshipsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userSavedScholarships,
          getReferencedColumn: (t) => t.scholarshipId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserSavedScholarshipsTableFilterComposer(
                $db: $db,
                $table: $db.userSavedScholarships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ScholarshipsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScholarshipsTable> {
  $$ScholarshipsTableOrderingComposer({
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

  ColumnOrderings<String> get jsonId => $composableBuilder(
    column: $table.jsonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerCountry => $composableBuilder(
    column: $table.providerCountry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get applicationDeadline => $composableBuilder(
    column: $table.applicationDeadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fundingType => $composableBuilder(
    column: $table.fundingType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetDegreeLevels => $composableBuilder(
    column: $table.targetDegreeLevels,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectAreas => $composableBuilder(
    column: $table.subjectAreas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studyCountries => $composableBuilder(
    column: $table.studyCountries,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minGpa => $composableBuilder(
    column: $table.minGpa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageRequirements => $composableBuilder(
    column: $table.languageRequirements,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullData => $composableBuilder(
    column: $table.fullData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScholarshipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScholarshipsTable> {
  $$ScholarshipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get jsonId =>
      $composableBuilder(column: $table.jsonId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get providerCountry => $composableBuilder(
    column: $table.providerCountry,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get applicationDeadline => $composableBuilder(
    column: $table.applicationDeadline,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fundingType => $composableBuilder(
    column: $table.fundingType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetDegreeLevels => $composableBuilder(
    column: $table.targetDegreeLevels,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subjectAreas => $composableBuilder(
    column: $table.subjectAreas,
    builder: (column) => column,
  );

  GeneratedColumn<String> get studyCountries => $composableBuilder(
    column: $table.studyCountries,
    builder: (column) => column,
  );

  GeneratedColumn<double> get minGpa =>
      $composableBuilder(column: $table.minGpa, builder: (column) => column);

  GeneratedColumn<String> get languageRequirements => $composableBuilder(
    column: $table.languageRequirements,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullData =>
      $composableBuilder(column: $table.fullData, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> userSavedScholarshipsRefs<T extends Object>(
    Expression<T> Function($$UserSavedScholarshipsTableAnnotationComposer a) f,
  ) {
    final $$UserSavedScholarshipsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userSavedScholarships,
          getReferencedColumn: (t) => t.scholarshipId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserSavedScholarshipsTableAnnotationComposer(
                $db: $db,
                $table: $db.userSavedScholarships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ScholarshipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScholarshipsTable,
          Scholarship,
          $$ScholarshipsTableFilterComposer,
          $$ScholarshipsTableOrderingComposer,
          $$ScholarshipsTableAnnotationComposer,
          $$ScholarshipsTableCreateCompanionBuilder,
          $$ScholarshipsTableUpdateCompanionBuilder,
          (Scholarship, $$ScholarshipsTableReferences),
          Scholarship,
          PrefetchHooks Function({bool userSavedScholarshipsRefs})
        > {
  $$ScholarshipsTableTableManager(_$AppDatabase db, $ScholarshipsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScholarshipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScholarshipsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScholarshipsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> jsonId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> provider = const Value.absent(),
                Value<String> providerCountry = const Value.absent(),
                Value<DateTime> applicationDeadline = const Value.absent(),
                Value<String> fundingType = const Value.absent(),
                Value<String> targetDegreeLevels = const Value.absent(),
                Value<String?> subjectAreas = const Value.absent(),
                Value<String?> studyCountries = const Value.absent(),
                Value<double?> minGpa = const Value.absent(),
                Value<String?> languageRequirements = const Value.absent(),
                Value<String> fullData = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ScholarshipsCompanion(
                id: id,
                jsonId: jsonId,
                title: title,
                provider: provider,
                providerCountry: providerCountry,
                applicationDeadline: applicationDeadline,
                fundingType: fundingType,
                targetDegreeLevels: targetDegreeLevels,
                subjectAreas: subjectAreas,
                studyCountries: studyCountries,
                minGpa: minGpa,
                languageRequirements: languageRequirements,
                fullData: fullData,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String jsonId,
                required String title,
                required String provider,
                required String providerCountry,
                required DateTime applicationDeadline,
                required String fundingType,
                required String targetDegreeLevels,
                Value<String?> subjectAreas = const Value.absent(),
                Value<String?> studyCountries = const Value.absent(),
                Value<double?> minGpa = const Value.absent(),
                Value<String?> languageRequirements = const Value.absent(),
                required String fullData,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ScholarshipsCompanion.insert(
                id: id,
                jsonId: jsonId,
                title: title,
                provider: provider,
                providerCountry: providerCountry,
                applicationDeadline: applicationDeadline,
                fundingType: fundingType,
                targetDegreeLevels: targetDegreeLevels,
                subjectAreas: subjectAreas,
                studyCountries: studyCountries,
                minGpa: minGpa,
                languageRequirements: languageRequirements,
                fullData: fullData,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScholarshipsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userSavedScholarshipsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userSavedScholarshipsRefs) db.userSavedScholarships,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userSavedScholarshipsRefs)
                    await $_getPrefetchedData<
                      Scholarship,
                      $ScholarshipsTable,
                      UserSavedScholarship
                    >(
                      currentTable: table,
                      referencedTable: $$ScholarshipsTableReferences
                          ._userSavedScholarshipsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ScholarshipsTableReferences(
                            db,
                            table,
                            p0,
                          ).userSavedScholarshipsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.scholarshipId == item.id,
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

typedef $$ScholarshipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScholarshipsTable,
      Scholarship,
      $$ScholarshipsTableFilterComposer,
      $$ScholarshipsTableOrderingComposer,
      $$ScholarshipsTableAnnotationComposer,
      $$ScholarshipsTableCreateCompanionBuilder,
      $$ScholarshipsTableUpdateCompanionBuilder,
      (Scholarship, $$ScholarshipsTableReferences),
      Scholarship,
      PrefetchHooks Function({bool userSavedScholarshipsRefs})
    >;
typedef $$UserSavedScholarshipsTableCreateCompanionBuilder =
    UserSavedScholarshipsCompanion Function({
      required int userId,
      required int scholarshipId,
      Value<DateTime> savedAt,
      Value<int> rowid,
    });
typedef $$UserSavedScholarshipsTableUpdateCompanionBuilder =
    UserSavedScholarshipsCompanion Function({
      Value<int> userId,
      Value<int> scholarshipId,
      Value<DateTime> savedAt,
      Value<int> rowid,
    });

final class $$UserSavedScholarshipsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserSavedScholarshipsTable,
          UserSavedScholarship
        > {
  $$UserSavedScholarshipsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.userSavedScholarships.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ScholarshipsTable _scholarshipIdTable(_$AppDatabase db) =>
      db.scholarships.createAlias(
        $_aliasNameGenerator(
          db.userSavedScholarships.scholarshipId,
          db.scholarships.id,
        ),
      );

  $$ScholarshipsTableProcessedTableManager get scholarshipId {
    final $_column = $_itemColumn<int>('scholarship_id')!;

    final manager = $$ScholarshipsTableTableManager(
      $_db,
      $_db.scholarships,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scholarshipIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserSavedScholarshipsTableFilterComposer
    extends Composer<_$AppDatabase, $UserSavedScholarshipsTable> {
  $$UserSavedScholarshipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScholarshipsTableFilterComposer get scholarshipId {
    final $$ScholarshipsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scholarshipId,
      referencedTable: $db.scholarships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScholarshipsTableFilterComposer(
            $db: $db,
            $table: $db.scholarships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserSavedScholarshipsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSavedScholarshipsTable> {
  $$UserSavedScholarshipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScholarshipsTableOrderingComposer get scholarshipId {
    final $$ScholarshipsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scholarshipId,
      referencedTable: $db.scholarships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScholarshipsTableOrderingComposer(
            $db: $db,
            $table: $db.scholarships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserSavedScholarshipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSavedScholarshipsTable> {
  $$UserSavedScholarshipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScholarshipsTableAnnotationComposer get scholarshipId {
    final $$ScholarshipsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scholarshipId,
      referencedTable: $db.scholarships,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScholarshipsTableAnnotationComposer(
            $db: $db,
            $table: $db.scholarships,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserSavedScholarshipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserSavedScholarshipsTable,
          UserSavedScholarship,
          $$UserSavedScholarshipsTableFilterComposer,
          $$UserSavedScholarshipsTableOrderingComposer,
          $$UserSavedScholarshipsTableAnnotationComposer,
          $$UserSavedScholarshipsTableCreateCompanionBuilder,
          $$UserSavedScholarshipsTableUpdateCompanionBuilder,
          (UserSavedScholarship, $$UserSavedScholarshipsTableReferences),
          UserSavedScholarship,
          PrefetchHooks Function({bool userId, bool scholarshipId})
        > {
  $$UserSavedScholarshipsTableTableManager(
    _$AppDatabase db,
    $UserSavedScholarshipsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSavedScholarshipsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$UserSavedScholarshipsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UserSavedScholarshipsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<int> scholarshipId = const Value.absent(),
                Value<DateTime> savedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserSavedScholarshipsCompanion(
                userId: userId,
                scholarshipId: scholarshipId,
                savedAt: savedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int userId,
                required int scholarshipId,
                Value<DateTime> savedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserSavedScholarshipsCompanion.insert(
                userId: userId,
                scholarshipId: scholarshipId,
                savedAt: savedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserSavedScholarshipsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, scholarshipId = false}) {
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
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$UserSavedScholarshipsTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$UserSavedScholarshipsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (scholarshipId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.scholarshipId,
                                referencedTable:
                                    $$UserSavedScholarshipsTableReferences
                                        ._scholarshipIdTable(db),
                                referencedColumn:
                                    $$UserSavedScholarshipsTableReferences
                                        ._scholarshipIdTable(db)
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

typedef $$UserSavedScholarshipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserSavedScholarshipsTable,
      UserSavedScholarship,
      $$UserSavedScholarshipsTableFilterComposer,
      $$UserSavedScholarshipsTableOrderingComposer,
      $$UserSavedScholarshipsTableAnnotationComposer,
      $$UserSavedScholarshipsTableCreateCompanionBuilder,
      $$UserSavedScholarshipsTableUpdateCompanionBuilder,
      (UserSavedScholarship, $$UserSavedScholarshipsTableReferences),
      UserSavedScholarship,
      PrefetchHooks Function({bool userId, bool scholarshipId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$TestScoresTableTableManager get testScores =>
      $$TestScoresTableTableManager(_db, _db.testScores);
  $$ScholarshipsTableTableManager get scholarships =>
      $$ScholarshipsTableTableManager(_db, _db.scholarships);
  $$UserSavedScholarshipsTableTableManager get userSavedScholarships =>
      $$UserSavedScholarshipsTableTableManager(_db, _db.userSavedScholarships);
}
