import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/widgets/category_label.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.dimSumCategory});

  final Future<DimSumCategory> dimSumCategory;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryLabel(label: '全部'),
        CategoryLabel(label: '小點'),
        CategoryLabel(label: '中點'),
        CategoryLabel(label: '大點'),
        CategoryLabel(label: '特點'),
      ],
    );
  }
}
