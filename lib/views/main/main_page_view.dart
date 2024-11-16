import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/views/home/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  // Track selected index
  int _selectedIndex = 0;

  // Pages for navigation
  final List<Widget> _pages = [
    const HomeView(title: 'Home'),
    const Center(child: Text('Cart Page')), // Replace with actual widget
    const Center(child: Text('Profile Page')) // Replace with actual widget
  ];

  // Update index when an item is tapped
  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // Display the selected page
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.white,
        color: AppColors.primaryColor,
        buttonBackgroundColor: AppColors.primaryColor,
        index: _selectedIndex,
        items: const <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 30,
          ),
          Icon(
            Icons.person_outline_outlined,
            size: 30,
          ),
        ],
        onTap: (index) {
          _onNavBarItemTapped(index);
        },
      ),
    );
  }
}
