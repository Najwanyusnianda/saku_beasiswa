import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';
import 'database.dart';

/// Service responsible for seeding the database with scholarship data from JSON assets
class DatabaseSeeder {
  final AppDatabase db;

  DatabaseSeeder(this.db);

  /// Seeds the scholarships table with data from JSON asset files
  /// This method should be called once during app initialization
  Future<void> seedScholarships() async {
    try {
      // Check if data already exists to prevent re-seeding
      final existingCount = await db.select(db.scholarships).get();
      if (existingCount.isNotEmpty) {
        print('Scholarships already seeded. Count: ${existingCount.length}');
        return;
      }

      print('Starting scholarship data seeding...');

      // Load the asset manifest to discover all scholarship JSON files
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // Find all scholarship JSON files in the assets directory
      final scholarshipPaths = manifestMap.keys
          .where((String key) => 
              key.contains('assets/scholarships/') && 
              key.endsWith('.json'))
          .toList();

      print('Found ${scholarshipPaths.length} scholarship files to process');

      int successCount = 0;
      int errorCount = 0;

      // Process each scholarship file
      for (final path in scholarshipPaths) {
        try {
          await _processScholarshipFile(path);
          successCount++;
        } catch (e) {
          print('Error processing scholarship file $path: $e');
          errorCount++;
        }
      }

      print('Scholarship seeding completed. Success: $successCount, Errors: $errorCount');
    } catch (e) {
      print('Failed to seed scholarships: $e');
      rethrow;
    }
  }

  /// Processes a single scholarship JSON file and inserts it into the database
  Future<void> _processScholarshipFile(String assetPath) async {
    try {
      // Load and parse the JSON file
      final jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> data = json.decode(jsonString);

      // Validate required fields
      if (!_validateScholarshipData(data)) {
        throw Exception('Invalid scholarship data structure in $assetPath');
      }

      // Extract basic information for filtering
      final basicInfo = data['basic_info'] as Map<String, dynamic>? ?? {};
      final dates = data['dates'] as Map<String, dynamic>? ?? {};
      final requirements = data['requirements'] as Map<String, dynamic>? ?? {};

      // Parse application deadline
      final deadlineStr = dates['application_deadline'] as String?;
      DateTime? applicationDeadline;
      if (deadlineStr != null && deadlineStr.isNotEmpty) {
        try {
          applicationDeadline = DateTime.parse(deadlineStr);
        } catch (e) {
          print('Warning: Could not parse deadline for ${data['id']}: $deadlineStr');
        }
      }

      // Extract language requirements
      final academic = requirements['academic'] as Map<String, dynamic>? ?? {};
      final languageReq = academic['language_requirements'] as Map<String, dynamic>?;
      String? languageRequirementsJson;
      if (languageReq != null) {
        languageRequirementsJson = json.encode(languageReq);
      }

      // Extract minimum GPA
      double? minGpa;
      final gpaReq = academic['minimum_gpa'];
      if (gpaReq != null) {
        if (gpaReq is num) {
          minGpa = gpaReq.toDouble();
        } else if (gpaReq is String) {
          minGpa = double.tryParse(gpaReq);
        }
      }

      // Create the scholarship record
      final companion = ScholarshipsCompanion.insert(
        jsonId: data['id']?.toString() ?? '',
        title: data['title']?.toString() ?? '',
        provider: data['provider']?.toString() ?? '',
        providerCountry: data['provider_country']?.toString() ?? '',
        applicationDeadline: applicationDeadline ?? DateTime.now().add(const Duration(days: 365)),
        fundingType: basicInfo['funding_type']?.toString() ?? '',
        targetDegreeLevels: json.encode(basicInfo['target_degree_levels'] ?? []),
        subjectAreas: Value.absentIfNull(
          basicInfo['subject_areas'] != null 
              ? json.encode(basicInfo['subject_areas']) 
              : null
        ),
        studyCountries: Value.absentIfNull(
          basicInfo['study_countries'] != null 
              ? json.encode(basicInfo['study_countries']) 
              : null
        ),
        minGpa: Value.absentIfNull(minGpa),
        languageRequirements: Value.absentIfNull(languageRequirementsJson),
        fullData: jsonString,
      );

      // Insert into database
      await db.into(db.scholarships).insert(companion);
      
    } catch (e) {
      print('Error in _processScholarshipFile for $assetPath: $e');
      rethrow;
    }
  }

  /// Validates that the scholarship JSON has the required structure
  bool _validateScholarshipData(Map<String, dynamic> data) {
    // Check for required top-level fields
    final requiredFields = ['id', 'title', 'provider'];
    for (final field in requiredFields) {
      if (!data.containsKey(field) || data[field] == null) {
        print('Missing required field: $field');
        return false;
      }
    }
    return true;
  }

  /// Clears all scholarship data (useful for development/testing)
  Future<void> clearScholarships() async {
    await db.delete(db.scholarships).go();
    print('All scholarship data cleared');
  }

  /// Re-seeds scholarships by clearing existing data and loading fresh data
  Future<void> reseedScholarships() async {
    await clearScholarships();
    await seedScholarships();
  }
}
