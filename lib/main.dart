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
    return MaterialApp(
      title: '點心紙',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 45, 168, 108)),
      home: const HomeScreen(),
    );
  }
}
