import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../utils/app_theme.dart';
import '../widgets/product_card.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  bool _isGridView = true;
  String _selectedCategory = 'All';
  String _sortBy = 'Popularity';

  final List<String> _sortOptions = [
    'Popularity',
    'Price: Low to High',
    'Price: High to Low',
    'Rating',
  ];

  @override
  Widget build(BuildContext context) {
    final categories = ['All', ...ProductData.categories];
    var products = _selectedCategory == 'All'
        ? ProductData.products.toList()
        : ProductData.getByCategory(_selectedCategory);

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
        title: const Text('All Products'),
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
          // Category chips
          Container(
            color: Colors.white,
            height: 46,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: categories.length,
              itemBuilder: (ctx, i) {
                final cat = categories[i];
                final selected = cat == _selectedCategory;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = cat),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: selected ? AppTheme.primaryBlue : Colors.white,
                      border: Border.all(
                        color: selected
                            ? AppTheme.primaryBlue
                            : AppTheme.dividerGrey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        color: selected ? Colors.white : AppTheme.textDark,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Sort bar
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.sort, size: 16, color: AppTheme.textGrey),
                const SizedBox(width: 4),
                DropdownButton<String>(
                  value: _sortBy,
                  underline: const SizedBox(),
                  style: const TextStyle(
                    fontSize: 12,
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
                  '${products.length} items',
                  style: const TextStyle(
                      fontSize: 12, color: AppTheme.textGrey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: _isGridView
                ? GridView.builder(
                    padding: const EdgeInsets.all(12),
                    // Replace the GridView's gridDelegate with:
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: Responsive.gridColumns(context),
  crossAxisSpacing: 8,
  mainAxisSpacing: 8,
  childAspectRatio: 0.72,
),
                    itemCount: products.length,
                    itemBuilder: (ctx, i) =>
                        ProductCard(product: products[i]),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (ctx, i) => ProductCard(
                      product: products[i],
                      isGridView: false,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
