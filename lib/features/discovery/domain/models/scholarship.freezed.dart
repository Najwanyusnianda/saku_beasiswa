// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scholarship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Scholarship {

 String get id; String get title; String get provider;@JsonKey(name: 'provider_country') String get providerCountry;@JsonKey(name: 'basic_info') BasicInfo get basicInfo; Dates get dates; Requirements get requirements;@JsonKey(name: 'financial_details') FinancialDetails get financialDetails;@JsonKey(name: 'application_process') ApplicationProcess get applicationProcess; Contact get contact; List<String> get tags;@JsonKey(name: 'additional_info') AdditionalInfo? get additionalInfo;
/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScholarshipCopyWith<Scholarship> get copyWith => _$ScholarshipCopyWithImpl<Scholarship>(this as Scholarship, _$identity);

  /// Serializes this Scholarship to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scholarship&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerCountry, providerCountry) || other.providerCountry == providerCountry)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.dates, dates) || other.dates == dates)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.financialDetails, financialDetails) || other.financialDetails == financialDetails)&&(identical(other.applicationProcess, applicationProcess) || other.applicationProcess == applicationProcess)&&(identical(other.contact, contact) || other.contact == contact)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,provider,providerCountry,basicInfo,dates,requirements,financialDetails,applicationProcess,contact,const DeepCollectionEquality().hash(tags),additionalInfo);

@override
String toString() {
  return 'Scholarship(id: $id, title: $title, provider: $provider, providerCountry: $providerCountry, basicInfo: $basicInfo, dates: $dates, requirements: $requirements, financialDetails: $financialDetails, applicationProcess: $applicationProcess, contact: $contact, tags: $tags, additionalInfo: $additionalInfo)';
}


}

