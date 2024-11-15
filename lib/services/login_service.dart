import 'dart:async';

import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginServices {
  // final FirebaseAuth? _auth;

  // LoginServices() : _auth = FirebaseAuth.instance;

  Future<void> checkStatusAndLogin(BuildContext context) async {
    _navigateWithDelay(context, RouteName.homeRoute);
  }

  void _navigateWithDelay(BuildContext context, String routeName) {
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacementNamed(routeName);
    });
  }
}
