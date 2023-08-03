import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/presentation/pages/cart/widgets/card_list_cart_widget.dart';
import 'package:e_commerce_electronics/presentation/widgets/data_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCartWidget extends StatefulWidget {
  const ListCartWidget({super.key});

  @override
  State<ListCartWidget> createState() => _ListCartWidgetState();
}

class _ListCartWidgetState extends State<ListCartWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoaded) {
          final uniqueItem = state.items.toSet().length;
          final dataSet = state.items.toSet();

          if (state.items.isEmpty) {
            return const Center(
              child: DataNotfoundWidget(),
            );
          }
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              itemCount: uniqueItem,
              itemBuilder: (context, index) {
                final itemCount = state.items
                    .where((item) => item.id == dataSet.elementAt(index).id)
                    .length;
                return CardListCartWidget(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  image: dataSet.elementAt(index).attributes!.picture,
                  name: dataSet.elementAt(index).attributes!.name,
                  description: dataSet.elementAt(index).attributes!.description,
                  price: dataSet.elementAt(index).attributes!.price,
                  count: itemCount.toString(),
                  onTapAdd: () {
                    context.read<CheckoutBloc>().add(
                          AddToChartEvent(
                            product: dataSet.elementAt(
                              index,
                            ),
                          ),
                        );
                  },
                  onTapRemove: () {
                    context.read<CheckoutBloc>().add(
                          RemoveFromChartEvent(
                            product: dataSet.elementAt(
                              index,
                            ),
                          ),
                        );
                  },
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
