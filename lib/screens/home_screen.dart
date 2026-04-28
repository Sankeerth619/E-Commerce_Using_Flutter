import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../data/product_data.dart';
import '../utils/app_theme.dart';
import '../widgets/product_card.dart';
import '../widgets/shopkart_app_bar.dart';
import '../screens/category_screen.dart';
import '../screens/all_products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerController = PageController();

  final List<Map<String, dynamic>> _banners = [
    {
      'title': 'Mega Electronics Sale',
      'subtitle': 'Up to 40% off on mobiles & laptops',
      'gradient': [Color(0xFF1a237e), Color(0xFF283593)],
      'icon': Icons.phone_android,
    },
    {
      'title': 'Fashion Week',
      'subtitle': 'Top brands at lowest prices',
      'gradient': [Color(0xFF880e4f), Color(0xFFad1457)],
      'icon': Icons.shopping_bag,
    },
    {
      'title': 'Home & Kitchen Deals',
      'subtitle': 'Upgrade your home today',
      'gradient': [Color(0xFF1b5e20), Color(0xFF2e7d32)],
      'icon': Icons.home,
    },
    {
      'title': 'Prime Benefits',
      'subtitle': 'Free delivery on eligible orders',
      'gradient': [Color(0xFF004d40), Color(0xFF00695c)],
      'icon': Icons.local_shipping,
    },
  ];

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Electronics',   'icon': Icons.phone_android, 'color': Color(0xFF1565C0)},
    {'name': 'Fashion',       'icon': Icons.checkroom,     'color': Color(0xFFAD1457)},
    {'name': 'Home & Kitchen','icon': Icons.home,          'color': Color(0xFF2E7D32)},
    {'name': 'Books',         'icon': Icons.menu_book,     'color': Color(0xFFE65100)},
    {'name': 'Beauty',        'icon': Icons.spa,           'color': Color(0xFF6A1B9A)},
    {'name': 'Computers',     'icon': Icons.laptop,        'color': Color(0xFF00695C)},
    {'name': 'All',           'icon': Icons.grid_view,     'color': Color(0xFF37474F)},
  ];

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ FIX: declare products here so every method below can use it
    final products   = ProductData.products;
    final deals      = ProductData.dealsOfTheDay;
    final featured   = ProductData.featuredProducts;

    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: const ShopKartAppBar(),
      body: RefreshIndicator(
        color: AppTheme.primaryOrange,
        onRefresh: () async =>
            await Future.delayed(const Duration(milliseconds: 800)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeliveryBar(),
              _buildBannerCarousel(),
              const SizedBox(height: 8),
              _buildCategoryRow(),
              const SizedBox(height: 8),
              _buildDealSection(deals),
              const SizedBox(height: 8),
              _buildFeaturedSection(featured),
              const SizedBox(height: 8),
              _buildAllProductsGrid(products),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ── Delivery Bar ───────────────────────────────────────────────────────────
  Widget _buildDeliveryBar() {
    return Container(
      color: AppTheme.headerBlue.withOpacity(0.85),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: const Row(
        children: [
          Icon(Icons.location_on, color: Colors.white70, size: 14),
          SizedBox(width: 4),
          Text('Deliver to: ',
              style: TextStyle(color: Colors.white70, fontSize: 12)),
          Text(
            'Bengaluru 560001',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  // ── Banner Carousel ────────────────────────────────────────────────────────
  Widget _buildBannerCarousel() {
    // Responsive height
    final bannerHeight = Responsive.bannerHeight(context);

    return Column(
      children: [
        SizedBox(
          height: bannerHeight,
          child: PageView.builder(
            controller: _bannerController,
            itemCount: _banners.length,
            itemBuilder: (ctx, index) {
              final banner = _banners[index];
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: banner['gradient'] as List<Color>,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      bottom: -20,
                      child: Icon(
                        banner['icon'] as IconData,
                        size: 160,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryOrange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'LIMITED TIME',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            banner['title'] as String,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner['subtitle'] as String,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 13),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllProductsScreen()),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text('Shop Now →',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: _bannerController,
          count: _banners.length,
          effect: WormEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: AppTheme.primaryOrange,
            dotColor: Colors.grey[300]!,
          ),
        ),
      ],
    );
  }

  // ── Category Row ───────────────────────────────────────────────────────────
  Widget _buildCategoryRow() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Shop by Category',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _categories.length,
              itemBuilder: (ctx, index) {
                final cat = _categories[index];
                return GestureDetector(
                  onTap: () {
                    final catName = cat['name'] as String;
                    if (catName == 'All') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AllProductsScreen()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  CategoryScreen(category: catName)));
                    }
                  },
                  child: Container(
                    width: 72,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                (cat['color'] as Color).withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(cat['icon'] as IconData,
                              color: cat['color'] as Color, size: 22),
                        ),
                        const SizedBox(height: 4),
                        Flexible(
                          child: Text(
                            cat['name'] as String,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textDark),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ── Deals of the Day ───────────────────────────────────────────────────────
  Widget _buildDealSection(List deals) {
    if (deals.isEmpty) return const SizedBox.shrink();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader(
            icon: Icons.local_fire_department,
            iconColor: Colors.orange,
            title: 'Deals of the Day',
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: deals.length,
              itemBuilder: (ctx, index) => SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ProductCard(product: deals[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Featured / Prime Picks ─────────────────────────────────────────────────
  Widget _buildFeaturedSection(List featured) {
    if (featured.isEmpty) return const SizedBox.shrink();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader(
            icon: Icons.star,
            iconColor: AppTheme.starYellow,
            title: 'Prime Picks',
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (ctx, index) => SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ProductCard(product: featured[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── All Products Grid ──────────────────────────────────────────────────────
  Widget _buildAllProductsGrid(List products) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader(title: 'All Products', showViewAll: true),
          const SizedBox(height: 12),

          // ✅ LayoutBuilder for responsive column count
          LayoutBuilder(
            builder: (context, constraints) {
              final cols = Responsive.gridColumns(context);
              // Show at most 2 rows worth of products on home screen
              final displayCount =
                  (products.length > cols * 2) ? cols * 2 : products.length;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.72,
                ),
                itemCount: displayCount,
                itemBuilder: (ctx, index) =>
                    ProductCard(product: products[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  // ── Shared Section Header ──────────────────────────────────────────────────
  Widget _sectionHeader({
    IconData? icon,
    Color? iconColor,
    required String title,
    bool showViewAll = true,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 6),
            ],
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        if (showViewAll)
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllProductsScreen()),
            ),
            child: const Text(
              'See all',
              style: TextStyle(
                  color: AppTheme.primaryBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }
}