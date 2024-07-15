import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:dim_sum_order/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
