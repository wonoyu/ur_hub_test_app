part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class ProductListInitial extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<Product> products;
  final List<String> categories;
  final List<Product> filteredProducts;

  const ProductListLoaded(
      {required this.products,
      required this.categories,
      required this.filteredProducts});

  @override
  List<Object> get props => [products, categories];
}

class ProductListError extends ProductListState {
  final String error;

  const ProductListError({required this.error});

  @override
  List<Object> get props => [error];
}
