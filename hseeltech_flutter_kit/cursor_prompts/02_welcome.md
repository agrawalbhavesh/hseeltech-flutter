# Welcome Screen - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/welcome.png`

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
@file:lib/features/auth/screens/welcome_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Welcome Screen** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/auth/screens/welcome_screen.dart

DESIGN SPECIFICATIONS:
- Full screen with background illustration/image
- Hseeltech logo at top (centered, white)
- Hero text: "استثمر في العقارات بذكاء" in HseelTypography.display white
- Subtitle: "منصة استثمار عقاري مرخصة..." in HseelTypography.bodyLarge white/80%
- Primary CTA button: "ابدأ الآن" (full width, HseelColors.primary)
- Secondary text button: "لدي حساب بالفعل" (HseelColors.primaryLight)
- Bottom: regulatory text "مرخصة من الهيئة العامة للعقار" in HseelTypography.caption

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
- [ ] Deep link handling (if user came from referral link)
- [ ] Analytics: track welcome screen views
- [ ] A/B testing for different welcome messages

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
