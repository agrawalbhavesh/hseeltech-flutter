# Transaction History - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/transactions.png`

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
@file:lib/features/wallet/screens/transactions_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Transaction History** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/wallet/screens/transactions_screen.dart

DESIGN SPECIFICATIONS:
- Header "المعاملات" with back button
- Filter tabs: الكل | وارد | صادر
- Date range filter option
- Transaction list items:
  * Icon (colored by type: green deposit, red withdraw, blue investment)
  * Title + description
  * Amount (+ green or - red)
  * Date + status badge
- Empty state when no transactions

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
- [ ] Transactions API with filters
- [ ] Pagination / infinite scroll
- [ ] Date range picker
- [ ] Transaction detail bottom sheet
- [ ] Export transactions (PDF/CSV)

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
