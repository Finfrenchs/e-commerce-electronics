import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/data_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCheckoutWidget extends StatelessWidget {
  const ListCheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoaded) {
          final uniqueItem = state.items.toSet().length;
          final dataSet = state.items.toSet();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: uniqueItem,
            itemBuilder: (context, index) {
              final count = state.items
                  .where(
                    (item) => item.id == dataSet.elementAt(index).id,
                  )
                  .length;
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: lightBackgroundColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: dataSet.elementAt(index).attributes!.picture!,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                                dataSet.elementAt(index).attributes!.picture!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 220,
                          height: 20,
                          child: Text(
                            //'${name!.length >= 26 ? name!.substring(0, 26) : name!}...',
                            dataSet.elementAt(index).attributes!.name!,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: Text(
                            //'${description!.length >= 26 ? description!.substring(0, 26) : description!}...',
                            dataSet.elementAt(index).attributes!.description!,
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatCurrency(
                                  int.parse(dataSet
                                      .elementAt(index)
                                      .attributes!
                                      .price!),
                                ),
                                style: blackTextStyle.copyWith(
                                  fontWeight: black,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'x$count',
                                style: blackTextStyle.copyWith(
                                  fontWeight: regular,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
        return const DataNotfoundWidget();
      },
    );
  }
}
