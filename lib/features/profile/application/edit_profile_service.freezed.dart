// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProfileState {

 bool get isLoading; bool get hasUnsavedChanges; bool get isFormValid; UserProfile? get currentProfile; UserProfile? get formData; String? get errorMessage;
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileStateCopyWith<EditProfileState> get copyWith => _$EditProfileStateCopyWithImpl<EditProfileState>(this as EditProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.currentProfile, currentProfile) || other.currentProfile == currentProfile)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasUnsavedChanges,isFormValid,currentProfile,formData,errorMessage);

@override
String toString() {
  return 'EditProfileState(isLoading: $isLoading, hasUnsavedChanges: $hasUnsavedChanges, isFormValid: $isFormValid, currentProfile: $currentProfile, formData: $formData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditProfileStateCopyWith<$Res>  {
  factory $EditProfileStateCopyWith(EditProfileState value, $Res Function(EditProfileState) _then) = _$EditProfileStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool hasUnsavedChanges, bool isFormValid, UserProfile? currentProfile, UserProfile? formData, String? errorMessage
});


$UserProfileCopyWith<$Res>? get currentProfile;$UserProfileCopyWith<$Res>? get formData;

}
/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._self, this._then);

  final EditProfileState _self;
  final $Res Function(EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? hasUnsavedChanges = null,Object? isFormValid = null,Object? currentProfile = freezed,Object? formData = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,currentProfile: freezed == currentProfile ? _self.currentProfile : currentProfile // ignore: cast_nullable_to_non_nullable
as UserProfile?,formData: freezed == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as UserProfile?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get currentProfile {
    if (_self.currentProfile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.currentProfile!, (value) {
    return _then(_self.copyWith(currentProfile: value));
  });
}/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get formData {
    if (_self.formData == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.formData!, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}


/// @nodoc


class _EditProfileState implements EditProfileState {
  const _EditProfileState({this.isLoading = false, this.hasUnsavedChanges = false, this.isFormValid = false, this.currentProfile, this.formData, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasUnsavedChanges;
@override@JsonKey() final  bool isFormValid;
@override final  UserProfile? currentProfile;
@override final  UserProfile? formData;
@override final  String? errorMessage;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileStateCopyWith<_EditProfileState> get copyWith => __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.currentProfile, currentProfile) || other.currentProfile == currentProfile)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasUnsavedChanges,isFormValid,currentProfile,formData,errorMessage);

@override
String toString() {
  return 'EditProfileState(isLoading: $isLoading, hasUnsavedChanges: $hasUnsavedChanges, isFormValid: $isFormValid, currentProfile: $currentProfile, formData: $formData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditProfileStateCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(_EditProfileState value, $Res Function(_EditProfileState) _then) = __$EditProfileStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool hasUnsavedChanges, bool isFormValid, UserProfile? currentProfile, UserProfile? formData, String? errorMessage
});


@override $UserProfileCopyWith<$Res>? get currentProfile;@override $UserProfileCopyWith<$Res>? get formData;

}
/// @nodoc
class __$EditProfileStateCopyWithImpl<$Res>
    implements _$EditProfileStateCopyWith<$Res> {
  __$EditProfileStateCopyWithImpl(this._self, this._then);

  final _EditProfileState _self;
  final $Res Function(_EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? hasUnsavedChanges = null,Object? isFormValid = null,Object? currentProfile = freezed,Object? formData = freezed,Object? errorMessage = freezed,}) {
  return _then(_EditProfileState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,currentProfile: freezed == currentProfile ? _self.currentProfile : currentProfile // ignore: cast_nullable_to_non_nullable
as UserProfile?,formData: freezed == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as UserProfile?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get currentProfile {
    if (_self.currentProfile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.currentProfile!, (value) {
    return _then(_self.copyWith(currentProfile: value));
  });
}/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get formData {
    if (_self.formData == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.formData!, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

// dart format on
