# Delete Account - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/delete-account.png`

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
@file:lib/features/settings/screens/delete_account_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Delete Account** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/settings/screens/delete_account_screen.dart

DESIGN SPECIFICATIONS:
- Header "حذف الحساب" with back button
- Warning card (red border):
  * Alert icon
  * "تحذير: حذف الحساب نهائي" in red
  * Description of consequences
- Checklist of what will be deleted
- Reason selection (optional dropdown)
- Confirmation input: type "حذف" to confirm
- "حذف الحساب نهائياً" red button (disabled until confirmed)
- PIN/Biometric verification

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
- [ ] Delete account API
- [ ] Withdrawal of remaining balance first
- [ ] PIN/Biometric verification
- [ ] Confirmation dialog
- [ ] Clear all local data
- [ ] Analytics: track deletion reasons

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
