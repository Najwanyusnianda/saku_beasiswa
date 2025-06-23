//lib/features/templates/presentation/providers/customise_wizard_provider.dart
import 'package:collection/collection.dart'; // Import for ListEquality
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/core/models/full_scholarship_template_with_milestones.dart';

part 'customise_wizard_provider.g.dart';

// The state model now includes lists for tasks and documents that can be modified
class CustomiseWizardState {
    // The original, unmodified template data
    final FullScholarshipTemplateWithMilestones fullTemplate;
    
    // The user's single, most important date
    final DateTime? mainDeadline;
    
    // NEW: A map to store user overrides for specific milestone deadlines
    // Key: milestone.id, Value: The new deadline set by the user
    final Map<int, DateTime> milestoneDeadlineOverrides;

    // The user's chosen name and color
    final String customName;
    final String? customColor;

    // The list of tasks the user has chosen to include
    final List<TemplateTask> customizedTasks;
    final List<TemplateDocument> customizedDocuments;

    CustomiseWizardState({
      required this.fullTemplate,
      this.mainDeadline,
      required this.milestoneDeadlineOverrides,
      required this.customName,
      this.customColor,
      required this.customizedTasks,
      required this.customizedDocuments,
    });

    // copyWith method will need to be updated to handle the new map
    CustomiseWizardState copyWith({
      DateTime? mainDeadline,
      Map<int, DateTime>? milestoneDeadlineOverrides,
      String? customName,
      String? customColor,
      List<TemplateTask>? customizedTasks,
      List<TemplateDocument>? customizedDocuments,
    }) {
      return CustomiseWizardState(
        fullTemplate: fullTemplate,
        mainDeadline: mainDeadline ?? this.mainDeadline,
        milestoneDeadlineOverrides: milestoneDeadlineOverrides ?? this.milestoneDeadlineOverrides,
        customName: customName ?? this.customName,
        customColor: customColor, // Allow setting color to null
        customizedTasks: customizedTasks ?? this.customizedTasks,
        customizedDocuments: customizedDocuments ?? this.customizedDocuments,
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
    // We now use the new repository method
    final fullTemplateData = await ref.watch(scholarshipTemplateRepositoryProvider).getFullTemplateWithMilestones(templateId);

    // Get all tasks from all milestones into one list for initialization
    final allTasks = fullTemplateData.milestonesWithTasks.values.expand((tasks) => tasks).toList();

    return CustomiseWizardState(
      fullTemplate: fullTemplateData,
      mainDeadline: null, // Start with no deadline set
      milestoneDeadlineOverrides: {}, // Start with an empty map of overrides
      customizedTasks: allTasks, // Initially include all tasks
      customizedDocuments: List.from(fullTemplateData.documents),
      customName: fullTemplateData.template.name,
      customColor: fullTemplateData.template.color,
    );
  }

  // --- METHODS FOR STEP 1 ---
  void setMainDeadline(DateTime newDeadline) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(mainDeadline: newDeadline));
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