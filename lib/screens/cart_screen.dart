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
                          itemCount: cart.itemCount,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: Image.asset(item.image),
                                ),
                                Text(
                                  SourceData.itemOnCartAmount(cart, item)
                                      .toString(),
                                ),
                                Text(
                                  SourceData.price(
                                          dimSumCategory, item.category)
                                      .toString(),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
