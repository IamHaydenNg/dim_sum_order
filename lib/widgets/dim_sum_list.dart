import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/widgets/dim_sum_card.dart';
import 'package:flutter/material.dart';

class DimSumList extends StatelessWidget {
  const DimSumList({
    super.key,
    required this.dimsum,
    required this.selectedCategory,
  });

  final Future<List<DimSum>> dimsum;
  final String selectedCategory;

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
          final List<DimSum> allDimSumList = snapshot.data!;
          final List<DimSum> filteredList = allDimSumList.where((item) {
            return item.category == selectedCategory;
          }).toList();
          return ListView.builder(
            itemCount: selectedCategory == 'a'
                ? allDimSumList.length
                : filteredList.length,
            itemBuilder: (context, index) {
              final DimSum dimSumItem = selectedCategory == 'a'
                  ? allDimSumList[index]
                  : filteredList[index];

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
