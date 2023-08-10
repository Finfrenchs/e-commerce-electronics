// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_electronics/data/datasources/auth_remote_datasource.dart';
import 'package:e_commerce_electronics/data/models/auth_response_model.dart';
import 'package:e_commerce_electronics/data/models/register_request_model.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDatasource datasource;
  RegisterBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.register(event.model);
      result.fold(
        (l) => emit(const _Failed()),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