/// @nodoc
abstract mixin class $ScholarshipCopyWith<$Res>  {
  factory $ScholarshipCopyWith(Scholarship value, $Res Function(Scholarship) _then) = _$ScholarshipCopyWithImpl;
@useResult
$Res call({
 String id, String title, String provider,@JsonKey(name: 'provider_country') String providerCountry,@JsonKey(name: 'basic_info') BasicInfo basicInfo, Dates dates, Requirements requirements,@JsonKey(name: 'financial_details') FinancialDetails financialDetails,@JsonKey(name: 'application_process') ApplicationProcess applicationProcess, Contact contact, List<String> tags,@JsonKey(name: 'additional_info') AdditionalInfo? additionalInfo
});


$BasicInfoCopyWith<$Res> get basicInfo;$DatesCopyWith<$Res> get dates;$RequirementsCopyWith<$Res> get requirements;$FinancialDetailsCopyWith<$Res> get financialDetails;$ApplicationProcessCopyWith<$Res> get applicationProcess;$ContactCopyWith<$Res> get contact;$AdditionalInfoCopyWith<$Res>? get additionalInfo;

}
/// @nodoc
class _$ScholarshipCopyWithImpl<$Res>
    implements $ScholarshipCopyWith<$Res> {
  _$ScholarshipCopyWithImpl(this._self, this._then);

  final Scholarship _self;
  final $Res Function(Scholarship) _then;

/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? provider = null,Object? providerCountry = null,Object? basicInfo = null,Object? dates = null,Object? requirements = null,Object? financialDetails = null,Object? applicationProcess = null,Object? contact = null,Object? tags = null,Object? additionalInfo = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,providerCountry: null == providerCountry ? _self.providerCountry : providerCountry // ignore: cast_nullable_to_non_nullable
as String,basicInfo: null == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfo,dates: null == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as Dates,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as Requirements,financialDetails: null == financialDetails ? _self.financialDetails : financialDetails // ignore: cast_nullable_to_non_nullable
as FinancialDetails,applicationProcess: null == applicationProcess ? _self.applicationProcess : applicationProcess // ignore: cast_nullable_to_non_nullable
as ApplicationProcess,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as Contact,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as AdditionalInfo?,
  ));
}
/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicInfoCopyWith<$Res> get basicInfo {
  
  return $BasicInfoCopyWith<$Res>(_self.basicInfo, (value) {
    return _then(_self.copyWith(basicInfo: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatesCopyWith<$Res> get dates {
  
  return $DatesCopyWith<$Res>(_self.dates, (value) {
    return _then(_self.copyWith(dates: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequirementsCopyWith<$Res> get requirements {
  
  return $RequirementsCopyWith<$Res>(_self.requirements, (value) {
    return _then(_self.copyWith(requirements: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinancialDetailsCopyWith<$Res> get financialDetails {
  
  return $FinancialDetailsCopyWith<$Res>(_self.financialDetails, (value) {
    return _then(_self.copyWith(financialDetails: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationProcessCopyWith<$Res> get applicationProcess {
  
  return $ApplicationProcessCopyWith<$Res>(_self.applicationProcess, (value) {
    return _then(_self.copyWith(applicationProcess: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res> get contact {
  
  return $ContactCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdditionalInfoCopyWith<$Res>? get additionalInfo {
    if (_self.additionalInfo == null) {
    return null;
  }

  return $AdditionalInfoCopyWith<$Res>(_self.additionalInfo!, (value) {
    return _then(_self.copyWith(additionalInfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Scholarship implements Scholarship {
  const _Scholarship({required this.id, required this.title, required this.provider, @JsonKey(name: 'provider_country') required this.providerCountry, @JsonKey(name: 'basic_info') required this.basicInfo, required this.dates, required this.requirements, @JsonKey(name: 'financial_details') required this.financialDetails, @JsonKey(name: 'application_process') required this.applicationProcess, required this.contact, final  List<String> tags = const [], @JsonKey(name: 'additional_info') this.additionalInfo}): _tags = tags;
  factory _Scholarship.fromJson(Map<String, dynamic> json) => _$ScholarshipFromJson(json);

@override final  String id;
@override final  String title;
@override final  String provider;
@override@JsonKey(name: 'provider_country') final  String providerCountry;
@override@JsonKey(name: 'basic_info') final  BasicInfo basicInfo;
@override final  Dates dates;
@override final  Requirements requirements;
@override@JsonKey(name: 'financial_details') final  FinancialDetails financialDetails;
@override@JsonKey(name: 'application_process') final  ApplicationProcess applicationProcess;
@override final  Contact contact;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'additional_info') final  AdditionalInfo? additionalInfo;

/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScholarshipCopyWith<_Scholarship> get copyWith => __$ScholarshipCopyWithImpl<_Scholarship>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScholarshipToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scholarship&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerCountry, providerCountry) || other.providerCountry == providerCountry)&&(identical(other.basicInfo, basicInfo) || other.basicInfo == basicInfo)&&(identical(other.dates, dates) || other.dates == dates)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.financialDetails, financialDetails) || other.financialDetails == financialDetails)&&(identical(other.applicationProcess, applicationProcess) || other.applicationProcess == applicationProcess)&&(identical(other.contact, contact) || other.contact == contact)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,provider,providerCountry,basicInfo,dates,requirements,financialDetails,applicationProcess,contact,const DeepCollectionEquality().hash(_tags),additionalInfo);

@override
String toString() {
  return 'Scholarship(id: $id, title: $title, provider: $provider, providerCountry: $providerCountry, basicInfo: $basicInfo, dates: $dates, requirements: $requirements, financialDetails: $financialDetails, applicationProcess: $applicationProcess, contact: $contact, tags: $tags, additionalInfo: $additionalInfo)';
}


}

/// @nodoc
abstract mixin class _$ScholarshipCopyWith<$Res> implements $ScholarshipCopyWith<$Res> {
  factory _$ScholarshipCopyWith(_Scholarship value, $Res Function(_Scholarship) _then) = __$ScholarshipCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String provider,@JsonKey(name: 'provider_country') String providerCountry,@JsonKey(name: 'basic_info') BasicInfo basicInfo, Dates dates, Requirements requirements,@JsonKey(name: 'financial_details') FinancialDetails financialDetails,@JsonKey(name: 'application_process') ApplicationProcess applicationProcess, Contact contact, List<String> tags,@JsonKey(name: 'additional_info') AdditionalInfo? additionalInfo
});


@override $BasicInfoCopyWith<$Res> get basicInfo;@override $DatesCopyWith<$Res> get dates;@override $RequirementsCopyWith<$Res> get requirements;@override $FinancialDetailsCopyWith<$Res> get financialDetails;@override $ApplicationProcessCopyWith<$Res> get applicationProcess;@override $ContactCopyWith<$Res> get contact;@override $AdditionalInfoCopyWith<$Res>? get additionalInfo;

}
/// @nodoc
class __$ScholarshipCopyWithImpl<$Res>
    implements _$ScholarshipCopyWith<$Res> {
  __$ScholarshipCopyWithImpl(this._self, this._then);

  final _Scholarship _self;
  final $Res Function(_Scholarship) _then;

/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? provider = null,Object? providerCountry = null,Object? basicInfo = null,Object? dates = null,Object? requirements = null,Object? financialDetails = null,Object? applicationProcess = null,Object? contact = null,Object? tags = null,Object? additionalInfo = freezed,}) {
  return _then(_Scholarship(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,providerCountry: null == providerCountry ? _self.providerCountry : providerCountry // ignore: cast_nullable_to_non_nullable
as String,basicInfo: null == basicInfo ? _self.basicInfo : basicInfo // ignore: cast_nullable_to_non_nullable
as BasicInfo,dates: null == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as Dates,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as Requirements,financialDetails: null == financialDetails ? _self.financialDetails : financialDetails // ignore: cast_nullable_to_non_nullable
as FinancialDetails,applicationProcess: null == applicationProcess ? _self.applicationProcess : applicationProcess // ignore: cast_nullable_to_non_nullable
as ApplicationProcess,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as Contact,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as AdditionalInfo?,
  ));
}

/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicInfoCopyWith<$Res> get basicInfo {
  
  return $BasicInfoCopyWith<$Res>(_self.basicInfo, (value) {
    return _then(_self.copyWith(basicInfo: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatesCopyWith<$Res> get dates {
  
  return $DatesCopyWith<$Res>(_self.dates, (value) {
    return _then(_self.copyWith(dates: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequirementsCopyWith<$Res> get requirements {
  
  return $RequirementsCopyWith<$Res>(_self.requirements, (value) {
    return _then(_self.copyWith(requirements: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinancialDetailsCopyWith<$Res> get financialDetails {
  
  return $FinancialDetailsCopyWith<$Res>(_self.financialDetails, (value) {
    return _then(_self.copyWith(financialDetails: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationProcessCopyWith<$Res> get applicationProcess {
  
  return $ApplicationProcessCopyWith<$Res>(_self.applicationProcess, (value) {
    return _then(_self.copyWith(applicationProcess: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res> get contact {
  
  return $ContactCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of Scholarship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdditionalInfoCopyWith<$Res>? get additionalInfo {
    if (_self.additionalInfo == null) {
    return null;
  }

  return $AdditionalInfoCopyWith<$Res>(_self.additionalInfo!, (value) {
    return _then(_self.copyWith(additionalInfo: value));
  });
}
}


/// @nodoc
mixin _$BasicInfo {

 String get description;@JsonKey(name: 'funding_type') String get fundingType;@JsonKey(name: 'target_degree_levels') List<String> get targetDegreeLevels;@JsonKey(name: 'subject_areas') List<String>? get subjectAreas;@JsonKey(name: 'study_countries') List<String>? get studyCountries;@JsonKey(name: 'scholarship_duration') String? get scholarshipDuration;@JsonKey(name: 'number_of_awards') int? get numberOfAwards;
/// Create a copy of BasicInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicInfoCopyWith<BasicInfo> get copyWith => _$BasicInfoCopyWithImpl<BasicInfo>(this as BasicInfo, _$identity);

  /// Serializes this BasicInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicInfo&&(identical(other.description, description) || other.description == description)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&const DeepCollectionEquality().equals(other.targetDegreeLevels, targetDegreeLevels)&&const DeepCollectionEquality().equals(other.subjectAreas, subjectAreas)&&const DeepCollectionEquality().equals(other.studyCountries, studyCountries)&&(identical(other.scholarshipDuration, scholarshipDuration) || other.scholarshipDuration == scholarshipDuration)&&(identical(other.numberOfAwards, numberOfAwards) || other.numberOfAwards == numberOfAwards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,fundingType,const DeepCollectionEquality().hash(targetDegreeLevels),const DeepCollectionEquality().hash(subjectAreas),const DeepCollectionEquality().hash(studyCountries),scholarshipDuration,numberOfAwards);

@override
String toString() {
  return 'BasicInfo(description: $description, fundingType: $fundingType, targetDegreeLevels: $targetDegreeLevels, subjectAreas: $subjectAreas, studyCountries: $studyCountries, scholarshipDuration: $scholarshipDuration, numberOfAwards: $numberOfAwards)';
}


}

/// @nodoc
abstract mixin class $BasicInfoCopyWith<$Res>  {
  factory $BasicInfoCopyWith(BasicInfo value, $Res Function(BasicInfo) _then) = _$BasicInfoCopyWithImpl;
@useResult
$Res call({
 String description,@JsonKey(name: 'funding_type') String fundingType,@JsonKey(name: 'target_degree_levels') List<String> targetDegreeLevels,@JsonKey(name: 'subject_areas') List<String>? subjectAreas,@JsonKey(name: 'study_countries') List<String>? studyCountries,@JsonKey(name: 'scholarship_duration') String? scholarshipDuration,@JsonKey(name: 'number_of_awards') int? numberOfAwards
});




}
/// @nodoc
class _$BasicInfoCopyWithImpl<$Res>
    implements $BasicInfoCopyWith<$Res> {
  _$BasicInfoCopyWithImpl(this._self, this._then);

  final BasicInfo _self;
  final $Res Function(BasicInfo) _then;

/// Create a copy of BasicInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? fundingType = null,Object? targetDegreeLevels = null,Object? subjectAreas = freezed,Object? studyCountries = freezed,Object? scholarshipDuration = freezed,Object? numberOfAwards = freezed,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fundingType: null == fundingType ? _self.fundingType : fundingType // ignore: cast_nullable_to_non_nullable
as String,targetDegreeLevels: null == targetDegreeLevels ? _self.targetDegreeLevels : targetDegreeLevels // ignore: cast_nullable_to_non_nullable
as List<String>,subjectAreas: freezed == subjectAreas ? _self.subjectAreas : subjectAreas // ignore: cast_nullable_to_non_nullable
as List<String>?,studyCountries: freezed == studyCountries ? _self.studyCountries : studyCountries // ignore: cast_nullable_to_non_nullable
as List<String>?,scholarshipDuration: freezed == scholarshipDuration ? _self.scholarshipDuration : scholarshipDuration // ignore: cast_nullable_to_non_nullable
as String?,numberOfAwards: freezed == numberOfAwards ? _self.numberOfAwards : numberOfAwards // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BasicInfo implements BasicInfo {
  const _BasicInfo({required this.description, @JsonKey(name: 'funding_type') required this.fundingType, @JsonKey(name: 'target_degree_levels') required final  List<String> targetDegreeLevels, @JsonKey(name: 'subject_areas') final  List<String>? subjectAreas, @JsonKey(name: 'study_countries') final  List<String>? studyCountries, @JsonKey(name: 'scholarship_duration') this.scholarshipDuration, @JsonKey(name: 'number_of_awards') this.numberOfAwards}): _targetDegreeLevels = targetDegreeLevels,_subjectAreas = subjectAreas,_studyCountries = studyCountries;
  factory _BasicInfo.fromJson(Map<String, dynamic> json) => _$BasicInfoFromJson(json);

@override final  String description;
@override@JsonKey(name: 'funding_type') final  String fundingType;
 final  List<String> _targetDegreeLevels;
@override@JsonKey(name: 'target_degree_levels') List<String> get targetDegreeLevels {
  if (_targetDegreeLevels is EqualUnmodifiableListView) return _targetDegreeLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetDegreeLevels);
}

 final  List<String>? _subjectAreas;
@override@JsonKey(name: 'subject_areas') List<String>? get subjectAreas {
  final value = _subjectAreas;
  if (value == null) return null;
  if (_subjectAreas is EqualUnmodifiableListView) return _subjectAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _studyCountries;
@override@JsonKey(name: 'study_countries') List<String>? get studyCountries {
  final value = _studyCountries;
  if (value == null) return null;
  if (_studyCountries is EqualUnmodifiableListView) return _studyCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'scholarship_duration') final  String? scholarshipDuration;
@override@JsonKey(name: 'number_of_awards') final  int? numberOfAwards;

/// Create a copy of BasicInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicInfoCopyWith<_BasicInfo> get copyWith => __$BasicInfoCopyWithImpl<_BasicInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicInfo&&(identical(other.description, description) || other.description == description)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&const DeepCollectionEquality().equals(other._targetDegreeLevels, _targetDegreeLevels)&&const DeepCollectionEquality().equals(other._subjectAreas, _subjectAreas)&&const DeepCollectionEquality().equals(other._studyCountries, _studyCountries)&&(identical(other.scholarshipDuration, scholarshipDuration) || other.scholarshipDuration == scholarshipDuration)&&(identical(other.numberOfAwards, numberOfAwards) || other.numberOfAwards == numberOfAwards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,fundingType,const DeepCollectionEquality().hash(_targetDegreeLevels),const DeepCollectionEquality().hash(_subjectAreas),const DeepCollectionEquality().hash(_studyCountries),scholarshipDuration,numberOfAwards);

@override
String toString() {
  return 'BasicInfo(description: $description, fundingType: $fundingType, targetDegreeLevels: $targetDegreeLevels, subjectAreas: $subjectAreas, studyCountries: $studyCountries, scholarshipDuration: $scholarshipDuration, numberOfAwards: $numberOfAwards)';
}


}

/// @nodoc
abstract mixin class _$BasicInfoCopyWith<$Res> implements $BasicInfoCopyWith<$Res> {
  factory _$BasicInfoCopyWith(_BasicInfo value, $Res Function(_BasicInfo) _then) = __$BasicInfoCopyWithImpl;
@override @useResult
$Res call({
 String description,@JsonKey(name: 'funding_type') String fundingType,@JsonKey(name: 'target_degree_levels') List<String> targetDegreeLevels,@JsonKey(name: 'subject_areas') List<String>? subjectAreas,@JsonKey(name: 'study_countries') List<String>? studyCountries,@JsonKey(name: 'scholarship_duration') String? scholarshipDuration,@JsonKey(name: 'number_of_awards') int? numberOfAwards
});




}
/// @nodoc
class __$BasicInfoCopyWithImpl<$Res>
    implements _$BasicInfoCopyWith<$Res> {
  __$BasicInfoCopyWithImpl(this._self, this._then);

  final _BasicInfo _self;
  final $Res Function(_BasicInfo) _then;

/// Create a copy of BasicInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? fundingType = null,Object? targetDegreeLevels = null,Object? subjectAreas = freezed,Object? studyCountries = freezed,Object? scholarshipDuration = freezed,Object? numberOfAwards = freezed,}) {
  return _then(_BasicInfo(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fundingType: null == fundingType ? _self.fundingType : fundingType // ignore: cast_nullable_to_non_nullable
as String,targetDegreeLevels: null == targetDegreeLevels ? _self._targetDegreeLevels : targetDegreeLevels // ignore: cast_nullable_to_non_nullable
as List<String>,subjectAreas: freezed == subjectAreas ? _self._subjectAreas : subjectAreas // ignore: cast_nullable_to_non_nullable
as List<String>?,studyCountries: freezed == studyCountries ? _self._studyCountries : studyCountries // ignore: cast_nullable_to_non_nullable
as List<String>?,scholarshipDuration: freezed == scholarshipDuration ? _self.scholarshipDuration : scholarshipDuration // ignore: cast_nullable_to_non_nullable
as String?,numberOfAwards: freezed == numberOfAwards ? _self.numberOfAwards : numberOfAwards // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Dates {

@JsonKey(name: 'application_deadline') String get applicationDeadline;@JsonKey(name: 'notification_date') String? get notificationDate;@JsonKey(name: 'program_start_date') String? get programStartDate;@JsonKey(name: 'program_end_date') String? get programEndDate;
/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatesCopyWith<Dates> get copyWith => _$DatesCopyWithImpl<Dates>(this as Dates, _$identity);

  /// Serializes this Dates to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dates&&(identical(other.applicationDeadline, applicationDeadline) || other.applicationDeadline == applicationDeadline)&&(identical(other.notificationDate, notificationDate) || other.notificationDate == notificationDate)&&(identical(other.programStartDate, programStartDate) || other.programStartDate == programStartDate)&&(identical(other.programEndDate, programEndDate) || other.programEndDate == programEndDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationDeadline,notificationDate,programStartDate,programEndDate);

@override
String toString() {
  return 'Dates(applicationDeadline: $applicationDeadline, notificationDate: $notificationDate, programStartDate: $programStartDate, programEndDate: $programEndDate)';
}


}

/// @nodoc
abstract mixin class $DatesCopyWith<$Res>  {
  factory $DatesCopyWith(Dates value, $Res Function(Dates) _then) = _$DatesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'application_deadline') String applicationDeadline,@JsonKey(name: 'notification_date') String? notificationDate,@JsonKey(name: 'program_start_date') String? programStartDate,@JsonKey(name: 'program_end_date') String? programEndDate
});




}
/// @nodoc
class _$DatesCopyWithImpl<$Res>
    implements $DatesCopyWith<$Res> {
  _$DatesCopyWithImpl(this._self, this._then);

  final Dates _self;
  final $Res Function(Dates) _then;

/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationDeadline = null,Object? notificationDate = freezed,Object? programStartDate = freezed,Object? programEndDate = freezed,}) {
  return _then(_self.copyWith(
applicationDeadline: null == applicationDeadline ? _self.applicationDeadline : applicationDeadline // ignore: cast_nullable_to_non_nullable
as String,notificationDate: freezed == notificationDate ? _self.notificationDate : notificationDate // ignore: cast_nullable_to_non_nullable
as String?,programStartDate: freezed == programStartDate ? _self.programStartDate : programStartDate // ignore: cast_nullable_to_non_nullable
as String?,programEndDate: freezed == programEndDate ? _self.programEndDate : programEndDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Dates implements Dates {
  const _Dates({@JsonKey(name: 'application_deadline') required this.applicationDeadline, @JsonKey(name: 'notification_date') this.notificationDate, @JsonKey(name: 'program_start_date') this.programStartDate, @JsonKey(name: 'program_end_date') this.programEndDate});
  factory _Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

@override@JsonKey(name: 'application_deadline') final  String applicationDeadline;
@override@JsonKey(name: 'notification_date') final  String? notificationDate;
@override@JsonKey(name: 'program_start_date') final  String? programStartDate;
@override@JsonKey(name: 'program_end_date') final  String? programEndDate;

/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatesCopyWith<_Dates> get copyWith => __$DatesCopyWithImpl<_Dates>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dates&&(identical(other.applicationDeadline, applicationDeadline) || other.applicationDeadline == applicationDeadline)&&(identical(other.notificationDate, notificationDate) || other.notificationDate == notificationDate)&&(identical(other.programStartDate, programStartDate) || other.programStartDate == programStartDate)&&(identical(other.programEndDate, programEndDate) || other.programEndDate == programEndDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationDeadline,notificationDate,programStartDate,programEndDate);

@override
String toString() {
  return 'Dates(applicationDeadline: $applicationDeadline, notificationDate: $notificationDate, programStartDate: $programStartDate, programEndDate: $programEndDate)';
}


}

/// @nodoc
abstract mixin class _$DatesCopyWith<$Res> implements $DatesCopyWith<$Res> {
  factory _$DatesCopyWith(_Dates value, $Res Function(_Dates) _then) = __$DatesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'application_deadline') String applicationDeadline,@JsonKey(name: 'notification_date') String? notificationDate,@JsonKey(name: 'program_start_date') String? programStartDate,@JsonKey(name: 'program_end_date') String? programEndDate
});




}
/// @nodoc
class __$DatesCopyWithImpl<$Res>
    implements _$DatesCopyWith<$Res> {
  __$DatesCopyWithImpl(this._self, this._then);

  final _Dates _self;
  final $Res Function(_Dates) _then;

/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationDeadline = null,Object? notificationDate = freezed,Object? programStartDate = freezed,Object? programEndDate = freezed,}) {
  return _then(_Dates(
applicationDeadline: null == applicationDeadline ? _self.applicationDeadline : applicationDeadline // ignore: cast_nullable_to_non_nullable
as String,notificationDate: freezed == notificationDate ? _self.notificationDate : notificationDate // ignore: cast_nullable_to_non_nullable
as String?,programStartDate: freezed == programStartDate ? _self.programStartDate : programStartDate // ignore: cast_nullable_to_non_nullable
as String?,programEndDate: freezed == programEndDate ? _self.programEndDate : programEndDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Requirements {

 Academic get academic;@JsonKey(name: 'personal_criteria') PersonalCriteria? get personalCriteria;@JsonKey(name: 'application_documents') List<String>? get applicationDocuments;@JsonKey(name: 'additional_requirements') List<String>? get additionalRequirements;
/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequirementsCopyWith<Requirements> get copyWith => _$RequirementsCopyWithImpl<Requirements>(this as Requirements, _$identity);

  /// Serializes this Requirements to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Requirements&&(identical(other.academic, academic) || other.academic == academic)&&(identical(other.personalCriteria, personalCriteria) || other.personalCriteria == personalCriteria)&&const DeepCollectionEquality().equals(other.applicationDocuments, applicationDocuments)&&const DeepCollectionEquality().equals(other.additionalRequirements, additionalRequirements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,academic,personalCriteria,const DeepCollectionEquality().hash(applicationDocuments),const DeepCollectionEquality().hash(additionalRequirements));

@override
String toString() {
  return 'Requirements(academic: $academic, personalCriteria: $personalCriteria, applicationDocuments: $applicationDocuments, additionalRequirements: $additionalRequirements)';
}


}

/// @nodoc
abstract mixin class $RequirementsCopyWith<$Res>  {
  factory $RequirementsCopyWith(Requirements value, $Res Function(Requirements) _then) = _$RequirementsCopyWithImpl;
@useResult
$Res call({
 Academic academic,@JsonKey(name: 'personal_criteria') PersonalCriteria? personalCriteria,@JsonKey(name: 'application_documents') List<String>? applicationDocuments,@JsonKey(name: 'additional_requirements') List<String>? additionalRequirements
});


$AcademicCopyWith<$Res> get academic;$PersonalCriteriaCopyWith<$Res>? get personalCriteria;

}
/// @nodoc
class _$RequirementsCopyWithImpl<$Res>
    implements $RequirementsCopyWith<$Res> {
  _$RequirementsCopyWithImpl(this._self, this._then);

  final Requirements _self;
  final $Res Function(Requirements) _then;

/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? academic = null,Object? personalCriteria = freezed,Object? applicationDocuments = freezed,Object? additionalRequirements = freezed,}) {
  return _then(_self.copyWith(
academic: null == academic ? _self.academic : academic // ignore: cast_nullable_to_non_nullable
as Academic,personalCriteria: freezed == personalCriteria ? _self.personalCriteria : personalCriteria // ignore: cast_nullable_to_non_nullable
as PersonalCriteria?,applicationDocuments: freezed == applicationDocuments ? _self.applicationDocuments : applicationDocuments // ignore: cast_nullable_to_non_nullable
as List<String>?,additionalRequirements: freezed == additionalRequirements ? _self.additionalRequirements : additionalRequirements // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AcademicCopyWith<$Res> get academic {
  
  return $AcademicCopyWith<$Res>(_self.academic, (value) {
    return _then(_self.copyWith(academic: value));
  });
}/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalCriteriaCopyWith<$Res>? get personalCriteria {
    if (_self.personalCriteria == null) {
    return null;
  }

  return $PersonalCriteriaCopyWith<$Res>(_self.personalCriteria!, (value) {
    return _then(_self.copyWith(personalCriteria: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Requirements implements Requirements {
  const _Requirements({required this.academic, @JsonKey(name: 'personal_criteria') this.personalCriteria, @JsonKey(name: 'application_documents') final  List<String>? applicationDocuments, @JsonKey(name: 'additional_requirements') final  List<String>? additionalRequirements}): _applicationDocuments = applicationDocuments,_additionalRequirements = additionalRequirements;
  factory _Requirements.fromJson(Map<String, dynamic> json) => _$RequirementsFromJson(json);

@override final  Academic academic;
@override@JsonKey(name: 'personal_criteria') final  PersonalCriteria? personalCriteria;
 final  List<String>? _applicationDocuments;
@override@JsonKey(name: 'application_documents') List<String>? get applicationDocuments {
  final value = _applicationDocuments;
  if (value == null) return null;
  if (_applicationDocuments is EqualUnmodifiableListView) return _applicationDocuments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _additionalRequirements;
@override@JsonKey(name: 'additional_requirements') List<String>? get additionalRequirements {
  final value = _additionalRequirements;
  if (value == null) return null;
  if (_additionalRequirements is EqualUnmodifiableListView) return _additionalRequirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequirementsCopyWith<_Requirements> get copyWith => __$RequirementsCopyWithImpl<_Requirements>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequirementsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Requirements&&(identical(other.academic, academic) || other.academic == academic)&&(identical(other.personalCriteria, personalCriteria) || other.personalCriteria == personalCriteria)&&const DeepCollectionEquality().equals(other._applicationDocuments, _applicationDocuments)&&const DeepCollectionEquality().equals(other._additionalRequirements, _additionalRequirements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,academic,personalCriteria,const DeepCollectionEquality().hash(_applicationDocuments),const DeepCollectionEquality().hash(_additionalRequirements));

@override
String toString() {
  return 'Requirements(academic: $academic, personalCriteria: $personalCriteria, applicationDocuments: $applicationDocuments, additionalRequirements: $additionalRequirements)';
}


}

/// @nodoc
abstract mixin class _$RequirementsCopyWith<$Res> implements $RequirementsCopyWith<$Res> {
  factory _$RequirementsCopyWith(_Requirements value, $Res Function(_Requirements) _then) = __$RequirementsCopyWithImpl;
@override @useResult
$Res call({
 Academic academic,@JsonKey(name: 'personal_criteria') PersonalCriteria? personalCriteria,@JsonKey(name: 'application_documents') List<String>? applicationDocuments,@JsonKey(name: 'additional_requirements') List<String>? additionalRequirements
});


@override $AcademicCopyWith<$Res> get academic;@override $PersonalCriteriaCopyWith<$Res>? get personalCriteria;

}
/// @nodoc
class __$RequirementsCopyWithImpl<$Res>
    implements _$RequirementsCopyWith<$Res> {
  __$RequirementsCopyWithImpl(this._self, this._then);

  final _Requirements _self;
  final $Res Function(_Requirements) _then;

/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? academic = null,Object? personalCriteria = freezed,Object? applicationDocuments = freezed,Object? additionalRequirements = freezed,}) {
  return _then(_Requirements(
academic: null == academic ? _self.academic : academic // ignore: cast_nullable_to_non_nullable
as Academic,personalCriteria: freezed == personalCriteria ? _self.personalCriteria : personalCriteria // ignore: cast_nullable_to_non_nullable
as PersonalCriteria?,applicationDocuments: freezed == applicationDocuments ? _self._applicationDocuments : applicationDocuments // ignore: cast_nullable_to_non_nullable
as List<String>?,additionalRequirements: freezed == additionalRequirements ? _self._additionalRequirements : additionalRequirements // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AcademicCopyWith<$Res> get academic {
  
  return $AcademicCopyWith<$Res>(_self.academic, (value) {
    return _then(_self.copyWith(academic: value));
  });
}/// Create a copy of Requirements
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalCriteriaCopyWith<$Res>? get personalCriteria {
    if (_self.personalCriteria == null) {
    return null;
  }

  return $PersonalCriteriaCopyWith<$Res>(_self.personalCriteria!, (value) {
    return _then(_self.copyWith(personalCriteria: value));
  });
}
}


/// @nodoc
mixin _$Academic {

@JsonKey(name: 'minimum_gpa') dynamic get minimumGpa;// Can be double or string
@JsonKey(name: 'education_level') String? get educationLevel;@JsonKey(name: 'language_requirements') Map<String, dynamic>? get languageRequirements;@JsonKey(name: 'academic_field') List<String>? get academicField;@JsonKey(name: 'institution_requirements') String? get institutionRequirements;
/// Create a copy of Academic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcademicCopyWith<Academic> get copyWith => _$AcademicCopyWithImpl<Academic>(this as Academic, _$identity);

  /// Serializes this Academic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Academic&&const DeepCollectionEquality().equals(other.minimumGpa, minimumGpa)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&const DeepCollectionEquality().equals(other.languageRequirements, languageRequirements)&&const DeepCollectionEquality().equals(other.academicField, academicField)&&(identical(other.institutionRequirements, institutionRequirements) || other.institutionRequirements == institutionRequirements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(minimumGpa),educationLevel,const DeepCollectionEquality().hash(languageRequirements),const DeepCollectionEquality().hash(academicField),institutionRequirements);

@override
String toString() {
  return 'Academic(minimumGpa: $minimumGpa, educationLevel: $educationLevel, languageRequirements: $languageRequirements, academicField: $academicField, institutionRequirements: $institutionRequirements)';
}


}

/// @nodoc
abstract mixin class $AcademicCopyWith<$Res>  {
  factory $AcademicCopyWith(Academic value, $Res Function(Academic) _then) = _$AcademicCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'minimum_gpa') dynamic minimumGpa,@JsonKey(name: 'education_level') String? educationLevel,@JsonKey(name: 'language_requirements') Map<String, dynamic>? languageRequirements,@JsonKey(name: 'academic_field') List<String>? academicField,@JsonKey(name: 'institution_requirements') String? institutionRequirements
});




}
/// @nodoc
class _$AcademicCopyWithImpl<$Res>
    implements $AcademicCopyWith<$Res> {
  _$AcademicCopyWithImpl(this._self, this._then);

  final Academic _self;
  final $Res Function(Academic) _then;

/// Create a copy of Academic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minimumGpa = freezed,Object? educationLevel = freezed,Object? languageRequirements = freezed,Object? academicField = freezed,Object? institutionRequirements = freezed,}) {
  return _then(_self.copyWith(
minimumGpa: freezed == minimumGpa ? _self.minimumGpa : minimumGpa // ignore: cast_nullable_to_non_nullable
as dynamic,educationLevel: freezed == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String?,languageRequirements: freezed == languageRequirements ? _self.languageRequirements : languageRequirements // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,academicField: freezed == academicField ? _self.academicField : academicField // ignore: cast_nullable_to_non_nullable
as List<String>?,institutionRequirements: freezed == institutionRequirements ? _self.institutionRequirements : institutionRequirements // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Academic implements Academic {
  const _Academic({@JsonKey(name: 'minimum_gpa') this.minimumGpa, @JsonKey(name: 'education_level') this.educationLevel, @JsonKey(name: 'language_requirements') final  Map<String, dynamic>? languageRequirements, @JsonKey(name: 'academic_field') final  List<String>? academicField, @JsonKey(name: 'institution_requirements') this.institutionRequirements}): _languageRequirements = languageRequirements,_academicField = academicField;
  factory _Academic.fromJson(Map<String, dynamic> json) => _$AcademicFromJson(json);

@override@JsonKey(name: 'minimum_gpa') final  dynamic minimumGpa;
// Can be double or string
@override@JsonKey(name: 'education_level') final  String? educationLevel;
 final  Map<String, dynamic>? _languageRequirements;
@override@JsonKey(name: 'language_requirements') Map<String, dynamic>? get languageRequirements {
  final value = _languageRequirements;
  if (value == null) return null;
  if (_languageRequirements is EqualUnmodifiableMapView) return _languageRequirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String>? _academicField;
@override@JsonKey(name: 'academic_field') List<String>? get academicField {
  final value = _academicField;
  if (value == null) return null;
  if (_academicField is EqualUnmodifiableListView) return _academicField;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'institution_requirements') final  String? institutionRequirements;

/// Create a copy of Academic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcademicCopyWith<_Academic> get copyWith => __$AcademicCopyWithImpl<_Academic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcademicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Academic&&const DeepCollectionEquality().equals(other.minimumGpa, minimumGpa)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&const DeepCollectionEquality().equals(other._languageRequirements, _languageRequirements)&&const DeepCollectionEquality().equals(other._academicField, _academicField)&&(identical(other.institutionRequirements, institutionRequirements) || other.institutionRequirements == institutionRequirements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(minimumGpa),educationLevel,const DeepCollectionEquality().hash(_languageRequirements),const DeepCollectionEquality().hash(_academicField),institutionRequirements);

@override
String toString() {
  return 'Academic(minimumGpa: $minimumGpa, educationLevel: $educationLevel, languageRequirements: $languageRequirements, academicField: $academicField, institutionRequirements: $institutionRequirements)';
}


}

/// @nodoc
abstract mixin class _$AcademicCopyWith<$Res> implements $AcademicCopyWith<$Res> {
  factory _$AcademicCopyWith(_Academic value, $Res Function(_Academic) _then) = __$AcademicCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'minimum_gpa') dynamic minimumGpa,@JsonKey(name: 'education_level') String? educationLevel,@JsonKey(name: 'language_requirements') Map<String, dynamic>? languageRequirements,@JsonKey(name: 'academic_field') List<String>? academicField,@JsonKey(name: 'institution_requirements') String? institutionRequirements
});




}
/// @nodoc
class __$AcademicCopyWithImpl<$Res>
    implements _$AcademicCopyWith<$Res> {
  __$AcademicCopyWithImpl(this._self, this._then);

  final _Academic _self;
  final $Res Function(_Academic) _then;

/// Create a copy of Academic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minimumGpa = freezed,Object? educationLevel = freezed,Object? languageRequirements = freezed,Object? academicField = freezed,Object? institutionRequirements = freezed,}) {
  return _then(_Academic(
minimumGpa: freezed == minimumGpa ? _self.minimumGpa : minimumGpa // ignore: cast_nullable_to_non_nullable
as dynamic,educationLevel: freezed == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String?,languageRequirements: freezed == languageRequirements ? _self._languageRequirements : languageRequirements // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,academicField: freezed == academicField ? _self._academicField : academicField // ignore: cast_nullable_to_non_nullable
as List<String>?,institutionRequirements: freezed == institutionRequirements ? _self.institutionRequirements : institutionRequirements // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PersonalCriteria {

@JsonKey(name: 'age_limit') String? get ageLimit;@JsonKey(name: 'nationality_restrictions') List<String>? get nationalityRestrictions;@JsonKey(name: 'work_experience') String? get workExperience;@JsonKey(name: 'other_criteria') List<String>? get otherCriteria;
/// Create a copy of PersonalCriteria
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalCriteriaCopyWith<PersonalCriteria> get copyWith => _$PersonalCriteriaCopyWithImpl<PersonalCriteria>(this as PersonalCriteria, _$identity);

  /// Serializes this PersonalCriteria to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalCriteria&&(identical(other.ageLimit, ageLimit) || other.ageLimit == ageLimit)&&const DeepCollectionEquality().equals(other.nationalityRestrictions, nationalityRestrictions)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&const DeepCollectionEquality().equals(other.otherCriteria, otherCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ageLimit,const DeepCollectionEquality().hash(nationalityRestrictions),workExperience,const DeepCollectionEquality().hash(otherCriteria));

@override
String toString() {
  return 'PersonalCriteria(ageLimit: $ageLimit, nationalityRestrictions: $nationalityRestrictions, workExperience: $workExperience, otherCriteria: $otherCriteria)';
}


}

/// @nodoc
abstract mixin class $PersonalCriteriaCopyWith<$Res>  {
  factory $PersonalCriteriaCopyWith(PersonalCriteria value, $Res Function(PersonalCriteria) _then) = _$PersonalCriteriaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'age_limit') String? ageLimit,@JsonKey(name: 'nationality_restrictions') List<String>? nationalityRestrictions,@JsonKey(name: 'work_experience') String? workExperience,@JsonKey(name: 'other_criteria') List<String>? otherCriteria
});




}
/// @nodoc
class _$PersonalCriteriaCopyWithImpl<$Res>
    implements $PersonalCriteriaCopyWith<$Res> {
  _$PersonalCriteriaCopyWithImpl(this._self, this._then);

  final PersonalCriteria _self;
  final $Res Function(PersonalCriteria) _then;

/// Create a copy of PersonalCriteria
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ageLimit = freezed,Object? nationalityRestrictions = freezed,Object? workExperience = freezed,Object? otherCriteria = freezed,}) {
  return _then(_self.copyWith(
ageLimit: freezed == ageLimit ? _self.ageLimit : ageLimit // ignore: cast_nullable_to_non_nullable
as String?,nationalityRestrictions: freezed == nationalityRestrictions ? _self.nationalityRestrictions : nationalityRestrictions // ignore: cast_nullable_to_non_nullable
as List<String>?,workExperience: freezed == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String?,otherCriteria: freezed == otherCriteria ? _self.otherCriteria : otherCriteria // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PersonalCriteria implements PersonalCriteria {
  const _PersonalCriteria({@JsonKey(name: 'age_limit') this.ageLimit, @JsonKey(name: 'nationality_restrictions') final  List<String>? nationalityRestrictions, @JsonKey(name: 'work_experience') this.workExperience, @JsonKey(name: 'other_criteria') final  List<String>? otherCriteria}): _nationalityRestrictions = nationalityRestrictions,_otherCriteria = otherCriteria;
  factory _PersonalCriteria.fromJson(Map<String, dynamic> json) => _$PersonalCriteriaFromJson(json);

@override@JsonKey(name: 'age_limit') final  String? ageLimit;
 final  List<String>? _nationalityRestrictions;
@override@JsonKey(name: 'nationality_restrictions') List<String>? get nationalityRestrictions {
  final value = _nationalityRestrictions;
  if (value == null) return null;
  if (_nationalityRestrictions is EqualUnmodifiableListView) return _nationalityRestrictions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'work_experience') final  String? workExperience;
 final  List<String>? _otherCriteria;
@override@JsonKey(name: 'other_criteria') List<String>? get otherCriteria {
  final value = _otherCriteria;
  if (value == null) return null;
  if (_otherCriteria is EqualUnmodifiableListView) return _otherCriteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PersonalCriteria
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalCriteriaCopyWith<_PersonalCriteria> get copyWith => __$PersonalCriteriaCopyWithImpl<_PersonalCriteria>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalCriteriaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalCriteria&&(identical(other.ageLimit, ageLimit) || other.ageLimit == ageLimit)&&const DeepCollectionEquality().equals(other._nationalityRestrictions, _nationalityRestrictions)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&const DeepCollectionEquality().equals(other._otherCriteria, _otherCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ageLimit,const DeepCollectionEquality().hash(_nationalityRestrictions),workExperience,const DeepCollectionEquality().hash(_otherCriteria));

@override
String toString() {
  return 'PersonalCriteria(ageLimit: $ageLimit, nationalityRestrictions: $nationalityRestrictions, workExperience: $workExperience, otherCriteria: $otherCriteria)';
}


}

/// @nodoc
abstract mixin class _$PersonalCriteriaCopyWith<$Res> implements $PersonalCriteriaCopyWith<$Res> {
  factory _$PersonalCriteriaCopyWith(_PersonalCriteria value, $Res Function(_PersonalCriteria) _then) = __$PersonalCriteriaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'age_limit') String? ageLimit,@JsonKey(name: 'nationality_restrictions') List<String>? nationalityRestrictions,@JsonKey(name: 'work_experience') String? workExperience,@JsonKey(name: 'other_criteria') List<String>? otherCriteria
});




}
/// @nodoc
class __$PersonalCriteriaCopyWithImpl<$Res>
    implements _$PersonalCriteriaCopyWith<$Res> {
  __$PersonalCriteriaCopyWithImpl(this._self, this._then);

  final _PersonalCriteria _self;
  final $Res Function(_PersonalCriteria) _then;

/// Create a copy of PersonalCriteria
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ageLimit = freezed,Object? nationalityRestrictions = freezed,Object? workExperience = freezed,Object? otherCriteria = freezed,}) {
  return _then(_PersonalCriteria(
ageLimit: freezed == ageLimit ? _self.ageLimit : ageLimit // ignore: cast_nullable_to_non_nullable
as String?,nationalityRestrictions: freezed == nationalityRestrictions ? _self._nationalityRestrictions : nationalityRestrictions // ignore: cast_nullable_to_non_nullable
as List<String>?,workExperience: freezed == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String?,otherCriteria: freezed == otherCriteria ? _self._otherCriteria : otherCriteria // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$FinancialDetails {

@JsonKey(name: 'coverage_amount') String? get coverageAmount;@JsonKey(name: 'what_is_covered') List<String>? get whatIsCovered;@JsonKey(name: 'additional_benefits') List<String>? get additionalBenefits;@JsonKey(name: 'funding_duration') String? get fundingDuration;
/// Create a copy of FinancialDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinancialDetailsCopyWith<FinancialDetails> get copyWith => _$FinancialDetailsCopyWithImpl<FinancialDetails>(this as FinancialDetails, _$identity);

  /// Serializes this FinancialDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinancialDetails&&(identical(other.coverageAmount, coverageAmount) || other.coverageAmount == coverageAmount)&&const DeepCollectionEquality().equals(other.whatIsCovered, whatIsCovered)&&const DeepCollectionEquality().equals(other.additionalBenefits, additionalBenefits)&&(identical(other.fundingDuration, fundingDuration) || other.fundingDuration == fundingDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverageAmount,const DeepCollectionEquality().hash(whatIsCovered),const DeepCollectionEquality().hash(additionalBenefits),fundingDuration);

@override
String toString() {
  return 'FinancialDetails(coverageAmount: $coverageAmount, whatIsCovered: $whatIsCovered, additionalBenefits: $additionalBenefits, fundingDuration: $fundingDuration)';
}


}

/// @nodoc
abstract mixin class $FinancialDetailsCopyWith<$Res>  {
  factory $FinancialDetailsCopyWith(FinancialDetails value, $Res Function(FinancialDetails) _then) = _$FinancialDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'coverage_amount') String? coverageAmount,@JsonKey(name: 'what_is_covered') List<String>? whatIsCovered,@JsonKey(name: 'additional_benefits') List<String>? additionalBenefits,@JsonKey(name: 'funding_duration') String? fundingDuration
});




}
/// @nodoc
class _$FinancialDetailsCopyWithImpl<$Res>
    implements $FinancialDetailsCopyWith<$Res> {
  _$FinancialDetailsCopyWithImpl(this._self, this._then);

  final FinancialDetails _self;
  final $Res Function(FinancialDetails) _then;

/// Create a copy of FinancialDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coverageAmount = freezed,Object? whatIsCovered = freezed,Object? additionalBenefits = freezed,Object? fundingDuration = freezed,}) {
  return _then(_self.copyWith(
coverageAmount: freezed == coverageAmount ? _self.coverageAmount : coverageAmount // ignore: cast_nullable_to_non_nullable
as String?,whatIsCovered: freezed == whatIsCovered ? _self.whatIsCovered : whatIsCovered // ignore: cast_nullable_to_non_nullable
as List<String>?,additionalBenefits: freezed == additionalBenefits ? _self.additionalBenefits : additionalBenefits // ignore: cast_nullable_to_non_nullable
as List<String>?,fundingDuration: freezed == fundingDuration ? _self.fundingDuration : fundingDuration // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FinancialDetails implements FinancialDetails {
  const _FinancialDetails({@JsonKey(name: 'coverage_amount') this.coverageAmount, @JsonKey(name: 'what_is_covered') final  List<String>? whatIsCovered, @JsonKey(name: 'additional_benefits') final  List<String>? additionalBenefits, @JsonKey(name: 'funding_duration') this.fundingDuration}): _whatIsCovered = whatIsCovered,_additionalBenefits = additionalBenefits;
  factory _FinancialDetails.fromJson(Map<String, dynamic> json) => _$FinancialDetailsFromJson(json);

@override@JsonKey(name: 'coverage_amount') final  String? coverageAmount;
 final  List<String>? _whatIsCovered;
@override@JsonKey(name: 'what_is_covered') List<String>? get whatIsCovered {
  final value = _whatIsCovered;
  if (value == null) return null;
  if (_whatIsCovered is EqualUnmodifiableListView) return _whatIsCovered;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _additionalBenefits;
@override@JsonKey(name: 'additional_benefits') List<String>? get additionalBenefits {
  final value = _additionalBenefits;
  if (value == null) return null;
  if (_additionalBenefits is EqualUnmodifiableListView) return _additionalBenefits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'funding_duration') final  String? fundingDuration;

/// Create a copy of FinancialDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinancialDetailsCopyWith<_FinancialDetails> get copyWith => __$FinancialDetailsCopyWithImpl<_FinancialDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinancialDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinancialDetails&&(identical(other.coverageAmount, coverageAmount) || other.coverageAmount == coverageAmount)&&const DeepCollectionEquality().equals(other._whatIsCovered, _whatIsCovered)&&const DeepCollectionEquality().equals(other._additionalBenefits, _additionalBenefits)&&(identical(other.fundingDuration, fundingDuration) || other.fundingDuration == fundingDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverageAmount,const DeepCollectionEquality().hash(_whatIsCovered),const DeepCollectionEquality().hash(_additionalBenefits),fundingDuration);

@override
String toString() {
  return 'FinancialDetails(coverageAmount: $coverageAmount, whatIsCovered: $whatIsCovered, additionalBenefits: $additionalBenefits, fundingDuration: $fundingDuration)';
}


}

/// @nodoc
abstract mixin class _$FinancialDetailsCopyWith<$Res> implements $FinancialDetailsCopyWith<$Res> {
  factory _$FinancialDetailsCopyWith(_FinancialDetails value, $Res Function(_FinancialDetails) _then) = __$FinancialDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'coverage_amount') String? coverageAmount,@JsonKey(name: 'what_is_covered') List<String>? whatIsCovered,@JsonKey(name: 'additional_benefits') List<String>? additionalBenefits,@JsonKey(name: 'funding_duration') String? fundingDuration
});




}
/// @nodoc
class __$FinancialDetailsCopyWithImpl<$Res>
    implements _$FinancialDetailsCopyWith<$Res> {
  __$FinancialDetailsCopyWithImpl(this._self, this._then);

  final _FinancialDetails _self;
  final $Res Function(_FinancialDetails) _then;

/// Create a copy of FinancialDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coverageAmount = freezed,Object? whatIsCovered = freezed,Object? additionalBenefits = freezed,Object? fundingDuration = freezed,}) {
  return _then(_FinancialDetails(
coverageAmount: freezed == coverageAmount ? _self.coverageAmount : coverageAmount // ignore: cast_nullable_to_non_nullable
as String?,whatIsCovered: freezed == whatIsCovered ? _self._whatIsCovered : whatIsCovered // ignore: cast_nullable_to_non_nullable
as List<String>?,additionalBenefits: freezed == additionalBenefits ? _self._additionalBenefits : additionalBenefits // ignore: cast_nullable_to_non_nullable
as List<String>?,fundingDuration: freezed == fundingDuration ? _self.fundingDuration : fundingDuration // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ApplicationProcess {

@JsonKey(name: 'application_steps') List<String>? get applicationSteps;@JsonKey(name: 'selection_process') List<String>? get selectionProcess;@JsonKey(name: 'application_fee') String? get applicationFee;@JsonKey(name: 'interview_required') bool? get interviewRequired;@JsonKey(name: 'application_tips') List<String>? get applicationTips;
/// Create a copy of ApplicationProcess
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationProcessCopyWith<ApplicationProcess> get copyWith => _$ApplicationProcessCopyWithImpl<ApplicationProcess>(this as ApplicationProcess, _$identity);

  /// Serializes this ApplicationProcess to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationProcess&&const DeepCollectionEquality().equals(other.applicationSteps, applicationSteps)&&const DeepCollectionEquality().equals(other.selectionProcess, selectionProcess)&&(identical(other.applicationFee, applicationFee) || other.applicationFee == applicationFee)&&(identical(other.interviewRequired, interviewRequired) || other.interviewRequired == interviewRequired)&&const DeepCollectionEquality().equals(other.applicationTips, applicationTips));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(applicationSteps),const DeepCollectionEquality().hash(selectionProcess),applicationFee,interviewRequired,const DeepCollectionEquality().hash(applicationTips));

@override
String toString() {
  return 'ApplicationProcess(applicationSteps: $applicationSteps, selectionProcess: $selectionProcess, applicationFee: $applicationFee, interviewRequired: $interviewRequired, applicationTips: $applicationTips)';
}


}

/// @nodoc
abstract mixin class $ApplicationProcessCopyWith<$Res>  {
  factory $ApplicationProcessCopyWith(ApplicationProcess value, $Res Function(ApplicationProcess) _then) = _$ApplicationProcessCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'application_steps') List<String>? applicationSteps,@JsonKey(name: 'selection_process') List<String>? selectionProcess,@JsonKey(name: 'application_fee') String? applicationFee,@JsonKey(name: 'interview_required') bool? interviewRequired,@JsonKey(name: 'application_tips') List<String>? applicationTips
});




}
/// @nodoc
class _$ApplicationProcessCopyWithImpl<$Res>
    implements $ApplicationProcessCopyWith<$Res> {
  _$ApplicationProcessCopyWithImpl(this._self, this._then);

  final ApplicationProcess _self;
  final $Res Function(ApplicationProcess) _then;

/// Create a copy of ApplicationProcess
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationSteps = freezed,Object? selectionProcess = freezed,Object? applicationFee = freezed,Object? interviewRequired = freezed,Object? applicationTips = freezed,}) {
  return _then(_self.copyWith(
applicationSteps: freezed == applicationSteps ? _self.applicationSteps : applicationSteps // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self.selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,applicationFee: freezed == applicationFee ? _self.applicationFee : applicationFee // ignore: cast_nullable_to_non_nullable
as String?,interviewRequired: freezed == interviewRequired ? _self.interviewRequired : interviewRequired // ignore: cast_nullable_to_non_nullable
as bool?,applicationTips: freezed == applicationTips ? _self.applicationTips : applicationTips // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApplicationProcess implements ApplicationProcess {
  const _ApplicationProcess({@JsonKey(name: 'application_steps') final  List<String>? applicationSteps, @JsonKey(name: 'selection_process') final  List<String>? selectionProcess, @JsonKey(name: 'application_fee') this.applicationFee, @JsonKey(name: 'interview_required') this.interviewRequired, @JsonKey(name: 'application_tips') final  List<String>? applicationTips}): _applicationSteps = applicationSteps,_selectionProcess = selectionProcess,_applicationTips = applicationTips;
  factory _ApplicationProcess.fromJson(Map<String, dynamic> json) => _$ApplicationProcessFromJson(json);

 final  List<String>? _applicationSteps;
@override@JsonKey(name: 'application_steps') List<String>? get applicationSteps {
  final value = _applicationSteps;
  if (value == null) return null;
  if (_applicationSteps is EqualUnmodifiableListView) return _applicationSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _selectionProcess;
@override@JsonKey(name: 'selection_process') List<String>? get selectionProcess {
  final value = _selectionProcess;
  if (value == null) return null;
  if (_selectionProcess is EqualUnmodifiableListView) return _selectionProcess;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'application_fee') final  String? applicationFee;
@override@JsonKey(name: 'interview_required') final  bool? interviewRequired;
 final  List<String>? _applicationTips;
@override@JsonKey(name: 'application_tips') List<String>? get applicationTips {
  final value = _applicationTips;
  if (value == null) return null;
  if (_applicationTips is EqualUnmodifiableListView) return _applicationTips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ApplicationProcess
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationProcessCopyWith<_ApplicationProcess> get copyWith => __$ApplicationProcessCopyWithImpl<_ApplicationProcess>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationProcessToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationProcess&&const DeepCollectionEquality().equals(other._applicationSteps, _applicationSteps)&&const DeepCollectionEquality().equals(other._selectionProcess, _selectionProcess)&&(identical(other.applicationFee, applicationFee) || other.applicationFee == applicationFee)&&(identical(other.interviewRequired, interviewRequired) || other.interviewRequired == interviewRequired)&&const DeepCollectionEquality().equals(other._applicationTips, _applicationTips));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_applicationSteps),const DeepCollectionEquality().hash(_selectionProcess),applicationFee,interviewRequired,const DeepCollectionEquality().hash(_applicationTips));

@override
String toString() {
  return 'ApplicationProcess(applicationSteps: $applicationSteps, selectionProcess: $selectionProcess, applicationFee: $applicationFee, interviewRequired: $interviewRequired, applicationTips: $applicationTips)';
}


}

/// @nodoc
abstract mixin class _$ApplicationProcessCopyWith<$Res> implements $ApplicationProcessCopyWith<$Res> {
  factory _$ApplicationProcessCopyWith(_ApplicationProcess value, $Res Function(_ApplicationProcess) _then) = __$ApplicationProcessCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'application_steps') List<String>? applicationSteps,@JsonKey(name: 'selection_process') List<String>? selectionProcess,@JsonKey(name: 'application_fee') String? applicationFee,@JsonKey(name: 'interview_required') bool? interviewRequired,@JsonKey(name: 'application_tips') List<String>? applicationTips
});




}
/// @nodoc
class __$ApplicationProcessCopyWithImpl<$Res>
    implements _$ApplicationProcessCopyWith<$Res> {
  __$ApplicationProcessCopyWithImpl(this._self, this._then);

  final _ApplicationProcess _self;
  final $Res Function(_ApplicationProcess) _then;

/// Create a copy of ApplicationProcess
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationSteps = freezed,Object? selectionProcess = freezed,Object? applicationFee = freezed,Object? interviewRequired = freezed,Object? applicationTips = freezed,}) {
  return _then(_ApplicationProcess(
applicationSteps: freezed == applicationSteps ? _self._applicationSteps : applicationSteps // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self._selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,applicationFee: freezed == applicationFee ? _self.applicationFee : applicationFee // ignore: cast_nullable_to_non_nullable
as String?,interviewRequired: freezed == interviewRequired ? _self.interviewRequired : interviewRequired // ignore: cast_nullable_to_non_nullable
as bool?,applicationTips: freezed == applicationTips ? _self._applicationTips : applicationTips // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$Contact {

 String? get email; String? get phone; String? get website; String? get address;@JsonKey(name: 'contact_person') String? get contactPerson;
/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactCopyWith<Contact> get copyWith => _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contact&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,phone,website,address,contactPerson);

@override
String toString() {
  return 'Contact(email: $email, phone: $phone, website: $website, address: $address, contactPerson: $contactPerson)';
}


}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res>  {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) = _$ContactCopyWithImpl;
@useResult
$Res call({
 String? email, String? phone, String? website, String? address,@JsonKey(name: 'contact_person') String? contactPerson
});




}
/// @nodoc
class _$ContactCopyWithImpl<$Res>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._self, this._then);

  final Contact _self;
  final $Res Function(Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? phone = freezed,Object? website = freezed,Object? address = freezed,Object? contactPerson = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Contact implements Contact {
  const _Contact({this.email, this.phone, this.website, this.address, @JsonKey(name: 'contact_person') this.contactPerson});
  factory _Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

@override final  String? email;
@override final  String? phone;
@override final  String? website;
@override final  String? address;
@override@JsonKey(name: 'contact_person') final  String? contactPerson;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactCopyWith<_Contact> get copyWith => __$ContactCopyWithImpl<_Contact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contact&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,phone,website,address,contactPerson);

@override
String toString() {
  return 'Contact(email: $email, phone: $phone, website: $website, address: $address, contactPerson: $contactPerson)';
}


}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) = __$ContactCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? phone, String? website, String? address,@JsonKey(name: 'contact_person') String? contactPerson
});




}
/// @nodoc
class __$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(this._self, this._then);

  final _Contact _self;
  final $Res Function(_Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? phone = freezed,Object? website = freezed,Object? address = freezed,Object? contactPerson = freezed,}) {
  return _then(_Contact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AdditionalInfo {

@JsonKey(name: 'success_stories') List<String>? get successStories;@JsonKey(name: 'alumni_network') String? get alumniNetwork;@JsonKey(name: 'special_programs') List<String>? get specialPrograms;@JsonKey(name: 'external_links') List<String>? get externalLinks;
/// Create a copy of AdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdditionalInfoCopyWith<AdditionalInfo> get copyWith => _$AdditionalInfoCopyWithImpl<AdditionalInfo>(this as AdditionalInfo, _$identity);

  /// Serializes this AdditionalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdditionalInfo&&const DeepCollectionEquality().equals(other.successStories, successStories)&&(identical(other.alumniNetwork, alumniNetwork) || other.alumniNetwork == alumniNetwork)&&const DeepCollectionEquality().equals(other.specialPrograms, specialPrograms)&&const DeepCollectionEquality().equals(other.externalLinks, externalLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(successStories),alumniNetwork,const DeepCollectionEquality().hash(specialPrograms),const DeepCollectionEquality().hash(externalLinks));

@override
String toString() {
  return 'AdditionalInfo(successStories: $successStories, alumniNetwork: $alumniNetwork, specialPrograms: $specialPrograms, externalLinks: $externalLinks)';
}


}

/// @nodoc
abstract mixin class $AdditionalInfoCopyWith<$Res>  {
  factory $AdditionalInfoCopyWith(AdditionalInfo value, $Res Function(AdditionalInfo) _then) = _$AdditionalInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success_stories') List<String>? successStories,@JsonKey(name: 'alumni_network') String? alumniNetwork,@JsonKey(name: 'special_programs') List<String>? specialPrograms,@JsonKey(name: 'external_links') List<String>? externalLinks
});




}
/// @nodoc
class _$AdditionalInfoCopyWithImpl<$Res>
    implements $AdditionalInfoCopyWith<$Res> {
  _$AdditionalInfoCopyWithImpl(this._self, this._then);

  final AdditionalInfo _self;
  final $Res Function(AdditionalInfo) _then;

/// Create a copy of AdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? successStories = freezed,Object? alumniNetwork = freezed,Object? specialPrograms = freezed,Object? externalLinks = freezed,}) {
  return _then(_self.copyWith(
successStories: freezed == successStories ? _self.successStories : successStories // ignore: cast_nullable_to_non_nullable
as List<String>?,alumniNetwork: freezed == alumniNetwork ? _self.alumniNetwork : alumniNetwork // ignore: cast_nullable_to_non_nullable
as String?,specialPrograms: freezed == specialPrograms ? _self.specialPrograms : specialPrograms // ignore: cast_nullable_to_non_nullable
as List<String>?,externalLinks: freezed == externalLinks ? _self.externalLinks : externalLinks // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AdditionalInfo implements AdditionalInfo {
  const _AdditionalInfo({@JsonKey(name: 'success_stories') final  List<String>? successStories, @JsonKey(name: 'alumni_network') this.alumniNetwork, @JsonKey(name: 'special_programs') final  List<String>? specialPrograms, @JsonKey(name: 'external_links') final  List<String>? externalLinks}): _successStories = successStories,_specialPrograms = specialPrograms,_externalLinks = externalLinks;
  factory _AdditionalInfo.fromJson(Map<String, dynamic> json) => _$AdditionalInfoFromJson(json);

 final  List<String>? _successStories;
@override@JsonKey(name: 'success_stories') List<String>? get successStories {
  final value = _successStories;
  if (value == null) return null;
  if (_successStories is EqualUnmodifiableListView) return _successStories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'alumni_network') final  String? alumniNetwork;
 final  List<String>? _specialPrograms;
@override@JsonKey(name: 'special_programs') List<String>? get specialPrograms {
  final value = _specialPrograms;
  if (value == null) return null;
  if (_specialPrograms is EqualUnmodifiableListView) return _specialPrograms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _externalLinks;
@override@JsonKey(name: 'external_links') List<String>? get externalLinks {
  final value = _externalLinks;
  if (value == null) return null;
  if (_externalLinks is EqualUnmodifiableListView) return _externalLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdditionalInfoCopyWith<_AdditionalInfo> get copyWith => __$AdditionalInfoCopyWithImpl<_AdditionalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdditionalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdditionalInfo&&const DeepCollectionEquality().equals(other._successStories, _successStories)&&(identical(other.alumniNetwork, alumniNetwork) || other.alumniNetwork == alumniNetwork)&&const DeepCollectionEquality().equals(other._specialPrograms, _specialPrograms)&&const DeepCollectionEquality().equals(other._externalLinks, _externalLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_successStories),alumniNetwork,const DeepCollectionEquality().hash(_specialPrograms),const DeepCollectionEquality().hash(_externalLinks));

@override
String toString() {
  return 'AdditionalInfo(successStories: $successStories, alumniNetwork: $alumniNetwork, specialPrograms: $specialPrograms, externalLinks: $externalLinks)';
}


}

/// @nodoc
abstract mixin class _$AdditionalInfoCopyWith<$Res> implements $AdditionalInfoCopyWith<$Res> {
  factory _$AdditionalInfoCopyWith(_AdditionalInfo value, $Res Function(_AdditionalInfo) _then) = __$AdditionalInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success_stories') List<String>? successStories,@JsonKey(name: 'alumni_network') String? alumniNetwork,@JsonKey(name: 'special_programs') List<String>? specialPrograms,@JsonKey(name: 'external_links') List<String>? externalLinks
});




}
/// @nodoc
class __$AdditionalInfoCopyWithImpl<$Res>
    implements _$AdditionalInfoCopyWith<$Res> {
  __$AdditionalInfoCopyWithImpl(this._self, this._then);

  final _AdditionalInfo _self;
  final $Res Function(_AdditionalInfo) _then;

/// Create a copy of AdditionalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? successStories = freezed,Object? alumniNetwork = freezed,Object? specialPrograms = freezed,Object? externalLinks = freezed,}) {
  return _then(_AdditionalInfo(
successStories: freezed == successStories ? _self._successStories : successStories // ignore: cast_nullable_to_non_nullable
as List<String>?,alumniNetwork: freezed == alumniNetwork ? _self.alumniNetwork : alumniNetwork // ignore: cast_nullable_to_non_nullable
as String?,specialPrograms: freezed == specialPrograms ? _self._specialPrograms : specialPrograms // ignore: cast_nullable_to_non_nullable
as List<String>?,externalLinks: freezed == externalLinks ? _self._externalLinks : externalLinks // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
