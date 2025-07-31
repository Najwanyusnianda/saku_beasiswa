// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scholarship_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScholarshipMatch {

 String get scholarshipId; double get matchScore;// 0.0 to 1.0 (displayed as percentage)
 List<MatchReason> get matchReasons; bool get isSaved; bool get isInApplicationPlan; DateTime? get lastViewed; DateTime? get savedAt;
/// Create a copy of ScholarshipMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScholarshipMatchCopyWith<ScholarshipMatch> get copyWith => _$ScholarshipMatchCopyWithImpl<ScholarshipMatch>(this as ScholarshipMatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScholarshipMatch&&(identical(other.scholarshipId, scholarshipId) || other.scholarshipId == scholarshipId)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other.matchReasons, matchReasons)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.isInApplicationPlan, isInApplicationPlan) || other.isInApplicationPlan == isInApplicationPlan)&&(identical(other.lastViewed, lastViewed) || other.lastViewed == lastViewed)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}


@override
int get hashCode => Object.hash(runtimeType,scholarshipId,matchScore,const DeepCollectionEquality().hash(matchReasons),isSaved,isInApplicationPlan,lastViewed,savedAt);

@override
String toString() {
  return 'ScholarshipMatch(scholarshipId: $scholarshipId, matchScore: $matchScore, matchReasons: $matchReasons, isSaved: $isSaved, isInApplicationPlan: $isInApplicationPlan, lastViewed: $lastViewed, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class $ScholarshipMatchCopyWith<$Res>  {
  factory $ScholarshipMatchCopyWith(ScholarshipMatch value, $Res Function(ScholarshipMatch) _then) = _$ScholarshipMatchCopyWithImpl;
@useResult
$Res call({
 String scholarshipId, double matchScore, List<MatchReason> matchReasons, bool isSaved, bool isInApplicationPlan, DateTime? lastViewed, DateTime? savedAt
});




}
/// @nodoc
class _$ScholarshipMatchCopyWithImpl<$Res>
    implements $ScholarshipMatchCopyWith<$Res> {
  _$ScholarshipMatchCopyWithImpl(this._self, this._then);

  final ScholarshipMatch _self;
  final $Res Function(ScholarshipMatch) _then;

/// Create a copy of ScholarshipMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scholarshipId = null,Object? matchScore = null,Object? matchReasons = null,Object? isSaved = null,Object? isInApplicationPlan = null,Object? lastViewed = freezed,Object? savedAt = freezed,}) {
  return _then(_self.copyWith(
scholarshipId: null == scholarshipId ? _self.scholarshipId : scholarshipId // ignore: cast_nullable_to_non_nullable
as String,matchScore: null == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as double,matchReasons: null == matchReasons ? _self.matchReasons : matchReasons // ignore: cast_nullable_to_non_nullable
as List<MatchReason>,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,isInApplicationPlan: null == isInApplicationPlan ? _self.isInApplicationPlan : isInApplicationPlan // ignore: cast_nullable_to_non_nullable
as bool,lastViewed: freezed == lastViewed ? _self.lastViewed : lastViewed // ignore: cast_nullable_to_non_nullable
as DateTime?,savedAt: freezed == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _ScholarshipMatch implements ScholarshipMatch {
  const _ScholarshipMatch({required this.scholarshipId, required this.matchScore, required final  List<MatchReason> matchReasons, required this.isSaved, this.isInApplicationPlan = false, this.lastViewed, this.savedAt}): _matchReasons = matchReasons;
  

@override final  String scholarshipId;
@override final  double matchScore;
// 0.0 to 1.0 (displayed as percentage)
 final  List<MatchReason> _matchReasons;
// 0.0 to 1.0 (displayed as percentage)
@override List<MatchReason> get matchReasons {
  if (_matchReasons is EqualUnmodifiableListView) return _matchReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matchReasons);
}

@override final  bool isSaved;
@override@JsonKey() final  bool isInApplicationPlan;
@override final  DateTime? lastViewed;
@override final  DateTime? savedAt;

/// Create a copy of ScholarshipMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScholarshipMatchCopyWith<_ScholarshipMatch> get copyWith => __$ScholarshipMatchCopyWithImpl<_ScholarshipMatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScholarshipMatch&&(identical(other.scholarshipId, scholarshipId) || other.scholarshipId == scholarshipId)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other._matchReasons, _matchReasons)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.isInApplicationPlan, isInApplicationPlan) || other.isInApplicationPlan == isInApplicationPlan)&&(identical(other.lastViewed, lastViewed) || other.lastViewed == lastViewed)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}


@override
int get hashCode => Object.hash(runtimeType,scholarshipId,matchScore,const DeepCollectionEquality().hash(_matchReasons),isSaved,isInApplicationPlan,lastViewed,savedAt);

@override
String toString() {
  return 'ScholarshipMatch(scholarshipId: $scholarshipId, matchScore: $matchScore, matchReasons: $matchReasons, isSaved: $isSaved, isInApplicationPlan: $isInApplicationPlan, lastViewed: $lastViewed, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class _$ScholarshipMatchCopyWith<$Res> implements $ScholarshipMatchCopyWith<$Res> {
  factory _$ScholarshipMatchCopyWith(_ScholarshipMatch value, $Res Function(_ScholarshipMatch) _then) = __$ScholarshipMatchCopyWithImpl;
@override @useResult
$Res call({
 String scholarshipId, double matchScore, List<MatchReason> matchReasons, bool isSaved, bool isInApplicationPlan, DateTime? lastViewed, DateTime? savedAt
});




}
/// @nodoc
class __$ScholarshipMatchCopyWithImpl<$Res>
    implements _$ScholarshipMatchCopyWith<$Res> {
  __$ScholarshipMatchCopyWithImpl(this._self, this._then);

  final _ScholarshipMatch _self;
  final $Res Function(_ScholarshipMatch) _then;

/// Create a copy of ScholarshipMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scholarshipId = null,Object? matchScore = null,Object? matchReasons = null,Object? isSaved = null,Object? isInApplicationPlan = null,Object? lastViewed = freezed,Object? savedAt = freezed,}) {
  return _then(_ScholarshipMatch(
scholarshipId: null == scholarshipId ? _self.scholarshipId : scholarshipId // ignore: cast_nullable_to_non_nullable
as String,matchScore: null == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as double,matchReasons: null == matchReasons ? _self._matchReasons : matchReasons // ignore: cast_nullable_to_non_nullable
as List<MatchReason>,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,isInApplicationPlan: null == isInApplicationPlan ? _self.isInApplicationPlan : isInApplicationPlan // ignore: cast_nullable_to_non_nullable
as bool,lastViewed: freezed == lastViewed ? _self.lastViewed : lastViewed // ignore: cast_nullable_to_non_nullable
as DateTime?,savedAt: freezed == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$MatchReason {

 MatchCriteria get criteria; String get description; double get weight;// How much this reason contributes to the overall score
 double get score;
/// Create a copy of MatchReason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchReasonCopyWith<MatchReason> get copyWith => _$MatchReasonCopyWithImpl<MatchReason>(this as MatchReason, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchReason&&(identical(other.criteria, criteria) || other.criteria == criteria)&&(identical(other.description, description) || other.description == description)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,criteria,description,weight,score);

@override
String toString() {
  return 'MatchReason(criteria: $criteria, description: $description, weight: $weight, score: $score)';
}


}

/// @nodoc
abstract mixin class $MatchReasonCopyWith<$Res>  {
  factory $MatchReasonCopyWith(MatchReason value, $Res Function(MatchReason) _then) = _$MatchReasonCopyWithImpl;
@useResult
$Res call({
 MatchCriteria criteria, String description, double weight, double score
});




}
/// @nodoc
class _$MatchReasonCopyWithImpl<$Res>
    implements $MatchReasonCopyWith<$Res> {
  _$MatchReasonCopyWithImpl(this._self, this._then);

  final MatchReason _self;
  final $Res Function(MatchReason) _then;

/// Create a copy of MatchReason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? criteria = null,Object? description = null,Object? weight = null,Object? score = null,}) {
  return _then(_self.copyWith(
criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as MatchCriteria,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _MatchReason implements MatchReason {
  const _MatchReason({required this.criteria, required this.description, required this.weight, required this.score});
  

@override final  MatchCriteria criteria;
@override final  String description;
@override final  double weight;
// How much this reason contributes to the overall score
@override final  double score;

/// Create a copy of MatchReason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchReasonCopyWith<_MatchReason> get copyWith => __$MatchReasonCopyWithImpl<_MatchReason>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchReason&&(identical(other.criteria, criteria) || other.criteria == criteria)&&(identical(other.description, description) || other.description == description)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,criteria,description,weight,score);

@override
String toString() {
  return 'MatchReason(criteria: $criteria, description: $description, weight: $weight, score: $score)';
}


}

/// @nodoc
abstract mixin class _$MatchReasonCopyWith<$Res> implements $MatchReasonCopyWith<$Res> {
  factory _$MatchReasonCopyWith(_MatchReason value, $Res Function(_MatchReason) _then) = __$MatchReasonCopyWithImpl;
@override @useResult
$Res call({
 MatchCriteria criteria, String description, double weight, double score
});




}
/// @nodoc
class __$MatchReasonCopyWithImpl<$Res>
    implements _$MatchReasonCopyWith<$Res> {
  __$MatchReasonCopyWithImpl(this._self, this._then);

  final _MatchReason _self;
  final $Res Function(_MatchReason) _then;

/// Create a copy of MatchReason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? criteria = null,Object? description = null,Object? weight = null,Object? score = null,}) {
  return _then(_MatchReason(
criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as MatchCriteria,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ScholarshipCardData {

 String get id; String get title; String get provider; String get providerCountry; String get countryFlag;// Emoji flag for the country
 String get fundingType; String get fundingAmount; String get degreeLevel; DateTime get applicationDeadline; double get matchScore; bool get isSaved; bool get isInApplicationPlan; String get scholarshipEmoji;// 📍 or other relevant emoji
 List<String>? get quickTags;
/// Create a copy of ScholarshipCardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScholarshipCardDataCopyWith<ScholarshipCardData> get copyWith => _$ScholarshipCardDataCopyWithImpl<ScholarshipCardData>(this as ScholarshipCardData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScholarshipCardData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerCountry, providerCountry) || other.providerCountry == providerCountry)&&(identical(other.countryFlag, countryFlag) || other.countryFlag == countryFlag)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&(identical(other.fundingAmount, fundingAmount) || other.fundingAmount == fundingAmount)&&(identical(other.degreeLevel, degreeLevel) || other.degreeLevel == degreeLevel)&&(identical(other.applicationDeadline, applicationDeadline) || other.applicationDeadline == applicationDeadline)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.isInApplicationPlan, isInApplicationPlan) || other.isInApplicationPlan == isInApplicationPlan)&&(identical(other.scholarshipEmoji, scholarshipEmoji) || other.scholarshipEmoji == scholarshipEmoji)&&const DeepCollectionEquality().equals(other.quickTags, quickTags));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,provider,providerCountry,countryFlag,fundingType,fundingAmount,degreeLevel,applicationDeadline,matchScore,isSaved,isInApplicationPlan,scholarshipEmoji,const DeepCollectionEquality().hash(quickTags));

@override
String toString() {
  return 'ScholarshipCardData(id: $id, title: $title, provider: $provider, providerCountry: $providerCountry, countryFlag: $countryFlag, fundingType: $fundingType, fundingAmount: $fundingAmount, degreeLevel: $degreeLevel, applicationDeadline: $applicationDeadline, matchScore: $matchScore, isSaved: $isSaved, isInApplicationPlan: $isInApplicationPlan, scholarshipEmoji: $scholarshipEmoji, quickTags: $quickTags)';
}


}

/// @nodoc
abstract mixin class $ScholarshipCardDataCopyWith<$Res>  {
  factory $ScholarshipCardDataCopyWith(ScholarshipCardData value, $Res Function(ScholarshipCardData) _then) = _$ScholarshipCardDataCopyWithImpl;
@useResult
$Res call({
 String id, String title, String provider, String providerCountry, String countryFlag, String fundingType, String fundingAmount, String degreeLevel, DateTime applicationDeadline, double matchScore, bool isSaved, bool isInApplicationPlan, String scholarshipEmoji, List<String>? quickTags
});




}
/// @nodoc
class _$ScholarshipCardDataCopyWithImpl<$Res>
    implements $ScholarshipCardDataCopyWith<$Res> {
  _$ScholarshipCardDataCopyWithImpl(this._self, this._then);

  final ScholarshipCardData _self;
  final $Res Function(ScholarshipCardData) _then;

/// Create a copy of ScholarshipCardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? provider = null,Object? providerCountry = null,Object? countryFlag = null,Object? fundingType = null,Object? fundingAmount = null,Object? degreeLevel = null,Object? applicationDeadline = null,Object? matchScore = null,Object? isSaved = null,Object? isInApplicationPlan = null,Object? scholarshipEmoji = null,Object? quickTags = freezed,}) {
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
as String,quickTags: freezed == quickTags ? _self.quickTags : quickTags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc


class _ScholarshipCardData extends ScholarshipCardData {
  const _ScholarshipCardData({required this.id, required this.title, required this.provider, required this.providerCountry, required this.countryFlag, required this.fundingType, required this.fundingAmount, required this.degreeLevel, required this.applicationDeadline, required this.matchScore, required this.isSaved, this.isInApplicationPlan = false, required this.scholarshipEmoji, final  List<String>? quickTags}): _quickTags = quickTags,super._();
  

@override final  String id;
@override final  String title;
@override final  String provider;
@override final  String providerCountry;
@override final  String countryFlag;
// Emoji flag for the country
@override final  String fundingType;
@override final  String fundingAmount;
@override final  String degreeLevel;
@override final  DateTime applicationDeadline;
@override final  double matchScore;
@override final  bool isSaved;
@override@JsonKey() final  bool isInApplicationPlan;
@override final  String scholarshipEmoji;
// 📍 or other relevant emoji
 final  List<String>? _quickTags;
// 📍 or other relevant emoji
@override List<String>? get quickTags {
  final value = _quickTags;
  if (value == null) return null;
  if (_quickTags is EqualUnmodifiableListView) return _quickTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ScholarshipCardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScholarshipCardDataCopyWith<_ScholarshipCardData> get copyWith => __$ScholarshipCardDataCopyWithImpl<_ScholarshipCardData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScholarshipCardData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerCountry, providerCountry) || other.providerCountry == providerCountry)&&(identical(other.countryFlag, countryFlag) || other.countryFlag == countryFlag)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&(identical(other.fundingAmount, fundingAmount) || other.fundingAmount == fundingAmount)&&(identical(other.degreeLevel, degreeLevel) || other.degreeLevel == degreeLevel)&&(identical(other.applicationDeadline, applicationDeadline) || other.applicationDeadline == applicationDeadline)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.isInApplicationPlan, isInApplicationPlan) || other.isInApplicationPlan == isInApplicationPlan)&&(identical(other.scholarshipEmoji, scholarshipEmoji) || other.scholarshipEmoji == scholarshipEmoji)&&const DeepCollectionEquality().equals(other._quickTags, _quickTags));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,provider,providerCountry,countryFlag,fundingType,fundingAmount,degreeLevel,applicationDeadline,matchScore,isSaved,isInApplicationPlan,scholarshipEmoji,const DeepCollectionEquality().hash(_quickTags));

@override
String toString() {
  return 'ScholarshipCardData(id: $id, title: $title, provider: $provider, providerCountry: $providerCountry, countryFlag: $countryFlag, fundingType: $fundingType, fundingAmount: $fundingAmount, degreeLevel: $degreeLevel, applicationDeadline: $applicationDeadline, matchScore: $matchScore, isSaved: $isSaved, isInApplicationPlan: $isInApplicationPlan, scholarshipEmoji: $scholarshipEmoji, quickTags: $quickTags)';
}


}

/// @nodoc
abstract mixin class _$ScholarshipCardDataCopyWith<$Res> implements $ScholarshipCardDataCopyWith<$Res> {
  factory _$ScholarshipCardDataCopyWith(_ScholarshipCardData value, $Res Function(_ScholarshipCardData) _then) = __$ScholarshipCardDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String provider, String providerCountry, String countryFlag, String fundingType, String fundingAmount, String degreeLevel, DateTime applicationDeadline, double matchScore, bool isSaved, bool isInApplicationPlan, String scholarshipEmoji, List<String>? quickTags
});




}
/// @nodoc
class __$ScholarshipCardDataCopyWithImpl<$Res>
    implements _$ScholarshipCardDataCopyWith<$Res> {
  __$ScholarshipCardDataCopyWithImpl(this._self, this._then);

  final _ScholarshipCardData _self;
  final $Res Function(_ScholarshipCardData) _then;

/// Create a copy of ScholarshipCardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? provider = null,Object? providerCountry = null,Object? countryFlag = null,Object? fundingType = null,Object? fundingAmount = null,Object? degreeLevel = null,Object? applicationDeadline = null,Object? matchScore = null,Object? isSaved = null,Object? isInApplicationPlan = null,Object? scholarshipEmoji = null,Object? quickTags = freezed,}) {
  return _then(_ScholarshipCardData(
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
as String,quickTags: freezed == quickTags ? _self._quickTags : quickTags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
