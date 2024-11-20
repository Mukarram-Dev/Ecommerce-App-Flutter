import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/views/favourite/favourtite_view.dart';
import 'package:ecommerce_app/views/home/home_page.dart';
import 'package:ecommerce_app/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    const FavoriteProductsScreen(),
    const ProfileScreen(),
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
        items: <Widget>[
          SvgPicture.asset(
            ImageAssets.homeSvg,
            height: 30,
            width: 30,
          ),
          SvgPicture.asset(
            ImageAssets.heartSvg,
            height: 35,
            width: 35,
          ),
          SvgPicture.asset(
            ImageAssets.settingsSvg,
            height: 30,
            width: 30,
          ),
        ],
        onTap: (index) {
          _onNavBarItemTapped(index);
        },
      ),
    );
  }
}
