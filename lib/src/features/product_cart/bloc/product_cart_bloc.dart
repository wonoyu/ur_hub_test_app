import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_cart_event.dart';
part 'product_cart_state.dart';

class ProductCartBloc extends Bloc<ProductCartEvent, ProductCartState> {
  ProductCartBloc() : super(ProductCartInitial()) {
    on<ProductCartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
