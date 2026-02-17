# Rewards Screen - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/rewards.png`

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
@file:lib/features/rewards/screens/rewards_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Rewards Screen** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/rewards/screens/rewards_screen.dart

DESIGN SPECIFICATIONS:
- Header "المكافآت" with back arrow + "تعرف على المستويات" button
- Current tier card:
  * Tier icon + name (الانطلاق Al-Iitlaq)
  * Progress bar to next tier
  * "ابدأ الاستثمار لترقية مستواك" hint
- "أرباحي" expandable section: earnings amount
- Referral card "أحل واكسب":
  * Gift icon + title
  * Description: "انضم إلي في حصيلتك واحصل على 150 ريال..."
  * "مشاركة الرابط" primary button (full width)
- "سياسة المكافآت" link with icon
- "مستويات المكافآت" section:
  * List of tiers with icons, names, requirements
  * Current tier highlighted with "الحالي" badge

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
- [ ] Rewards API (tier, earnings, referral code)
- [ ] Share referral link (share_plus)
- [ ] Referral tracking
- [ ] Tier progression logic
- [ ] Rewards policy deep link

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
