part of 'product_cart_bloc.dart';

abstract class ProductCartState extends Equatable {
  const ProductCartState();

  @override
  List<Object> get props => [];
}

class ProductCartInitial extends ProductCartState {}

class ProductCartLoading extends ProductCartState {}

class ProductCartAdded extends ProductCartState {
  final List<Product> product;

  const ProductCartAdded({required this.product});

  @override
  List<Object> get props => [product];
}
