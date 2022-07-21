import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ur_hub_test_app/src/features/product_list/entities/product_list_model.dart';
import 'package:ur_hub_test_app/src/features/product_list/repository/product_list_repository.dart';
import 'package:ur_hub_test_app/src/shared/api.dart';

class ProductListRepositoryImpl implements ProductListRepository {
  ProductListRepositoryImpl({required this.client, required this.api});

  final http.Client client;
  final ProductListApi api;

  @override
  Future<List<Product>> getProducts() async {
    final response = await client.get(api.productList());
    final data = List<Product>.from(
        ProductListModel.fromMap(json.decode(response.body)).products);

    return data;
  }
}
