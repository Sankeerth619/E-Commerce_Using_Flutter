import '../models/product.dart';

class ProductData {
  static const List<Product> products = [
    // Electronics
    Product(
      id: 'p001',
      name: 'Samsung Galaxy S24 Ultra 5G',
      brand: 'Samsung',
      description:
          'Experience the next level of mobile innovation with the Galaxy S24 Ultra. Featuring a 200MP camera, built-in S Pen, and powerful Snapdragon 8 Gen 3 processor. The titanium frame design offers premium durability while the 6.8" Dynamic AMOLED 2X display delivers stunning visuals at 120Hz.',
      price: 109999,
      originalPrice: 134999,
      rating: 4.5,
      reviewCount: 12847,
      images: [
        'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600',
        'https://images.unsplash.com/photo-1585060544812-6b45742d762f?w=600',
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600',
      ],
      category: 'Electronics',
      isPrime: true,
      stockCount: 45,
      features: [
        '200MP Camera with ProVisual Engine',
        'Built-in S Pen with AI features',
        'Snapdragon 8 Gen 3 Processor',
        '5000mAh Battery with 45W fast charge',
        '6.8" Dynamic AMOLED 2X 120Hz display',
        'Titanium frame design',
      ],
      specifications: {
        'Display': '6.8" Dynamic AMOLED 2X',
        'Processor': 'Snapdragon 8 Gen 3',
        'RAM': '12GB',
        'Storage': '256GB / 512GB / 1TB',
        'Camera': '200MP + 12MP + 10MP + 10MP',
        'Battery': '5000mAh',
        'OS': 'Android 14 with One UI 6.1',
        'Connectivity': '5G, Wi-Fi 7, Bluetooth 5.3',
      },
      seller: 'Samsung India Official',
      deliveryDays: 1,
      tags: ['bestseller', 'new', '5G'],
    ),

    Product(
      id: 'p002',
      name: 'Apple iPhone 15 Pro Max 256GB',
      brand: 'Apple',
      description:
          'iPhone 15 Pro Max. Forged in titanium and featuring the groundbreaking A17 Pro chip, a customizable Action button, and the most powerful iPhone camera system ever. The 48MP main camera supports 5x Telephoto zoom for incredible detail.',
      price: 159900,
      originalPrice: 174900,
      rating: 4.7,
      reviewCount: 28953,
      images: [
        'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600',
        'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600',
        'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=600',
      ],
      category: 'Electronics',
      isPrime: true,
      stockCount: 30,
      features: [
        'A17 Pro chip with 6-core GPU',
        'Titanium design with Action button',
        '48MP main camera with 5x Telephoto',
        'USB 3 for up to 20x faster transfers',
        'All-day battery life',
        'Dynamic Island',
      ],
      specifications: {
        'Display': '6.7" Super Retina XDR OLED',
        'Processor': 'A17 Pro',
        'Storage': '256GB',
        'Camera': '48MP + 12MP + 12MP',
        'Battery': 'Up to 29 hours video playback',
        'OS': 'iOS 17',
        'Connectivity': '5G, Wi-Fi 6E, Bluetooth 5.3',
        'Frame': 'Grade 5 Titanium',
      },
      seller: 'Apple India Official',
      deliveryDays: 1,
      tags: ['apple', 'premium', 'new'],
    ),

    Product(
      id: 'p003',
      name: 'Sony WH-1000XM5 Wireless Headphones',
      brand: 'Sony',
      description:
          'Industry-leading noise cancellation with two processors controlling 8 microphones. Crystal clear hands-free calling, exceptional sound quality optimised for Alexa. Up to 30 hours battery life with quick charging — 3 min charge gives 3 hours of playback.',
      price: 24990,
      originalPrice: 34990,
      rating: 4.6,
      reviewCount: 9214,
      images: [
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
        'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=600',
        'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=600',
      ],
      category: 'Electronics',
      isPrime: true,
      stockCount: 120,
      features: [
        'Industry-leading noise cancellation',
        '30 hours battery life',
        'Quick charge: 3 min = 3 hours',
        'Multi-point connection',
        'Speak-to-Chat technology',
        'LDAC Hi-Res Audio',
      ],
      specifications: {
        'Driver': '30mm',
        'Frequency': '4Hz-40,000Hz',
        'Battery': '30 hours',
        'Charging': 'USB-C',
        'Weight': '250g',
        'Connectivity': 'Bluetooth 5.2, NFC',
        'Noise Cancellation': 'Active (ANC)',
        'Microphone': '8 mics with 2 processors',
      },
      seller: 'Sony India',
      deliveryDays: 2,
      tags: ['bestseller', 'noise-cancelling'],
    ),

    Product(
      id: 'p004',
      name: 'MacBook Air M3 13-inch 8GB/256GB',
      brand: 'Apple',
      description:
          'MacBook Air with M3 chip. Strikingly thin and fanless design, up to 18 hours battery life, and a gorgeous Liquid Retina display. The powerful M3 chip handles anything from creative projects to demanding workloads with ease.',
      price: 114900,
      originalPrice: 119900,
      rating: 4.8,
      reviewCount: 6743,
      images: [
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600',
        'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=600',
        'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600',
      ],
      category: 'Computers',
      isPrime: true,
      stockCount: 22,
      features: [
        'Apple M3 chip with 8-core CPU',
        '18 hours battery life',
        '13.6" Liquid Retina display',
        'Fanless silent design',
        'MagSafe 3 charging',
        'Up to 24GB unified memory',
      ],
      specifications: {
        'Chip': 'Apple M3',
        'CPU': '8-core',
        'GPU': '10-core',
        'Memory': '8GB Unified',
        'Storage': '256GB SSD',
        'Display': '13.6" Liquid Retina',
        'Battery': 'Up to 18 hours',
        'Weight': '1.24 kg',
      },
      seller: 'Apple India Official',
      deliveryDays: 2,
      tags: ['premium', 'laptop', 'apple'],
    ),

    // Fashion
    Product(
      id: 'p005',
      name: 'Nike Air Max 270 Running Shoes',
      brand: 'Nike',
      description:
          'The Nike Air Max 270 delivers visible cushioning under every step. Designed for all-day comfort, the large Air unit in the heel offers maximum cushioning while the mesh upper provides breathability. A must-have for both performance and casual wear.',
      price: 10995,
      originalPrice: 14995,
      rating: 4.4,
      reviewCount: 34521,
      images: [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
        'https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?w=600',
        'https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=600',
      ],
      category: 'Fashion',
      isPrime: true,
      stockCount: 200,
      features: [
        '270° Max Air unit for cushioning',
        'Mesh upper for breathability',
        'Foam midsole for lightweight comfort',
        'Rubber outsole for traction',
        'Available in multiple colorways',
        'True to size fit',
      ],
      specifications: {
        'Upper': 'Engineered mesh',
        'Midsole': 'Foam with Air-Sole unit',
        'Outsole': 'Rubber',
        'Closure': 'Lace-up',
        'Sizes': 'UK 6-12',
        'Colors': 'Black/White, Blue/Orange, Red/Black',
        'Weight': '298g (size 9)',
        'Origin': 'Vietnam',
      },
      seller: 'Nike India Official',
      deliveryDays: 3,
      tags: ['sports', 'shoes', 'bestseller'],
    ),

    Product(
      id: 'p006',
      name: 'Levi\'s 511 Slim Fit Jeans',
      brand: 'Levi\'s',
      description:
          'The Levi\'s 511 Slim Fit Jeans are the modern evolution of the iconic 501. Sitting below the waist with a slim fit through the seat and thigh, these jeans are the go-to choice for a clean, put-together look that works from day to night.',
      price: 2999,
      originalPrice: 4999,
      rating: 4.3,
      reviewCount: 18765,
      images: [
        'https://images.unsplash.com/photo-1542272604-787c3835535d?w=600',
        'https://images.unsplash.com/photo-1604176354204-9268737828e4?w=600',
        'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=600',
      ],
      category: 'Fashion',
      isPrime: false,
      stockCount: 500,
      features: [
        'Slim fit through seat and thigh',
        'Sits below the waist',
        '98% Cotton, 2% Elastane',
        'Zip fly with button closure',
        '5 pocket styling',
        'Machine washable',
      ],
      specifications: {
        'Fit': 'Slim',
        'Rise': 'Regular',
        'Material': '98% Cotton, 2% Elastane',
        'Closure': 'Zip fly',
        'Care': 'Machine wash cold',
        'Sizes': '28x30 to 36x32',
        'Colors': 'Dark Stonewash, Black, Medium Indigo',
        'Origin': 'Bangladesh',
      },
      seller: 'Levi\'s India Store',
      deliveryDays: 3,
      tags: ['casual', 'jeans'],
    ),

    // Home & Kitchen
    Product(
      id: 'p007',
      name: 'Dyson V15 Detect Absolute Vacuum',
      brand: 'Dyson',
      description:
          'The Dyson V15 Detect uses a laser to reveal microscopic dust you can\'t see. An acoustic piezo sensor counts and sizes dust particles in real time, giving you data to prove you\'ve cleaned. The most powerful Dyson cordless vacuum ever.',
      price: 52900,
      originalPrice: 62900,
      rating: 4.6,
      reviewCount: 3892,
      images: [
        'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600',
        'https://images.unsplash.com/photo-1527515545081-5db817172677?w=600',
        'https://images.unsplash.com/photo-1563453392212-326f5e854473?w=600',
      ],
      category: 'Home & Kitchen',
      isPrime: true,
      stockCount: 35,
      features: [
        'Laser dust detection technology',
        'Acoustic piezo dust sensor',
        '60 minutes run time',
        '230 AW suction power',
        'HEPA filtration',
        'LCD screen with real-time reports',
      ],
      specifications: {
        'Suction': '230 AW',
        'Run time': 'Up to 60 min',
        'Bin volume': '0.77L',
        'Weight': '3.1 kg',
        'Filtration': 'Whole machine HEPA',
        'Charging time': '4.5 hours',
        'Accessories': '11 tools included',
        'Warranty': '2 years',
      },
      seller: 'Dyson Official India',
      deliveryDays: 2,
      tags: ['premium', 'cleaning'],
    ),

    Product(
      id: 'p008',
      name: 'Instant Pot Duo 7-in-1 Electric Pressure Cooker',
      brand: 'Instant Pot',
      description:
          'The Instant Pot Duo is a 7-in-1 programmable cooker: pressure cooker, slow cooker, rice cooker, steamer, saute pan, yogurt maker, and food warmer. Cook up to 70% faster with this versatile kitchen essential.',
      price: 8999,
      originalPrice: 12999,
      rating: 4.5,
      reviewCount: 21456,
      images: [
        'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600',
        'https://images.unsplash.com/photo-1585515320310-259814833e62?w=600',
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=600',
      ],
      category: 'Home & Kitchen',
      isPrime: true,
      stockCount: 85,
      features: [
        '7-in-1 multi-cooker',
        'Cook 70% faster than traditional',
        '14 one-touch smart programs',
        'Dishwasher safe parts',
        'Safety features: 10 proven mechanisms',
        '6 Litre capacity',
      ],
      specifications: {
        'Capacity': '6 Litres',
        'Functions': '7-in-1',
        'Programs': '14 smart programs',
        'Wattage': '1000W',
        'Voltage': '220-240V',
        'Material': 'Stainless steel inner pot',
        'Dimensions': '33 x 31 x 32 cm',
        'Weight': '5.4 kg',
      },
      seller: 'Instant Pot Official',
      deliveryDays: 2,
      tags: ['kitchen', 'bestseller', 'cooking'],
    ),

    // Books
    Product(
      id: 'p009',
      name: 'Atomic Habits by James Clear',
      brand: 'Penguin',
      description:
          'The #1 New York Times bestseller. An Easy & Proven Way to Build Good Habits & Break Bad Ones. James Clear, one of the world\'s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.',
      price: 399,
      originalPrice: 799,
      rating: 4.7,
      reviewCount: 89234,
      images: [
        'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600',
        'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=600',
      ],
      category: 'Books',
      isPrime: true,
      stockCount: 999,
      features: [
        '#1 New York Times Bestseller',
        '320 pages of actionable content',
        'Practical habit-building strategies',
        'Used by Olympic athletes and Fortune 500 companies',
        'Available in Paperback & Hardcover',
        'Free delivery on Prime',
      ],
      specifications: {
        'Author': 'James Clear',
        'Publisher': 'Penguin Random House',
        'Pages': '320',
        'Language': 'English',
        'ISBN': '978-1847941831',
        'Format': 'Paperback',
        'Dimensions': '21.6 x 13.7 x 2.3 cm',
        'Weight': '354g',
      },
      seller: 'ShopKart Books',
      deliveryDays: 1,
      tags: ['bestseller', 'self-help', 'productivity'],
    ),

    // Beauty
    Product(
      id: 'p010',
      name: 'L\'Oreal Paris Revitalift Face Serum',
      brand: "L'Oreal Paris",
      description:
          'L\'Oreal Paris Revitalift 1.5% Pure Hyaluronic Acid Serum intensely hydrates skin and visibly reduces wrinkles in 1 week. With concentrated 1.5% Hyaluronic Acid, this serum deeply plumps and smooths the look of fine lines.',
      price: 849,
      originalPrice: 1299,
      rating: 4.2,
      reviewCount: 14532,
      images: [
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=600',
        'https://images.unsplash.com/photo-1598440947619-2c35fc9aa908?w=600',
        'https://images.unsplash.com/photo-1570194065650-d99fb4ee9e56?w=600',
      ],
      category: 'Beauty',
      isPrime: false,
      stockCount: 150,
      features: [
        '1.5% Pure Hyaluronic Acid',
        'Clinically tested formula',
        'Results visible in 1 week',
        'Suitable for all skin types',
        'Fragrance-free',
        '30ml / 50ml variants available',
      ],
      specifications: {
        'Key Ingredient': '1.5% Hyaluronic Acid',
        'Skin Type': 'All skin types',
        'Volume': '30ml',
        'Fragrance': 'Fragrance-free',
        'Target': 'Anti-aging, Hydration',
        'Application': 'Morning and evening',
        'SPF': 'None',
        'Cruelty-free': 'Yes',
      },
      seller: 'L\'Oreal India Official',
      deliveryDays: 2,
      tags: ['skincare', 'anti-aging'],
    ),

    Product(
      id: 'p011',
      name: 'boAt Airdopes 141 TWS Earbuds',
      brand: 'boAt',
      description:
          'boAt Airdopes 141 comes with 42H total playback, ENx™ Technology for clear calls, and BEAST™ Mode for ultra-low 60ms latency gaming. IPX4 water resistance makes these earbuds your perfect everyday companion.',
      price: 999,
      originalPrice: 2990,
      rating: 4.1,
      reviewCount: 156789,
      images: [
        'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=600',
        'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=600',
        'https://images.unsplash.com/photo-1572536147248-ac59a8abfa4b?w=600',
      ],
      category: 'Electronics',
      isPrime: true,
      stockCount: 500,
      features: [
        '42H total playback',
        'BEAST™ Mode 60ms low latency',
        'ENx™ Technology for clear calls',
        'IPX4 water resistance',
        '10mm drivers',
        'Instant voice assistant access',
      ],
      specifications: {
        'Driver': '10mm',
        'Battery (earbuds)': '30mAh each',
        'Battery (case)': '390mAh',
        'Total Playback': '42 hours',
        'Connectivity': 'Bluetooth 5.2',
        'Latency': '60ms (BEAST Mode)',
        'Water Resistance': 'IPX4',
        'Charging': 'USB-C',
      },
      seller: 'boAt Lifestyle',
      deliveryDays: 2,
      tags: ['budget', 'earbuds', 'gaming'],
    ),

    Product(
      id: 'p012',
      name: 'Whirlpool 1.5 Ton 5 Star Inverter AC',
      brand: 'Whirlpool',
      description:
          'Whirlpool 1.5 Ton 5 Star Inverter Split AC with IntelliSense Inverter Technology automatically adjusts cooling as per heat load to ensure faster cooling and greater energy savings. Converts any room to desired temperature within minutes.',
      price: 38990,
      originalPrice: 55000,
      rating: 4.3,
      reviewCount: 7823,
      images: [
        'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=600',
        'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600',
        'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600',
      ],
      category: 'Home & Kitchen',
      isPrime: false,
      stockCount: 15,
      features: [
        'IntelliSense Inverter Technology',
        '5 Star BEE Rating',
        'Wi-Fi enabled with app control',
        '6th Sense technology',
        'Auto Restart after power cut',
        '3D Cool Airflow',
      ],
      specifications: {
        'Capacity': '1.5 Ton',
        'Star Rating': '5 Star',
        'Type': 'Inverter Split AC',
        'Cooling Capacity': '5.0 kW',
        'Energy Consumption': '1420W',
        'Refrigerant': 'R32',
        'Warranty': '1 year comprehensive, 5 years compressor',
        'Wi-Fi': 'Yes',
      },
      seller: 'Whirlpool India',
      deliveryDays: 5,
      tags: ['home-appliance', 'summer'],
    ),
  ];

  static List<String> get categories {
    return products.map((p) => p.category).toSet().toList();
  }

  static List<Product> getByCategory(String category) {
    return products.where((p) => p.category == category).toList();
  }

  static List<Product> search(String query) {
    final q = query.toLowerCase();
    return products.where((p) =>
      p.name.toLowerCase().contains(q) ||
      p.brand.toLowerCase().contains(q) ||
      p.category.toLowerCase().contains(q) ||
      p.tags.any((t) => t.toLowerCase().contains(q))
    ).toList();
  }

  static List<Product> get featuredProducts =>
      products.where((p) => p.isPrime).take(6).toList();

  static List<Product> get dealsOfTheDay =>
      products.where((p) => p.hasDiscount && p.discountPercent >= 20).toList();
}
