import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.onPressAction,
  });

  final void Function(String) onPressAction;

  Widget categoryFilterButton({
    required String category,
    required BuildContext context,
    required VoidCallback onPressAction,
  }) {
    return TextButton.icon(
      onPressed: onPressAction,
      label: Text(category),
      icon: Icon(
        Icons.label_outline,
        color: Theme.of(context).primaryColor,
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
