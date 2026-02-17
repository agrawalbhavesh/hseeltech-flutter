# Hseeltech - New Features Requiring Manual Implementation

This document lists all **new features** in the redesigned app that likely don't exist in the current codebase. These cannot be auto-migrated by Cursor and need manual development with backend support.

---

## Priority 1: Core Business Logic

| # | Feature | Screens Affected | Backend Required | Complexity |
|---|---------|-----------------|-----------------|------------|
| 1 | **Rewards & Referral System** | Rewards, Profile, Home | Yes - new API endpoints | High |
| 2 | **Tier Progression** (Al-Iitlaq → Al-Raed → Al-Mustathmer → Al-Shareek) | Rewards | Yes - tier calculation engine | High |
| 3 | **Open Banking Verification** | Bank Account | Yes - Open Banking API integration | High |
| 4 | **Next Distribution Countdown** | Portfolio, Home | Yes - distribution scheduling | Medium |
| 5 | **Investment Distribution Breakdown** (by property type %) | Portfolio | Yes - aggregation API | Medium |

---

## Priority 2: UX Enhancements

| # | Feature | Screens Affected | Backend Required | Complexity |
|---|---------|-----------------|-----------------|------------|
| 6 | **AR/EN Language Toggle** (live switching) | All screens | No - local only | Medium |
| 7 | **Dark Mode Support** | All screens | No - local only | Medium |
| 8 | **Skeleton Loading States** | All screens | No - UI only | Low |
| 9 | **Empty States** (per screen) | Portfolio, Notifications, Saved, Transactions | No - UI only | Low |
| 10 | **Error States** (network, server, not found) | All screens | No - UI only | Low |
| 11 | **Pull-to-Refresh** | Home, Explore, Portfolio, Wallet | No - triggers existing API | Low |
| 12 | **Balance Visibility Toggle** (eye icon) | Wallet, Home | No - local preference | Low |

---

## Priority 3: New Screens

| # | Feature | Screen | Backend Required | Complexity |
|---|---------|--------|-----------------|------------|
| 13 | **Completed Investment Report** | completed-report | Yes - report generation API | Medium |
| 14 | **Delete Account Flow** | delete-account | Yes - account deletion API | Medium |
| 15 | **Contact Us Form** | contact-us | Yes - support ticket API | Low |
| 16 | **Saved/Bookmarked Projects** | saved-projects | Yes - bookmark CRUD API | Low |

---

## Priority 4: Financial Features

| # | Feature | Screens Affected | Backend Required | Complexity |
|---|---------|-----------------|-----------------|------------|
| 17 | **Deposit via Open Banking** | Deposit | Yes - payment gateway | High |
| 18 | **Withdrawal with PIN/Biometric** | Withdraw | Yes - verification + transfer API | High |
| 19 | **Transaction Filtering** (الكل/وارد/صادر + date range) | Transactions, Wallet | Yes - filter params in API | Medium |
| 20 | **Copy Bank Details** (IBAN, account number) | Wallet | No - clipboard only | Low |
| 21 | **Share Bank Details** | Wallet | No - share_plus | Low |

---

## Priority 5: Design System Components

These are **new reusable widgets** that should be built as a shared component library:

| # | Component | Used In | Notes |
|---|-----------|---------|-------|
| 22 | `PropertyCard` (horizontal scroll version) | Home | New card layout with progress bar |
| 23 | `PropertyCard` (full-width list version) | Explore | Different layout from Home version |
| 24 | `InvestmentSummaryCard` (glass-morphism) | Home, Portfolio | Navy gradient + blur effect |
| 25 | `QuickActionButton` (circular icon + label) | Home, Wallet | Reusable action button |
| 26 | `StatCard` (icon + label + value) | Portfolio, Detail | Multiple variants |
| 27 | `BankAccountCard` | Wallet, Bank Account | With copy/share actions |
| 28 | `StatusBadge` (متاح/مكتمل/جديد) | Explore, Detail, Cards | Color-coded badges |
| 29 | `FundingProgressBar` | Detail, Cards | Custom progress bar |
| 30 | `SkeletonLoader` (shimmer) | All screens | Base shimmer widget |
| 31 | `EmptyStateWidget` | Multiple | Reusable with variants |
| 32 | `ErrorStateWidget` | Multiple | Reusable with retry |
| 33 | `BottomNavBar` (custom) | Main shell | 5 tabs with active indicator |
| 34 | `SectionHeader` (title + "عرض الكل") | Home, Portfolio | Reusable section header |

---

## Implementation Notes

### For Cursor AI Migration (Automated)
Cursor can handle these tasks effectively:
- Updating layouts to match new designs
- Replacing hardcoded colors with `HseelColors.*`
- Replacing hardcoded fonts with `HseelTypography.*`
- Adding RTL support (Start/End)
- Creating widget structure from screenshots
- Generating mock data for testing

### For Manual Implementation
These require human developers:
- Backend API integration and new endpoints
- Payment gateway integration (Open Banking)
- Nafath verification flow
- Security features (PIN, biometric)
- Push notification setup
- Analytics integration
- App Store / Play Store submission
- Performance optimization
- Accessibility audit
- Security audit

---

## Suggested Sprint Plan

| Sprint | Focus | Screens |
|--------|-------|---------|
| Sprint 1 | **Pilot** - Home Screen migration + verify workflow | Home |
| Sprint 2 | **Auth Flow** - All registration screens | Splash → Biometric (8 screens) |
| Sprint 3 | **Core Browsing** - Explore + Detail | Explore, Property Detail |
| Sprint 4 | **Investment** - Full investment flow | Invest, Success, Investment Detail |
| Sprint 5 | **Portfolio** - Portfolio + Report | Portfolio, Completed Report |
| Sprint 6 | **Financial** - Wallet + Deposit + Withdraw | Wallet, Deposit, Withdraw, Transactions, Bank Account |
| Sprint 7 | **Rewards** - Full rewards system | Rewards (+ backend) |
| Sprint 8 | **Settings & Profile** | Profile, Settings, Edit Profile, Notifications, Saved |
| Sprint 9 | **Legal & Support** | Terms, Privacy, Risk, FAQ, Contact |
| Sprint 10 | **Polish** - Empty/Error states, Skeleton, Dark Mode, Delete Account | Utility screens |
