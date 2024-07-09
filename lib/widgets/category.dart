import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});

  final Future<DimSumCategory> category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DimSumCategory>(
      future: category,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          final category = snapshot.data!;
          return Column(
            children: [
              TextButton.icon(
                onPressed: () {},
                label: const Text('big point'),
                icon: Icon(
                  Icons.label_important,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(category.l.toString()),
              Text(category.m.toString()),
              Text(category.s.toString()),
            ],
          );
        }
      },
    );
  }
}
