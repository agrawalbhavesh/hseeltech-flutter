# Hseeltech Flutter Migration Guide

**For IT Team using Cursor IDE**

---

## Overview

This guide explains how to use Cursor AI to migrate your existing Flutter screens to the new Hseeltech design system. The workflow is designed so Cursor handles the heavy lifting while you focus on reviewing and handling new features that require manual implementation.

---

## Setup (One-Time)

### Step 1: Copy Files to Your Project

```
# Copy these into your existing Flutter project:

1. .cursorrules              → project root (Cursor reads this automatically)
2. lib/core/theme/           → copy all 4 files (colors, typography, spacing, theme)
3. lib/core/constants/       → copy hseel_assets.dart
4. lib/shared/models/        → copy models.dart (adapt to your existing models)
5. lib/routing/              → copy app_router.dart (adapt to your existing routing)
6. assets/fonts/             → copy all .ttf font files
7. assets/icons/             → copy all .svg icon files
8. assets/images/screenshots/→ copy all 39 screen mockup images
```

### Step 2: Install Dependencies

```yaml
# Add to pubspec.yaml if not already present:
dependencies:
  lucide_icons: ^0.257.0      # Icon library used in designs
  shimmer: ^3.0.0              # Skeleton loading effects
  fl_chart: ^0.68.0            # Charts for portfolio
  cached_network_image: ^3.3.0 # Image caching
```

### Step 3: Register Fonts

```yaml
# Add to pubspec.yaml:
fonts:
  - family: Montserrat Arabic
    fonts:
      - asset: assets/fonts/Montserrat-Arabic-Light.ttf
        weight: 300
      - asset: assets/fonts/Montserrat-Arabic-Regular.ttf
        weight: 400
      - asset: assets/fonts/Montserrat-Arabic-Medium.ttf
        weight: 500
      - asset: assets/fonts/Montserrat-Arabic-SemiBold.ttf
        weight: 600
      - asset: assets/fonts/Montserrat-Arabic-Bold.ttf
        weight: 700
      - asset: assets/fonts/Montserrat-Arabic-ExtraBold.ttf
        weight: 800
```

### Step 4: Apply Theme

```dart
// In your main.dart MaterialApp:
MaterialApp(
  theme: HseelTheme.light,
  darkTheme: HseelTheme.dark,
  themeMode: ThemeMode.system,
  // ...
);
```

---

## Migration Workflow (Per Screen)

### The 3-Step Process

For each screen you want to migrate:

```
┌─────────────────────────────────────────────────┐
│  STEP 1: Feed Cursor the old code + new design  │
│  STEP 2: Review Cursor's output + fix issues     │
│  STEP 3: Manually implement new features          │
└─────────────────────────────────────────────────┘
```

### Step 1: Feed Cursor

Open Cursor's Composer (Cmd+I / Ctrl+I) and use this template:

```
@file:assets/images/screenshots/{screen_name}.png
@file:lib/core/theme/hseel_colors.dart
@file:lib/core/theme/hseel_typography.dart
@file:lib/core/theme/hseel_spacing.dart
@file:.cursorrules

Migrate this screen to match the new design shown in the screenshot.

Current code:
@file:lib/features/{feature}/screens/{screen_name}_screen.dart

Requirements:
1. Match the layout, spacing, and visual hierarchy from the screenshot exactly
2. Use HseelColors for all colors (never hardcode hex values)
3. Use HseelTypography for all text styles (never hardcode font sizes)
4. Use HseelSpacing for all spacing values
5. Support RTL layout (use Start/End instead of Left/Right)
6. Add skeleton loading state
7. Keep existing business logic and API calls intact
8. Only change the UI layer

Do NOT implement these new features (marked for manual implementation):
{list features from the prompt file}
```

### Step 2: Review Output

After Cursor generates the code:

- [ ] Compare with screenshot - does it match?
- [ ] Check all colors use `HseelColors.*`
- [ ] Check all text styles use `HseelTypography.*`
- [ ] Check RTL compatibility (no Left/Right, only Start/End)
- [ ] Check touch targets >= 44pt
- [ ] Test on both light and dark mode
- [ ] Test with Arabic and English

### Step 3: Manual Features

Each screen prompt file lists features marked as `[MANUAL]`. These are new features not in the old code that need backend work or complex logic. Implement these separately after the UI migration is done.

---

## Recommended Migration Order

Start with the Home Screen as a pilot test, then follow this order:

| Phase | Screens | Priority |
|-------|---------|----------|
| **Pilot** | Home Screen | Test the workflow |
| **Phase 1** | Splash, Welcome, Onboarding | Auth entry |
| **Phase 2** | Register, Nafath, KYC, PIN, Biometric | Auth flow |
| **Phase 3** | Explore, Property Detail | Core browsing |
| **Phase 4** | Invest Flow, Invest Success | Core transaction |
| **Phase 5** | Portfolio, Investment Detail | Portfolio |
| **Phase 6** | Wallet, Deposit, Withdraw, Transactions | Financial |
| **Phase 7** | Rewards | Engagement |
| **Phase 8** | Profile, Settings, Edit Profile | User management |
| **Phase 9** | Notifications, Saved Projects | Secondary |
| **Phase 10** | Legal pages, FAQ, Contact | Support |
| **Phase 11** | Empty States, Error States, Skeleton | Polish |
| **Phase 12** | Dark Mode, Delete Account | Final |

---

## Pilot Test: Home Screen

Use this to verify the workflow works before migrating all screens.

