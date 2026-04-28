import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../utils/app_theme.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Product> _results = [];
  bool _hasSearched = false;

  final List<String> _recentSearches = [
    'iPhone 15', 'Samsung Galaxy', 'Nike shoes', 'Laptop', 'Headphones'
  ];

  final List<String> _popularSearches = [
    'Electronics', 'Mobile phones', 'Books', 'Fashion', 'Kitchen'
  ];

  void _search(String query) {
    if (query.trim().isEmpty) {
      setState(() {
        _results = [];
        _hasSearched = false;
      });
      return;
    }
    setState(() {
      _results = ProductData.search(query);
      _hasSearched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: AppBar(
        backgroundColor: AppTheme.headerBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search ShopKart',
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18, color: Colors.grey),
                      onPressed: () {
                        _controller.clear();
                        _search('');
                      },
                    )
                  : null,
            ),
            onChanged: _search,
            onSubmitted: _search,
            style: const TextStyle(fontSize: 14, color: AppTheme.textDark),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => _search(_controller.text),
          ),
        ],
      ),
      body: _hasSearched ? _buildResults() : _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Searches',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          ..._recentSearches.map((s) => _searchTile(s, Icons.history)),
          const SizedBox(height: 20),
          const Text(
            'Popular on ShopKart',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _popularSearches
                .map((s) => GestureDetector(
                      onTap: () {
                        _controller.text = s;
                        _search(s);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.primaryBlue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          s,
                          style: const TextStyle(
                            color: AppTheme.primaryBlue,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _searchTile(String title, IconData icon) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey, size: 18),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.north_west, color: Colors.grey, size: 16),
      onTap: () {
        _controller.text = title;
        _search(title);
      },
    );
  }

  Widget _buildResults() {
    if (_results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              'No results for "${_controller.text}"',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.textGrey,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Try different keywords',
              style: TextStyle(color: AppTheme.textGrey, fontSize: 13),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            '${_results.length} result${_results.length != 1 ? 's' : ''} for "${_controller.text}"',
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textGrey,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.62,
            ),
            itemCount: _results.length,
            itemBuilder: (ctx, i) => ProductCard(product: _results[i]),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
