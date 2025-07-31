---
applyTo: '**'
---
## Project Overview
This document outlines the development standards, architecture, and best practices for the Saku Beasiswa project. The goal is to create a high-quality, maintainable, and scalable offline-first mobile application that serves as a smart scholarship assistant for Indonesian students. Adherence to these guidelines is mandatory for all team members to ensure code consistency and a smooth development workflow.

## Core Technologies & Frameworks
Framework: Flutter for building the cross-platform user interface.

State Management: Riverpod 2.0+ for managing application state in a declarative, robust, and testable way.

Database: Drift (Moor) for a reactive, type-safe, and performant local SQLite database (offline-first).

Navigation: GoRouter for declarative, URL-based routing and deep linking.

Data Models: Freezed for creating immutable, boilerplate-free data classes and unions.

## Architecture: Feature-First Clean Architecture
Our project follows a Feature-First approach. This means all code related to a specific feature is co-located within its own module. This improves modularity and makes the codebase easier to navigate and scale.

Folder Structure
The primary source code resides in the lib/ directory.

/lib/core: Contains code that is shared across the entire application.

/lib/core/db: Drift database setup, including app_database.dart and the /tables directory. No feature-specific queries should be here.

/lib/core/navigation: GoRouter configuration (app_router.dart).

/lib/core/theme: App-wide theme data, colors, and typography.

/lib/core/utils: Global helper functions, formatters, and constants.

/lib/core/widgets: Common, reusable widgets (e.g., PrimaryButton, LoadingSpinner).

/lib/features: Contains the individual feature modules. Each feature folder has the following internal structure:

/lib/features/application: The business logic layer. This is where Riverpod Notifiers live. This layer orchestrates the flow of data between the UI and the data sources.

/lib/features/domain: The core of the feature. Contains the data models (Freezed classes) and the abstract Repository interfaces. This layer has zero dependencies on other layers.

/lib/features/infrastructure: The implementation layer for data handling. Contains Repository implementations and Drift DAOs. All database and API calls must be made from this layer.

/lib/features/presentation: The UI layer. Contains the screens and feature-specific widgets. This layer should only talk to the /application layer (Riverpod providers). To keep screen files lean, create a /widgets sub-directory inside /presentation for complex or reusable widgets specific to this feature.

## Coding Standards & Best Practices
Formatting: All code must be formatted using the default Dart formatter (dart format .). This is non-negotiable and ensures universal code style.

### Naming Conventions

Classes, Enums, and Typedefs: PascalCase (e.g., ProfileService, UserStatus).

Files, Methods, and Variables: camelCase (e.g., profile_setup_screen.dart, getUserProfile()).

Private Members: Prefix with an underscore _ (e.g., _saveToDatabase()).

### State Management (Riverpod)
UI to Application Layer Only: The UI (Presentation) must not directly access repositories (Infrastructure). It should only interact with providers from the Application layer.

Read vs. Watch: Use ref.watch() within build methods to react to state changes. Use ref.read() inside callbacks (like onPressed) to trigger actions without rebuilding the widget.

AutoDispose: Use .autoDispose for providers that are tied to a specific screen's lifecycle to prevent memory leaks.

Immutability: All data models (classes that hold data, e.g., UserProfile) must be created using the Freezed package to ensure they are immutable. This prevents hard-to-track bugs.

Null Safety: Write null-safe code. Avoid using the bang operator (!) wherever possible.

Provider Modifiers:

Use the .family modifier for providers that need to be parameterized (e.g., fetching a specific task by its ID). Example: taskProvider(taskId).

Use ref.watch(provider.select((value) => value.someProperty)) to listen to changes in only a small part of a larger state object, preventing unnecessary widget rebuilds.

### Database (Drift)
DAOs (Data Access Objects): Each feature that interacts with the database should have its own DAO file within its infrastructure layer. This co-locates database queries with the feature that uses them.

Reactive UI: Prefer watch methods in your DAOs (e.g., watchAllTasks()) which return a Stream. Your Application layer should consume these streams, allowing the UI to update automatically and reactively when underlying data changes.

One-off Actions: For actions like creating, updating, or deleting, use methods that return a Future (e.g., Future<void> updateTask(Task task)).

### Navigation (GoRouter)
Nested Navigation: For the main app structure with a bottom navigation bar, we will use StatefulShellRoute. This allows each tab to maintain its own navigation stack.

Route Guards (Future): When we implement authentication, we will use GoRouter's redirect functionality. It will check the user's auth state and redirect to the login screen if they are not authenticated, protecting sensitive routes.

Type-Safe Routes: Define routes as constants in app_router.dart to avoid magic strings in your code. Pass parameters as part of the route path (e.g., /tasks/:id) rather than as navigation arguments.

## UI/UX Guidelines
Design Philosophy: The application must maintain a modern, clean, and professional design. Prioritize usability and clarity over flashy but confusing animations.

Theming: All colors, text styles, and widget themes must be defined in and sourced from our central theme file: lib/core/theme/app_theme.dart. Do not hardcode colors or font sizes in widget files.

Reusable Widgets: If you create a widget that could potentially be used on more than one screen (e.g., a custom card or text field), place it in lib/core/widgets/. This promotes code reuse and a consistent UI.

Responsiveness: While the initial target is mobile, build UI in a way that can adapt to different screen sizes. Use LayoutBuilder and avoid fixed pixel widths/heights where possible.