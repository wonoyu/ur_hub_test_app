part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class LoadProductList extends ProductListEvent {}

class AddProduct extends ProductListEvent {
  final Product product;

  const AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class SelectCategory extends ProductListEvent {
  final List<Product> products;
  final String category;
  final List<String> categories;

  const SelectCategory(this.products, this.category, this.categories);

  @override
  List<Object> get props => [products, categories, category];
}

class RemoveProduct extends ProductListEvent {
  final Product product;

  const RemoveProduct(this.product);

  @override
  List<Object> get props => [product];
}
