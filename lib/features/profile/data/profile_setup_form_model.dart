import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_setup_form_model.freezed.dart';

// Using Freezed for an immutable data class with nice utilities.
@freezed
abstract class ProfileSetupFormModel with _$ProfileSetupFormModel {
  const factory ProfileSetupFormModel({
    String? studyLevel,
    String? fieldOfStudy,
    @Default([]) List<String> targetCountries,
  }) = _ProfileSetupFormModel;
}
