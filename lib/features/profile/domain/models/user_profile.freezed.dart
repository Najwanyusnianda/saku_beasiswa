// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 int get id; String get fullName; String get email; String? get phoneNumber; DateTime? get dateOfBirth; String? get city; String get currentEducationLevel; String get institution; String get majorField; double? get currentGpa; DateTime? get expectedGraduation; String? get profilePhotoPath; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.city, city) || other.city == city)&&(identical(other.currentEducationLevel, currentEducationLevel) || other.currentEducationLevel == currentEducationLevel)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.majorField, majorField) || other.majorField == majorField)&&(identical(other.currentGpa, currentGpa) || other.currentGpa == currentGpa)&&(identical(other.expectedGraduation, expectedGraduation) || other.expectedGraduation == expectedGraduation)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phoneNumber,dateOfBirth,city,currentEducationLevel,institution,majorField,currentGpa,expectedGraduation,profilePhotoPath,createdAt,updatedAt);

@override
String toString() {
  return 'UserProfile(id: $id, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, city: $city, currentEducationLevel: $currentEducationLevel, institution: $institution, majorField: $majorField, currentGpa: $currentGpa, expectedGraduation: $expectedGraduation, profilePhotoPath: $profilePhotoPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, String email, String? phoneNumber, DateTime? dateOfBirth, String? city, String currentEducationLevel, String institution, String majorField, double? currentGpa, DateTime? expectedGraduation, String? profilePhotoPath, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? city = freezed,Object? currentEducationLevel = null,Object? institution = null,Object? majorField = null,Object? currentGpa = freezed,Object? expectedGraduation = freezed,Object? profilePhotoPath = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,currentEducationLevel: null == currentEducationLevel ? _self.currentEducationLevel : currentEducationLevel // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,majorField: null == majorField ? _self.majorField : majorField // ignore: cast_nullable_to_non_nullable
as String,currentGpa: freezed == currentGpa ? _self.currentGpa : currentGpa // ignore: cast_nullable_to_non_nullable
as double?,expectedGraduation: freezed == expectedGraduation ? _self.expectedGraduation : expectedGraduation // ignore: cast_nullable_to_non_nullable
as DateTime?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.id, required this.fullName, required this.email, this.phoneNumber, this.dateOfBirth, this.city, required this.currentEducationLevel, required this.institution, required this.majorField, this.currentGpa, this.expectedGraduation, this.profilePhotoPath, required this.createdAt, required this.updatedAt});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  int id;
@override final  String fullName;
@override final  String email;
@override final  String? phoneNumber;
@override final  DateTime? dateOfBirth;
@override final  String? city;
@override final  String currentEducationLevel;
@override final  String institution;
@override final  String majorField;
@override final  double? currentGpa;
@override final  DateTime? expectedGraduation;
@override final  String? profilePhotoPath;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.city, city) || other.city == city)&&(identical(other.currentEducationLevel, currentEducationLevel) || other.currentEducationLevel == currentEducationLevel)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.majorField, majorField) || other.majorField == majorField)&&(identical(other.currentGpa, currentGpa) || other.currentGpa == currentGpa)&&(identical(other.expectedGraduation, expectedGraduation) || other.expectedGraduation == expectedGraduation)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phoneNumber,dateOfBirth,city,currentEducationLevel,institution,majorField,currentGpa,expectedGraduation,profilePhotoPath,createdAt,updatedAt);

@override
String toString() {
  return 'UserProfile(id: $id, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, city: $city, currentEducationLevel: $currentEducationLevel, institution: $institution, majorField: $majorField, currentGpa: $currentGpa, expectedGraduation: $expectedGraduation, profilePhotoPath: $profilePhotoPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, String email, String? phoneNumber, DateTime? dateOfBirth, String? city, String currentEducationLevel, String institution, String majorField, double? currentGpa, DateTime? expectedGraduation, String? profilePhotoPath, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? city = freezed,Object? currentEducationLevel = null,Object? institution = null,Object? majorField = null,Object? currentGpa = freezed,Object? expectedGraduation = freezed,Object? profilePhotoPath = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,currentEducationLevel: null == currentEducationLevel ? _self.currentEducationLevel : currentEducationLevel // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,majorField: null == majorField ? _self.majorField : majorField // ignore: cast_nullable_to_non_nullable
as String,currentGpa: freezed == currentGpa ? _self.currentGpa : currentGpa // ignore: cast_nullable_to_non_nullable
as double?,expectedGraduation: freezed == expectedGraduation ? _self.expectedGraduation : expectedGraduation // ignore: cast_nullable_to_non_nullable
as DateTime?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
