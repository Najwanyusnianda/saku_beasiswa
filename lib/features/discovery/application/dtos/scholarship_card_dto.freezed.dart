// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scholarship_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScholarshipCardDto {

 String get id; String get title; String get provider; String get providerCountry; String get countryFlag; String get fundingType; String get fundingAmount; String get degreeLevel; DateTime get applicationDeadline; double get matchScore; bool get isSaved; bool get isInApplicationPlan; String get scholarshipEmoji; List<String> get quickTags; List<String> get subjectAreas;
/// Create a copy of ScholarshipCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScholarshipCardDtoCopyWith<ScholarshipCardDto> get copyWith => _$ScholarshipCardDtoCopyWithImpl<ScholarshipCardDto>(this as ScholarshipCardDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScholarshipCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerCountry, providerCountry) || other.providerCountry == providerCountry)&&(identical(other.countryFlag, countryFlag) || other.countryFlag == countryFlag)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&(identical(other.fundingAmount, fundingAmount) || other.fundingAmount == fundingAmount)&&(identical(other.degreeLevel, degreeLevel) || other.degreeLevel == degreeLevel)&&(identical(other.applicationDeadline, applicationDeadline) || other.applicationDeadline == applicationDeadline)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.isInApplicationPlan, isInApplicationPlan) || other.isInApplicationPlan == isInApplicationPlan)&&(identical(other.scholarshipEmoji, scholarshipEmoji) || other.scholarshipEmoji == scholarshipEmoji)&&const DeepCollectionEquality().equals(other.quickTags, quickTags)&&const DeepCollectionEquality().equals(other.subjectAreas, subjectAreas));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,provider,providerCountry,countryFlag,fundingType,fundingAmount,degreeLevel,applicationDeadline,matchScore,isSaved,isInApplicationPlan,scholarshipEmoji,const DeepCollectionEquality().hash(quickTags),const DeepCollectionEquality().hash(subjectAreas));

@override
String toString() {
  return 'ScholarshipCardDto(id: $id, title: $title, provider: $provider, providerCountry: $providerCountry, countryFlag: $countryFlag, fundingType: $fundingType, fundingAmount: $fundingAmount, degreeLevel: $degreeLevel, applicationDeadline: $applicationDeadline, matchScore: $matchScore, isSaved: $isSaved, isInApplicationPlan: $isInApplicationPlan, scholarshipEmoji: $scholarshipEmoji, quickTags: $quickTags, subjectAreas: $subjectAreas)';
}


}

/// @nodoc
abstract mixin class $ScholarshipCardDtoCopyWith<$Res>  {
  factory $ScholarshipCardDtoCopyWith(ScholarshipCardDto value, $Res Function(ScholarshipCardDto) _then) = _$ScholarshipCardDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String provider, String providerCountry, String countryFlag, String fundingType, String fundingAmount, String degreeLevel, DateTime applicationDeadline, double matchScore, bool isSaved, bool isInApplicationPlan, String scholarshipEmoji, List<String> quickTags, List<String> subjectAreas
});




}
/// @nodoc
class _$ScholarshipCardDtoCopyWithImpl<$Res>
    implements $ScholarshipCardDtoCopyWith<$Res> {
  _$ScholarshipCardDtoCopyWithImpl(this._self, this._then);

  final ScholarshipCardDto _self;
  final $Res Function(ScholarshipCardDto) _then;

/// Create a copy of ScholarshipCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? provider = null,Object? providerCountry = null,Object? countryFlag = null,Object? fundingType = null,Object? fundingAmount = null,Object? degreeLevel = null,Object? applicationDeadline = null,Object? matchScore = null,Object? isSaved = null,Object? isInApplicationPlan = null,Object? scholarshipEmoji = null,Object? quickTags = null,Object? subjectAreas = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,providerCountry: null == providerCountry ? _self.providerCountry : providerCountry // ignore: cast_nullable_to_non_nullable
as String,countryFlag: null == countryFlag ? _self.countryFlag : countryFlag // ignore: cast_nullable_to_non_nullable
as String,fundingType: null == fundingType ? _self.fundingType : fundingType // ignore: cast_nullable_to_non_nullable
as String,fundingAmount: null == fundingAmount ? _self.fundingAmount : fundingAmount // ignore: cast_nullable_to_non_nullable
as String,degreeLevel: null == degreeLevel ? _self.degreeLevel : degreeLevel // ignore: cast_nullable_to_non_nullable
as String,applicationDeadline: null == applicationDeadline ? _self.applicationDeadline : applicationDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,matchScore: null == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as double,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,isInApplicationPlan: null == isInApplicationPlan ? _self.isInApplicationPlan : isInApplicationPlan // ignore: cast_nullable_to_non_nullable
as bool,scholarshipEmoji: null == scholarshipEmoji ? _self.scholarshipEmoji : scholarshipEmoji // ignore: cast_nullable_to_non_nullable
as String,quickTags: null == quickTags ? _self.quickTags : quickTags // ignore: cast_nullable_to_non_nullable
as List<String>,subjectAreas: null == subjectAreas ? _self.subjectAreas : subjectAreas // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _ScholarshipCardDto extends ScholarshipCardDto {
  const _ScholarshipCardDto({required this.id, required this.title, required this.provider, required this.providerCountry, required this.countryFlag, required this.fundingType, required this.fundingAmount, required this.degreeLevel, required this.applicationDeadline, required this.matchScore, required this.isSaved, this.isInApplicationPlan = false, required this.scholarshipEmoji, final  List<String> quickTags = const [], final  List<String> subjectAreas = const []}): _quickTags = quickTags,_subjectAreas = subjectAreas,super._();
  

@override final  String id;
@override final  String title;
@override final  String provider;
@override final  String providerCountry;
@override final  String countryFlag;
@override final  String fundingType;
@override final  String fundingAmount;
@override final  String degreeLevel;
@override final  DateTime applicationDeadline;
@override final  double matchScore;
@override final  bool isSaved;
@override@JsonKey() final  bool isInApplicationPlan;
@override final  String scholarshipEmoji;
 final  List<String> _quickTags;
@override@JsonKey() List<String> get quickTags {
  if (_quickTags is EqualUnmodifiableListView) return _quickTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quickTags);
}

 final  List<String> _subjectAreas;
