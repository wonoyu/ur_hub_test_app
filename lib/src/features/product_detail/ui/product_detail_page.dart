import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_cart/bloc/product_cart_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_list/entities/product_list_model.dart';
import 'package:ur_hub_test_app/src/shared/routes.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        actions: [
          Badge(
            position: BadgePosition.topStart(),
            badgeContent: BlocBuilder<ProductCartBloc, ProductCartState>(
              builder: (context, state) {
                if (state is ProductCartAdded) {
                  return Text("${state.product.length}");
                }
                return const Text("0");
              },
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.productCartPage);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.shopping_cart_outlined),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselImages(images: product.images),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 8.0, 24.0, 8.0),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 8.0, 24.0, 8.0),
              child: Text(product.description),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 8.0, 24.0, 8.0),
              child: Text("Harga : Rp. ${product.price}"),
            ),
            BlocBuilder<ProductCartBloc, ProductCartState>(
              builder: (context, state) {
                final productsAdded =
                    state is ProductCartAdded ? state.product : <Product>[];
                return ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProductCartBloc>()
                          .add(AddToCart(product, productsAdded));
                    },
                    child: Text(
                        "Tambah Ke Keranjang (Qty ${productsAdded.any((element) => element == product) ? product.quantity : 0})"));
              },
            )
          ],
        ),
      ),
    );
  }
}

class CarouselImages extends StatefulWidget {
  const CarouselImages({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int _currPos = 0;
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.images.length,
            itemBuilder: (context, index, pos) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: CachedNetworkImage(
                  // width: MediaQuery.of(context).size.width,
                  // height: 200,
                  imageUrl: widget.images[index],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.8,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 1.2,
              onPageChanged: (index, reason) {
                setState(() {
                  _currPos = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((e) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(e.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                        .withOpacity(_currPos == e.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
