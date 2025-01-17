import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:dim_sum_order/widgets/dim_sum_detail.dart';
import 'package:dim_sum_order/utils/source_data.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class DimSumItem extends StatelessWidget {
  DimSumItem({
    super.key,
    required this.dimSumItem,
  });

  final DimSum dimSumItem;

  final Future<DimSumCategory> _category = SourceData.loadDimSumCategory();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

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

          return ListTile(
            leading: Image.asset(
              dimSumItem.image,
            ),
            title: Text(dimSumItem.name),
            subtitle: Text(
                '價格: \$${SourceData.price(category, dimSumItem.category)}'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => DimSumDetail(
                dimSumItem: dimSumItem,
                dimSumCategory: category,
              ),
            ),
            trailing: SourceData.itemOnCartQuantity(cart, dimSumItem) > 0
                ? badges.Badge(
                    badgeStyle:
                        const badges.BadgeStyle(badgeColor: Colors.amber),
                    badgeContent: Text(
                      SourceData.itemOnCartQuantity(cart, dimSumItem)
                          .toString(),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                : null,
          );
        }
      },
    );
  }
}
