# Onboarding (3 Slides) - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/onboarding.png`

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
@file:lib/features/auth/screens/onboarding_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Onboarding (3 Slides)** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/auth/screens/onboarding_screen.dart

DESIGN SPECIFICATIONS:
- PageView with 3 slides, swipeable horizontally
- Each slide:
  * Illustration image (top 60% of screen)
  * Title in HseelTypography.h1 (navy)
  * Description in HseelTypography.bodyLarge (gray-500)
- Slide 1: "استثمر بأقل مبلغ" - fractional investment concept
- Slide 2: "عوائد شهرية" - monthly returns concept  
- Slide 3: "محفظة متنوعة" - diversified portfolio concept
- Page indicator dots: active = HseelColors.primary (8px), inactive = HseelColors.gray300 (6px)
- Bottom: "التالي" button (slides 1-2), "ابدأ الاستثمار" button (slide 3)
- "تخطي" text button on all slides

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
- [ ] Save onboarding completion flag (SharedPreferences)
- [ ] Analytics: track which slide users skip at

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
