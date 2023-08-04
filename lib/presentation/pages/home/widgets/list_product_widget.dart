import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/bloc/get_products/get_products_bloc.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';
import 'package:e_commerce_electronics/presentation/widgets/box_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  bool isFavorite = false;

  @override
  void initState() {
    context.read<GetProductsBloc>().add(DoGetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Product",
              style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
            ),
            const Spacer(),
            Text(
              "See all",
              style: greyTextStyle.copyWith(fontWeight: regular, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder<GetProductsBloc, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsFailed) {
              return const Center(
                child: Text("Failed to load data."),
              );
            }

            if (state is GetProductsLoaded) {
              if (state.data.data!.isEmpty) {
                return const Center(
                  child: Text('Data is empty.'),
                );
              }
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.63,
                ),
                itemBuilder: (context, index) {
                  final Product product = state.data.data![index];
                  return BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      if (state is CheckoutLoaded) {
                        final itemCount = state.items
                            .where((item) => item.id == product.id)
                            .length;
                        return BoxProduct(
                          imageProduct: product.attributes!.picture.toString(),
                          name: product.attributes!.name.toString(),
                          description:
                              product.attributes!.description.toString(),
                          price: product.attributes!.price!.toString(),
                          count: '$itemCount',
                          icon: isFavorite != true
                              ? Icons.favorite_border_rounded
                              : Icons.favorite_rounded,
                          iconColor: isFavorite != true ? greyColor : redColor,
                          onTapFavorite: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          onTapAdd: () {
                            context.read<CheckoutBloc>().add(
                                  AddToChartEvent(product: product),
                                );
                          },
                          onTapRemove: () {
                            context.read<CheckoutBloc>().add(
                                  RemoveFromChartEvent(product: product),
                                );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
                itemCount: state.data.data!.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
