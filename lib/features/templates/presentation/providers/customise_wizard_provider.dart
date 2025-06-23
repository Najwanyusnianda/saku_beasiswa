//lib/features/templates/presentation/providers/customise_wizard_provider.dart
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
      fullTemplate: fullTemplate,
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
    // This logic is already correct.
    final fullTemplate = await ref.watch(scholarshipTemplateRepositoryProvider).getFullTemplateById(templateId);

    return CustomiseWizardState(
      fullTemplate: fullTemplate,
      mainDeadline: fullTemplate.template.applicationDeadline, // Pre-fill with template deadline if available
      customizedTasks: List.from(fullTemplate.tasks),
      customizedDocuments: List.from(fullTemplate.documents),
      customName: fullTemplate.template.name,
      customColor: fullTemplate.template.color,
    );
  }

  void setMainDeadline(DateTime newDeadline) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(mainDeadline: newDeadline));
  }
  
  // --- REFINED METHODS FOR CHECKLISTS ---

  void toggleTask(TemplateTask task, bool isIncluded) {
    if (state.value == null) return;
    final currentState = state.value!;
    final currentTasks = List<TemplateTask>.from(currentState.customizedTasks);
    
    if (isIncluded && !currentTasks.any((t) => t.id == task.id)) {
      // Find original index to maintain logical order
      final originalIndex = currentState.fullTemplate.tasks.indexWhere((t) => t.id == task.id);
      if(originalIndex != -1) {
        currentTasks.insert(originalIndex, task);
        currentTasks.sort((a,b) => currentState.fullTemplate.tasks.indexOf(a).compareTo(currentState.fullTemplate.tasks.indexOf(b)));
      } else {
         currentTasks.add(task); // Fallback
      }
    } else {
      currentTasks.removeWhere((t) => t.id == task.id);
    }
    
    state = AsyncData(currentState.copyWith(customizedTasks: currentTasks));
  }
  
  // NEW method for documents
  void toggleDocument(TemplateDocument doc, bool isIncluded) {
    if (state.value == null) return;
    final currentState = state.value!;
    final currentDocs = List<TemplateDocument>.from(currentState.customizedDocuments);

    if (isIncluded && !currentDocs.any((d) => d.id == doc.id)) {
        currentDocs.add(doc);
    } else {
      currentDocs.removeWhere((d) => d.id == doc.id);
    }
    state = AsyncData(currentState.copyWith(customizedDocuments: currentDocs));
  }


  // reorderTasks can be removed for simplicity unless you really need it.
  // The toggle logic now maintains the original order.
  
  // --- Personalization methods are fine as they are ---
  void setCustomName(String name) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(customName: name));
  }

  void setCustomColor(String? color) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(customColor: color));
  }
}