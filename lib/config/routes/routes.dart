import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:ecommerce_app/views/home/home_page.dart';
import 'package:ecommerce_app/views/language/language_view.dart';
import 'package:ecommerce_app/views/main/main_page_view.dart';
import 'package:go_router/go_router.dart';

import '../../views/login/login_screen.dart';
import '../../views/signup/signup_screen.dart';
import '../../views/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteName.splashRoute,
      builder: (context, state) => const SplashScreen(),
      name: RouteName.splashRoute,
    ),
    GoRoute(
      path: RouteName.loginRoute,
      builder: (context, state) => const LoginScreen(),
      name: RouteName.loginRoute,
    ),
    GoRoute(
      path: RouteName.signUpRoute,
      builder: (context, state) => const SignUpScreen(),
      name: RouteName.signUpRoute,
    ),
    GoRoute(
      path: RouteName.languageRoute,
      builder: (context, state) => LanguageView(
        userId: state.uri.queryParameters['userId'] ?? "",
      ),
      name: RouteName.languageRoute,
    ),
    GoRoute(
      path: RouteName.homeRoute,
      builder: (context, state) => const HomeView(
        title: 'Home',
      ),
      name: RouteName.homeRoute,
    ),
    GoRoute(
      path: RouteName.mainRoute,
      builder: (context, state) => const MainPage(),
      name: RouteName.mainRoute,
    ),
  ],
);
