# PIN Setup - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/pin.png`

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
@file:lib/features/auth/screens/pin_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **PIN Setup** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/auth/screens/pin_screen.dart

DESIGN SPECIFICATIONS:
- White background
- Header: "إنشاء رمز PIN" in HseelTypography.h2
- Subtitle: "أدخل رمز مكون من 4 أرقام"
- 4-digit PIN input (pinput package):
  * Each cell: 56x56px, HseelSpacing.radiusLg
  * Empty: gray-200 border
  * Filled: navy background, white dot
  * Focused: primary border
- Custom number pad (0-9 + delete + biometric)
- Step 2: "تأكيد رمز PIN" (re-enter)
- Error state: shake animation + red border if mismatch

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
- [ ] Secure PIN storage (flutter_secure_storage)
- [ ] PIN validation (no sequential, no repeated digits)
- [ ] Biometric fallback option

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
