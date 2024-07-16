import 'package:dim_sum_order/models/dimsum_category.dart';
import 'package:dim_sum_order/providers/cart_provider.dart';
import 'package:dim_sum_order/screens/cart_screen.dart';
import 'package:dim_sum_order/screens/menu_screen.dart';
import 'package:dim_sum_order/utils/source_data.dart';
import 'package:dim_sum_order/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Future<DimSumCategory> _category;

  static final List<Widget> _widgetOptions = [
    const MenuScreen(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    _category = SourceData.loadDimSumCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("點心紙"),
        actions: [
          badges.Badge(
            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.amber),
            badgeContent: Text(
              cart.items.length.toString(),
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.pushNamed(
                context,
                CartScreen.routeName,
                arguments: _category,
              ),
            ),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
