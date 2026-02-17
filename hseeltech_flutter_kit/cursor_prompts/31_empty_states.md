# Empty States - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/empty-states.png`

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
@file:lib/features/shared/screens/empty_states_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Empty States** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/shared/screens/empty_states_screen.dart

DESIGN SPECIFICATIONS:
Reusable empty state widget with:
- Illustration/icon (centered, 120px, gray-300)
- Title in HseelTypography.h3 (gray-700)
- Description in HseelTypography.body (gray-500)
- Optional CTA button

Variants:
- Portfolio: briefcase icon + "لم تقم بأي استثمار بعد" + "استكشف الفرص" button
- Notifications: bell icon + "لا توجد إشعارات"
- Saved: bookmark icon + "لم تحفظ أي مشاريع بعد"
- Transactions: receipt icon + "لا توجد معاملات"
- Search: search icon + "لم يتم العثور على نتائج"

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
- [ ] Create reusable EmptyStateWidget
- [ ] Lottie animations for each variant (optional)

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
