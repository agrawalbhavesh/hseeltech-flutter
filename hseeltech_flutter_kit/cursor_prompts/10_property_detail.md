# Property Detail Screen - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/property-detail.png`

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
@file:lib/features/investment/screens/property_detail_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Property Detail Screen** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/investment/screens/property_detail_screen.dart

DESIGN SPECIFICATIONS:
- Image carousel (full width, 60% height) with:
  * Page indicator dots
  * Back button (top-left, circular, semi-transparent)
  * Share + Bookmark buttons (top-right)
  * Property name + location overlay (bottom of image)
  * Status badge (bottom-left)
- Property spec chips row: type, bedrooms, bathrooms, area (horizontal scroll)
- Funding progress card:
  * "تقدم التمويل" label + percentage
  * Progress bar (HseelColors.primary)
  * "X ر.س تم جمعها" + "من X ر.س" labels
- 4 stat cards (2x2 grid):
  * العائد السنوي المتوقع: X.XX%
  * سعر التوكن: X,XXX ر.س
  * نسبة الإيجار السنوي: X.X%
  * التوزيعات: ربع سنوي
  * Each with icon + label + value
- Tab bar: نظرة عامة | المالية | الموقع | المستندات
  * نظرة عامة: description text
  * المالية: financial breakdown table
  * الموقع: Google Maps embed
  * المستندات: downloadable PDF list
- Sticky bottom: "استثمر الآن" primary CTA button

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
- [ ] Property API fetch by ID
- [ ] Image carousel with cached_network_image
- [ ] Google Maps integration for location tab
- [ ] Document download functionality
- [ ] Share functionality (share_plus)
- [ ] Bookmark/save toggle API
- [ ] Real-time funding progress updates

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
