# Explore Screen - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/explore.png`

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
@file:lib/features/explore/screens/explore_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Explore Screen** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/explore/screens/explore_screen.dart

DESIGN SPECIFICATIONS:
- Navy gradient header with title "استكشاف" + subtitle "اكتشف فرص الاستثمار"
- Search bar: rounded, gray bg, search icon + placeholder "ابحث عن عقارات..."
- Filter icon button (left of search bar)
- Tab toggle: "متاح" / "مكتمل" (pill-style toggle)
- Category filter chips (horizontal scroll): جميع الأنواع, سكني, تجاري, تجزئة
- Results count: "تم العثور على X فرص"
- Vertical list of property cards:
  * Full-width image with location overlay text + heart/save icon
  * Status badge (متاح/جديد/مكتمل) top-left
  * Property name + type badge
  * Return % (green, large) + min investment
  * Funding progress: "X% ممول" with progress bar
  * Token price + "عرض التفاصيل" button
- Pull-to-refresh

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
- [ ] Search API integration with debounce
- [ ] Filter API parameters
- [ ] Pagination / infinite scroll
- [ ] Save/unsave property (bookmark API)
- [ ] Sort options (return, price, newest)

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
