import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'product_list_screen.dart';
import 'cart_screen.dart';
import 'orders_screen.dart';
import 'profile_screen.dart';

/// The main shell of the app after login.
/// Holds the bottom navigation bar and swaps between the four main
/// tabs: Shop, Cart, Orders, Profile. Using IndexedStack (not just
/// swapping widgets) so each tab keeps its scroll position and state
/// when switching back and forth.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const List<Widget> _tabs = [
    ProductListScreen(),
    CartScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront),
            label: 'Shop',
          ),
          NavigationDestination(
            icon: Consumer<CartProvider>(
              builder: (context, cart, _) {
                return _CartIcon(count: cart.totalItemCount, filled: false);
              },
            ),
            selectedIcon: Consumer<CartProvider>(
              builder: (context, cart, _) {
                return _CartIcon(count: cart.totalItemCount, filled: true);
              },
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/// Cart icon with a small badge showing the number of items.
/// Extracted as a private widget since it's only used within this file.
class _CartIcon extends StatelessWidget {
  final int count;
  final bool filled;

  const _CartIcon({required this.count, required this.filled});

  @override
  Widget build(BuildContext context) {
    final icon = filled ? Icons.shopping_cart : Icons.shopping_cart_outlined;

    if (count == 0) return Icon(icon);

    return Badge(
      label: Text('$count'),
      child: Icon(icon),
    );
  }
}
