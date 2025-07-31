// Test configuration classes
class TestType {
  final String id;
  final String name;
  final String emoji;
  final String description;
  final List<String> skillNames;
  final Duration validityPeriod;
  final double maxScore;

  const TestType({
    required this.id,
    required this.name,
    required this.emoji,
    required this.description,
    required this.skillNames,
    required this.validityPeriod,
    required this.maxScore,
  });
}

enum TestCategory {
  englishProficiency('English Proficiency'),
  graduateTests('Graduate Tests');

  const TestCategory(this.displayName);
  final String displayName;
}

// Test type definitions
final Map<String, TestType> testTypes = {
  'ielts': const TestType(
    id: 'ielts',
    name: 'IELTS',
    emoji: '🇬🇧',
    description: 'International English Language Testing System',
    skillNames: ['Listening', 'Reading', 'Writing', 'Speaking'],
    validityPeriod: Duration(days: 730), // 2 years
    maxScore: 9.0,
  ),
  'toefl': const TestType(
    id: 'toefl',
    name: 'TOEFL iBT',
    emoji: '🇺🇸',
    description: 'Test of English as a Foreign Language',
    skillNames: ['Reading', 'Listening', 'Speaking', 'Writing'],
    validityPeriod: Duration(days: 730), // 2 years
    maxScore: 120.0,
  ),
  'gre': const TestType(
    id: 'gre',
    name: 'GRE General Test',
    emoji: '📊',
    description: 'Graduate Record Examinations',
    skillNames: [
      'Verbal Reasoning',
      'Quantitative Reasoning',
      'Analytical Writing',
    ],
    validityPeriod: Duration(days: 1825), // 5 years
    maxScore: 340.0,
  ),
  'gmat': const TestType(
    id: 'gmat',
    name: 'GMAT',
    emoji: '📈',
    description: 'Graduate Management Admission Test',
    skillNames: [
      'Verbal',
      'Quantitative',
      'Integrated Reasoning',
      'Analytical Writing',
    ],
    validityPeriod: Duration(days: 1825), // 5 years
    maxScore: 800.0,
  ),
};

final Map<TestCategory, List<String>> testCategoryMapping = {
  TestCategory.englishProficiency: ['ielts', 'toefl'],
  TestCategory.graduateTests: ['gre', 'gmat'],
};
