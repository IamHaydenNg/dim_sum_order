import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/models/order.dart';
import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:dim_sum_order/utils/source_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  Widget flexibleItem(String displayText, [TextStyle? style]) {
    return Flexible(
      fit: FlexFit.tight,
      child: Text(
        displayText,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider cart = Provider.of<CartProvider>(context);

    final List<DimSum> cartItems = cart.items;

    final Future<DimSumCategory> category =
        ModalRoute.of(context)!.settings.arguments as Future<DimSumCategory>;

    final noRepetitiveList = cartItems.toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('購物車'),
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
                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: noRepetitiveList.length,
                            itemBuilder: (context, index) {
                              final item = noRepetitiveList[index];
                              final quantity =
                                  SourceData.itemOnCartQuantity(cart, item);
                              final price = SourceData.price(
                                  dimSumCategory, item.category);
                              final itemPrice = price * quantity;

                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Row(
                                  children: [
                                    flexibleItem(item.name),
                                    flexibleItem(
                                      quantity.toString(),
                                    ),
                                    flexibleItem('\$${itemPrice.toString()}'),
                                  ],
                                ),
                              );
                            },
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              flexibleItem(
                                '總計: ',
                                const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              flexibleItem(
                                '${cartItems.length}',
                                const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              flexibleItem(
                                '\$${cart.total}',
                                const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
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
          if (cartItems.isNotEmpty)
            Expanded(
              child: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cart.addOrders(
                          Order(
                            total: cart.total,
                            quantity: cart.itemCount,
                            items: cart.items,
                          ),
                        );
                        cart.clearCart();
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.amber,
                        ),
                        foregroundColor: WidgetStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      child: const Text(
                        '確認訂單',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
