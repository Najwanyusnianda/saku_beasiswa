import 'package:flutter/material.dart';
import '../test_type_config.dart';

class TestTypeSelector extends StatelessWidget {
  final String? selectedTestType;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const TestTypeSelector({
    super.key,
    required this.selectedTestType,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title with better hierarchy
        Text(
          'Test Information',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        
        DropdownButtonFormField<String>(
          value: selectedTestType != null && testTypes.containsKey(selectedTestType)
              ? selectedTestType
              : null,
          decoration: InputDecoration(
            labelText: 'Test Type',
            helperText: 'Required field',
            helperStyle: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          items: testTypes.entries
              .map(
                (entry) => DropdownMenuItem(
                  value: entry.key,
                  child: Row(
                    children: [
                      Text(
                        entry.value.emoji,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          entry.value.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          validator: validator,
          isExpanded: true,
          dropdownColor: Theme.of(context).colorScheme.surface,
        ),
        
        // Show description for selected test type
        if (selectedTestType != null && testTypes[selectedTestType] != null)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    testTypes[selectedTestType]!.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
