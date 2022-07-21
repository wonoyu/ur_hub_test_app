import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ur_hub_test_app/src/features/product_list/entities/product_list_model.dart';
import 'package:ur_hub_test_app/src/features/product_list/repository/product_list_repository_impl.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepositoryImpl productListRepositoryImpl;
  ProductListBloc({required this.productListRepositoryImpl})
      : super(ProductListInitial()) {
    on<LoadProductList>((event, emit) async {
      emit(ProductListInitial());
      print("kepanggil euy");
      try {
        final data = await productListRepositoryImpl.getProducts();
        final categories = data.map((el) => el.category).toSet().toList();
        emit(ProductListLoaded(
            filteredProducts: data, products: data, categories: categories));
      } on Exception catch (e) {
        emit(ProductListError(error: e.toString()));
      }
    });
    on<SelectCategory>((event, emit) {
      emit(ProductListInitial());
      final data = event.products;
      final category = event.category;
      final categories = event.categories;
      final filtered =
          data.where((element) => element.category == category).toList();
      emit(ProductListLoaded(
          products: data, categories: categories, filteredProducts: filtered));
    });
    on<AddProduct>((event, emit) {});
  }
}
