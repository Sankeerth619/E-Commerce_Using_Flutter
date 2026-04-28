import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/app_theme.dart';
import '../utils/currency_formatter.dart';
import '../models/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: AppBar(
        backgroundColor: AppTheme.headerBlue,
        title: Consumer<CartProvider>(
          builder: (ctx, cart, _) => Text(
            'Cart (${cart.totalQuantity} item${cart.totalQuantity != 1 ? 's' : ''})',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (ctx, cart, _) {
          if (cart.cartItems.isEmpty) {
            return _buildEmptyCart(context);
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _buildDeliveryBanner(cart),
                    ...cart.cartItems
                        .map((item) => _buildCartItem(context, item, cart)),
                    _buildPriceSummary(cart),
                  ],
                ),
              ),
              _buildCheckoutBar(context, cart),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey[300]),
        const SizedBox(height: 16),
        const Text('Your cart is empty',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        const Text('Add items to get started', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Continue Shopping'),
        ),
      ],
    ),
  );
}

  Widget _buildDeliveryBanner(CartProvider cart) {
    final freeDelivery = cart.subtotal >= 499;
    final remaining = (499 - cart.subtotal).clamp(0, double.infinity);

    return Container(
      color: freeDelivery ? const Color(0xFFE8F5E9) : const Color(0xFFFFF8E1),
      padding: const EdgeInsets.all(12),
      child: Text(
        freeDelivery
            ? 'FREE Delivery applied'
            : 'Add ₹${remaining.toInt()} for FREE delivery',
        style: TextStyle(
          color:
              freeDelivery ? AppTheme.accentGreen : Colors.orange.shade700,
        ),
      ),
    );
  }

  Widget _buildCartItem(
      BuildContext context, CartItem item, CartProvider cart) {
    final name = item.product.name;
    final shortName = name.length > 20 ? name.substring(0, 20) : name;

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          item.product.images.isNotEmpty
              ? item.product.images.first
              : 'https://via.placeholder.com/150',
          width: 60,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.image_not_supported),
        ),
        title: Text(item.product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(CurrencyFormatter.format(item.product.price)),
            Text('Qty: ${item.quantity}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            cart.removeFromCart(item.product.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$shortName removed')),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPriceSummary(CartProvider cart) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _row('Subtotal', cart.subtotal),
          _row('Discount', -cart.discount),
          _row('Delivery', cart.deliveryCharge),
          const Divider(),
          _row('Total', cart.total, isBold: true),
        ],
      ),
    );
  }

  Widget _row(String label, double value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          CurrencyFormatter.format(value),
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutBar(BuildContext context, CartProvider cart) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: () {
          cart.clearCart();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Order placed successfully')),
          );
        },
        child: Text('Checkout (${CurrencyFormatter.format(cart.total)})'),
      ),
    );
  }
}