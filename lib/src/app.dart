import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_detail/ui/product_detail_page.dart';
import 'package:ur_hub_test_app/src/features/product_list/bloc/product_list_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_list/repository/product_list_repository_impl.dart';
import 'package:http/http.dart' as http;
import 'package:ur_hub_test_app/src/features/product_list/ui/product_list_page.dart';
import 'package:ur_hub_test_app/src/shared/api.dart';
import 'package:ur_hub_test_app/src/shared/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductListRepositoryImpl>(
            create: (context) => ProductListRepositoryImpl(
                client: http.Client(), api: ProductListApi()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProductListBloc(
                  productListRepositoryImpl:
                      context.read<ProductListRepositoryImpl>())
                ..add(LoadProductList()))
        ],
        child: MaterialApp(
          title: 'UR Hub Test',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ProductListPage(),
        ),
      ),
    );
  }
}
