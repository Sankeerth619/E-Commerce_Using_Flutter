import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Brand Colors ────────────────────────────────────────────
  static const Color primaryOrange = Color(0xFFFF9F00);
  static const Color primaryBlue   = Color(0xFF2874F0);
  static const Color darkNavy      = Color(0xFF131921);
  static const Color headerBlue    = Color(0xFF232F3E);
  static const Color accentGreen   = Color(0xFF388E3C);
  static const Color primeBlue     = Color(0xFF00A8E1);
  static const Color discountRed   = Color(0xFFB12704);
  static const Color lightGrey     = Color(0xFFF5F5F5);
  static const Color cardWhite     = Color(0xFFFFFFFF);
  static const Color textDark      = Color(0xFF0F1111);
  static const Color textGrey      = Color(0xFF565959);
  static const Color dividerGrey   = Color(0xFFDDD9D9);
  static const Color starYellow    = Color(0xFFFF9900);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: primaryOrange,
        surface: lightGrey,
      ),
      textTheme: GoogleFonts.nunitoTextTheme().copyWith(
        displayLarge: GoogleFonts.nunito(
            fontSize: 28, fontWeight: FontWeight.w800, color: textDark),
        titleLarge: GoogleFonts.nunito(
            fontSize: 18, fontWeight: FontWeight.w700, color: textDark),
        titleMedium: GoogleFonts.nunito(
            fontSize: 16, fontWeight: FontWeight.w600, color: textDark),
        bodyLarge: GoogleFonts.nunito(
            fontSize: 14, fontWeight: FontWeight.w500, color: textDark),
        bodyMedium: GoogleFonts.nunito(
            fontSize: 13, fontWeight: FontWeight.w400, color: textGrey),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: headerBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.nunito(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: Colors.black,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle:
              GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ),
      cardTheme: CardThemeData(
        color: cardWhite,
        elevation: 1,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      scaffoldBackgroundColor: lightGrey,
    );
  }
}

// ── Responsive Layout Helper ─────────────────────────────────
class Responsive {
  static bool isMobile(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width < 600;
  static bool isTablet(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width >= 600 &&
      MediaQuery.sizeOf(ctx).width < 1024;
  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width >= 1024;

  /// Number of grid columns based on screen width.
  static int gridColumns(BuildContext ctx) {
    final w = MediaQuery.sizeOf(ctx).width;
    if (w >= 1400) return 5;
    if (w >= 1024) return 4;
    if (w >= 600)  return 3;
    return 2;
  }

  /// Horizontal content padding that grows on larger screens.
  static double horizontalPadding(BuildContext ctx) {
    final w = MediaQuery.sizeOf(ctx).width;
    if (w >= 1200) return (w - 1200) / 2 + 24;
    if (w >= 900) return 48.0;
    return 16.0;
  }

  /// Banner carousel height.
  static double bannerHeight(BuildContext ctx) {
    final w = MediaQuery.sizeOf(ctx).width;
    if (w >= 1024) return 260;
    if (w >= 600)  return 200;
    return 160;
  }
}

class AppConstants {
  static const double defaultPadding = 16.0;
  static const double smallPadding   = 8.0;
  static const double largePadding   = 24.0;
  static const double cardRadius     = 8.0;
  static const double buttonRadius   = 8.0;
}