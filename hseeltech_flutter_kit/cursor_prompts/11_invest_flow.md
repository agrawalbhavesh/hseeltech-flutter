# Investment Flow - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/invest-flow.png`

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
@file:lib/features/investment/screens/invest_flow_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Investment Flow** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/investment/screens/invest_flow_screen.dart

DESIGN SPECIFICATIONS:
- Step 1: Amount Selection
  * Property summary card (mini version)
  * Token price display
  * Number of tokens input (stepper: - / input / +)
  * Total amount calculated live
  * Wallet balance shown
  * "المتابعة" button (disabled if insufficient balance)
- Step 2: Confirmation
  * Investment summary card
  * Property name + image thumbnail
  * Tokens: X, Amount: X SAR
  * Fee breakdown (if any)
  * Terms checkbox
  * "تأكيد الاستثمار" button
  * Biometric/PIN verification bottom sheet

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
- [ ] Investment API call
- [ ] Wallet balance check
- [ ] Biometric/PIN verification before confirm
- [ ] Insufficient balance → redirect to deposit
- [ ] Transaction fee calculation
- [ ] Idempotency handling (prevent double-submit)

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
