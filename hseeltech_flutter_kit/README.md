# Hseeltech Flutter Development Kit

**For IT Team - Cursor IDE Migration**

---

## What's Inside

```
hseeltech_flutter_kit/
├── .cursorrules                    ← Cursor AI reads this automatically
├── README.md                       ← This file
├── MIGRATION_GUIDE.md              ← Step-by-step migration workflow
├── NEW_FEATURES.md                 ← Features requiring manual implementation
│
├── lib/                            ← Copy into your Flutter project
│   ├── core/
│   │   ├── theme/
│   │   │   ├── hseel_colors.dart       ← All color constants
│   │   │   ├── hseel_typography.dart   ← All text style constants
│   │   │   ├── hseel_spacing.dart      ← Spacing, radius, dimensions
│   │   │   └── hseel_theme.dart        ← ThemeData (light + dark)
│   │   └── constants/
│   │       └── hseel_assets.dart       ← Asset path constants
│   ├── shared/models/
│   │   └── models.dart                 ← Data model definitions
│   └── routing/
│       └── app_router.dart             ← Route definitions
│
├── cursor_prompts/                 ← 36 screen-specific AI prompts
│   ├── 00_INDEX.md                     ← Master index
│   ├── 01_splash.md                    ← Splash screen prompt
│   ├── 02_welcome.md                   ← Welcome screen prompt
│   ├── ...                             ← (36 total screen prompts)
│   └── 36_dark_mode.md                 ← Dark mode prompt
│
└── assets/                         ← Copy into your Flutter project
    ├── fonts/                          ← 6 Montserrat Arabic TTF files
    ├── icons/                          ← 37 SVG icons (Lucide)
    └── images/screenshots/             ← 65 screen mockup PNGs
```

---

## Quick Start (5 Minutes)

### 1. Copy `.cursorrules` to your project root
```bash
cp .cursorrules /path/to/your/flutter/project/
```

### 2. Copy `lib/core/` and `lib/shared/` to your project
```bash
cp -r lib/core/ /path/to/your/flutter/project/lib/core/
cp -r lib/shared/models/ /path/to/your/flutter/project/lib/shared/models/
```

### 3. Copy assets
```bash
cp -r assets/ /path/to/your/flutter/project/assets/
```

### 4. Update `pubspec.yaml`
```yaml
fonts:
  - family: Montserrat Arabic
    fonts:
      - asset: assets/fonts/Montserrat-Arabic-Light.ttf
        weight: 300
      - asset: assets/fonts/Montserrat-Arabic-Regular.ttf
        weight: 400
      - asset: assets/fonts/Montserrat-Arabic-Medium.ttf
        weight: 500
      - asset: assets/fonts/Montserrat-Arabic-SemiBold.ttf
        weight: 600
      - asset: assets/fonts/Montserrat-Arabic-Bold.ttf
        weight: 700
      - asset: assets/fonts/Montserrat-Arabic-ExtraBold.ttf
        weight: 800

flutter:
  assets:
    - assets/icons/
    - assets/images/
    - assets/images/screenshots/
```

### 5. Apply theme in `main.dart`
```dart
import 'lib/core/theme/hseel_theme.dart';

MaterialApp(
  theme: HseelTheme.light,
  darkTheme: HseelTheme.dark,
  themeMode: ThemeMode.system,
);
```

### 6. Test with Home Screen
Open `cursor_prompts/MIGRATION_GUIDE.md` → follow the **Pilot Test: Home Screen** section.

---

## Migration Workflow

Read `MIGRATION_GUIDE.md` for the complete workflow. Summary:

1. Open a screen's prompt file from `cursor_prompts/`
2. Copy the prompt into Cursor Composer (Cmd+I)
3. Reference your existing screen code + the screenshot
4. Cursor generates the migrated code
5. Review and test
6. Implement manual features (listed at bottom of each prompt)

---

## Key Files for Developers

| File | What It Does | When to Use |
|------|-------------|-------------|
| `hseel_colors.dart` | All color values (light + dark) | Every widget that uses color |
| `hseel_typography.dart` | All text styles (6 weights) | Every Text widget |
| `hseel_spacing.dart` | Spacing, radius, dimensions | Every layout/padding |
| `hseel_theme.dart` | Complete ThemeData | main.dart setup |
| `models.dart` | Data structures | API integration |
| `app_router.dart` | Route paths + helpers | Navigation |

---

## Support

For questions about the design system, refer to the screenshots in `assets/images/screenshots/` as the source of truth.
