import '../models/order.dart';

/// Static mock orders shown on the Orders screen.
class MockOrders {
  MockOrders._();

  static final List<Order> orders = [
    Order(
      id: 'ORD-1042',
      date: DateTime(2026, 6, 18),
      status: 'Delivered',
      total: 16700,
      itemCount: 2,
    ),
    Order(
      id: 'ORD-1031',
      date: DateTime(2026, 6, 5),
      status: 'Delivered',
      total: 9500,
      itemCount: 1,
    ),
    Order(
      id: 'ORD-1020',
      date: DateTime(2026, 5, 22),
      status: 'Cancelled',
      total: 4500,
      itemCount: 1,
    ),
  ];
}
