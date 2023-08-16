import 'package:e_commerce_electronics/bloc/list_order/list_order_bloc.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:e_commerce_electronics/presentation/widgets/data_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListOrderPage extends StatefulWidget {
  const ListOrderPage({super.key});

  @override
  State<ListOrderPage> createState() => _ListOrderPageState();
}

class _ListOrderPageState extends State<ListOrderPage> {
  @override
  void initState() {
    context.read<ListOrderBloc>().add(const ListOrderEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 1,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: blackColor,
          ),
        ),
        title: Text(
          'List Order',
          style: blackTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
      ),
      body: BlocBuilder<ListOrderBloc, ListOrderState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const DataNotfoundWidget();
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (data) {
              return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  final order = data.data![index];
                  final items = order.attributes!.items!.first;
                  return Card(
                    shadowColor: blueColor,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order#${order.id}',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy HH:mm')
                                          .format(order.attributes!.createdAt!),
                                      style: greyTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: order.attributes!.statusOrder ==
                                            'purchased'
                                        ? lightGreenColor
                                        : lightRedColor,
                                  ),
                                  child: Text(
                                    order.attributes!.statusOrder!,
                                    style: order.attributes!.statusOrder ==
                                            'purchased'
                                        ? greenTextStyle.copyWith(
                                            fontWeight: bold,
                                          )
                                        : redTextStyle.copyWith(
                                            fontWeight: bold,
                                          ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: greyColor.withOpacity(0.5),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            items.productName!,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Total Harga',
                            style: greyTextStyle,
                          ),
                          Text(
                            formatCurrency(
                              int.parse(
                                '${order.attributes!.totalPrice}',
                              ),
                            ),
                            style: blackTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
