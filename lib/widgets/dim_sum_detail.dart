import 'package:dim_sum_order/models/dimsum.dart';
import 'package:flutter/material.dart';

class DimSumDetail extends StatelessWidget {
  const DimSumDetail({super.key, required this.dimSumItem});
  final DimSum dimSumItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        shape: const Border(bottom: BorderSide.none),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(dimSumItem.image),
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
            )
          ],
        ),
      ),
    );
  }
}
