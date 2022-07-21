part of 'product_cart_bloc.dart';

abstract class ProductCartState extends Equatable {
  const ProductCartState();
  
  @override
  List<Object> get props => [];
}

class ProductCartInitial extends ProductCartState {}
