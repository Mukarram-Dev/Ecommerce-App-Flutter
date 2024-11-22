import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/services/splash_services.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animateProvider = StateProvider.autoDispose<bool>((ref) => false);

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashService = SplashService();
    startAnimation(ref);

    ref.listen(animateProvider, (previous, next) {
      if (next) {
        Future.delayed(const Duration(milliseconds: 5000), () {
          splashService.checkAndNavigate(context);
        });
      }
    });
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: FadeInImage(
                image: AssetImage(
                  ImageAssets.appLogo,
                ),
                placeholder: NetworkImage(AppConstants.placeHolder),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void startAnimation(WidgetRef ref) async {
    await Future.delayed(const Duration(milliseconds: 500));
    ref.read(animateProvider.notifier).state = true;
  }
}
