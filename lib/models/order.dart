/// A simple static order record used to populate the Orders screen.
/// This is mock/static data only — there is no real order placement
/// flow or backend, as allowed by the task brief.
class Order {
  final String id;
  final DateTime date;
  final String status;
  final double total;
  final int itemCount;

  const Order({
    required this.id,
    required this.date,
    required this.status,
    required this.total,
    required this.itemCount,
  });
}
