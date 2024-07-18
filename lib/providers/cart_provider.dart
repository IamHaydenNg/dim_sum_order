import 'package:dim_sum_order/utils/source_data.dart';
import 'package:flutter/material.dart';
import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';

class CartProvider with ChangeNotifier {
  List<DimSum> _cartItems = [];

  List<DimSum> get items => _cartItems;

  int get itemCount => _cartItems.length;

  double _cartTotal = 0.0;

  double get total => _cartTotal;

  List<dynamic> _orders = [];

  List<dynamic> get orders => _orders;

  void addOrders({
    required double total,
    required int quantity,
    required List<DimSum> order,
  }) {
    _orders.add({total, quantity, order});
    notifyListeners();
  }

  void addItem(DimSum dimSum) {
    _cartItems.add(dimSum);
    notifyListeners();
  }

  void removeItem(DimSum dimSum) {
    final DimSum firstItem = _cartItems
        .firstWhere((x) => x.id == dimSum.id && x.category == dimSum.category);
    _cartItems.remove(firstItem);
    notifyListeners();
  }

  void setTotal(DimSumCategory category) {
    _cartTotal = _cartItems.fold(
        0.0, (sum, item) => sum + SourceData.price(category, item.category));
    notifyListeners();
  }

  void clearCart() {
    _cartItems = [];
    _cartTotal = 0.0;
    notifyListeners();
  }
}
