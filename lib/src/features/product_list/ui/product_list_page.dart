import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_list/bloc/product_list_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_list/ui/product_list_view.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
        if (state is ProductListInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductListLoaded) {
          final products = state.products;
          final categories = state.categories;
          final filtered = state.filteredProducts;

          return ProductListView(
            products: products,
            categories: categories.toList(),
            filteredProducts: filtered,
          );
        }
        return Center(
          child: Text(
              state is ProductListError ? state.error : "An Error Occured"),
        );
      }),
    );
  }
}
