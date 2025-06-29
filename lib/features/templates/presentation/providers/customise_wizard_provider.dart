//lib/features/templates/presentation/providers/customise_wizard_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/core/models/full_template_plan.dart';



part 'customise_wizard_provider.g.dart';

// Add this enum at the top of the file
enum DeadlineMode { specificDate, planningDuration }

// lib/features/templates/presentation/providers/customise_wizard_provider.dart
 // Import the new DTO

// ... (DeadlineMode enum stays the same)

class CustomiseWizardState {
  final FullTemplatePlan fullTemplatePlan;
  final List<AssembledMilestone> userAssembledMilestones;
  final List<TaskTemplate> userCustomizedTasks;
  final List<TemplateDocument> userCustomizedDocuments;
  
  // --- THESE ARE THE CRITICAL PROPERTIES ---
  final DeadlineMode deadlineMode;
  final DateTime mainDeadline;
  final int planningDurationInMonths; // This was the missing property

  final Map<int, DateTime> milestoneDeadlineOverrides;
  final String customName;

  CustomiseWizardState({
    required this.fullTemplatePlan,
    required this.userAssembledMilestones,
    required this.userCustomizedTasks,
    required this.userCustomizedDocuments,
    required this.deadlineMode,
    required this.mainDeadline,
    required this.planningDurationInMonths, // Added to constructor
    required this.milestoneDeadlineOverrides,
    required this.customName,
  });

  CustomiseWizardState copyWith({
    FullTemplatePlan? fullTemplatePlan,
    List<AssembledMilestone>? userAssembledMilestones,
    List<TaskTemplate>? userCustomizedTasks,
    List<TemplateDocument>? userCustomizedDocuments,
    DeadlineMode? deadlineMode,
    DateTime? mainDeadline,
    int? planningDurationInMonths, // Added to copyWith
    Map<int, DateTime>? milestoneDeadlineOverrides,
    String? customName,
  }) {
    return CustomiseWizardState(
      fullTemplatePlan: fullTemplatePlan ?? this.fullTemplatePlan,
      userAssembledMilestones: userAssembledMilestones ?? this.userAssembledMilestones,
      userCustomizedTasks: userCustomizedTasks ?? this.userCustomizedTasks,
      userCustomizedDocuments: userCustomizedDocuments ?? this.userCustomizedDocuments,
      deadlineMode: deadlineMode ?? this.deadlineMode,
      mainDeadline: mainDeadline ?? this.mainDeadline,
      planningDurationInMonths: planningDurationInMonths ?? this.planningDurationInMonths, // Added
      milestoneDeadlineOverrides: milestoneDeadlineOverrides ?? this.milestoneDeadlineOverrides,
      customName: customName ?? this.customName,
    );
  }
}


  // Override == and hashCode for proper state comparison in Riverpod



@riverpod
class CustomiseWizard extends _$CustomiseWizard {
  @override
  Future<CustomiseWizardState> build(String templateId) async {
    final fullPlan = await ref.watch(scholarshipTemplateRepositoryProvider).getFullTemplatePlanById(templateId);
    final allTasks = fullPlan.assembledMilestones.expand((am) => am.taskTemplates).toList();
    final defaultDeadline = DateTime.now().add(const Duration(days: 180));

    return CustomiseWizardState(
      fullTemplatePlan: fullPlan,
      userAssembledMilestones: List.from(fullPlan.assembledMilestones), 
      userCustomizedTasks: allTasks,
      userCustomizedDocuments: List.from(fullPlan.documents),
      deadlineMode: DeadlineMode.planningDuration, 
      mainDeadline: defaultDeadline,
      planningDurationInMonths: 6, // --- INITIALIZE THE MISSING PROPERTY ---
      milestoneDeadlineOverrides: {},
      customName: '${fullPlan.scholarshipTemplate.name} ${defaultDeadline.year}',
    );
  }

  void setPlanningDuration(int months) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(
      planningDurationInMonths: months, // --- UPDATE THE PROPERTY ---
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
  
  void setDeadlineMode(DeadlineMode mode) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(deadlineMode: mode));
  }
  
  void setMilestoneDeadlineOverride(int milestoneId, DateTime newDeadline) {
    if (state.value == null) return;
    final newOverrides = Map<int, DateTime>.from(state.value!.milestoneDeadlineOverrides);
    newOverrides[milestoneId] = newDeadline;
    state = AsyncData(state.value!.copyWith(milestoneDeadlineOverrides: newOverrides));
  }
  
  // --- Plan Builder Methods ---
  void removeMilestone(AssembledMilestone milestoneToRemove) {
    if (state.value == null) return;
    final currentState = state.value!;

    // Remove the milestone itself
    final updatedMilestones = List<AssembledMilestone>.from(currentState.userAssembledMilestones)
      ..removeWhere((am) => am.milestoneTemplate.id == milestoneToRemove.milestoneTemplate.id);
      
    // Also remove its tasks from the customized list
    final updatedTasks = List<TaskTemplate>.from(currentState.userCustomizedTasks)
      ..removeWhere((task) => milestoneToRemove.taskTemplates.any((t) => t.id == task.id));

    state = AsyncData(currentState.copyWith(
      userAssembledMilestones: updatedMilestones,
      userCustomizedTasks: updatedTasks,
    ));
  }
  
  void reorderMilestone(int oldIndex, int newIndex) {
    if (state.value == null) return;
    final milestones = List<AssembledMilestone>.from(state.value!.userAssembledMilestones);

    if (newIndex > oldIndex) newIndex -= 1;
    final item = milestones.removeAt(oldIndex);
    milestones.insert(newIndex, item);
    
    state = AsyncData(state.value!.copyWith(userAssembledMilestones: milestones));
  }
  
  // Note: Adding a milestone from the library would be a new method here.
  // void addMilestoneFromLibrary(MilestoneTemplate template) { ... }

  void toggleTask(TaskTemplate task, bool isIncluded) {
    if (state.value == null) return;
    final currentTasks = List<TaskTemplate>.from(state.value!.userCustomizedTasks);
    if (isIncluded) {
      currentTasks.add(task);
    } else {
      currentTasks.removeWhere((t) => t.id == task.id);
    }
    state = AsyncData(state.value!.copyWith(userCustomizedTasks: currentTasks));
  }

  // --- Personalization Methods ---
  void setCustomName(String name) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(customName: name));
  }
}