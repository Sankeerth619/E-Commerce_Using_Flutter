import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/app_theme.dart';
import '../screens/cart_screen.dart';
import '../screens/search_screen.dart';

class ShopKartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showSearch;
  final bool showCart;
  final List<Widget>? actions;

  const ShopKartAppBar({
    super.key,
    this.title,
    this.showSearch = true,
    this.showCart = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.headerBlue,
      title: title != null
          ? Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Shop',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: 'Kart',
                        style: TextStyle(
                          color: AppTheme.primaryOrange,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : _buildSearchBar(context),
      actions: [
        if (showSearch && title != null)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchScreen()),
            ),
          ),
        if (showCart) _buildCartIcon(context),
        if (actions != null) ...actions!,
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchScreen()),
      ),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Icon(Icons.search, color: Colors.grey[600], size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                'Search ShopKart',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 36,
              decoration: BoxDecoration(
                color: AppTheme.primaryOrange,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(4),
                ),
              ),
              child: const Icon(Icons.search, color: Colors.black, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartIcon(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (ctx, cart, _) {
        return IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          ),
          icon: badges.Badge(
            showBadge: cart.totalQuantity > 0,
            badgeContent: Text(
              cart.totalQuantity.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: AppTheme.primaryOrange,
            ),
            child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
