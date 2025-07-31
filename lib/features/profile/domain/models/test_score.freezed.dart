// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestScore {

 int get id; int get userId; String get testType;// e.g., 'ielts', 'toefl', 'gre'
 double get overallScore; DateTime get testDate; String? get detailedScores;// JSON string for sub-scores
 DateTime get createdAt;
/// Create a copy of TestScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestScoreCopyWith<TestScore> get copyWith => _$TestScoreCopyWithImpl<TestScore>(this as TestScore, _$identity);

  /// Serializes this TestScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestScore&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.testType, testType) || other.testType == testType)&&(identical(other.overallScore, overallScore) || other.overallScore == overallScore)&&(identical(other.testDate, testDate) || other.testDate == testDate)&&(identical(other.detailedScores, detailedScores) || other.detailedScores == detailedScores)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,testType,overallScore,testDate,detailedScores,createdAt);

@override
String toString() {
  return 'TestScore(id: $id, userId: $userId, testType: $testType, overallScore: $overallScore, testDate: $testDate, detailedScores: $detailedScores, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TestScoreCopyWith<$Res>  {
  factory $TestScoreCopyWith(TestScore value, $Res Function(TestScore) _then) = _$TestScoreCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String testType, double overallScore, DateTime testDate, String? detailedScores, DateTime createdAt
});




}
/// @nodoc
class _$TestScoreCopyWithImpl<$Res>
    implements $TestScoreCopyWith<$Res> {
  _$TestScoreCopyWithImpl(this._self, this._then);

  final TestScore _self;
  final $Res Function(TestScore) _then;

/// Create a copy of TestScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? testType = null,Object? overallScore = null,Object? testDate = null,Object? detailedScores = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,testType: null == testType ? _self.testType : testType // ignore: cast_nullable_to_non_nullable
as String,overallScore: null == overallScore ? _self.overallScore : overallScore // ignore: cast_nullable_to_non_nullable
as double,testDate: null == testDate ? _self.testDate : testDate // ignore: cast_nullable_to_non_nullable
as DateTime,detailedScores: freezed == detailedScores ? _self.detailedScores : detailedScores // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TestScore implements TestScore {
  const _TestScore({required this.id, required this.userId, required this.testType, required this.overallScore, required this.testDate, this.detailedScores, required this.createdAt});
  factory _TestScore.fromJson(Map<String, dynamic> json) => _$TestScoreFromJson(json);

@override final  int id;
@override final  int userId;
@override final  String testType;
// e.g., 'ielts', 'toefl', 'gre'
@override final  double overallScore;
@override final  DateTime testDate;
@override final  String? detailedScores;
// JSON string for sub-scores
@override final  DateTime createdAt;

/// Create a copy of TestScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestScoreCopyWith<_TestScore> get copyWith => __$TestScoreCopyWithImpl<_TestScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestScore&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.testType, testType) || other.testType == testType)&&(identical(other.overallScore, overallScore) || other.overallScore == overallScore)&&(identical(other.testDate, testDate) || other.testDate == testDate)&&(identical(other.detailedScores, detailedScores) || other.detailedScores == detailedScores)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,testType,overallScore,testDate,detailedScores,createdAt);

@override
String toString() {
  return 'TestScore(id: $id, userId: $userId, testType: $testType, overallScore: $overallScore, testDate: $testDate, detailedScores: $detailedScores, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TestScoreCopyWith<$Res> implements $TestScoreCopyWith<$Res> {
  factory _$TestScoreCopyWith(_TestScore value, $Res Function(_TestScore) _then) = __$TestScoreCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String testType, double overallScore, DateTime testDate, String? detailedScores, DateTime createdAt
});




}
/// @nodoc
class __$TestScoreCopyWithImpl<$Res>
    implements _$TestScoreCopyWith<$Res> {
  __$TestScoreCopyWithImpl(this._self, this._then);

  final _TestScore _self;
  final $Res Function(_TestScore) _then;

/// Create a copy of TestScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? testType = null,Object? overallScore = null,Object? testDate = null,Object? detailedScores = freezed,Object? createdAt = null,}) {
  return _then(_TestScore(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,testType: null == testType ? _self.testType : testType // ignore: cast_nullable_to_non_nullable
as String,overallScore: null == overallScore ? _self.overallScore : overallScore // ignore: cast_nullable_to_non_nullable
as double,testDate: null == testDate ? _self.testDate : testDate // ignore: cast_nullable_to_non_nullable
as DateTime,detailedScores: freezed == detailedScores ? _self.detailedScores : detailedScores // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
