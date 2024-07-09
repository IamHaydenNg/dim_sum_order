import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onItemTapped});

  final int currentIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: '主頁',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '訂單',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onItemTapped,
      fixedColor: Colors.amber,
    );
  }
}
