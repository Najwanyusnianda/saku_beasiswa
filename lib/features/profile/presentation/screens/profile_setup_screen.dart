import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/profile_service.dart';
import '../../domain/models/user_profile.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _educationLevelController = TextEditingController();
  final _institutionController = TextEditingController();
  final _majorController = TextEditingController();
  final _gpaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load existing profile data if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadProfileData();
    });
  }

  Future<void> _loadProfileData() async {
    final profileAsync = ref.read(profileNotifierProvider);
    profileAsync.whenData((profile) {
      if (profile != null) {
        _nameController.text = profile.fullName;
        _emailController.text = profile.email;
        _educationLevelController.text = profile.currentEducationLevel;
        _institutionController.text = profile.institution;
        _majorController.text = profile.majorField;
        _gpaController.text = profile.currentGpa?.toString() ?? '';
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _educationLevelController.dispose();
    _institutionController.dispose();
    _majorController.dispose();
    _gpaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header with profile info
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Profile photo
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Name and details
                      profileAsync.when(
                        data: (profile) => Column(
                          children: [
                            Text(
                              profile?.fullName ?? 'Set up your profile',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (profile != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                '${profile.majorField} Student',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              Text(
                                profile.institution,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ],
                        ),
                        loading: () => const CircularProgressIndicator(color: Colors.white),
                        error: (error, stack) => Text(
                          'Error loading profile',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Stats Card
                  _buildQuickStatsCard(),
                  const SizedBox(height: 16),
                  
                  // Academic Profile Card
                  _buildAcademicProfileCard(),
                  const SizedBox(height: 16),
                  
                  // Test Scores Card
                  _buildTestScoresCard(),
                  const SizedBox(height: 16),
                  
                  // Settings & More Card
                  _buildSettingsCard(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Your Scholarship Journey',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('12', 'Saved\nSchols'),
                _buildStatItem('3', 'Active\nApps'),
                _buildStatItem('67%', 'Success\nRate'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAcademicProfileCard() {
    final profileAsync = ref.watch(profileNotifierProvider);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Academic Information',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            profileAsync.when(
              data: (profile) {
                if (profile == null) {
                  return Column(
                    children: [
                      Text(
                        'No academic information available',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _showProfileEditDialog(),
                          icon: const Icon(Icons.add),
                          label: const Text('Add Details'),
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('• ${profile.currentEducationLevel} in ${profile.majorField}'),
                    _buildInfoRow('• ${profile.institution}'),
                    if (profile.currentGpa != null)
                      _buildInfoRow('• GPA: ${profile.currentGpa!.toStringAsFixed(2)}/4.00'),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _showProfileEditDialog(),
                        icon: const Icon(Icons.edit),
                        label: const Text('Update Details'),
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildTestScoresCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.quiz, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Test Scores',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoRow('• IELTS: 7.5 (expires Mar 2026)'),
            _buildInfoRow('• GRE: Not taken'),
            _buildInfoRow('• TOEFL: Not taken'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.go('/test-scores'),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Add/Update Scores'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings & More',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.go('/settings'),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.go('/settings'), // Will redirect to settings for now
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.go('/help'),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.go('/about'),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showProfileEditDialog() async {
    final profileAsync = ref.read(profileNotifierProvider);
    
    // Load current profile data
    profileAsync.whenData((profile) {
      if (profile != null) {
        _nameController.text = profile.fullName;
        _emailController.text = profile.email;
        _educationLevelController.text = profile.currentEducationLevel;
        _institutionController.text = profile.institution;
        _majorController.text = profile.majorField;
        _gpaController.text = profile.currentGpa?.toString() ?? '';
      }
    });

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name *',
                    hintText: 'Enter your full name',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email *',
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _educationLevelController,
                  decoration: const InputDecoration(
                    labelText: 'Education Level',
                    hintText: 'e.g., Bachelor\'s, Master\'s',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _institutionController,
                  decoration: const InputDecoration(
                    labelText: 'Institution',
                    hintText: 'Enter your university/school',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _majorController,
                  decoration: const InputDecoration(
                    labelText: 'Major/Field',
                    hintText: 'Enter your field of study',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _gpaController,
                  decoration: const InputDecoration(
                    labelText: 'GPA (optional)',
                    hintText: 'Enter your GPA',
                  ),
                  keyboardType: TextInputType.number,
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
            onPressed: () => _saveProfile(),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final profile = UserProfile(
      id: 1, // Will be handled by the repository
      fullName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      currentEducationLevel: _educationLevelController.text.trim(),
      institution: _institutionController.text.trim(),
      majorField: _majorController.text.trim(),
      currentGpa: double.tryParse(_gpaController.text.trim()),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await ref.read(profileNotifierProvider.notifier).saveProfile(profile);
    
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully!')),
      );
    }
  }
}
