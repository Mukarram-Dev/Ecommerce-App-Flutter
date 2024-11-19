import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/product_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeProviderState>(
  (ref) => HomeProvider(),
);

final getProductListProvider = FutureProvider<List<Product>>(
  (ref) async {
    ref.watch(homeProvider);
    return await ref.read(homeProvider.notifier).getProductListbyCategory();
  },
);

class HomeProviderState {
  final List<ProductCategory> catergoryList;
  final List<Product> productList;
  final String selectedCategory;

  HomeProviderState({
    required this.catergoryList,
    required this.productList,
    required this.selectedCategory,
  });

  HomeProviderState copyWith({
    List<ProductCategory>? catergoryList,
    List<Product>? productList,
    String? selectedCategory,
  }) {
    return HomeProviderState(
      catergoryList: catergoryList ?? this.catergoryList,
      productList: productList ?? this.productList,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class HomeProvider extends StateNotifier<HomeProviderState> {
  HomeProvider()
      : super(HomeProviderState(
          catergoryList: AppData.categoryList,
          productList: AppData.productList,
          selectedCategory: 'Jackets',
        ));

  Future<List<Product>> getProductListbyCategory() async {
    final productList = state.productList.where(
      (element) {
        return element.category.contains(state.selectedCategory);
      },
    ).toList();

    await Future.delayed(const Duration(milliseconds: 200));

    return productList;
  }

  Future<void> updateCategory(int index) async {
    final updatedCategories = state.catergoryList.map((category) {
      return category.copyWith(isSelected: false);
    }).toList();
    updatedCategories[index] =
        updatedCategories[index].copyWith(isSelected: true);

    state = state.copyWith(
      catergoryList: updatedCategories,
      selectedCategory: updatedCategories[index].name,
    );
  }
}
