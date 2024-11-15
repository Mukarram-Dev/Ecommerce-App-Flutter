import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animateProvider = StateProvider.autoDispose<bool>((ref) => false);

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final splashService = SplashService();

    startAnimation(ref);

    ref.listen(animateProvider, (previous, next) {
      if (next) {
        Future.delayed(const Duration(milliseconds: 5000), () {
          splashService.checkAndNavigate(context);
        });
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ImageAssets.splashBg),
            fit: BoxFit.fill,
          )),
          child: Container(
              height: size.height,
              width: size.width,
              color: AppColors.black.withOpacity(0.5),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    ImageAssets.appLogo,
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void startAnimation(WidgetRef ref) async {
    await Future.delayed(const Duration(milliseconds: 500));
    ref.read(animateProvider.notifier).state = true;
  }
}
