import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ur_hub_test_app/src/features/product_cart/bloc/product_cart_bloc.dart';

class ProductCartPage extends StatelessWidget {
  const ProductCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Cart"),
      ),
      body: BlocBuilder<ProductCartBloc, ProductCartState>(
        builder: (context, state) {
          if (state is ProductCartAdded) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final total = state.product[index].quantity *
                    num.parse(state.product[index].price);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    tileColor: Colors.blue,
                    textColor: Colors.white,
                    title: Text(
                      state.product[index].name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                        "Rp. ${state.product[index].price} ${state.product[index].quantity} Buah, Total Rp $total"),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ProductCartBloc>().add(RemoveFromCart(
                                state.product[index], state.product));
                          },
                          child: const Icon(
                            Icons.delete_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<ProductCartBloc>().add(
                                    RemoveQuantity(
                                        state.product[index], state.product));
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.read<ProductCartBloc>().add(AddQuantity(
                                    state.product[index], state.product));
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.product.length,
            );
          }
          return const Center(
            child: Text("No Product Added Yet"),
          );
        },
      ),
    );
  }
}
