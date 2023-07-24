// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

abstract class CheckoutEvent {}

class AddToChartEvent extends CheckoutEvent {
  final Product product;
  AddToChartEvent({
    required this.product,
  });
}

class RemoveFromChartEvent extends CheckoutEvent {
  final Product product;
  RemoveFromChartEvent({
    required this.product,
  });
}
