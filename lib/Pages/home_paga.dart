import 'package:flutter/material.dart';
import 'package:flutter_test_22/components/bottom_nav_bar.dart';

import 'cart_page.dart';
import 'shop_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // nevigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex){
     setState((){
      _selectedIndex = newIndex;
     });
  }

  // peges to display
  final List<Widget> _pages = [
    // shope page 
    ShopPage(),

    // cart page 
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.brown[200],
    bottomNavigationBar:MyBottomNavBar(
     onTabChange: (index) => navigateBottomBar(index) ,
    ),
    body: _pages[_selectedIndex],
    );
  }
}
