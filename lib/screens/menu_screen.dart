import 'package:dim_sum_order/models/dimsum.dart';
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
  late Future<List<DimSum>> _dimsum;

  String _selectedCategory = 'a';

  void _onCategoryPressed(String type) {
    setState(() {
      _selectedCategory = type;
    });
  }

  @override
  void initState() {
    _dimsum = SourceData.loadDimSumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Category(
            onPressAction: _onCategoryPressed,
            selectedCategory: _selectedCategory,
          ),
          Expanded(
            child: DimSumList(
              dimsum: _dimsum,
              selectedCategory: _selectedCategory,
            ),
          ),
        ],
      ),
    );
  }
}
