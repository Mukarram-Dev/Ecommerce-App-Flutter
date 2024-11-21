import 'package:ecommerce_app/config/components/custome_appbar.dart';
import 'package:ecommerce_app/providers/home/home_provider.dart';
import 'package:ecommerce_app/views/details/details_screen.dart';
import 'package:ecommerce_app/views/favourite/widgets/favourtie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteProductsScreen extends ConsumerWidget {
  const FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(getFavouriteListProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(title: 'Favourite'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: favouriteList.isNotEmpty
                ? GridView.builder(
                    itemCount: favouriteList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.68,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) => FavouriteCard(
                      product: favouriteList[index],
                      onCardPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: favouriteList[index],
                          ),
                        ));
                      },
                      onFavouritePress: () =>
                          ref.read(homeProvider.notifier).updateFavouriteList(
                                favouriteList[index].id,
                                !favouriteList[index].isliked,
                              ),
                    ),
                  )
                : const Center(
                    child: Text('No favourite list found'),
                  )),
      ),
    );
  }
}

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
