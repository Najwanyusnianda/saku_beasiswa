// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_setup_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileSetupFormModel {

 String? get studyLevel; String? get fieldOfStudy; List<String> get targetCountries;
/// Create a copy of ProfileSetupFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSetupFormModelCopyWith<ProfileSetupFormModel> get copyWith => _$ProfileSetupFormModelCopyWithImpl<ProfileSetupFormModel>(this as ProfileSetupFormModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSetupFormModel&&(identical(other.studyLevel, studyLevel) || other.studyLevel == studyLevel)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&const DeepCollectionEquality().equals(other.targetCountries, targetCountries));
}


@override
int get hashCode => Object.hash(runtimeType,studyLevel,fieldOfStudy,const DeepCollectionEquality().hash(targetCountries));

@override
String toString() {
  return 'ProfileSetupFormModel(studyLevel: $studyLevel, fieldOfStudy: $fieldOfStudy, targetCountries: $targetCountries)';
}


}

/// @nodoc
abstract mixin class $ProfileSetupFormModelCopyWith<$Res>  {
  factory $ProfileSetupFormModelCopyWith(ProfileSetupFormModel value, $Res Function(ProfileSetupFormModel) _then) = _$ProfileSetupFormModelCopyWithImpl;
@useResult
$Res call({
 String? studyLevel, String? fieldOfStudy, List<String> targetCountries
});




}
/// @nodoc
class _$ProfileSetupFormModelCopyWithImpl<$Res>
    implements $ProfileSetupFormModelCopyWith<$Res> {
  _$ProfileSetupFormModelCopyWithImpl(this._self, this._then);

  final ProfileSetupFormModel _self;
  final $Res Function(ProfileSetupFormModel) _then;

/// Create a copy of ProfileSetupFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studyLevel = freezed,Object? fieldOfStudy = freezed,Object? targetCountries = null,}) {
  return _then(_self.copyWith(
studyLevel: freezed == studyLevel ? _self.studyLevel : studyLevel // ignore: cast_nullable_to_non_nullable
as String?,fieldOfStudy: freezed == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as String?,targetCountries: null == targetCountries ? _self.targetCountries : targetCountries // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _ProfileSetupFormModel implements ProfileSetupFormModel {
  const _ProfileSetupFormModel({this.studyLevel, this.fieldOfStudy, final  List<String> targetCountries = const []}): _targetCountries = targetCountries;
  

@override final  String? studyLevel;
@override final  String? fieldOfStudy;
 final  List<String> _targetCountries;
@override@JsonKey() List<String> get targetCountries {
  if (_targetCountries is EqualUnmodifiableListView) return _targetCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetCountries);
}


/// Create a copy of ProfileSetupFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSetupFormModelCopyWith<_ProfileSetupFormModel> get copyWith => __$ProfileSetupFormModelCopyWithImpl<_ProfileSetupFormModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSetupFormModel&&(identical(other.studyLevel, studyLevel) || other.studyLevel == studyLevel)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&const DeepCollectionEquality().equals(other._targetCountries, _targetCountries));
}


@override
int get hashCode => Object.hash(runtimeType,studyLevel,fieldOfStudy,const DeepCollectionEquality().hash(_targetCountries));

@override
String toString() {
  return 'ProfileSetupFormModel(studyLevel: $studyLevel, fieldOfStudy: $fieldOfStudy, targetCountries: $targetCountries)';
}


}

/// @nodoc
abstract mixin class _$ProfileSetupFormModelCopyWith<$Res> implements $ProfileSetupFormModelCopyWith<$Res> {
  factory _$ProfileSetupFormModelCopyWith(_ProfileSetupFormModel value, $Res Function(_ProfileSetupFormModel) _then) = __$ProfileSetupFormModelCopyWithImpl;
@override @useResult
$Res call({
 String? studyLevel, String? fieldOfStudy, List<String> targetCountries
});




}
/// @nodoc
class __$ProfileSetupFormModelCopyWithImpl<$Res>
    implements _$ProfileSetupFormModelCopyWith<$Res> {
  __$ProfileSetupFormModelCopyWithImpl(this._self, this._then);

  final _ProfileSetupFormModel _self;
  final $Res Function(_ProfileSetupFormModel) _then;

/// Create a copy of ProfileSetupFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studyLevel = freezed,Object? fieldOfStudy = freezed,Object? targetCountries = null,}) {
  return _then(_ProfileSetupFormModel(
studyLevel: freezed == studyLevel ? _self.studyLevel : studyLevel // ignore: cast_nullable_to_non_nullable
as String?,fieldOfStudy: freezed == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as String?,targetCountries: null == targetCountries ? _self._targetCountries : targetCountries // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
