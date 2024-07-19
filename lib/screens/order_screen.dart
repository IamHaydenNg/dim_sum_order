import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:dim_sum_order/screens/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final orders = cart.orders;
    final orderQuantity = orders.length;
    final totalOrderAmount = cart.totalOrderAmount;

    return Scaffold(
      body: orders.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderQuantity,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      final price = order.total;
                      final quantity = order.quantity;
                      final items = order.items;
                      final noRepetitiveList = items.toSet().toList();

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16,
                        ),
                        child: ExpansionTile(
                          title: Text(
                            '訂單: #${index + 1}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text('準備中...'),
                          collapsedShape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '總價: \$$price',
                                  style: const TextStyle(color: Colors.red),
                                ),
                                Text(
                                  '總數: $quantity',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: noRepetitiveList.length,
                                itemBuilder: (context, index) {
                                  final itemQuantity = items
                                      .where(
                                          (item) => item.id == items[index].id)
                                      .length
                                      .toString();
                                  final item = noRepetitiveList[index];

                                  return Row(
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
                                          itemQuantity,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 232, 231, 231),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '總計金額: \$$totalOrderAmount',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cart.clearOrder();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentSuccessScreen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.amber,
                            ),
                          ),
                          child: Text(
                            '支付',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: Text(
                '請前往點單',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 32,
                ),
              ),
            ),
    );
  }
}