@override@JsonKey() List<String> get subjectAreas {
  if (_subjectAreas is EqualUnmodifiableListView) return _subjectAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjectAreas);
}


/// Create a copy of ScholarshipCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScholarshipCardDtoCopyWith<_ScholarshipCardDto> get copyWith => __$ScholarshipCardDtoCopyWithImpl<_ScholarshipCardDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScholarshipCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerCountry, providerCountry) || other.providerCountry == providerCountry)&&(identical(other.countryFlag, countryFlag) || other.countryFlag == countryFlag)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&(identical(other.fundingAmount, fundingAmount) || other.fundingAmount == fundingAmount)&&(identical(other.degreeLevel, degreeLevel) || other.degreeLevel == degreeLevel)&&(identical(other.applicationDeadline, applicationDeadline) || other.applicationDeadline == applicationDeadline)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.isInApplicationPlan, isInApplicationPlan) || other.isInApplicationPlan == isInApplicationPlan)&&(identical(other.scholarshipEmoji, scholarshipEmoji) || other.scholarshipEmoji == scholarshipEmoji)&&const DeepCollectionEquality().equals(other._quickTags, _quickTags)&&const DeepCollectionEquality().equals(other._subjectAreas, _subjectAreas));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,provider,providerCountry,countryFlag,fundingType,fundingAmount,degreeLevel,applicationDeadline,matchScore,isSaved,isInApplicationPlan,scholarshipEmoji,const DeepCollectionEquality().hash(_quickTags),const DeepCollectionEquality().hash(_subjectAreas));

@override
String toString() {
  return 'ScholarshipCardDto(id: $id, title: $title, provider: $provider, providerCountry: $providerCountry, countryFlag: $countryFlag, fundingType: $fundingType, fundingAmount: $fundingAmount, degreeLevel: $degreeLevel, applicationDeadline: $applicationDeadline, matchScore: $matchScore, isSaved: $isSaved, isInApplicationPlan: $isInApplicationPlan, scholarshipEmoji: $scholarshipEmoji, quickTags: $quickTags, subjectAreas: $subjectAreas)';
}


}

/// @nodoc
abstract mixin class _$ScholarshipCardDtoCopyWith<$Res> implements $ScholarshipCardDtoCopyWith<$Res> {
  factory _$ScholarshipCardDtoCopyWith(_ScholarshipCardDto value, $Res Function(_ScholarshipCardDto) _then) = __$ScholarshipCardDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String provider, String providerCountry, String countryFlag, String fundingType, String fundingAmount, String degreeLevel, DateTime applicationDeadline, double matchScore, bool isSaved, bool isInApplicationPlan, String scholarshipEmoji, List<String> quickTags, List<String> subjectAreas
});




}
/// @nodoc
class __$ScholarshipCardDtoCopyWithImpl<$Res>
    implements _$ScholarshipCardDtoCopyWith<$Res> {
  __$ScholarshipCardDtoCopyWithImpl(this._self, this._then);

  final _ScholarshipCardDto _self;
  final $Res Function(_ScholarshipCardDto) _then;

/// Create a copy of ScholarshipCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? provider = null,Object? providerCountry = null,Object? countryFlag = null,Object? fundingType = null,Object? fundingAmount = null,Object? degreeLevel = null,Object? applicationDeadline = null,Object? matchScore = null,Object? isSaved = null,Object? isInApplicationPlan = null,Object? scholarshipEmoji = null,Object? quickTags = null,Object? subjectAreas = null,}) {
  return _then(_ScholarshipCardDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,providerCountry: null == providerCountry ? _self.providerCountry : providerCountry // ignore: cast_nullable_to_non_nullable
as String,countryFlag: null == countryFlag ? _self.countryFlag : countryFlag // ignore: cast_nullable_to_non_nullable
as String,fundingType: null == fundingType ? _self.fundingType : fundingType // ignore: cast_nullable_to_non_nullable
as String,fundingAmount: null == fundingAmount ? _self.fundingAmount : fundingAmount // ignore: cast_nullable_to_non_nullable
as String,degreeLevel: null == degreeLevel ? _self.degreeLevel : degreeLevel // ignore: cast_nullable_to_non_nullable
as String,applicationDeadline: null == applicationDeadline ? _self.applicationDeadline : applicationDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,matchScore: null == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as double,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,isInApplicationPlan: null == isInApplicationPlan ? _self.isInApplicationPlan : isInApplicationPlan // ignore: cast_nullable_to_non_nullable
as bool,scholarshipEmoji: null == scholarshipEmoji ? _self.scholarshipEmoji : scholarshipEmoji // ignore: cast_nullable_to_non_nullable
as String,quickTags: null == quickTags ? _self._quickTags : quickTags // ignore: cast_nullable_to_non_nullable
as List<String>,subjectAreas: null == subjectAreas ? _self._subjectAreas : subjectAreas // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
