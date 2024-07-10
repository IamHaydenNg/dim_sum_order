import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/widgets/dim_sum_card.dart';
import 'package:flutter/material.dart';

class DimSumList extends StatelessWidget {
  const DimSumList({
    super.key,
    required this.dimsum,
  });

  final Future<List<DimSum>> dimsum;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DimSum>>(
      future: dimsum,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading dimsum item'),
          );
        } else {
          final dimSumList = snapshot.data!;
          return ListView.builder(
            itemCount: dimSumList.length,
            itemBuilder: (context, index) {
              final dimSumItem = dimSumList[index];
              return DimSumCard(
                dimSumItem: dimSumItem,
              );
            },
          );
        }
      },
    );
  }
}
