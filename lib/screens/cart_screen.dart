import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:dim_sum_order/utils/source_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cart = Provider.of<CartProvider>(context);

    final List<DimSum> cartItems = cart.items;

    final Future<DimSumCategory> category =
        ModalRoute.of(context)!.settings.arguments as Future<DimSumCategory>;

    final noRepetitiveList = cartItems.toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('確認訂單'),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('項目'),
              Text('數量'),
              Text('價錢'),
            ],
          ),
          const Divider(),
          cartItems.isNotEmpty
              ? FutureBuilder<DimSumCategory>(
                  future: category,
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
                      final dimSumCategory = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: noRepetitiveList.length,
                          itemBuilder: (context, index) {
                            final item = noRepetitiveList[index];
                            final itemAmount =
                                SourceData.itemOnCartAmount(cart, item);
                            final price =
                                SourceData.price(dimSumCategory, item.category);
                            final totalPrice = price * itemAmount;

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      item.name,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      itemAmount.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      '\$${totalPrice.toString()}',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              : Expanded(
                  child: Center(
                    child: Text(
                      '歡迎光臨',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
