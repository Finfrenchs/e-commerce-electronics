import 'package:e_commerce_electronics/data/models/list_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutLoaded(items: [])) {
    on<AddToChartEvent>((event, emit) {
      final currentState = state as CheckoutLoaded; //tampung state sebelumnya

      emit(CheckoutLoading());
      emit(CheckoutLoaded(items: [...currentState.items, event.product]));
    });

    on<RemoveFromChartEvent>((event, emit) {
      final currentState = state as CheckoutLoaded; //tampung state sebelumnya
      currentState.items.remove(event.product);
      emit(CheckoutLoading());
      emit(CheckoutLoaded(items: currentState.items));
    });
  }
}
