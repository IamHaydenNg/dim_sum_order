import 'package:dim_sum_order/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '點心紙',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 45, 168, 108)),
      home: const HomeScreen(),
    );
  }
}
