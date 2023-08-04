// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_commerce_electronics/data/models/order_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_electronics/data/datasources/order_remote_datasource.dart';
import 'package:e_commerce_electronics/data/models/order_request_model.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDatasource datasource;
  OrderBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_DoOrder>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.order(event.model);
      result.fold(
        (l) => emit(const _Failed()),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
