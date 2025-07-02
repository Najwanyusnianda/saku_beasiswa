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

// --- THE CORRECTED STATE CLASS ---
class CustomiseWizardState {
  // The two "source of truth" plans.
  final FullTemplatePlan officialPlan;
  final FullTemplatePlan planningPlan;

  // The user's choices.
  final DeadlineMode deadlineMode;
  final DateTime mainDeadline;
  final int planningDurationInMonths;
  final Map<int, DateTime> milestoneDeadlineOverrides;
  final String customName;
  
  // These lists represent the user's CURRENTLY selected items,
  // which can change as they interact with the UI.
  final List<AssembledMilestone> currentUserMilestones;
  final List<TaskTemplate> currentUserTasks;
  final List<TemplateDocument> currentUserDocuments;

  // --- THE GETTER (COMPUTED PROPERTY) ---
  // This is where the magic happens. The UI will use this to get the correct list.
  // It is NOT a stored field and is NOT in the constructor.
  List<AssembledMilestone> get activeMilestones {
    return deadlineMode == DeadlineMode.specificDate 
      ? officialPlan.assembledMilestones 
      : planningPlan.assembledMilestones;
  }

  CustomiseWizardState({
    required this.officialPlan,
    required this.planningPlan,
    required this.deadlineMode,
    required this.mainDeadline,
    required this.planningDurationInMonths,
    required this.milestoneDeadlineOverrides,
    required this.customName,
    required this.currentUserMilestones,
    required this.currentUserTasks,
    required this.currentUserDocuments,
  });

  // The copyWith method is now much cleaner.
  CustomiseWizardState copyWith({
    FullTemplatePlan? officialPlan,
    FullTemplatePlan? planningPlan,
    DeadlineMode? deadlineMode,
    DateTime? mainDeadline,
    int? planningDurationInMonths,
    Map<int, DateTime>? milestoneDeadlineOverrides,
    String? customName,
    List<AssembledMilestone>? currentUserMilestones,
    List<TaskTemplate>? currentUserTasks,
    List<TemplateDocument>? currentUserDocuments,
  }) {
    return CustomiseWizardState(
      officialPlan: officialPlan ?? this.officialPlan,
      planningPlan: planningPlan ?? this.planningPlan,
      deadlineMode: deadlineMode ?? this.deadlineMode,
      mainDeadline: mainDeadline ?? this.mainDeadline,
      planningDurationInMonths: planningDurationInMonths ?? this.planningDurationInMonths,
      milestoneDeadlineOverrides: milestoneDeadlineOverrides ?? this.milestoneDeadlineOverrides,
      customName: customName ?? this.customName,
      currentUserMilestones: currentUserMilestones ?? this.currentUserMilestones,
      currentUserTasks: currentUserTasks ?? this.currentUserTasks,
      currentUserDocuments: currentUserDocuments ?? this.currentUserDocuments,
    );
  }
}

  // Override == and hashCode for proper state comparison in Riverpod



@riverpod
class CustomiseWizard extends _$CustomiseWizard {


  @override
  Future<CustomiseWizardState> build(String templateId) async {
    final repo = ref.watch(scholarshipTemplateRepositoryProvider);

    final results = await Future.wait([
      repo.getFullTemplatePlanById(templateId),
      repo.getFullTemplatePlanById('generic_planning_template'),
    ]);
    
    final officialPlan = results[0];
    final planningPlan = results[1];

    // By default, the user's plan starts as a copy of the generic planning plan.
    final initialMilestones = List<AssembledMilestone>.from(planningPlan.assembledMilestones);
    final initialTasks = initialMilestones.expand((am) => am.taskTemplates).toList();
    final initialDocuments = List<TemplateDocument>.from(officialPlan.documents);
    final defaultDeadline = DateTime.now().add(const Duration(days: 180));

    return CustomiseWizardState(
      officialPlan: officialPlan,
      planningPlan: planningPlan,
      deadlineMode: DeadlineMode.planningDuration, 
      mainDeadline: defaultDeadline,
      planningDurationInMonths: 6,
      milestoneDeadlineOverrides: {},
      customName: '${officialPlan.scholarshipTemplate.name} ${defaultDeadline.year}',
      currentUserMilestones: initialMilestones,
      currentUserTasks: initialTasks,
      currentUserDocuments: initialDocuments, //
    );
  }

  void addCustomDocument(TemplateDocument document) {
    if (state.value == null) return;
    final updatedDocs = [...state.value!.currentUserDocuments, document];
    state = AsyncData(state.value!.copyWith(currentUserDocuments: updatedDocs));
  }
  
