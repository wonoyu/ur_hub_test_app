import 'package:ur_hub_test_app/src/features/product_list/entities/product_list_model.dart';

abstract class ProductListRepository {
  Future<List<Product>> getProducts();
}
