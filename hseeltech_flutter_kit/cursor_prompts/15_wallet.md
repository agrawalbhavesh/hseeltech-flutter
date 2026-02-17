# Wallet Screen - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/wallet.png`

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
@file:lib/features/wallet/screens/wallet_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Wallet Screen** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/wallet/screens/wallet_screen.dart

DESIGN SPECIFICATIONS:
- Header "محفظتي" with back arrow + "استثماراتي" button
- Balance card (navy gradient):
  * Eye icon (toggle balance visibility)
  * "الرصيد المتاح" label
  * Large amount: "8,968 ر.س"
  * Row: "إجمالي المستثمر 30,000 ر.س" | "إجمالي العوائد 3,968 ر.س"
- Bank account card:
  * Bank logo + name (البنك العربي الوطني) + "موثق" verified badge
  * Account holder name with copy button
  * IBAN with copy button (formatted: SA07 3010 0971 ...)
  * Account number with copy button
  * "نسخ الكل" + "مشاركة" buttons
- Quick actions: 3 circular buttons (إيداع, سحب, إحالة)
- "المعاملات" section with filter tabs: الكل | وارد | صادر
- Transaction list items

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
- [ ] Wallet balance API
- [ ] Bank account API
- [ ] Copy to clipboard functionality
- [ ] Share bank details
- [ ] Balance visibility toggle (secure storage)
- [ ] Transaction list API with pagination
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
