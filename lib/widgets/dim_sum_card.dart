import 'package:dim_sum_order/models/dimsum.dart';
import 'package:flutter/material.dart';

class DimSumCard extends StatelessWidget {
  const DimSumCard({
    super.key,
    required this.dimSumItem,
  });

  final DimSum dimSumItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/char_siu.jpeg',
      ),
      title: Text(dimSumItem.name),
      subtitle: Text('食材: ${dimSumItem.description}'),
      onTap: () {},
    );
  }
}
