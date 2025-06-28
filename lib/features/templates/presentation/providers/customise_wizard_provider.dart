//lib/features/templates/presentation/providers/customise_wizard_provider.dart
import 'package:collection/collection.dart'; // Import for ListEquality
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/core/models/full_scholarship_template_with_milestones.dart';

part 'customise_wizard_provider.g.dart';


// Add this enum at the top of the file
enum DeadlineMode { specificDate, planningDuration }
// The state model for the customization wizard
class CustomiseWizardState {
    // The original, unmodified template data
    final FullScholarshipTemplateWithMilestones fullTemplate;
    
    // The user's single, most important date - always has a value
    final DateTime mainDeadline;
    
    // Map to store user overrides for specific milestone deadlines
    // Key: milestone.id, Value: The new deadline set by the user
    final Map<int, DateTime> milestoneDeadlineOverrides;

    // The user's chosen name and color
    final String customName;
    final String? customColor;

    // The list of tasks the user has chosen to include
    final List<TemplateTask> customizedTasks;
    final List<TemplateDocument> customizedDocuments;

    // Properties for deadline management
    final DeadlineMode deadlineMode;
    final int planningDurationInMonths;
    
    CustomiseWizardState({
      required this.fullTemplate,
      required this.mainDeadline,
      this.milestoneDeadlineOverrides = const {},
      required this.customName,
      this.customColor,
      required this.customizedTasks,
      required this.customizedDocuments,
      this.deadlineMode = DeadlineMode.planningDuration, // Default to planning mode
      this.planningDurationInMonths = 6, // Default to 6 months
    });

    // Main deadline getter (no calculation needed as it's always set)
    DateTime get calculatedFinalDeadline => mainDeadline;

    // Copy with method for immutable updates
  CustomiseWizardState copyWith({
    DateTime? mainDeadline,
    Map<int, DateTime>? milestoneDeadlineOverrides,
    String? customName,
    String? customColor,
    List<TemplateTask>? customizedTasks,
    List<TemplateDocument>? customizedDocuments,
    DeadlineMode? deadlineMode,
    int? planningDurationInMonths,
  }) {
    return CustomiseWizardState(
      fullTemplate: fullTemplate,
      mainDeadline: mainDeadline ?? this.mainDeadline,
      milestoneDeadlineOverrides: milestoneDeadlineOverrides ?? this.milestoneDeadlineOverrides,
      customName: customName ?? this.customName,
      customColor: customColor ?? this.customColor,
      customizedTasks: customizedTasks ?? this.customizedTasks,
      customizedDocuments: customizedDocuments ?? this.customizedDocuments,
      deadlineMode: deadlineMode ?? this.deadlineMode,
      planningDurationInMonths: planningDurationInMonths ?? this.planningDurationInMonths,
    );
  }

  // Override == and hashCode for proper state comparison in Riverpod
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    const listEquals = ListEquality();

    return other is CustomiseWizardState &&
        other.fullTemplate == fullTemplate &&
        other.mainDeadline == mainDeadline &&
        other.customName == customName &&
        other.customColor == customColor &&
        listEquals.equals(other.customizedTasks, customizedTasks) &&
        listEquals.equals(other.customizedDocuments, customizedDocuments);
  }

  @override
  int get hashCode {
    const listEquals = ListEquality();
    return fullTemplate.hashCode ^
      mainDeadline.hashCode ^
      customName.hashCode ^
      customColor.hashCode ^
      listEquals.hash(customizedTasks) ^
      listEquals.hash(customizedDocuments);
  }
}

@riverpod
class CustomiseWizard extends _$CustomiseWizard {
  
  @override
  Future<CustomiseWizardState> build(String templateId) async {
    final fullTemplateData = await ref.watch(scholarshipTemplateRepositoryProvider)
        .getFullTemplateWithMilestones(templateId);

    // Get all tasks from all milestones into one list for initialization
    final allTasks = fullTemplateData.milestonesWithTasks.values.expand((tasks) => tasks).toList();
    
    // Default to 6 months from now as the initial deadline
    final defaultDeadline = DateTime.now().add(const Duration(days: 180));

    return CustomiseWizardState(
      fullTemplate: fullTemplateData,
      mainDeadline: defaultDeadline, // Always has a value now
      customizedTasks: allTasks, // Initially include all tasks
      customizedDocuments: List.from(fullTemplateData.documents),
      customName: fullTemplateData.template.name,
      customColor: fullTemplateData.template.color,
      // Default to planning mode with 6 months
      deadlineMode: DeadlineMode.planningDuration,
      planningDurationInMonths: 6,
    );
  }

  // --- METHODS FOR STEP 1 ---
  void setDeadlineMode(DeadlineMode mode) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(deadlineMode: mode));
  }
  
  void setPlanningDuration(int months) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(
      planningDurationInMonths: months,
      deadlineMode: DeadlineMode.planningDuration,
      mainDeadline: DateTime.now().add(Duration(days: months * 30)),
    ));
  }

  void setMainDeadline(DateTime newDeadline) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(
      mainDeadline: newDeadline,
      deadlineMode: DeadlineMode.specificDate,
    ));
  }

  // --- METHODS FOR STEP 2 ---
  void setMilestoneDeadlineOverride(int milestoneId, DateTime newDeadline) {
    if (state.value == null) return;
    final newOverrides = Map<int, DateTime>.from(state.value!.milestoneDeadlineOverrides);
    newOverrides[milestoneId] = newDeadline;
    state = AsyncData(state.value!.copyWith(milestoneDeadlineOverrides: newOverrides));
  }
  
  void toggleTask(TemplateTask task, bool isIncluded) {
    if (state.value == null) return;
    final currentState = state.value!;
    final currentTasks = List<TemplateTask>.from(currentState.customizedTasks);
    
    if (isIncluded && !currentTasks.any((t) => t.id == task.id)) {
      currentTasks.add(task);
    } else {
      currentTasks.removeWhere((t) => t.id == task.id);
    }
    
    state = AsyncData(currentState.copyWith(customizedTasks: currentTasks));
  }

  // --- METHODS FOR STEP 3 ---
  void setCustomName(String name) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(customName: name));
  }
}