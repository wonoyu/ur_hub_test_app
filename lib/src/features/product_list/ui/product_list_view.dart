import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ur_hub_test_app/src/features/product_list/bloc/product_list_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_list/entities/product_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ur_hub_test_app/src/shared/routes.dart';

class ProductListView extends StatelessWidget {
  const ProductListView(
      {Key? key,
      required this.products,
      required this.categories,
      required this.filteredProducts})
      : super(key: key);

  final List<Product> products;
  final List<Product> filteredProducts;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 70,
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:
                      CategoryChip(categories: categories, products: products),
                ))),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
            physics: const BouncingScrollPhysics(),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.productDetailPage,
                    arguments: filteredProducts[index]);
              },
              child: ListViewContent(
                product: filteredProducts[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryChip extends StatefulWidget {
  const CategoryChip(
      {Key? key, required this.categories, required this.products})
      : super(key: key);

  final List<String> categories;
  final List<Product> products;

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  int _selectedIndex = 0;

  Widget _buildChips() {
    List<Widget> chips = [];
    for (int i = 0; i < widget.categories.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        label: Text(widget.categories[i]),
        labelStyle:
            TextStyle(color: _selectedIndex == i ? Colors.white : Colors.black),
        selected: _selectedIndex == i,
        selectedColor: Colors.blue,
        onSelected: (value) {
          context.read<ProductListBloc>().add(SelectCategory(
              widget.products, widget.categories[i], widget.categories));
          setState(() {
            if (value) {
              _selectedIndex = i;
            }
          });
        },
      );
      chips.add(choiceChip);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chips
          .map((e) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: e,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChips();
  }
}

class ListViewContent extends StatelessWidget {
  const ListViewContent({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                width: 150,
                height: 150,
                imageUrl: product.images[0],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.red,
                ),
              )),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      product.name,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Harga : ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Rp. ${product.price}",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Terjual : ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Wrap(
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4.0,
                    children: [
                      Text(
                        "${product.sold} kali",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
