import 'package:ecommerce_app/config/routes/routes.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/models/hive/cart_hive/cart_hive.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await initializeHive();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AddToCartAdapter());
  await Hive.openBox<AddToCart>(AppConstants.preferencesCart);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      themeMode: ThemeMode.light,
      theme: theme(),
    );
  }
}
