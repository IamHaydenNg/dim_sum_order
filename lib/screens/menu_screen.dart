import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/utils/source_data.dart';
import 'package:dim_sum_order/widgets/category.dart';
import 'package:dim_sum_order/widgets/dim_sum_list.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<DimSumCategory> _category;
  late Future<List<DimSum>> _dimsum;

  @override
  void initState() {
    super.initState();
    _category = SourceData.loadDimSumCategory();
    _dimsum = SourceData.loadDimSumList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Category(
            dimSumCategory: _category,
          ),
          Expanded(
            child: DimSumList(
              dimsum: _dimsum,
            ),
          ),
        ],
      ),
    );
  }
}
