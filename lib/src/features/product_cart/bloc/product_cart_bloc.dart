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
  }
}
