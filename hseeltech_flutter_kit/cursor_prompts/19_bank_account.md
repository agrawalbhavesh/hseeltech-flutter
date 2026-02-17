# Bank Account Management - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/bank-account.png`

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
@file:lib/features/wallet/screens/bank_account_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Bank Account Management** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/wallet/screens/bank_account_screen.dart

DESIGN SPECIFICATIONS:
- Header "الحساب البنكي" with back button
- Current bank account card (if exists):
  * Bank logo + name + verified badge
  * IBAN display
  * "تعديل" / "حذف" options
- "إضافة حساب بنكي" button/card
- Add flow:
  * Bank selection (list of Saudi banks with logos)
  * IBAN input (SA prefix, 22 digits)
  * Beneficiary name (auto-filled from Nafath)
  * Open Banking verification option

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
- [ ] Bank account CRUD API
- [ ] IBAN validation (Saudi format)
- [ ] Open Banking verification flow
- [ ] Bank list with logos from API
- [ ] Primary account selection

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
