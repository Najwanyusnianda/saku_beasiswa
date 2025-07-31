// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scholarship_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScholarshipFilter {

// Search query
 String get searchQuery;// Education level filters
 List<String> get educationLevels;// ['S1', 'S2', 'S3']
// Target countries
 List<String> get targetCountries;// ['USA', 'UK', 'Australia']
// Subject areas/fields of study
 List<String> get subjectAreas;// ['Engineering', 'Computer Science']
// Funding type filter
 FundingTypeFilter? get fundingType;// Deadline filter
 DeadlineFilter? get deadlineFilter;// GPA range
 double? get minGpa; double? get maxGpa;// Language requirements
 List<String> get languageRequirements;// ['IELTS', 'TOEFL']
// Sort options
 SortOption get sortBy; SortDirection get sortDirection;
/// Create a copy of ScholarshipFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScholarshipFilterCopyWith<ScholarshipFilter> get copyWith => _$ScholarshipFilterCopyWithImpl<ScholarshipFilter>(this as ScholarshipFilter, _$identity);

  /// Serializes this ScholarshipFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScholarshipFilter&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.educationLevels, educationLevels)&&const DeepCollectionEquality().equals(other.targetCountries, targetCountries)&&const DeepCollectionEquality().equals(other.subjectAreas, subjectAreas)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&(identical(other.deadlineFilter, deadlineFilter) || other.deadlineFilter == deadlineFilter)&&(identical(other.minGpa, minGpa) || other.minGpa == minGpa)&&(identical(other.maxGpa, maxGpa) || other.maxGpa == maxGpa)&&const DeepCollectionEquality().equals(other.languageRequirements, languageRequirements)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchQuery,const DeepCollectionEquality().hash(educationLevels),const DeepCollectionEquality().hash(targetCountries),const DeepCollectionEquality().hash(subjectAreas),fundingType,deadlineFilter,minGpa,maxGpa,const DeepCollectionEquality().hash(languageRequirements),sortBy,sortDirection);

@override
String toString() {
  return 'ScholarshipFilter(searchQuery: $searchQuery, educationLevels: $educationLevels, targetCountries: $targetCountries, subjectAreas: $subjectAreas, fundingType: $fundingType, deadlineFilter: $deadlineFilter, minGpa: $minGpa, maxGpa: $maxGpa, languageRequirements: $languageRequirements, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class $ScholarshipFilterCopyWith<$Res>  {
  factory $ScholarshipFilterCopyWith(ScholarshipFilter value, $Res Function(ScholarshipFilter) _then) = _$ScholarshipFilterCopyWithImpl;
@useResult
$Res call({
 String searchQuery, List<String> educationLevels, List<String> targetCountries, List<String> subjectAreas, FundingTypeFilter? fundingType, DeadlineFilter? deadlineFilter, double? minGpa, double? maxGpa, List<String> languageRequirements, SortOption sortBy, SortDirection sortDirection
});




}
/// @nodoc
class _$ScholarshipFilterCopyWithImpl<$Res>
    implements $ScholarshipFilterCopyWith<$Res> {
  _$ScholarshipFilterCopyWithImpl(this._self, this._then);

  final ScholarshipFilter _self;
  final $Res Function(ScholarshipFilter) _then;

/// Create a copy of ScholarshipFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? educationLevels = null,Object? targetCountries = null,Object? subjectAreas = null,Object? fundingType = freezed,Object? deadlineFilter = freezed,Object? minGpa = freezed,Object? maxGpa = freezed,Object? languageRequirements = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,educationLevels: null == educationLevels ? _self.educationLevels : educationLevels // ignore: cast_nullable_to_non_nullable
as List<String>,targetCountries: null == targetCountries ? _self.targetCountries : targetCountries // ignore: cast_nullable_to_non_nullable
as List<String>,subjectAreas: null == subjectAreas ? _self.subjectAreas : subjectAreas // ignore: cast_nullable_to_non_nullable
as List<String>,fundingType: freezed == fundingType ? _self.fundingType : fundingType // ignore: cast_nullable_to_non_nullable
as FundingTypeFilter?,deadlineFilter: freezed == deadlineFilter ? _self.deadlineFilter : deadlineFilter // ignore: cast_nullable_to_non_nullable
as DeadlineFilter?,minGpa: freezed == minGpa ? _self.minGpa : minGpa // ignore: cast_nullable_to_non_nullable
as double?,maxGpa: freezed == maxGpa ? _self.maxGpa : maxGpa // ignore: cast_nullable_to_non_nullable
as double?,languageRequirements: null == languageRequirements ? _self.languageRequirements : languageRequirements // ignore: cast_nullable_to_non_nullable
as List<String>,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortOption,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as SortDirection,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ScholarshipFilter implements ScholarshipFilter {
  const _ScholarshipFilter({this.searchQuery = '', final  List<String> educationLevels = const [], final  List<String> targetCountries = const [], final  List<String> subjectAreas = const [], this.fundingType, this.deadlineFilter, this.minGpa, this.maxGpa, final  List<String> languageRequirements = const [], this.sortBy = SortOption.matchScore, this.sortDirection = SortDirection.descending}): _educationLevels = educationLevels,_targetCountries = targetCountries,_subjectAreas = subjectAreas,_languageRequirements = languageRequirements;
  factory _ScholarshipFilter.fromJson(Map<String, dynamic> json) => _$ScholarshipFilterFromJson(json);

// Search query
@override@JsonKey() final  String searchQuery;
// Education level filters
 final  List<String> _educationLevels;
// Education level filters
@override@JsonKey() List<String> get educationLevels {
  if (_educationLevels is EqualUnmodifiableListView) return _educationLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_educationLevels);
}

// ['S1', 'S2', 'S3']
// Target countries
 final  List<String> _targetCountries;
// ['S1', 'S2', 'S3']
// Target countries
@override@JsonKey() List<String> get targetCountries {
  if (_targetCountries is EqualUnmodifiableListView) return _targetCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetCountries);
}

