import 'package:ur_hub_test_app/src/constants/api_constants.dart';

class ProductListApi {
  Uri productList() => Uri(
        scheme: "https",
        host: ApiConstants.baseUrl,
        path: ApiConstants.endPoint,
      );
}
