import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/user_profile.dart';
import '../../../application/edit_profile_service.dart';
import 'profile_photo_section.dart';
import 'personal_information_section.dart';
import 'academic_information_section.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  final UserProfile initialProfile;
  final VoidCallback? onFieldChanged;

  const EditProfileForm({
    super.key,
    required this.initialProfile,
    this.onFieldChanged,
  });

  @override
  ConsumerState<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _cityController;
  late final TextEditingController _institutionController;
  late final TextEditingController _majorFieldController;
  late final TextEditingController _currentGpaController;

  DateTime? _selectedDateOfBirth;
  DateTime? _selectedExpectedGraduation;
  String? _selectedEducationLevel;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final profile = widget.initialProfile;

    _fullNameController = TextEditingController(text: profile.fullName);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phoneNumber ?? '');
    _cityController = TextEditingController(text: profile.city ?? '');
    _institutionController = TextEditingController(text: profile.institution);
    _majorFieldController = TextEditingController(text: profile.majorField);
    _currentGpaController = TextEditingController(
      text: profile.currentGpa?.toString() ?? '',
    );

    _selectedDateOfBirth = profile.dateOfBirth;
    _selectedExpectedGraduation = profile.expectedGraduation;
    _selectedEducationLevel = profile.currentEducationLevel;
  }

  void _onFieldChanged() {
    widget.onFieldChanged?.call();
    _updateFormData();
  }

  void _updateFormData() {
    ref
        .read(editProfileNotifierProvider.notifier)
        .updateFormData(
          fullName: _fullNameController.text,
          email: _emailController.text,
          phoneNumber: _phoneController.text.isEmpty
              ? null
              : _phoneController.text,
          dateOfBirth: _selectedDateOfBirth,
          city: _cityController.text.isEmpty ? null : _cityController.text,
          currentEducationLevel:
              _selectedEducationLevel ??
              widget.initialProfile.currentEducationLevel,
          institution: _institutionController.text,
          majorField: _majorFieldController.text,
          currentGpa: _currentGpaController.text.isEmpty
              ? null
              : double.tryParse(_currentGpaController.text),
          expectedGraduation: _selectedExpectedGraduation,
        );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _institutionController.dispose();
    _majorFieldController.dispose();
    _currentGpaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Photo Section
        ProfilePhotoSection(
          profilePhotoPath: widget.initialProfile.profilePhotoPath,
          onPhotoTap: _handlePhotoTap,
        ),
        const SizedBox(height: 32),

        // Personal Information Section
        PersonalInformationSection(
          fullNameController: _fullNameController,
          emailController: _emailController,
          phoneController: _phoneController,
          cityController: _cityController,
          selectedDateOfBirth: _selectedDateOfBirth,
          onDateOfBirthChanged: (date) {
            setState(() {
              _selectedDateOfBirth = date;
            });
            _onFieldChanged();
          },
          onFieldChanged: _onFieldChanged,
        ),
        const SizedBox(height: 32),

        // Academic Information Section
        AcademicInformationSection(
          institutionController: _institutionController,
          majorFieldController: _majorFieldController,
          currentGpaController: _currentGpaController,
          selectedEducationLevel: _selectedEducationLevel,
          selectedExpectedGraduation: _selectedExpectedGraduation,
          onEducationLevelChanged: (level) {
            setState(() {
              _selectedEducationLevel = level;
            });
            _onFieldChanged();
          },
          onExpectedGraduationChanged: (date) {
            setState(() {
              _selectedExpectedGraduation = date;
            });
            _onFieldChanged();
          },
          onFieldChanged: _onFieldChanged,
        ),
      ],
    );
  }

  void _handlePhotoTap() {
    // TODO: Implement photo picker functionality
    // This could show a bottom sheet with camera/gallery options
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Photo picker functionality coming soon!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
