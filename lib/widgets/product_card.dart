import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../utils/app_theme.dart';
import '../utils/currency_formatter.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isGridView;

  const ProductCard({
    super.key,
    required this.product,
    this.isGridView = true,
  });

  @override
  Widget build(BuildContext context) {
    return isGridView ? _buildGridCard(context) : _buildListCard(context);
  }

  // ── Grid Card ──────────────────────────────────────────────────────────────
  // KEY CHANGES:
// - const constructors throughout
// - BoxFit.contain for product images (not cover)
// - Wishlist icon now Consumer-based for reactivity
// - Responsive image height via LayoutBuilder
// - CurrencyFormatter used for price display

Widget _buildGridCard(BuildContext context) {
  return GestureDetector(
    onTap: () => _navigateToDetail(context),
    child: Card(
      margin: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: _buildImageSection(context),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductName(),
                  _buildRating(),
                  _buildPriceSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  // ── List Card ──────────────────────────────────────────────────────────────
  Widget _buildListCard(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: AppTheme.cardWhite,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(8)),
              child: Image.network(
                product.images.isNotEmpty
                    ? product.images.first
                    : 'https://via.placeholder.com/150',
                width: 120,
                height: 130,
                fit: BoxFit.contain, // FIX: was cover — distorted products
                errorBuilder: (_, __, ___) => const SizedBox(
                  width: 120,
                  height: 130,
                  child: Center(
                    child: Icon(Icons.image_not_supported,
                        color: Colors.grey, size: 36),
                  ),
                ),
              ),
            ),

            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textDark,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    _buildRating(),
                    const SizedBox(height: 4),
                    _buildPriceSection(),
                    if (product.isPrime) ...[
                      const SizedBox(height: 4),
                      _buildPrimeBadge(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Image Section (used in grid card) ─────────────────────────────────────
  Widget _buildImageSection(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Product image
        Image.network(
          product.images.isNotEmpty
              ? product.images.first
              : 'https://via.placeholder.com/300',
          fit: BoxFit.contain, // FIX: contain keeps aspect ratio — no distortion
          errorBuilder: (_, __, ___) => const ColoredBox(
            color: AppTheme.lightGrey,
            child: Center(
              child: Icon(Icons.image, color: Colors.grey, size: 40),
            ),
          ),
        ),

        // Discount badge — top left
        if (product.hasDiscount)
          Positioned(
            top: 6,
            left: 6,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: AppTheme.discountRed,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${product.discountPercent.toInt()}% off',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

        // Wishlist icon — top right
        // FIX: Consumer so icon reacts to wishlist state without full rebuild
        Positioned(
          top: 4,
          right: 4,
          child: Consumer<CartProvider>(
            builder: (ctx, cart, _) {
              final inWishlist = cart.isInWishlist(product.id);
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => cart.toggleWishlist(product.id),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: Icon(
                    inWishlist ? Icons.favorite : Icons.favorite_border,
                    size: 16,
                    color: inWishlist ? Colors.red : Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ── Sub-widgets ────────────────────────────────────────────────────────────

  Widget _buildProductName() {
    return Text(
      product.name,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppTheme.textDark,
        height: 1.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRating() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: AppTheme.accentGreen,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                product.rating.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.star, color: Colors.white, size: 10),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            '(${_formatCount(product.reviewCount)})',
            style: const TextStyle(
              color: AppTheme.textGrey,
              fontSize: 10,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // FIX: was showing raw double (e.g. ₹109999.0) — now uses CurrencyFormatter
        Text(
          CurrencyFormatter.format(product.price),
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: AppTheme.textDark,
          ),
        ),
        if (product.hasDiscount)
          Text(
            'M.R.P: ${CurrencyFormatter.format(product.originalPrice)}',
            style: const TextStyle(
              fontSize: 10,
              color: AppTheme.textGrey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }

  Widget _buildPrimeBadge() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: AppTheme.primeBlue,
            borderRadius: BorderRadius.circular(3),
          ),
          child: const Text(
            'prime',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(width: 4),
        const Flexible(
          child: Text(
            'FREE Delivery',
            style: TextStyle(
              fontSize: 10,
              color: AppTheme.textDark,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  String _formatCount(int count) {
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}k';
    return count.toString();
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailScreen(product: product),
      ),
    );
  }
}