// ['USA', 'UK', 'Australia']
// Subject areas/fields of study
 final  List<String> _subjectAreas;
// ['USA', 'UK', 'Australia']
// Subject areas/fields of study
@override@JsonKey() List<String> get subjectAreas {
  if (_subjectAreas is EqualUnmodifiableListView) return _subjectAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjectAreas);
}

// ['Engineering', 'Computer Science']
// Funding type filter
@override final  FundingTypeFilter? fundingType;
// Deadline filter
@override final  DeadlineFilter? deadlineFilter;
// GPA range
@override final  double? minGpa;
@override final  double? maxGpa;
// Language requirements
 final  List<String> _languageRequirements;
// Language requirements
@override@JsonKey() List<String> get languageRequirements {
  if (_languageRequirements is EqualUnmodifiableListView) return _languageRequirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languageRequirements);
}

// ['IELTS', 'TOEFL']
// Sort options
@override@JsonKey() final  SortOption sortBy;
@override@JsonKey() final  SortDirection sortDirection;

/// Create a copy of ScholarshipFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScholarshipFilterCopyWith<_ScholarshipFilter> get copyWith => __$ScholarshipFilterCopyWithImpl<_ScholarshipFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScholarshipFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScholarshipFilter&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._educationLevels, _educationLevels)&&const DeepCollectionEquality().equals(other._targetCountries, _targetCountries)&&const DeepCollectionEquality().equals(other._subjectAreas, _subjectAreas)&&(identical(other.fundingType, fundingType) || other.fundingType == fundingType)&&(identical(other.deadlineFilter, deadlineFilter) || other.deadlineFilter == deadlineFilter)&&(identical(other.minGpa, minGpa) || other.minGpa == minGpa)&&(identical(other.maxGpa, maxGpa) || other.maxGpa == maxGpa)&&const DeepCollectionEquality().equals(other._languageRequirements, _languageRequirements)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchQuery,const DeepCollectionEquality().hash(_educationLevels),const DeepCollectionEquality().hash(_targetCountries),const DeepCollectionEquality().hash(_subjectAreas),fundingType,deadlineFilter,minGpa,maxGpa,const DeepCollectionEquality().hash(_languageRequirements),sortBy,sortDirection);

