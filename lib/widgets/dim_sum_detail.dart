import 'package:dim_sum_order/models/dimsum.dart';
import 'package:flutter/material.dart';

class DimSumDetail extends StatelessWidget {
  const DimSumDetail({super.key, required this.dimSumItem});
  final DimSum dimSumItem;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const Border(bottom: BorderSide.none),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(dimSumItem.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('點心: ${dimSumItem.name}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('簡介: ${dimSumItem.description}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('食材: '),
                          for (var ingredient in dimSumItem.ingredients)
                            Text('$ingredient '),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
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
                    child: Text('1'),
                  ),
                  IconButton(
                    onPressed: () {},
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
                  SizedBox(
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
