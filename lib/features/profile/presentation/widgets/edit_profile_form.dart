import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/models/user_profile.dart';
import '../../application/edit_profile_service.dart';

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

  final List<String> _educationLevels = [
    'SMA/SMK',
    'D3 (Diploma)',
    'S1 (Sarjana)',
    'S2 (Magister)',
    'S3 (Doktor)',
  ];

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

    // Add listeners
    _fullNameController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
    _phoneController.addListener(_onFieldChanged);
    _cityController.addListener(_onFieldChanged);
    _institutionController.addListener(_onFieldChanged);
    _majorFieldController.addListener(_onFieldChanged);
    _currentGpaController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    widget.onFieldChanged?.call();
    _updateFormData();
  }

  void _updateFormData() {
    ref.read(editProfileNotifierProvider.notifier).updateFormData(
      fullName: _fullNameController.text,
      email: _emailController.text,
      phoneNumber: _phoneController.text.isEmpty ? null : _phoneController.text,
      dateOfBirth: _selectedDateOfBirth,
      city: _cityController.text.isEmpty ? null : _cityController.text,
      currentEducationLevel: _selectedEducationLevel ?? widget.initialProfile.currentEducationLevel,
      institution: _institutionController.text,
      majorField: _majorFieldController.text,
      currentGpa: _currentGpaController.text.isEmpty ? null : double.tryParse(_currentGpaController.text),
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
        _buildProfilePhotoSection(),
        const SizedBox(height: 32),

        // Personal Information
        _buildSectionHeader('Personal Information'),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _fullNameController,
          label: 'Full Name',
          isRequired: true,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _emailController,
          label: 'Email',
          isRequired: true,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        _buildPhoneField(),
        const SizedBox(height: 16),
        _buildDateField(
          label: 'Date of Birth',
          selectedDate: _selectedDateOfBirth,
          onDateSelected: (date) {
            setState(() {
              _selectedDateOfBirth = date;
            });
            _onFieldChanged();
          },
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _cityController,
          label: 'City',
        ),
        const SizedBox(height: 32),

        // Education Information
        _buildSectionHeader('Education Information'),
        const SizedBox(height: 16),
        _buildEducationLevelDropdown(),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _institutionController,
          label: 'Institution',
          isRequired: true,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _majorFieldController,
          label: 'Major/Field of Study',
          isRequired: true,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _currentGpaController,
          label: 'Current GPA',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
        ),
        const SizedBox(height: 16),
        _buildDateField(
          label: 'Expected Graduation',
          selectedDate: _selectedExpectedGraduation,
          onDateSelected: (date) {
            setState(() {
              _selectedExpectedGraduation = date;
            });
            _onFieldChanged();
          },
        ),
      ],
    );
  }

  Widget _buildProfilePhotoSection() {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceVariant,
                  border: Border.all(
                    color: AppColors.border,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    border: Border.all(
                      color: AppColors.surface,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Tap to change photo',
            style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.lightTextTheme.headlineSmall?.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isRequired = false,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w500,
            ),
            children: isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: AppColors.error,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            hintStyle: AppTypography.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            _IndonesianPhoneFormatter(),
          ],
          decoration: InputDecoration(
            hintText: '0812-3456-7890',
            hintStyle: AppTypography.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            prefixText: '+62 ',
            prefixStyle: AppTypography.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.onSurface,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationLevelDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Current Education Level',
            style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedEducationLevel,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items: _educationLevels.map((level) {
            return DropdownMenuItem<String>(
              value: level,
              child: Text(
                level,
                style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedEducationLevel = value;
            });
            _onFieldChanged();
          },
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime? selectedDate,
    required ValueChanged<DateTime?> onDateSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2050),
            );
            onDateSelected(date);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
              color: AppColors.surface,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: AppColors.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Text(
                  selectedDate != null
                      ? DateFormat('dd MMM yyyy').format(selectedDate)
                      : 'Select $label',
                  style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
                    color: selectedDate != null
                        ? AppColors.onSurface
                        : AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _IndonesianPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    
    if (text.isEmpty) {
      return newValue;
    }

    // Remove any existing formatting
    final digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');
    
    // Format: 0812-3456-7890
    String formatted = '';
    for (int i = 0; i < digitsOnly.length && i < 12; i++) {
      if (i == 4 || i == 8) {
        formatted += '-';
      }
      formatted += digitsOnly[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