  void removeDocument(TemplateDocument document) {
    if (state.value == null) return;
    final updatedDocs = List<TemplateDocument>.from(state.value!.currentUserDocuments)
      ..removeWhere((d) => d.id == document.id);
    state = AsyncData(state.value!.copyWith(currentUserDocuments: updatedDocs));
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
  
// In CustomiseWizard class
  // --- The `setDeadlineMode` method now correctly resets the user's plan ---
  void setDeadlineMode(DeadlineMode mode) {
    if (state.value == null) return;
    final currentState = state.value!;

    final newBasePlan = mode == DeadlineMode.specificDate 
      ? currentState.officialPlan 
      : currentState.planningPlan;

    final newMilestones = List<AssembledMilestone>.from(newBasePlan.assembledMilestones);
    final newTasks = newMilestones.expand((am) => am.taskTemplates).toList();

    state = AsyncData(currentState.copyWith(
      deadlineMode: mode,
      currentUserMilestones: newMilestones,
      currentUserTasks: newTasks,
    ));
  }

    // The rest of your provider methods (removeMilestone, reorderMilestone, etc.)
  // should now operate on `currentUserMilestones` and `currentUserTasks`
  void removeMilestone(AssembledMilestone milestoneToRemove) {
    if (state.value == null) return;
    final currentState = state.value!;

    final updatedMilestones = List<AssembledMilestone>.from(currentState.currentUserMilestones)
      ..removeWhere((am) => am.milestoneTemplate.id == milestoneToRemove.milestoneTemplate.id);
      
    final updatedTasks = List<TaskTemplate>.from(currentState.currentUserTasks)
      ..removeWhere((task) => milestoneToRemove.taskTemplates.any((t) => t.id == task.id));

    state = AsyncData(currentState.copyWith(
      currentUserMilestones: updatedMilestones,
      currentUserTasks: updatedTasks,
    ));
  }
  
  void setMilestoneDeadlineOverride(int milestoneId, DateTime newDeadline) {
    if (state.value == null) return;
    final newOverrides = Map<int, DateTime>.from(state.value!.milestoneDeadlineOverrides);
    newOverrides[milestoneId] = newDeadline;
    state = AsyncData(state.value!.copyWith(milestoneDeadlineOverrides: newOverrides));
  }
  
  
  void reorderMilestone(int oldIndex, int newIndex) {
    if (state.value == null) return;
    final milestones = List<AssembledMilestone>.from(state.value!.currentUserMilestones);

    if (newIndex > oldIndex) newIndex -= 1;
    final item = milestones.removeAt(oldIndex);
    milestones.insert(newIndex, item);
    
    state = AsyncData(state.value!.copyWith(currentUserMilestones: milestones));
  }
  
  // Note: Adding a milestone from the library would be a new method here.
  // void addMilestoneFromLibrary(MilestoneTemplate template) { ... }

  void toggleTask(TaskTemplate task, bool isIncluded) {
    if (state.value == null) return;
    final currentTasks = List<TaskTemplate>.from(state.value!.currentUserTasks);
    if (isIncluded) {
      currentTasks.add(task);
    } else {
      currentTasks.removeWhere((t) => t.id == task.id);
    }
    state = AsyncData(state.value!.copyWith(currentUserTasks: currentTasks));
  }

  

  // --- Personalization Methods ---
  void setCustomName(String name) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(customName: name));
  }

  // This method requires the full template repository to fetch tasks for the new milestone
  Future<void> addMilestoneFromLibrary(MilestoneTemplate milestoneTemplate) async {
    if (state.value == null) return;
    final currentState = state.value!;
    
    // 1. Fetch the tasks associated with the selected milestone template
    final taskRepo = ref.read(scholarshipTemplateRepositoryProvider);
    final tasksForMilestone = await (taskRepo.db.select(taskRepo.db.taskTemplates)
          ..where((t) => t.milestoneTemplateId.equals(milestoneTemplate.id)))
        .get();
    
    // 2. Create a new "link" object to define its default timing and order
    final newLink = ScholarshipMilestoneLink(
      scholarshipTemplateId: currentState.officialPlan.scholarshipTemplate.id,
      milestoneTemplateId: milestoneTemplate.id,
      order: currentState.currentUserMilestones.length, // Add it to the end
      startDateOffsetDays: -30, // Sensible defaults
      endDateOffsetDays: 0,
    );

    // 3. Assemble the new milestone
    final newAssembledMilestone = AssembledMilestone(
      milestoneTemplate: milestoneTemplate,
      link: newLink,
      taskTemplates: tasksForMilestone,
    );

    // 4. Add the new milestone and its tasks to the state
    final updatedMilestones = [...currentState.currentUserMilestones, newAssembledMilestone];
    final updatedTasks = [...currentState.currentUserTasks, ...tasksForMilestone];

    state = AsyncData(currentState.copyWith(
      currentUserMilestones: updatedMilestones,
      currentUserTasks: updatedTasks,
    ));
  }
}