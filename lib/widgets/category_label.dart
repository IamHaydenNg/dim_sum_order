import 'package:flutter/material.dart';

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      label: Text(label),
      icon: Icon(
        Icons.label_outline,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
