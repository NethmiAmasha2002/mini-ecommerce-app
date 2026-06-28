import 'package:flutter/foundation.dart';
import '../data/mock_data.dart';
import '../models/product.dart';

/// Manages the product list along with search and category-filter state.
///
/// Keeping search/filter logic in a provider (instead of local setState
/// in the screen) means the Home screen's build method stays focused on
/// layout, and the filtering logic is easy to unit test in isolation.
class ProductProvider extends ChangeNotifier {
  final List<Product> _allProducts = MockData.products;

  String _searchQuery = '';
  String _selectedCategory = 'All';

  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  List<String> get categories => MockData.categories;

  /// Returns products filtered by both the current search query and
  /// the selected category. Both filters are case-insensitive and
  /// combine with AND logic (must match category AND search text).
  List<Product> get filteredProducts {
    return _allProducts.where((product) {
      final matchesCategory =
          _selectedCategory == 'All' || product.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Product getProductById(String id) {
    return _allProducts.firstWhere((p) => p.id == id);
  }
}
