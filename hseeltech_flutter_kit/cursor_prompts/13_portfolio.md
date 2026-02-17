# Portfolio Screen - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/portfolio.png`

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
@file:lib/features/portfolio/screens/portfolio_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Portfolio Screen** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/portfolio/screens/portfolio_screen.dart

DESIGN SPECIFICATIONS:
- Navy gradient header "استثماراتي" with المحفظة button (top-left)
- Investment summary card (glass-morphism on navy):
  * "إجمالي قيمة الاستثمارات" label
  * Large total: "134,135 ر.س"
  * Row: "مستثمر 125,000 ر.س" | "إجمالي العائد +9,135 ر.س" (green)
- Available balance card: "الرصيد المتاح 45,250 ر.س" with المحفظة link arrow
- 3 stat cards row:
  * العقارات: 3 (with clock icon)
  * متوسط العائد: 7.5% (with trending-up icon)
  * مؤكد: 2/3 (with check-circle icon)
- Next distribution card:
  * Calendar icon + "التوزيع القادم"
  * Amount: "2,450 ر.س"
  * Date: "متوقع في 15 مارس 2026"
  * Countdown badge: "بعد 33 يوم"
- "توزيع الاستثمارات" section:
  * Horizontal bar chart by property type
  * سكني 40%, تجاري 24%, ضيافة 36%
  * Each with colored progress bar
- Investment list (scrollable below)

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
- [ ] Portfolio API aggregation
- [ ] Real-time value updates
- [ ] Distribution calendar integration
- [ ] Investment performance chart (fl_chart)
- [ ] Pull-to-refresh

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
