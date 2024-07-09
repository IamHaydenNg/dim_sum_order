import 'dart:convert';

import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';
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
}
