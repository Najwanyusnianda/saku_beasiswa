import 'dart:convert';
import 'package:flutter/services.dart';
import '../../features/discovery/domain/models/scholarship.dart';

/// Service for loading scholarship data from JSON assets
class ScholarshipJsonLoader {
  static const String _basePath = 'assets/scholarships/';
  
  /// Get list of available scholarship JSON files
  static List<String> get availableScholarshipFiles => [
    'fulbright_masters_2025.json',
    'chevening_2025.json',
    'lpdp_s2_2025.json',
  ];

  /// Load a single scholarship from JSON file
  static Future<Map<String, dynamic>?> loadScholarshipJson(String filename) async {
    try {
      final String content = await rootBundle.loadString('$_basePath$filename');
      return jsonDecode(content) as Map<String, dynamic>;
    } catch (e) {
      print('Error loading scholarship JSON file $filename: $e');
      return null;
    }
  }

  /// Load all available scholarships
  static Future<List<Map<String, dynamic>>> loadAllScholarships() async {
    final List<Map<String, dynamic>> scholarships = [];
    
    for (final filename in availableScholarshipFiles) {
      final scholarshipData = await loadScholarshipJson(filename);
      if (scholarshipData != null) {
        scholarships.add(scholarshipData);
      }
    }
    
    return scholarships;
  }

  /// Convert raw JSON to Scholarship domain model
  static Scholarship jsonToScholarship(Map<String, dynamic> json) {
    return Scholarship.fromJson(json);
  }

  /// Load and convert all scholarships to domain models
  static Future<List<Scholarship>> loadAllScholarshipModels() async {
    final jsonList = await loadAllScholarships();
    return jsonList.map(jsonToScholarship).toList();
  }
}
