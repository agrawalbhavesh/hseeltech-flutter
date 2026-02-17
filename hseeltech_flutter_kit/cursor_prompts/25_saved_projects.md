# Saved Projects - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/saved-projects.png`

## Required Context Files
```
@file:lib/core/theme/hseel_colors.dart
@file:lib/core/theme/hseel_typography.dart
@file:lib/core/theme/hseel_spacing.dart
@file:lib/shared/models/models.dart
@file:.cursorrules
```

## Current Code
```
@file:lib/features/profile/screens/saved_projects_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Saved Projects** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/profile/screens/saved_projects_screen.dart

DESIGN SPECIFICATIONS:
- Header "المشاريع المحفوظة" with back button
- Grid or list of saved property cards (mini version)
- Each card: image, name, return %, status badge, unsave button
- Empty state: bookmark icon + "لم تحفظ أي مشاريع بعد"

**IMPLEMENTATION RULES:**
1. Use `HseelColors` for ALL colors - never hardcode hex values
2. Use `HseelTypography` for ALL text styles - never hardcode font sizes
3. Use `HseelSpacing` for ALL spacing values
4. Support RTL: use `Start`/`End` instead of `Left`/`Right`
5. Add skeleton loading state (shimmer) while data loads
6. Keep existing business logic and API calls intact
7. Use Lucide icons (`lucide_icons` package)
8. Ensure minimum touch target of 44pt
9. Support both light and dark themes
10. Add `const` constructors where possible

**DO NOT IMPLEMENT (mark with TODO for manual work):**
- [ ] Saved properties API
- [ ] Remove from saved API
- [ ] Navigate to property detail on tap

---

## Verification Checklist
- [ ] Layout matches screenshot
- [ ] All colors from HseelColors
- [ ] All text styles from HseelTypography
- [ ] RTL layout works correctly
- [ ] Dark mode renders correctly
- [ ] Skeleton loading state works
- [ ] No hardcoded values in code
- [ ] Touch targets >= 44pt
- [ ] Keyboard dismisses properly (if has inputs)
- [ ] Safe area respected
