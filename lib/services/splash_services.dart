import 'dart:async';
import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashService {
  Future<void> checkAndNavigate(BuildContext context) async {
    // Optional delay to ensure Firebase initialization
    await Future.delayed(const Duration(milliseconds: 100));
    // Use authStateChanges to listen to authentication state changes
    // _auth.authStateChanges().listen((User? user) {
    //   print('Auth State Changed: ${user?.uid ?? 'No User'}'); // Debugging line

    //   if (user != null) {
    //     _navigateWithDelay(context, RouteName.homeRoute);
    //   } else {
    //     _navigateWithDelay(context, RouteName.loginRoute);
    //   }
    // });

    _navigateWithDelay(context, RouteName.loginRoute);
  }

  void _navigateWithDelay(BuildContext context, String routeName) {
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacementNamed(routeName);
    });
  }
}
