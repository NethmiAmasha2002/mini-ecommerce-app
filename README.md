# MiniMart — Mini E-commerce Flutter App

A small mobile e-commerce app built with Flutter for the CyphLab Flutter Developer Intern practical task. The app uses local mock data only — no backend integration.

## Features

- **Splash Screen** — animated branding screen on launch
- **Mock Login Screen** — form validation, guest login option (no real auth)
- **Product Home Screen** — responsive grid of products with image, name, price, and rating
- **Search** — live search by product name
- **Category Filter** — filter products by category (Shoes, Electronics, Bags, Watches, Clothing)
- **Product Details Screen** — full description, rating, quantity stepper, Add to Cart
- **Cart Screen** — increase/decrease quantity, remove items, live total price, mock checkout
- **Orders Screen** — static list of past orders
- **Profile Screen** — mock profile info + dark mode toggle
- **Dark Mode** — fully themed light/dark mode, preference saved with `shared_preferences`
- **Animations** — splash screen fade/scale transition, Hero image transitions between list and details

## Tech Stack

- **Flutter** (Dart)
- **State management:** [Provider](https://pub.dev/packages/provider)
- **Local storage:** [shared_preferences](https://pub.dev/packages/shared_preferences) (used to persist dark mode preference)
- **Data:** local mock data (`lib/data/mock_data.dart`, `lib/data/mock_orders.dart`) — no backend or network calls

## Folder Structure

```
lib/
├── main.dart                  # App entry point, Provider setup, theme wiring
├── models/                    # Plain Dart data models
│   ├── product.dart
│   ├── cart_item.dart
│   └── order.dart
├── data/                      # Local mock data sources
│   ├── mock_data.dart
│   └── mock_orders.dart
├── providers/                 # State management (Provider/ChangeNotifier)
│   ├── cart_provider.dart     # Cart logic: add/remove/update quantity, totals
│   ├── product_provider.dart  # Search + category filter logic
│   └── theme_provider.dart    # Dark mode state + persistence
├── screens/                   # One file per screen
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart       # Bottom nav shell (Shop / Cart / Orders / Profile)
│   ├── product_list_screen.dart
│   ├── product_details_screen.dart
│   ├── cart_screen.dart
│   ├── orders_screen.dart
│   └── profile_screen.dart
├── widgets/                   # Reusable UI components
│   ├── product_card.dart
│   └── category_filter_bar.dart
├── theme/
│   └── app_theme.dart         # Light/dark ThemeData definitions
└── utils/
    └── formatters.dart        # Currency formatting helper
```

## How to Run

1. **Install Flutter** (3.0+ recommended) — see [flutter.dev/docs/get-started/install](https://docs.flutter.dev/get-started/install)
2. **Clone this repository**
   ```bash
   git clone <repo-url>
   cd mini_ecommerce
   ```
3. **Install dependencies**
   ```bash
   flutter pub get
   ```
4. **Run the app**
   ```bash
   flutter run
   ```
   This will run on whatever device/emulator/simulator is currently connected. Use `flutter devices` to list available targets.

5. **Build a release APK** (optional, Android)
   ```bash
   flutter build apk --release
   ```
   The output APK will be at `build/app/outputs/flutter-apk/app-release.apk`.

## App Flow

Splash Screen → Login Screen (mock auth or "Continue as Guest") → Home (bottom nav: Shop, Cart, Orders, Profile) → tap a product → Product Details → Add to Cart → Cart tab → adjust quantities / remove items → Checkout (mock, clears cart).

## AI Tool Usage Disclosure

This project was built with the assistance of **Claude** (Anthropic).

**What AI assisted with:**
- Generating the initial project structure and boilerplate for models, providers, and screens
- Drafting widget code for all 5 screens based on a specified folder structure and state management approach
- Writing this README

**What I did / understand:**
- Chose Provider as the state management approach and can explain why (centralized ChangeNotifier classes for cart, product filtering, and theme state, consumed via `Consumer`/`context.read` throughout the widget tree)
- Reviewed, tested, and adjusted the generated code so I can explain how the cart quantity logic, search/filter logic, and theme persistence work
- Verified the folder structure and file responsibilities make sense (models vs providers vs screens vs widgets)
- Can walk through and modify any screen or provider if asked

## Notes

- All images are placeholder images loaded from `picsum.photos` since there's no backend/asset pipeline required for this task.
- Login is intentionally mock-only — any non-empty valid-looking email/password "succeeds," and a "Continue as Guest" option is also provided.
- Checkout in the Cart screen is also mock — it shows a confirmation dialog and clears the cart, simulating order placement without a real payment flow.
