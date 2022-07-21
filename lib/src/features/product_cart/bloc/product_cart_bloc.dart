import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ur_hub_test_app/src/features/product_list/entities/product_list_model.dart';

part 'product_cart_event.dart';
part 'product_cart_state.dart';

class ProductCartBloc extends Bloc<ProductCartEvent, ProductCartState> {
  ProductCartBloc() : super(ProductCartInitial()) {
    on<AddToCart>((event, emit) {
      emit(ProductCartInitial());
      final product = event.product;
      final productsAdded = event.productsAdded;
      if (productsAdded.any((element) => element.name == product.name)) {
        productsAdded[productsAdded
                .indexWhere((element) => element.name == product.name)]
            .quantity += 1;
      } else {
        productsAdded.add(product);
      }
      emit(ProductCartAdded(product: productsAdded));
    });

    on<RemoveFromCart>((event, emit) {
      final product = event.product;
      final productsAdded = event.productsAdded;
      productsAdded.remove(product);
      if (productsAdded.isEmpty) {
        emit(ProductCartInitial());
      } else {
        emit(ProductCartLoading());
        emit(ProductCartAdded(product: productsAdded));
      }
    });
    on<RemoveQuantity>((event, emit) {
      final product = event.product;
      final productsAdded = event.productsAdded;
      if (productsAdded.any((element) => element.name == product.name)) {
        int quantity = productsAdded[productsAdded
                .indexWhere((element) => element.name == product.name)]
            .quantity;
        if (quantity > 1) {
          productsAdded[productsAdded
                  .indexWhere((element) => element.name == product.name)]
              .quantity -= 1;
        } else {
          productsAdded.remove(product);
        }
      }
      if (productsAdded.isEmpty) {
        emit(ProductCartInitial());
      } else {
        emit(ProductCartLoading());
        emit(ProductCartAdded(product: productsAdded));
      }
    });

    on<AddQuantity>((event, emit) {
      final product = event.product;
      final productsAdded = event.productsAdded;
      if (productsAdded.any((element) => element.name == product.name)) {
        productsAdded[productsAdded
                .indexWhere((element) => element.name == product.name)]
            .quantity += 1;
        emit(ProductCartLoading());
        emit(ProductCartAdded(product: productsAdded));
      }
    });
  }
}
