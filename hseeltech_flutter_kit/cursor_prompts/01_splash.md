# Splash Screen - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/splash.png`

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
@file:lib/features/auth/screens/splash_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Splash Screen** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/auth/screens/splash_screen.dart

DESIGN SPECIFICATIONS:
- Full screen navy gradient background (HseelColors.navy → HseelColors.navyLight)
- Centered Hseeltech logo (white version) with subtle scale-up animation
- Logo: approximately 120px width
- Below logo: "حصيلتك" text in HseelTypography.h2 white
- Subtle particle/shimmer animation in background
- Auto-navigate to Welcome after 2.5 seconds
- Status bar: light content (white icons)

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
- [ ] Check if user is already logged in → skip to Home
- [ ] Check if onboarding was completed → skip to Welcome or Home
- [ ] App version check / force update logic
- [ ] Firebase Analytics screen tracking

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
