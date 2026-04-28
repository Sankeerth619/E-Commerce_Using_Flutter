import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../utils/app_theme.dart';
import '../utils/currency_formatter.dart';
import '../screens/cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentImageIndex = 0;
  bool _showFullDescription = false;

  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    final images = product.images.isNotEmpty
        ? product.images
        : ['https://via.placeholder.com/300'];

    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: AppBar(
        backgroundColor: AppTheme.headerBlue,
        title: const Text('Product Details'),
        actions: [
          Consumer<CartProvider>(
            builder: (ctx, cart, _) => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CartScreen()),
                  ),
                ),
                if (cart.totalQuantity > 0)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        cart.totalQuantity.toString(),
                        style: const TextStyle(
                            fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    // ✅ IMAGE SLIDER
                    SizedBox(
                      height: 300,
                      child: PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (index) {
                          if (!mounted) return;
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemBuilder: (_, index) => Image.network(
                          images[index],
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),

                    // ✅ DOT INDICATOR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images.length, (index) {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: _currentImageIndex == index ? 10 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _currentImageIndex == index
                                ? Colors.blue
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        );
                      }),
                    ),

                    // ✅ PRODUCT INFO
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(product.name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),

                          const SizedBox(height: 6),

                          Text('by ${product.brand}',
                              style: const TextStyle(
                                  color: Colors.blue)),

                          const SizedBox(height: 8),

                          RatingBarIndicator(
                            rating: product.rating
                                .clamp(0, 5)
                                .toDouble(),
                            itemBuilder: (_, __) => const Icon(
                                Icons.star,
                                color: Colors.amber),
                            itemCount: 5,
                            itemSize: 18,
                          ),

                          const SizedBox(height: 10),

                          Text(
                            CurrencyFormatter.format(product.price),
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),

                          if (product.hasDiscount)
                            Text(
                              'Save ${CurrencyFormatter.format(product.originalPrice - product.price)}',
                              style: const TextStyle(color: Colors.red),
                            ),

                          const SizedBox(height: 8),

                          Text(
                            product.isInStock
                                ? 'In Stock'
                                : 'Out of Stock',
                            style: TextStyle(
                              color: product.isInStock
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ✅ DESCRIPTION
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AnimatedCrossFade(
                            firstChild: Text(
                              product.description,
                              maxLines: 3,
                              overflow:
                                  TextOverflow.ellipsis,
                            ),
                            secondChild:
                                Text(product.description),
                            crossFadeState:
                                _showFullDescription
                                    ? CrossFadeState
                                        .showSecond
                                    : CrossFadeState
                                        .showFirst,
                            duration: const Duration(
                                milliseconds: 300),
                          ),
                          TextButton(
                            onPressed: () => setState(() =>
                                _showFullDescription =
                                    !_showFullDescription),
                            child: Text(
                                _showFullDescription
                                    ? 'Show less'
                                    : 'Read more'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ BOTTOM BAR
            Consumer<CartProvider>(
              builder: (ctx, cart, _) {
                final inCart =
                    cart.isInCart(product.id);

                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: product.isInStock
                              ? () {
                                  if (!inCart) {
                                    cart.addToCart(product);
                                  }
                                  ScaffoldMessenger.of(ctx)
                                      .showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Added to cart')),
                                  );
                                }
                              : null,
                          child: Text(
                              inCart ? 'Added' : 'Add to Cart'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: product.isInStock
                              ? () {
                                  cart.addToCart(product);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const CartScreen(),
                                    ),
                                  );
                                }
                              : null,
                          child: const Text('Buy Now'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}