import 'package:collection/collection.dart'; // Import for ListEquality
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';

part 'customise_wizard_provider.g.dart';

// The state model now includes lists for tasks and documents that can be modified
class CustomiseWizardState {
  final FullScholarshipTemplate fullTemplate;
  final DateTime? mainDeadline;
    // --- NEW PROPERTIES ---
  final String customName;
  final String? customColor;


  // These lists will hold the user's customizations
  final List<TemplateTask> customizedTasks;
  final List<TemplateDocument> customizedDocuments;

  CustomiseWizardState({
    required this.fullTemplate,
    this.mainDeadline,
    required this.customizedTasks,
    required this.customizedDocuments,
    required this.customName,
    this.customColor,
  });

  CustomiseWizardState copyWith({
    DateTime? mainDeadline,
    String? customName,
    String? customColor,
    List<TemplateTask>? customizedTasks,
    List<TemplateDocument>? customizedDocuments,
  }) {
    return CustomiseWizardState(
      fullTemplate: this.fullTemplate,
      mainDeadline: mainDeadline ?? this.mainDeadline,
      customizedTasks: customizedTasks ?? this.customizedTasks,
      customizedDocuments: customizedDocuments ?? this.customizedDocuments,
      customName: customName ?? this.customName,
      customColor: customColor ?? this.customColor,
    );
  }

  // Override == and hashCode for proper state comparison in Riverpod
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    const listEquals = ListEquality();

    return other is CustomiseWizardState &&
        other.mainDeadline == mainDeadline &&
        listEquals.equals(other.customizedTasks, customizedTasks) &&
        listEquals.equals(other.customizedDocuments, customizedDocuments);
  }

  @override
  int get hashCode => mainDeadline.hashCode ^ customizedTasks.hashCode ^ customizedDocuments.hashCode;
}

@riverpod
class CustomiseWizard extends _$CustomiseWizard {
  
  @override
  Future<CustomiseWizardState> build(String templateId) async {
    final fullTemplate = await ref.watch(scholarshipTemplateRepositoryProvider).getFullTemplateById(templateId);

    return CustomiseWizardState(
      fullTemplate: fullTemplate,
      mainDeadline: null,
      customizedTasks: List.from(fullTemplate.tasks),
      customizedDocuments: List.from(fullTemplate.documents),
      // Initialize with default values from the template
      customName: fullTemplate.template.name,
      customColor: fullTemplate.template.color,
    );
  }

  void setMainDeadline(DateTime newDeadline) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(mainDeadline: newDeadline));
  }
  
  // --- NEW METHODS FOR STEP 2 ---

  void toggleTask(TemplateTask task, bool isIncluded) {
    if (state.value == null) return;
    final currentState = state.value!;
    final currentTasks = List<TemplateTask>.from(currentState.customizedTasks);
    
    if (isIncluded) {
      // This logic re-inserts the task at its original position to maintain order
      final originalIndex = currentState.fullTemplate.tasks.indexWhere((t) => t.id == task.id);
      currentTasks.insert(originalIndex, task);
    } else {
      currentTasks.removeWhere((t) => t.id == task.id);
    }
    
    state = AsyncData(currentState.copyWith(customizedTasks: currentTasks));
  }

  void reorderTasks(int oldIndex, int newIndex) {
    if (state.value == null) return;
    final tasks = List<TemplateTask>.from(state.value!.customizedTasks);
    
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final task = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, task);
    
    state = AsyncData(state.value!.copyWith(customizedTasks: tasks));
  }

    // --- NEW METHODS FOR STEP 3 ---
  void setCustomName(String name) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(customName: name));
  }

  void setCustomColor(String? color) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(customColor: color));
  }
}