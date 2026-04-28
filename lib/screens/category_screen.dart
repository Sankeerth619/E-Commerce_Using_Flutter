import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../utils/app_theme.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _isGridView = true;
  String _sortBy = 'Popularity';

  final List<String> _sortOptions = [
    'Popularity',
    'Price: Low to High',
    'Price: High to Low',
    'Rating',
    'Newest First',
  ];

  @override
  Widget build(BuildContext context) {
    var products = ProductData.getByCategory(widget.category);

    // Sort
    switch (_sortBy) {
      case 'Price: Low to High':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Rating':
        products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      default:
        products.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
    }

    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: AppBar(
        backgroundColor: AppTheme.headerBlue,
        title: Text(widget.category),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view,
              color: Colors.white,
            ),
            onPressed: () => setState(() => _isGridView = !_isGridView),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter/Sort bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.sort, size: 18, color: AppTheme.textGrey),
                const SizedBox(width: 6),
                const Text(
                  'Sort:',
                  style: TextStyle(fontSize: 13, color: AppTheme.textGrey),
                ),
                const SizedBox(width: 4),
                DropdownButton<String>(
                  value: _sortBy,
                  underline: const SizedBox(),
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                  items: _sortOptions
                      .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                      .toList(),
                  onChanged: (v) => setState(() => _sortBy = v!),
                ),
                const Spacer(),
                Text(
                  '${products.length} products',
                  style: const TextStyle(fontSize: 12, color: AppTheme.textGrey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: _isGridView
                ? GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.62,
                    ),
                    itemCount: products.length,
                    itemBuilder: (ctx, i) =>
                        ProductCard(product: products[i]),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (ctx, i) =>
                        ProductCard(product: products[i], isGridView: false),
                  ),
          ),
        ],
      ),
    );
  }
}
