import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/product_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeProviderState>(
  (ref) => HomeProvider(),
);

final getProductListProvider = Provider<List<Product>>((ref) {
  final state = ref.watch(homeProvider);
  return state.productList
      .where((product) => product.category == state.selectedCategory)
      .toList();
});

final getFavouriteListProvider = Provider<List<Product>>((ref) {
  final state = ref.watch(homeProvider);
  return state.productList.where((product) => product.isliked).toList();
});

class HomeProviderState {
  final List<ProductCategory> categoryList;
  final List<Product> productList;
  final String selectedCategory;

  const HomeProviderState({
    required this.categoryList,
    required this.productList,
    required this.selectedCategory,
  });

  HomeProviderState copyWith({
    List<ProductCategory>? categoryList,
    List<Product>? productList,
    String? selectedCategory,
  }) {
    return HomeProviderState(
      categoryList: categoryList ?? this.categoryList,
      productList: productList ?? this.productList,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class HomeProvider extends StateNotifier<HomeProviderState> {
  HomeProvider()
      : super(
          HomeProviderState(
            categoryList: AppData.categoryList,
            productList: AppData.productList,
            selectedCategory: 'Jackets',
          ),
        );

  void updateCategory(int index) {
    final updatedCategories = [
      for (int i = 0; i < state.categoryList.length; i++)
        state.categoryList[i].copyWith(isSelected: i == index)
    ];

    state = state.copyWith(
      categoryList: updatedCategories,
      selectedCategory: updatedCategories[index].name,
    );
  }

  void updateFavouriteList(int id, bool isLiked) {
    final updatedProducts = [
      for (int i = 0; i < state.productList.length; i++)
        if (state.productList[i].id == id)
          state.productList[i].copyWith(isliked: isLiked)
        else
          state.productList[i]
    ];

    state = state.copyWith(productList: updatedProducts);
  }
}
