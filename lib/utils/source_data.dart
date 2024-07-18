import 'dart:convert';

import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:flutter/services.dart';

class SourceData {
  static Future<List<DimSum>> loadDimSumList() async {
    final dataString = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(dataString);
    final List<dynamic> dishField = jsonData['dish'];
    return dishField.map((element) => DimSum.fromJson(element)).toList();
  }

  static Future<DimSumCategory> loadDimSumCategory() async {
    final dataString = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData =
        await json.decode(dataString)['category'];
    return DimSumCategory.fromJson(jsonData);
  }

  static Map<String, String> trans = {
    '全部': 'a',
    '小點': 's',
    '中點': 'm',
    '大點': 'l',
    '特點': 'special',
  };

  static double price(DimSumCategory category, String dimSumItemCate) {
    switch (dimSumItemCate) {
      case 's':
        return category.s;
      case 'm':
        return category.m;
      case 'l':
        return category.l;
      case 'special':
        return category.special;
      default:
        return 0.0;
    }
  }

  static int itemOnCartQuantity(CartProvider cart, DimSum item) {
    return cart.items.where((cartItem) => cartItem.id == item.id).length;
  }
}
