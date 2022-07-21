part of 'product_cart_bloc.dart';

abstract class ProductCartEvent extends Equatable {
  const ProductCartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends ProductCartEvent {
  final Product product;
  final List<Product> productsAdded;

  const AddToCart(this.product, this.productsAdded);

  @override
  List<Object> get props => [product, productsAdded];
}

class RemoveFromCart extends ProductCartEvent {
  final Product product;
  final List<Product> productsAdded;

  const RemoveFromCart(this.product, this.productsAdded);

  @override
  List<Object> get props => [product, productsAdded];
}

class RemoveQuantity extends ProductCartEvent {
  final Product product;
  final List<Product> productsAdded;

  const RemoveQuantity(this.product, this.productsAdded);

  @override
  List<Object> get props => [product, productsAdded];
}

class AddQuantity extends ProductCartEvent {
  final Product product;
  final List<Product> productsAdded;

  const AddQuantity(this.product, this.productsAdded);

  @override
  List<Object> get props => [product, productsAdded];
}
