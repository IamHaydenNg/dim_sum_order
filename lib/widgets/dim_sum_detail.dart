import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DimSumDetail extends StatefulWidget {
  const DimSumDetail({super.key, required this.dimSumItem});
  final DimSum dimSumItem;

  @override
  State<DimSumDetail> createState() => _DimSumDetailState();
}

class _DimSumDetailState extends State<DimSumDetail> {
  void _addToCart(BuildContext context, DimSum item) {
    Provider.of<CartProvider>(context, listen: false).addItem(item);
  }

  void _removeFromCart(BuildContext context, DimSum item) {
    Provider.of<CartProvider>(context, listen: false).removeItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    int itemOnCartAmount(DimSum item) {
      return cart.items.where((cartItem) => cartItem.id == item.id).length;
    }

    return Dialog(
      shape: const Border(bottom: BorderSide.none),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(widget.dimSumItem.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('點心: ${widget.dimSumItem.name}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('簡介: ${widget.dimSumItem.description}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text('食材: '),
                        for (var ingredient in widget.dimSumItem.ingredients)
                          Text('$ingredient '),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      itemOnCartAmount(widget.dimSumItem) == 0
                          ? null
                          : _removeFromCart(context, widget.dimSumItem);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      itemOnCartAmount(widget.dimSumItem).toString(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _addToCart(context, widget.dimSumItem);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
