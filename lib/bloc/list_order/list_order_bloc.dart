// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_electronics/data/datasources/order_remote_datasource.dart';
import 'package:e_commerce_electronics/data/models/list_order_response_model.dart';

part 'list_order_bloc.freezed.dart';
part 'list_order_event.dart';
part 'list_order_state.dart';

class ListOrderBloc extends Bloc<ListOrderEvent, ListOrderState> {
  final OrderRemoteDatasource datasource;
  ListOrderBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.listOrder();
      result.fold(
        (l) => emit(const _Failed()),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
