import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/typography.dart';
import 'form_field_widgets.dart';
import 'phone_input_formatter.dart';

class PersonalInformationSection extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final DateTime? selectedDateOfBirth;
  final ValueChanged<DateTime?> onDateOfBirthChanged;
  final VoidCallback? onFieldChanged;

  const PersonalInformationSection({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.cityController,
    required this.selectedDateOfBirth,
    required this.onDateOfBirthChanged,
    this.onFieldChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Personal Information'),
        const SizedBox(height: 16),
        CustomTextField(
          controller: fullNameController,
          label: 'Full Name',
          isRequired: true,
          onChanged: (_) => onFieldChanged?.call(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: emailController,
          label: 'Email',
          isRequired: true,
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => onFieldChanged?.call(),
        ),
        const SizedBox(height: 16),
        _buildPhoneField(),
        const SizedBox(height: 16),
        DatePickerField(
          label: 'Date of Birth',
          selectedDate: selectedDateOfBirth,
          onDateSelected: onDateOfBirthChanged,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: cityController,
          label: 'City',
          onChanged: (_) => onFieldChanged?.call(),
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
          controller: phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            IndonesianPhoneFormatter(),
          ],
          onChanged: (_) => onFieldChanged?.call(),
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
}
