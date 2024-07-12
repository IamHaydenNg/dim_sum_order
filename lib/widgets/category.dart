import 'package:dim_sum_order/utils/source_data.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.onPressAction,
    required this.selectedCategory,
  });

  final void Function(String) onPressAction;
  final String selectedCategory;

  Widget categoryFilterButton({
    required String category,
    required BuildContext context,
    required VoidCallback onPressAction,
  }) {
    return TextButton(
      onPressed: onPressAction,
      style: TextButton.styleFrom(
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: selectedCategory == SourceData.trans[category]
            ? Colors.amber
            : null,
      ),
      child: Row(
        children: [
          Text(category),
          const SizedBox(
            width: 8,
          ),
          Icon(
            Icons.label_outline,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categoryFilterButton(
          category: '全部',
          context: context,
          onPressAction: () => onPressAction('a'),
        ),
        categoryFilterButton(
          category: '小點',
          context: context,
          onPressAction: () => onPressAction('s'),
        ),
        categoryFilterButton(
          category: '中點',
          context: context,
          onPressAction: () => onPressAction('m'),
        ),
        categoryFilterButton(
          category: '大點',
          context: context,
          onPressAction: () => onPressAction('l'),
        ),
        categoryFilterButton(
          category: '特點',
          context: context,
          onPressAction: () => onPressAction('special'),
        ),
      ],
    );
  }
}
