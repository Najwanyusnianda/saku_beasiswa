import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/test_score.dart';
import 'test_type_config.dart';

class TestScoreFormDialog extends StatefulWidget {
  final String title;
  final TestScore? existingScore;
  final String? preselectedTestType;
  final Function(TestScore) onSave;

  const TestScoreFormDialog({
    super.key,
    required this.title,
    this.existingScore,
    this.preselectedTestType,
    required this.onSave,
  });

  @override
  State<TestScoreFormDialog> createState() => _TestScoreFormDialogState();
}

class _TestScoreFormDialogState extends State<TestScoreFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _overallScoreController = TextEditingController();
  final _certificateUrlController = TextEditingController();
  final Map<String, TextEditingController> _skillControllers = {};

  DateTime? _selectedTestDate;
  DateTime? _selectedExpiryDate;
  String? _selectedTestType;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.existingScore != null) {
      final testScore = widget.existingScore!;

      // Normalize test type to ensure it matches the dropdown values
      final normalizedTestType = testScore.testType.toLowerCase();

      // Only set if the test type exists in our configuration
      if (testTypes.containsKey(normalizedTestType)) {
        _selectedTestType = normalizedTestType;
      } else {
        // Fallback: try to find a matching test type by name
        String? matchingKey;
        for (final entry in testTypes.entries) {
          if (entry.value.name.toLowerCase() ==
              testScore.testType.toLowerCase()) {
            matchingKey = entry.key;
            break;
          }
        }
        if (matchingKey != null) {
          _selectedTestType = matchingKey;
        }
      }

      _overallScoreController.text = testScore.overallScore.toString();
      _selectedTestDate = testScore.testDate;

      // Parse existing detailed scores into skill controllers
      if (_selectedTestType != null) {
        _setupSkillControllers(_selectedTestType!);
        final skillScores = _parseDetailedScores(
          testScore.detailedScores,
          testTypes[_selectedTestType]?.skillNames ?? [],
        );
        for (final entry in skillScores.entries) {
          _skillControllers[entry.key]?.text = entry.value;
        }

        // Auto-calculate expiry date
        final testType = testTypes[_selectedTestType];
        if (testType != null) {
          _selectedExpiryDate = testScore.testDate.add(testType.validityPeriod);
        }
      }

      // Load certificate URL from dedicated field
      if (testScore.certificateUrl != null &&
          testScore.certificateUrl!.isNotEmpty) {
        _certificateUrlController.text = testScore.certificateUrl!;
      }
    } else if (widget.preselectedTestType != null) {
      _selectedTestType = widget.preselectedTestType;
      _setupSkillControllers(widget.preselectedTestType!);
    }
  }

  @override
  void dispose() {
    _overallScoreController.dispose();
    _certificateUrlController.dispose();
    for (final controller in _skillControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Test Type Dropdown
              DropdownButtonFormField<String>(
                value:
                    _selectedTestType != null &&
                        testTypes.containsKey(_selectedTestType)
                    ? _selectedTestType
                    : null,
                decoration: const InputDecoration(labelText: 'Test Type *'),
                items: testTypes.entries
                    .map(
                      (entry) => DropdownMenuItem(
                        value: entry.key,
                        child: Row(
                          children: [
                            Text(entry.value.emoji),
                            const SizedBox(width: 8),
                            Text(entry.value.name),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTestType = value;
                    if (value != null) {
                      _setupSkillControllers(value);
                      // Auto-calculate expiry date when test type changes
                      if (_selectedTestDate != null) {
                        final testType = testTypes[value];
                        if (testType != null) {
                          _selectedExpiryDate = _selectedTestDate!.add(
                            testType.validityPeriod,
                          );
                        }
                      }
                    }
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a test type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Overall Score
              TextFormField(
                controller: _overallScoreController,
                decoration: InputDecoration(
                  labelText: 'Overall Score *',
                  hintText: _selectedTestType != null
                      ? 'Max: ${testTypes[_selectedTestType!]?.maxScore ?? ''}'
                      : 'Enter your overall score',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Score cannot be empty';
                  }
                  final score = double.tryParse(value.trim());
                  if (score == null) {
                    return 'Please enter a valid number';
                  }
                  if (_selectedTestType != null) {
                    final maxScore =
                        testTypes[_selectedTestType!]?.maxScore ??
                        double.infinity;
                    if (score > maxScore) {
                      return 'Score cannot exceed $maxScore';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Skill-specific scores
              if (_selectedTestType != null &&
                  _skillControllers.isNotEmpty) ...[
                Text(
                  'Skill Breakdown (optional)',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                ...testTypes[_selectedTestType!]!.skillNames.map((skill) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: _skillControllers[skill],
                      decoration: InputDecoration(
                        labelText: skill,
                        hintText: 'Enter $skill score',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
              ],

              // Test Date
              ListTile(
                title: Text(
                  _selectedTestDate == null
                      ? 'Select Test Date *'
                      : 'Test Date: ${DateFormat('MMM dd, yyyy').format(_selectedTestDate!)}',
                ),
                leading: const Icon(Icons.calendar_today),
                onTap: () => _selectTestDate(),
                contentPadding: EdgeInsets.zero,
              ),

              // Expiry Date
              if (_selectedExpiryDate != null)
                ListTile(
                  title: Text(
                    'Expires: ${DateFormat('MMM dd, yyyy').format(_selectedExpiryDate!)}',
                  ),
                  leading: const Icon(Icons.schedule),
                  trailing: TextButton(
                    onPressed: () => _selectExpiryDate(),
                    child: const Text('Change'),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),

              const SizedBox(height: 16),

              // Certificate URL
              TextFormField(
                controller: _certificateUrlController,
                decoration: const InputDecoration(
                  labelText: 'Certificate URL (optional)',
                  hintText: 'https://example.com/certificate.pdf',
                  prefixIcon: Icon(Icons.link),
                ),
                keyboardType: TextInputType.url,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveTestScore,
          child: Text(widget.existingScore == null ? 'Add' : 'Update'),
        ),
      ],
    );
  }

  void _setupSkillControllers(String testTypeId) {
    // Clear existing controllers
    for (final controller in _skillControllers.values) {
      controller.dispose();
    }
    _skillControllers.clear();

    // Setup new controllers for selected test type
    final testType = testTypes[testTypeId];
    if (testType != null) {
      for (final skill in testType.skillNames) {
        _skillControllers[skill] = TextEditingController();
      }
    }
  }

  Future<void> _selectTestDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedTestDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        _selectedTestDate = date;
        // Auto-calculate expiry date when test date changes
        if (_selectedTestType != null) {
          final testType = testTypes[_selectedTestType!];
          if (testType != null) {
            _selectedExpiryDate = date.add(testType.validityPeriod);
          }
        }
      });
    }
  }

  Future<void> _selectExpiryDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedExpiryDate ?? DateTime.now(),
      firstDate: _selectedTestDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 2555)), // ~7 years
    );

    if (date != null) {
      setState(() {
        _selectedExpiryDate = date;
      });
    }
  }

  void _saveTestScore() {
    if (!_formKey.currentState!.validate() || _selectedTestDate == null) {
      if (_selectedTestDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a test date')),
        );
      }
      return;
    }

    // Build detailed scores from skill controllers
    String? detailedScores;
    final skillScores = <String>[];

    if (_selectedTestType != null && _skillControllers.isNotEmpty) {
      final testType = testTypes[_selectedTestType!]!;
      for (final skill in testType.skillNames) {
        final controller = _skillControllers[skill];
        if (controller != null && controller.text.trim().isNotEmpty) {
          // Use abbreviations for storage
          final abbr = _getSkillAbbreviation(skill);
          skillScores.add('$abbr:${controller.text.trim()}');
        }
      }
    }

    // Don't add certificate URL to detailed scores anymore
    // if (_certificateUrlController.text.trim().isNotEmpty) {
    //   skillScores.add('cert:${_certificateUrlController.text.trim()}');
    // }

    if (skillScores.isNotEmpty) {
      detailedScores = skillScores.join(', ');
    }

    final testScore = TestScore(
      id: widget.existingScore?.id ?? 0,
      userId:
          widget.existingScore?.userId ??
          0, // Will be set by the calling screen
      testType: _selectedTestType!,
      overallScore: double.parse(_overallScoreController.text.trim()),
      testDate: _selectedTestDate!,
      detailedScores: detailedScores,
      certificateUrl: _certificateUrlController.text.trim().isNotEmpty
          ? _certificateUrlController.text.trim()
          : null,
      createdAt: widget.existingScore?.createdAt ?? DateTime.now(),
    );

    widget.onSave(testScore);
    Navigator.of(context).pop();
  }

  Map<String, String> _parseDetailedScores(
    String? detailedScores,
    List<String> skillNames,
  ) {
    final Map<String, String> result = {};
    if (detailedScores == null || detailedScores.isEmpty) return result;

    // Try to parse format like "L:8.0, R:7.5, W:7.0, S:7.5"
    final parts = detailedScores.split(',');
    for (final part in parts) {
      final trimmed = part.trim();
      if (trimmed.contains(':')) {
        final keyValue = trimmed.split(':');
        if (keyValue.length == 2) {
          final key = keyValue[0].trim();
          final value = keyValue[1].trim();

          // Skip certificate URL
          if (key.toLowerCase() == 'cert') continue;

          // Map abbreviations to full skill names
          final fullSkillName = _mapSkillAbbreviation(key, skillNames);
          if (fullSkillName != null) {
            result[fullSkillName] = value;
          }
        }
      }
    }

    return result;
  }

  String? _mapSkillAbbreviation(String abbreviation, List<String> skillNames) {
    final abbr = abbreviation.toLowerCase();
    for (final skill in skillNames) {
      final skillLower = skill.toLowerCase();
      if (skillLower.startsWith(abbr) || skillLower.contains(abbr)) {
        return skill;
      }
    }
    return null;
  }

  String _getSkillAbbreviation(String skill) {
    final skillLower = skill.toLowerCase();
    if (skillLower.contains('listening')) return 'L';
    if (skillLower.contains('reading')) return 'R';
    if (skillLower.contains('writing')) return 'W';
    if (skillLower.contains('speaking')) return 'S';
    if (skillLower.contains('verbal')) return 'V';
    if (skillLower.contains('quantitative')) return 'Q';
    if (skillLower.contains('analytical')) return 'A';
    if (skillLower.contains('integrated')) return 'IR';
    return skill.substring(0, 1).toUpperCase();
  }
}
