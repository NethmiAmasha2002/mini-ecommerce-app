import '../models/product.dart';

/// Local mock data source.

/// products live here as a simple static list.
class MockData {
  MockData._(); // prevent instantiation, this is a static-only class

  static const List<String> categories = [
    'All',
    'Shoes',
    'Electronics',
    'Bags',
    'Watches',
    'Clothing',
  ];

  static final List<Product> products = [
    Product(
      id: 'p1',
      name: 'Classic Running Shoes',
      imageUrl: 'https://normanwalsh.com/cdn/shop/files/12_255e42b5-c7e0-496d-87c9-136adeb28933.jpg?v=1779947765&width=1500',
      price: 8500,
      rating: 4.5,
      category: 'Shoes',
      description:
          'Lightweight running shoes with breathable mesh upper and '
          'cushioned sole. Perfect for daily runs and casual wear. '
          'Available in multiple sizes with a comfortable, durable fit.',
    ),
    Product(
      id: 'p2',
      name: 'Wireless Headphones',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXY6lLaE3wWu4HHHbgQW14IczCZZtUebhOVZ_NcNdbug&s=10',
      price: 12000,
      rating: 4.7,
      category: 'Electronics',
      description:
          'Over-ear wireless headphones with active noise cancellation, '
          '30-hour battery life, and crystal-clear sound quality. '
          'Comes with a carrying case and USB-C charging cable.',
    ),
    Product(
      id: 'p3',
      name: 'Leather Backpack',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9BSOy1ibGuEC401nH3LORcgYkKrNVPc587-Pz_brlJw&s=10',
      price: 9500,
      rating: 4.3,
      category: 'Bags',
      description:
          'Genuine leather backpack with padded laptop compartment, '
          'multiple pockets, and adjustable straps. Stylish enough for '
          'work, durable enough for travel.',
    ),
    Product(
      id: 'p4',
      name: 'Smart Watch Pro',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwHccilpSkstAfKjMlPlYA70ciseJwsqM7ULdhRaafnA&s=10',
      price: 25000,
      rating: 4.6,
      category: 'Watches',
      description:
          'Track your fitness, heart rate, and notifications on a '
          'vibrant AMOLED display. Water-resistant up to 50m with up '
          'to 7 days of battery life on a single charge.',
    ),
    Product(
      id: 'p5',
      name: 'Cotton Hoodie',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX58hPImLgHGYTsxnEhzt3IFhhGZucbWujo0qOz2WXSA&s=10',
      price: 4500,
      rating: 4.2,
      category: 'Clothing',
      description:
          'Soft, breathable cotton hoodie with a relaxed fit. Great '
          'for cool evenings or layering. Machine washable and '
          'available in multiple colors.',
    ),
    Product(
      id: 'p6',
      name: 'Bluetooth Speaker',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUs4keO8Nmz858DWOBuSrrggEn1GvGHKTIXlPKbU8ZrA&s=10',
      price: 7200,
      rating: 4.4,
      category: 'Electronics',
      description:
          'Portable Bluetooth speaker with deep bass, 12-hour playtime, '
          'and IPX7 water resistance. Pair two speakers together for '
          'stereo sound.',
    ),
    Product(
      id: 'p7',
      name: 'Canvas Sneakers',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3x8WfLLMfYif7xcfUByN5G5NGWy0PTCMhsFKzqBY2sg&s=10',
      price: 5200,
      rating: 4.0,
      category: 'Shoes',
      description:
          'Classic low-top canvas sneakers that go with everything. '
          'Durable rubber sole and a timeless design for everyday wear.',
    ),
    Product(
      id: 'p8',
      name: 'Travel Duffel Bag',
      imageUrl: 'https://dpotli.com/cdn/shop/files/Canvas_Duffle_Brown_1.jpg?v=1758250754&width=1200',
      price: 6800,
      rating: 4.1,
      category: 'Bags',
      description:
          'Spacious duffel bag with reinforced handles and a separate '
          'shoe compartment. Ideal for weekend trips and gym sessions.',
    ),
    Product(
      id: 'p9',
      name: 'Minimalist Analog Watch',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBt5u5-xbRb7m9hWMu-dMCnfRAK0-8dcErMReE_3o6_A&s=10',
      price: 11000,
      rating: 4.8,
      category: 'Watches',
      description:
          'A clean, minimalist analog watch with a leather strap and '
          'scratch-resistant glass. Suitable for both formal and '
          'casual outfits.',
    ),
    Product(
      id: 'p10',
      name: 'Denim Jacket',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEn0Kv4LxZDGh-xfzoipEUkPejI_SYDUj6Oq1MIvwp7g&s=10',
      price: 7900,
      rating: 4.3,
      category: 'Clothing',
      description:
          'Timeless denim jacket with a comfortable fit and sturdy '
          'stitching. A versatile layer for any season.',
    ),
  ];
}
