# Skeleton Loading - Cursor Migration Prompt

## Screenshot Reference
`@file:assets/images/screenshots/skeleton.png`

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
@file:lib/features/shared/screens/skeleton_screen.dart
```

## Cursor Prompt

> Copy everything below this line into Cursor Composer (Cmd+I):

---

Migrate the **Skeleton Loading** to match the new Hseeltech design shown in the screenshot.

**CURRENT CODE:**
@file:lib/features/shared/screens/skeleton_screen.dart

DESIGN SPECIFICATIONS:
Shimmer loading placeholders for each screen:
- Use shimmer package
- Match exact layout of each screen's content
- Colors: gray-200 base, gray-100 highlight
- Animation: 1500ms infinite sweep

Create skeleton variants for:
- HomeScreenSkeleton
- ExploreScreenSkeleton
- PropertyCardSkeleton
- PortfolioScreenSkeleton
- WalletScreenSkeleton
- TransactionItemSkeleton
- NotificationItemSkeleton

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
- [ ] Create reusable SkeletonBox and SkeletonCircle widgets
- [ ] Create screen-specific skeleton layouts

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