@override
String toString() {
  return 'ScholarshipFilter(searchQuery: $searchQuery, educationLevels: $educationLevels, targetCountries: $targetCountries, subjectAreas: $subjectAreas, fundingType: $fundingType, deadlineFilter: $deadlineFilter, minGpa: $minGpa, maxGpa: $maxGpa, languageRequirements: $languageRequirements, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class _$ScholarshipFilterCopyWith<$Res> implements $ScholarshipFilterCopyWith<$Res> {
  factory _$ScholarshipFilterCopyWith(_ScholarshipFilter value, $Res Function(_ScholarshipFilter) _then) = __$ScholarshipFilterCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, List<String> educationLevels, List<String> targetCountries, List<String> subjectAreas, FundingTypeFilter? fundingType, DeadlineFilter? deadlineFilter, double? minGpa, double? maxGpa, List<String> languageRequirements, SortOption sortBy, SortDirection sortDirection
});




}
/// @nodoc
class __$ScholarshipFilterCopyWithImpl<$Res>
    implements _$ScholarshipFilterCopyWith<$Res> {
  __$ScholarshipFilterCopyWithImpl(this._self, this._then);

  final _ScholarshipFilter _self;
  final $Res Function(_ScholarshipFilter) _then;

/// Create a copy of ScholarshipFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? educationLevels = null,Object? targetCountries = null,Object? subjectAreas = null,Object? fundingType = freezed,Object? deadlineFilter = freezed,Object? minGpa = freezed,Object? maxGpa = freezed,Object? languageRequirements = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_ScholarshipFilter(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,educationLevels: null == educationLevels ? _self._educationLevels : educationLevels // ignore: cast_nullable_to_non_nullable
as List<String>,targetCountries: null == targetCountries ? _self._targetCountries : targetCountries // ignore: cast_nullable_to_non_nullable
as List<String>,subjectAreas: null == subjectAreas ? _self._subjectAreas : subjectAreas // ignore: cast_nullable_to_non_nullable
as List<String>,fundingType: freezed == fundingType ? _self.fundingType : fundingType // ignore: cast_nullable_to_non_nullable
as FundingTypeFilter?,deadlineFilter: freezed == deadlineFilter ? _self.deadlineFilter : deadlineFilter // ignore: cast_nullable_to_non_nullable
as DeadlineFilter?,minGpa: freezed == minGpa ? _self.minGpa : minGpa // ignore: cast_nullable_to_non_nullable
as double?,maxGpa: freezed == maxGpa ? _self.maxGpa : maxGpa // ignore: cast_nullable_to_non_nullable
as double?,languageRequirements: null == languageRequirements ? _self._languageRequirements : languageRequirements // ignore: cast_nullable_to_non_nullable
as List<String>,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortOption,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as SortDirection,
  ));
}


}


/// @nodoc
mixin _$QuickFilter {

 String get id; String get label; String get emoji; bool get isSelected; QuickFilterType get type; String? get value;
/// Create a copy of QuickFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickFilterCopyWith<QuickFilter> get copyWith => _$QuickFilterCopyWithImpl<QuickFilter>(this as QuickFilter, _$identity);

  /// Serializes this QuickFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickFilter&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,emoji,isSelected,type,value);

@override
String toString() {
  return 'QuickFilter(id: $id, label: $label, emoji: $emoji, isSelected: $isSelected, type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class $QuickFilterCopyWith<$Res>  {
  factory $QuickFilterCopyWith(QuickFilter value, $Res Function(QuickFilter) _then) = _$QuickFilterCopyWithImpl;
@useResult
$Res call({
 String id, String label, String emoji, bool isSelected, QuickFilterType type, String? value
});




}
/// @nodoc
class _$QuickFilterCopyWithImpl<$Res>
    implements $QuickFilterCopyWith<$Res> {
  _$QuickFilterCopyWithImpl(this._self, this._then);

  final QuickFilter _self;
  final $Res Function(QuickFilter) _then;

/// Create a copy of QuickFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? emoji = null,Object? isSelected = null,Object? type = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuickFilterType,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _QuickFilter implements QuickFilter {
  const _QuickFilter({required this.id, required this.label, required this.emoji, this.isSelected = false, required this.type, this.value});
  factory _QuickFilter.fromJson(Map<String, dynamic> json) => _$QuickFilterFromJson(json);

@override final  String id;
@override final  String label;
@override final  String emoji;
@override@JsonKey() final  bool isSelected;
@override final  QuickFilterType type;
@override final  String? value;

/// Create a copy of QuickFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickFilterCopyWith<_QuickFilter> get copyWith => __$QuickFilterCopyWithImpl<_QuickFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuickFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickFilter&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,emoji,isSelected,type,value);

@override
String toString() {
  return 'QuickFilter(id: $id, label: $label, emoji: $emoji, isSelected: $isSelected, type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class _$QuickFilterCopyWith<$Res> implements $QuickFilterCopyWith<$Res> {
  factory _$QuickFilterCopyWith(_QuickFilter value, $Res Function(_QuickFilter) _then) = __$QuickFilterCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String emoji, bool isSelected, QuickFilterType type, String? value
});




}
/// @nodoc
class __$QuickFilterCopyWithImpl<$Res>
    implements _$QuickFilterCopyWith<$Res> {
  __$QuickFilterCopyWithImpl(this._self, this._then);

  final _QuickFilter _self;
  final $Res Function(_QuickFilter) _then;

/// Create a copy of QuickFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? emoji = null,Object? isSelected = null,Object? type = null,Object? value = freezed,}) {
  return _then(_QuickFilter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuickFilterType,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
