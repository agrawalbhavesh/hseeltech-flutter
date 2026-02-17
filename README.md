# Hseeltech Flutter App

## Generated from Hseeltech DevPortal

### Quick Start
```bash
cd hseeltech_app
flutter pub get
flutter gen-l10n
flutter run
```

### Project Structure
```
lib/
├── di/                    # Dependency Injection
│   └── service_locator.dart
├── features/              # Feature-based screens
│   ├── splash/
│   │   ├── splash_screen.dart
│   │   └── cubit/
│   │       ├── splash_state.dart
│   │       └── splash_cubit.dart
│   ├── home/
│   └── ...
├── l10n/                  # Localization ARB files
│   ├── app_en.arb
│   └── app_ar.arb
├── repositories/          # API Repositories
├── router/                # GoRouter config
├── theme/                 # Design tokens & theme
│   ├── design_tokens.dart
│   └── hseel_theme.dart
└── main.dart
```

### Phase Execution
- **Phase 1**: Design Refresh (17 screens) - UI updates only
- **Phase 2**: Feature Updates (13 screens) - UI + logic changes
- **Phase 3**: New Screens (5 screens) - Built from scratch

### Resources
- DevPortal: Full documentation, code, and guides
- ARB Files: 2,084 translation keys (EN + AR)
- Design Tokens: Colors, typography, spacing, shadows
- API Integration: 8 repositories with Dio client
