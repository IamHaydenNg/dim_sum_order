import 'package:dim_sum_order/utils/source_data.dart';
import 'package:flutter/material.dart';
import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';

class CartProvider with ChangeNotifier {
  List<DimSum> _items = [];

  List<DimSum> get items => _items;

  int get itemCount => _items.length;

  double _total = 0.0;

  double get total => _total;

  void addItem(DimSum dimSum) {
    _items.add(dimSum);
    notifyListeners();
  }

  void removeItem(DimSum dimSum) {
    final DimSum firstItem = _items
        .firstWhere((x) => x.id == dimSum.id && x.category == dimSum.category);
    _items.remove(firstItem);
    notifyListeners();
  }

  void setTotal(DimSumCategory category) {
    _total = _items.fold(
        0.0, (sum, item) => sum + SourceData.price(category, item.category));
    notifyListeners();
  }

  void clearCart() {
    _items = [];
    notifyListeners();
  }
}
