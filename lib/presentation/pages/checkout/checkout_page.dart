import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/bloc/order/order_bloc.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/models/order_request_model.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/add_voucher_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/delivery_service_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/list_checkout_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/payment_methods_widget.dart';
import 'package:e_commerce_electronics/presentation/pages/checkout/widgets/shipping_address_widget.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:e_commerce_electronics/presentation/widgets/snap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          'Checkout',
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: blackColor,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: [
          const ListCheckoutWidget(),
          ShippingAddressWidget(
            controller: addressController,
          ),
          const DeliveryServiceWidget(),
          const Divider(
            thickness: 1,
            color: greyColor,
          ),
          const PaymentMethodsWidget(),
          const Divider(
            thickness: 1,
            color: greyColor,
          ),
          const AddVoucherWidget(),
          const Divider(
            thickness: 1,
            color: greyColor,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.3), // Warna bayangan
              spreadRadius: 5, // Lebar bayangan
              blurRadius: 6, // Tingkat blur bayangan
              offset: const Offset(0, 2), // Offset bayangan (x, y)
            )
          ],
        ),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoaded) {
              final total = state.items.fold(
                0,
                (sum, item) => sum + int.parse(item.attributes!.price!),
              );
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub total Price',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        formatCurrency(
                          total,
                        ),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Total', style: greyTextStyle),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              formatCurrency(
                                total,
                              ),
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      BlocListener<OrderBloc, OrderState>(
                        listener: (context, state) {
                          // because order bloc use freezed, so this is step
                          state.maybeWhen(
                            orElse: () {},
                            loaded: (model) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SnapWidget(
                                      url: model.redirectUrl,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: BlocBuilder<CheckoutBloc, CheckoutState>(
                          builder: (context, state) {
                            if (state is CheckoutLoaded) {
                              final total = state.items.fold(
                                0,
                                (sum, item) =>
                                    sum + int.parse(item.attributes!.price!),
                              );
                              return Expanded(
                                child: CustomFilledButton(
                                  height: 40,
                                  title: 'Buy Now',
                                  onPressed: () {
                                    final data = Data(
                                      items: state.items
                                          .map(
                                            (item) => Item(
                                              id: item.id!,
                                              productName:
                                                  item.attributes!.name!,
                                              price: int.parse(
                                                  item.attributes!.price!),
                                              qty: int.parse(
                                                  item.attributes!.quantity!),
                                            ),
                                          )
                                          .toList(),
                                      totalPrice: total,
                                      deliveryAddress: addressController.text,
                                      courierName: 'JNT',
                                      shippingCost: 25000,
                                      statusOrder: 'waitingPayment',
                                    );
                                    final requestModel =
                                        OrderRequestModel(data: data);
                                    context.read<OrderBloc>().add(
                                          OrderEvent.doOrder(requestModel),
                                        );
                                  },
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub total Price',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      formatCurrency(
                        int.parse('0'),
                      ),
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total', style: greyTextStyle),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            formatCurrency(
                              int.parse('0'),
                            ),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: CustomFilledButton(
                        height: 40,
                        title: 'Buy Now',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CheckoutPage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
