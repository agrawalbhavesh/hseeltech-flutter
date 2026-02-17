# Investment Detail - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/investment-detail.png`

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
@file:lib/features/investment/screens/investment_detail_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Investment Detail** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/investment/screens/investment_detail_screen.dart

DESIGN SPECIFICATIONS:
- AppBar with property name + back button
- Property image (small, rounded)
- Investment stats cards:
  * Tokens owned, Purchase price, Current value
  * Total returns, Return %, Status
- Returns history chart (line chart)
- Distribution history list
- Documents section
- "بيع التوكنات" button (if secondary market available)

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
- [ ] Investment detail API
- [ ] Returns chart with fl_chart
- [ ] Distribution history pagination
- [ ] Document download
- [ ] Secondary market sell flow

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
