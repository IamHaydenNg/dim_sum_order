import 'dart:convert';

import 'package:dim_sum_order/models/dimsum.dart';
import 'package:dim_sum_order/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<List<DimSum>> _loadDimSum() async {
    final dataString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonData = await json.decode(dataString);
    return jsonData.map((json) => DimSum.fromJson(json?.dish)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '點心紙',
      home: HomeScreen(),
    );
  }
}
