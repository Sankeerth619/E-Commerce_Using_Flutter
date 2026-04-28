# ShopKart — Flutter E-Commerce App

A production-level e-commerce mobile application built with Flutter, inspired by Amazon and Flipkart. ShopKart features a full shopping experience including product browsing, category filtering, search, product detail pages, a shopping cart, and a wishlist.

---

## Features

- **Home Screen** — Auto-scrolling promotional banners, category quick-links, and curated product sections (deals, trending, top-rated)
- **Product Browsing** — Browse all products or filter by category (Electronics, Fashion, Home & Kitchen, Books, Beauty, Computers)
- **Product Detail** — Image gallery, ratings, discount percentage, stock count, delivery estimate, size/color selectors, specifications, and features list
- **Search** — Real-time search across product names, brands, and tags
- **Shopping Cart** — Add/remove items, adjust quantities (capped at 10), automatic free delivery above ₹499, live price summary
- **Wishlist** — Toggle products in/out of a persistent wishlist from any screen
- **Prime Badges** — Visual indicators for Prime-eligible products
- **Shimmer Loading** — Skeleton loading states for a polished UX
- **Responsive Scrolling** — Mouse and trackpad drag-scrolling enabled for web/desktop targets

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart SDK ≥ 3.3.0) |
| State Management | Provider (`^6.1.2`) |
| Fonts | Google Fonts — Nunito (`^6.2.1`) |
| Image Loading | cached_network_image (`^3.3.1`) |
| UI Extras | badges, smooth_page_indicator, flutter_rating_bar, shimmer |
| Localisation / Formatting | intl (`^0.19.0`) |
| Icons | Material Icons + cupertino_icons |

---

## Project Structure

```
lib/
├── main.dart                     # App entry point, theme & provider setup
│
├── data/
│   └── product_data.dart         # Static product catalogue
│
├── models/
│   ├── product.dart              # Product model (price, rating, specs, etc.)
│   └── cart_item.dart            # CartItem model (product + quantity + options)
│
├── providers/
│   └── cart_provider.dart        # CartProvider — cart & wishlist state (ChangeNotifier)
│
├── screens/
│   ├── home_screen.dart          # Home feed with banners and categories
│   ├── all_products_screen.dart  # Full product grid with sorting
│   ├── category_screen.dart      # Category-filtered product list
│   ├── product_detail_screen.dart# Product page with gallery and add-to-cart
│   ├── cart_screen.dart          # Cart summary and checkout flow
│   └── search_screen.dart        # Real-time search screen
│
├── widgets/
│   ├── product_card.dart         # Reusable product tile widget
│   └── shopkart_app_bar.dart     # Shared app bar with cart badge
│
└── utils/
    ├── app_theme.dart            # Brand colours, typography, ThemeData
    └── currency_formatter.dart   # INR currency formatting helper
```

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.3.0` — [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK `>=3.3.0` (bundled with Flutter)
- An emulator, simulator, or physical device

### Installation

```bash
# 1. Clone or unzip the project
cd "E-Commerce Product App"

# 2. Fetch dependencies
flutter pub get

# 3. Run the app
flutter run
```

To run on a specific platform:

```bash
flutter run -d chrome      # Web
flutter run -d android     # Android emulator / device
flutter run -d ios         # iOS simulator / device (macOS only)
```

### Build

```bash
# Android APK
flutter build apk --release

# Web
flutter build web --release

# iOS (macOS only)
flutter build ios --release
```

---

## State Management

All cart and wishlist state is managed by `CartProvider` (a `ChangeNotifier`) registered at the root via `MultiProvider`. Key operations:

| Method | Description |
|---|---|
| `addToCart(product)` | Adds item or increments quantity |
| `removeFromCart(id)` | Removes item from cart |
| `incrementQuantity(id)` | Increases quantity (max 10) |
| `decrementQuantity(id)` | Decreases quantity or removes if at 1 |
| `toggleWishlist(id)` | Adds or removes from wishlist |
| `clearCart()` | Empties the cart |

Pricing logic: free delivery for orders ≥ ₹499, otherwise ₹40 delivery charge.

---

## Theming

The app uses a custom `AppTheme` with Material 3. Brand colour palette:

| Token | Hex | Usage |
|---|---|---|
| `primaryBlue` | `#2874F0` | Buttons, links |
| `primaryOrange` | `#FF9F00` | CTAs, add-to-cart |
| `headerBlue` | `#232F3E` | App bar background |
| `accentGreen` | `#388E3C` | In-stock labels |
| `discountRed` | `#B12704` | Discount % badges |
| `primeBlue` | `#00A8E1` | Prime badges |

Typography is set globally using the **Nunito** font family via `google_fonts`.

---

## Dependencies

```yaml
dependencies:
  provider: ^6.1.2
  cached_network_image: ^3.3.1
  google_fonts: ^6.2.1
  badges: ^3.1.2
  smooth_page_indicator: ^1.1.0
  flutter_rating_bar: ^4.0.1
  shimmer: ^3.0.0
  intl: ^0.19.0
  cupertino_icons: ^1.0.6
```

---

## Notes

- Product data is currently static (defined in `lib/data/product_data.dart`). To connect a real backend, replace this with API calls and update the provider accordingly.
- No authentication or payment integration is included — the checkout flow is a UI stub.
- The `.dart_tool/` and `build/` directories in the zip are generated artefacts and can be safely excluded from version control via `.gitignore`.

---

## License

This project is for educational/demo purposes. All brand names referenced in the UI are trademarks of their respective owners.
