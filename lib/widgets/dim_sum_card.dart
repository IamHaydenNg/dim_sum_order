import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/widgets/dim_sum_detail.dart';
import 'package:dim_sum_order/utils/source_data.dart';
import 'package:flutter/material.dart';

class DimSumCard extends StatelessWidget {
  DimSumCard({
    super.key,
    required this.dimSumItem,
  });

  final DimSum dimSumItem;

  final Future<DimSumCategory> _category = SourceData.loadDimSumCategory();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DimSumCategory>(
      future: _category,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading dimsum category'),
          );
        } else {
          final DimSumCategory category = snapshot.data!;

          double price(String dimSumItemCate) {
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

          return ListTile(
            leading: Image.asset(
              dimSumItem.image,
            ),
            title: Text(dimSumItem.name),
            subtitle: Text('價格: \$${price(dimSumItem.category).toString()}'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => DimSumDetail(
                dimSumItem: dimSumItem,
              ),
            ),
          );
        }
      },
    );
  }
}
