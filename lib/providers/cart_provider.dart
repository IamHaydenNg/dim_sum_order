import 'package:flutter/material.dart';
import 'package:dim_sum_order/models/dimsum.dart';

class CartProvider with ChangeNotifier {
  final List<DimSum> _items = [];

  List<DimSum> get items => _items;

  void addItem(DimSum dimSum) {
    _items.add(dimSum);
    notifyListeners();
  }

  void removeItem(DimSum dimSum) {
    _items.remove(dimSum);
    notifyListeners();
  }

  int get itemCount => _items.length;
}
