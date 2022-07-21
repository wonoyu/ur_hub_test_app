import 'package:flutter/material.dart';
import 'package:ur_hub_test_app/src/features/product_cart/ui/product_cart_page.dart';
import 'package:ur_hub_test_app/src/features/product_detail/ui/product_detail_page.dart';
import 'package:ur_hub_test_app/src/features/product_list/entities/product_list_model.dart';
import 'package:ur_hub_test_app/src/features/product_list/ui/product_list_page.dart';

class AppRoutes {
  static const productListPage = "/";
  static const productDetailPage = "/detail";
  static const productCartPage = "/cart";
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.productDetailPage:
        return MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: args as Product));
      case AppRoutes.productCartPage:
        return MaterialPageRoute(builder: (_) => const ProductCartPage());
      default:
        return MaterialPageRoute(builder: (_) => const ProductListPage());
    }
  }
}
