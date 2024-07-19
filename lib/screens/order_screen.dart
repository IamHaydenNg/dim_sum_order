import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:dim_sum_order/widgets/confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<CartProvider>(context).orders;
    final orderQuantity = orders.length;

    return Scaffold(
      body: orders.isNotEmpty
          ? Column(
              children: [
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
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
                        padding: const EdgeInsets.all(8.0),
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
                ConfirmButton(label: '埋單', action: () {}),
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
