import 'package:dim_sum_order/models/dimsum.dart';

class Order {
  const Order({
    required this.total,
    required this.quantity,
    required this.items,
  });

  final double total;
  final int quantity;
  final List<DimSum> items;
}
