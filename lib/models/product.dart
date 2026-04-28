class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final double originalPrice;
  final double rating;
  final int reviewCount;
  final List<String> images;
  final String category;
  final bool isPrime;
  final bool isInStock;
  final int stockCount;
  final List<String> features;
  final Map<String, String> specifications;
  final String seller;
  final int deliveryDays;
  final List<String> tags;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviewCount,
    required this.images,
    required this.category,
    this.isPrime = false,
    this.isInStock = true,
    this.stockCount = 100,
    this.features = const [],
    this.specifications = const {},
    this.seller = 'ShopKart Official',
    this.deliveryDays = 2,
    this.tags = const [],
  });

  double get discountPercent =>
      ((originalPrice - price) / originalPrice * 100).roundToDouble();

  bool get hasDiscount => originalPrice > price;
}
