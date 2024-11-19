import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/product_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeProviderState>(
  (ref) => HomeProvider(),
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
          productList: [],
          selectedCategory: 'Jackets',
        ));

  Future<void> getProductListbyCategory(String catergory) async {
    if (state.productList.isEmpty) {
      await _getProducts();
    }
  }

  Future<void> updateCategory(int index) async {
    final updatedCategories = state.catergoryList.map((category) {
      print(category.name);
      return category.copyWith(isSelected: false);
    }).toList();
    updatedCategories[index] =
        updatedCategories[index].copyWith(isSelected: true);

    state = state.copyWith(catergoryList: updatedCategories);
  }

  Future<List<Product>> _getProducts() async {
    state = state.copyWith(productList: AppData.productList);
    return state.productList;
  }
}
