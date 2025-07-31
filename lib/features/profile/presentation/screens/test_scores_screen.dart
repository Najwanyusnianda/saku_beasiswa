import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../application/test_score_service.dart';
import '../../application/profile_service.dart';
import '../../domain/models/test_score.dart';

class TestScoresScreen extends ConsumerStatefulWidget {
  const TestScoresScreen({super.key});

  @override
  ConsumerState<TestScoresScreen> createState() => _TestScoresScreenState();
}

class _TestScoresScreenState extends ConsumerState<TestScoresScreen> {
  final _formKey = GlobalKey<FormState>();
  final _testTypeController = TextEditingController();
  final _overallScoreController = TextEditingController();
  final _detailedScoresController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _testTypeController.dispose();
    _overallScoreController.dispose();
    _detailedScoresController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Scores'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null) {
            return const Center(
              child: Text('Please set up your profile first'),
            );
          }
          
          final testScoresAsync = ref.watch(testScoreNotifierProvider(profile.id));
          
          return Column(
            children: [
              // Header info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Test Scores for ${profile.fullName}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Track your standardized test scores for scholarship applications',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              
              // Test scores list
              Expanded(
                child: testScoresAsync.when(
                  data: (testScores) {
                    if (testScores.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.quiz_outlined,
                              size: 64,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No test scores yet',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Add your first test score to get started',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      );
                    }
                    
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: testScores.length,
                      itemBuilder: (context, index) {
                        final testScore = testScores[index];
                        return _buildTestScoreCard(testScore, profile.id);
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(
                    child: Text('Error loading test scores: $error'),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading profile: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTestScoreDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTestScoreCard(TestScore testScore, int userId) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  testScore.testType.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showEditTestScoreDialog(testScore);
                    } else if (value == 'delete') {
                      _showDeleteConfirmation(testScore, userId);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Overall Score: ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  testScore.overallScore.toString(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Test Date: ${dateFormat.format(testScore.testDate)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (testScore.detailedScores != null) ...[
              const SizedBox(height: 8),
              Text(
                'Details: ${testScore.detailedScores}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _showAddTestScoreDialog() async {
    _clearForm();
    await _showTestScoreDialog('Add Test Score', null);
  }

  Future<void> _showEditTestScoreDialog(TestScore testScore) async {
    _testTypeController.text = testScore.testType;
    _overallScoreController.text = testScore.overallScore.toString();
    _detailedScoresController.text = testScore.detailedScores ?? '';
    _selectedDate = testScore.testDate;
    
    await _showTestScoreDialog('Edit Test Score', testScore);
  }

  Future<void> _showTestScoreDialog(String title, TestScore? existingScore) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: _testTypeController.text.isEmpty ? null : _testTypeController.text,
                  decoration: const InputDecoration(
                    labelText: 'Test Type *',
                  ),
                  items: ['IELTS', 'TOEFL', 'GRE', 'GMAT', 'SAT', 'Other']
                      .map((test) => DropdownMenuItem(
                            value: test.toLowerCase(),
                            child: Text(test),
                          ))
                      .toList(),
                  onChanged: (value) {
                    _testTypeController.text = value ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a test type';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _overallScoreController,
                  decoration: const InputDecoration(
                    labelText: 'Overall Score *',
                    hintText: 'Enter your overall score',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Score cannot be empty';
                    }
                    if (double.tryParse(value.trim()) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _detailedScoresController,
                  decoration: const InputDecoration(
                    labelText: 'Detailed Scores (optional)',
                    hintText: 'e.g., R:8.0, L:7.5, S:7.0, W:7.5',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(_selectedDate == null 
                      ? 'Select Test Date *' 
                      : 'Test Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate!)}'),
                  leading: const Icon(Icons.calendar_today),
                  onTap: () => _selectDate(),
                  contentPadding: EdgeInsets.zero,
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
            onPressed: () => _saveTestScore(existingScore),
            child: Text(existingScore == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> _saveTestScore(TestScore? existingScore) async {
    if (!_formKey.currentState!.validate() || _selectedDate == null) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a test date')),
        );
      }
      return;
    }

    final profileAsync = ref.read(profileNotifierProvider);
    final profile = profileAsync.value;
    if (profile == null) return;

    final testScore = TestScore(
      id: existingScore?.id ?? 0, // Will be handled by the repository
      userId: profile.id,
      testType: _testTypeController.text.trim(),
      overallScore: double.parse(_overallScoreController.text.trim()),
      testDate: _selectedDate!,
      detailedScores: _detailedScoresController.text.trim().isEmpty 
          ? null 
          : _detailedScoresController.text.trim(),
      createdAt: existingScore?.createdAt ?? DateTime.now(),
    );

    if (existingScore == null) {
      await ref.read(testScoreNotifierProvider(profile.id).notifier).addTestScore(testScore);
    } else {
      await ref.read(testScoreNotifierProvider(profile.id).notifier).updateTestScore(testScore);
    }
    
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Test score ${existingScore == null ? 'added' : 'updated'} successfully!')),
      );
    }
  }

  Future<void> _showDeleteConfirmation(TestScore testScore, int userId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Test Score'),
        content: Text('Are you sure you want to delete your ${testScore.testType.toUpperCase()} score?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(testScoreNotifierProvider(userId).notifier).deleteTestScore(testScore.id, userId);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Test score deleted successfully!')),
        );
      }
    }
  }

  void _clearForm() {
    _testTypeController.clear();
    _overallScoreController.clear();
    _detailedScoresController.clear();
    _selectedDate = null;
  }
}
