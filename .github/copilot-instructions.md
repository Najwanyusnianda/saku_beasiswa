# GitHub Copilot Instructions for Saku Beasiswa

## Project Architecture
This is a **Feature-First Clean Architecture** Flutter app for Indonesian scholarship assistance with strict **Separation of Concerns** and **Scalability** principles.

### Core Tech Stack
- **Flutter** + **Riverpod 2.0+** (state management)
- **Drift (Moor)** (offline-first SQLite database)  
- **GoRouter** (declarative routing)
- **Freezed** (immutable data models)

### Feature-First Structure
```
lib/
├── core/                    # Shared app-wide code only
│   ├── db/                 # Drift setup (NO feature-specific queries)
│   ├── navigation/         # GoRouter config
│   ├── theme/              # Central theming (mandatory source)
│   ├── utils/              # Global helpers & constants
│   └── widgets/            # Cross-feature reusable widgets
└── features/{feature}/     # Self-contained feature modules
    ├── application/        # Business logic (Riverpod providers)
    ├── domain/            # Models + abstract repositories (ZERO dependencies)
    ├── infrastructure/    # Repository implementations + DAOs
    └── presentation/      # Screens + feature-specific widgets
```

## Separation of Concerns Rules

### Layer Communication (STRICT)
- **UI → Application**: Presentation only talks to application layer providers
- **Application → Infrastructure**: Business logic calls repository implementations
- **Domain**: Contains models + interfaces, NO dependencies on other layers
- **Infrastructure**: Implements domain contracts, handles all data operations

### State Management (Riverpod)
```dart
// ✅ Correct: UI watches application providers
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<UserProfile?> build() async {
    return ref.read(profileRepositoryProvider).getCurrentProfile();
  }
}

// ✅ In widgets: ref.watch() in build, ref.read() in callbacks
class ProfileScreen extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);
    // Use ref.read(profileNotifierProvider.notifier) in onPressed
  }
}
```

### Data Flow Pattern
1. **UI triggers action** → Application provider
2. **Provider calls** → Repository (infrastructure)
3. **Repository queries** → Drift DAO
4. **Data flows back** → UI rebuilds via ref.watch()

## Scalability Patterns

### Feature Isolation
- Each feature is **completely self-contained**
- Feature-specific widgets go in `{feature}/presentation/widgets/`
- Cross-feature widgets go in `lib/core/widgets/`
- Database queries stay in feature's infrastructure DAOs

### Immutable Data Models (Freezed)
```dart
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String name,
    // All models must be immutable
  }) = _UserProfile;
}
```

### Repository Pattern
```dart
// Domain: Abstract interface (zero dependencies)
abstract class IProfileRepository {
  Future<UserProfile?> getCurrentProfile();
}

// Infrastructure: Implementation with Drift DAO
class ProfileRepository implements IProfileRepository {
  final ProfileDao _dao;
  // Implementation details
}
```

## Mandatory Standards

### Formatting & Style
- **ALWAYS** run `dart format .` before commits
- **Naming**: PascalCase (classes), camelCase (files/methods), `_private`
- **Theming**: ALL colors/styles from `lib/core/theme/app_theme.dart`
- **Provider Lifecycle**: Use `.autoDispose` for screen-tied providers

### Key Architecture Files
- `lib/core/db/database.dart` - Central Drift database setup
- `lib/core/navigation/app_router.dart` - GoRouter configuration
- `lib/core/theme/app_theme.dart` - Mandatory theming source
- `lib/features/profile/` - Reference feature structure

### Development Commands
```bash
dart format .                           # Format (mandatory)
dart run build_runner build            # Generate Freezed/Drift code
flutter clean && flutter pub get       # Clean build
```

## Critical Don'ts
- ❌ UI directly accessing repositories/DAOs
- ❌ Feature-specific database queries in `/core/db/`
- ❌ Hardcoded colors/styles (use theme)
- ❌ Mutable data models (use Freezed)
- ❌ Cross-feature dependencies (keep features isolated)

Every code decision must support **easy testing**, **independent feature development**, and **finding/changing code without breaking other parts**.