### Cursor Prompt for Home Screen

```
@file:assets/images/screenshots/home.png
@file:lib/core/theme/hseel_colors.dart
@file:lib/core/theme/hseel_typography.dart
@file:lib/core/theme/hseel_spacing.dart
@file:lib/shared/models/models.dart
@file:.cursorrules

Migrate the Home Screen to match the new design in the screenshot.

CURRENT CODE:
@file:lib/features/home/screens/home_screen.dart

DESIGN SPECIFICATIONS:
The home screen has these sections from top to bottom:

1. TOP BAR (inside navy gradient):
   - Right side (RTL): Greeting "مرحباً 👋" + user first name in HseelTypography.h2 white
   - Left side: Notification bell icon (with red dot badge for unread count), 
     bookmark icon, AR/EN language toggle pill

2. INVESTMENT SUMMARY CARD (glass-morphism card on navy gradient):
   - Label: "إجمالي قيمة الاستثمارات" in HseelTypography.bodySmall white/70%
   - Amount: Large number (e.g., "125,400") in HseelTypography.display white + "ر.س" suffix
   - Hseeltech logo icon next to amount
   - Divider line
   - 3-column stats row:
     * العائد الشهري: "+2,450" in HseelColors.primaryLight
     * العائد السنوي المتوقع: "+8.37%" in HseelColors.primaryLight  
     * الاستثمارات: "3" in white

3. QUICK ACTIONS ROW (4 circular buttons, horizontal):
   - إيداع (deposit) - arrow down icon
   - سحب (withdraw) - arrow up icon
   - المحفظة (wallet) - wallet icon
   - المزيد (more) - dots icon
   - Each: 56px circle with gray-100 bg, icon in gray-700, label below in HseelTypography.caption

4. AVAILABLE OPPORTUNITIES SECTION:
   - Header row: "الفرص المتاحة" (HseelTypography.h3) + "عرض الكل" link (HseelColors.primary)
   - Horizontal scrollable list of PropertyCard widgets
   - Each card:
     * Property image (16:10 ratio, rounded top corners)
     * Status badges overlay (e.g., "متاح", "سكني") 
     * Property name in HseelTypography.h4
     * Location with map-pin icon in HseelTypography.bodySmall
     * Stats row: العائد السنوي المتوقع, العائد الصافي, التوزيعات
     * Property specs: bedrooms, bathrooms, area
     * Funding progress bar (HseelColors.navy bg, HseelColors.primary fill)

5. BOTTOM NAVIGATION BAR:
   - 5 tabs: الرئيسية, استكشاف, استثمار, مكافآت, حسابي
   - Active tab: HseelColors.primary icon + label
   - Inactive: HseelColors.gray400

IMPLEMENTATION RULES:
- Navy gradient background: LinearGradient from HseelColors.navy to HseelColors.navyLight
- Investment card: semi-transparent white bg (Colors.white.withOpacity(0.1)) with blur
- All amounts formatted with NumberFormat('#,###') - always English numerals
- Currency: "ر.س" suffix (Arabic) or "SAR" (English)
- Property cards: 280px width, horizontal scroll with 16px gap
- Use Lucide icons (lucide_icons package)
- Skeleton loading: show shimmer placeholders while data loads

DO NOT IMPLEMENT (mark with TODO for manual work):
- [ ] Actual API integration (use mock data for now)
- [ ] Push notification badge real-time count
- [ ] Language switching logic (AR/EN toggle)
- [ ] Pull-to-refresh with real data reload
- [ ] Deep linking to property detail on card tap
```

### Expected Result

After running this prompt, Cursor should generate a complete `home_screen.dart` that:
- Matches the screenshot layout
- Uses all design tokens correctly
- Has mock data for testing
- Has TODO comments for manual features

### Verification Checklist

- [ ] Run the app - Home screen renders without errors
- [ ] Layout matches the screenshot
- [ ] Colors are correct (navy gradient, green accents)
- [ ] Typography is readable and properly sized
- [ ] RTL layout works (greeting on right, icons on left)
- [ ] Scroll behavior works on property cards
- [ ] Dark mode switches correctly
- [ ] No hardcoded colors or font sizes in the code

**If this works → proceed to Phase 1. If not → adjust the .cursorrules and try again.**

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Cursor ignores .cursorrules | Make sure file is in project root, restart Cursor |
| Colors don't match | Check HseelColors import, verify no hardcoded hex |
| Font not rendering | Check pubspec.yaml font registration, run `flutter clean` |
| RTL broken | Replace all Left/Right with Start/End, check Directionality |
| Dark mode wrong | Verify HseelTheme.dark is set as darkTheme in MaterialApp |
| Layout overflow | Check SafeArea usage, verify bottom nav padding |

---

## File Reference

| File | Purpose |
|------|---------|
| `.cursorrules` | AI instructions - Cursor reads automatically |
| `lib/core/theme/hseel_colors.dart` | All color constants |
| `lib/core/theme/hseel_typography.dart` | All text style constants |
| `lib/core/theme/hseel_spacing.dart` | Spacing, radius, dimensions |
| `lib/core/theme/hseel_theme.dart` | Complete ThemeData (light + dark) |
| `lib/core/constants/hseel_assets.dart` | Asset path constants |
| `lib/shared/models/models.dart` | Data model definitions |
| `lib/routing/app_router.dart` | Route definitions + helpers |
| `cursor_prompts/` | Per-screen migration prompts |
| `assets/images/screenshots/` | Design reference images |
