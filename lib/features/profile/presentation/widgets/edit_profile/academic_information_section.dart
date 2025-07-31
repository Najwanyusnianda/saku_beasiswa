import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'form_field_widgets.dart';

class AcademicInformationSection extends StatelessWidget {
  final TextEditingController institutionController;
  final TextEditingController majorFieldController;
  final TextEditingController currentGpaController;
  final String? selectedEducationLevel;
  final DateTime? selectedExpectedGraduation;
  final ValueChanged<String?> onEducationLevelChanged;
  final ValueChanged<DateTime?> onExpectedGraduationChanged;
  final VoidCallback? onFieldChanged;

  static const List<String> educationLevels = [
    'SMA/SMK',
    'D3 (Diploma)',
    'S1 (Sarjana)',
    'S2 (Magister)',
    'S3 (Doktor)',
  ];

  const AcademicInformationSection({
    super.key,
    required this.institutionController,
    required this.majorFieldController,
    required this.currentGpaController,
    required this.selectedEducationLevel,
    required this.selectedExpectedGraduation,
    required this.onEducationLevelChanged,
    required this.onExpectedGraduationChanged,
    this.onFieldChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Education Information'),
        const SizedBox(height: 16),
        DropdownField<String>(
          label: 'Current Education Level',
          value: selectedEducationLevel,
          items: educationLevels,
          getDisplayText: (level) => level,
          onChanged: (value) {
            onEducationLevelChanged(value);
            onFieldChanged?.call();
          },
          isRequired: true,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: institutionController,
          label: 'Institution',
          isRequired: true,
          onChanged: (_) => onFieldChanged?.call(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: majorFieldController,
          label: 'Major/Field of Study',
          isRequired: true,
          onChanged: (_) => onFieldChanged?.call(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: currentGpaController,
          label: 'Current GPA',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          onChanged: (_) => onFieldChanged?.call(),
        ),
        const SizedBox(height: 16),
        DatePickerField(
          label: 'Expected Graduation',
          selectedDate: selectedExpectedGraduation,
          onDateSelected: onExpectedGraduationChanged,
        ),
      ],
    );
  }
}
