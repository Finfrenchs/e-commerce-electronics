// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce_electronics/data/datasources/auth_remote_datasource.dart';
import 'package:e_commerce_electronics/data/models/auth_response_model.dart';
import 'package:e_commerce_electronics/data/models/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource
      datasource; //dibuat seperti ini agar datasource dapat dibuatkan mocking nya. jadi bisa di buatkan unit testing.
  LoginBloc(
    this.datasource,
  ) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      emit(LoginLoading());

      final result = await datasource.login(event.model);
      result.fold(
        (l) => emit(LoginFailed()),
        (r) => emit(LoginLoaded(model: r)),
      );
    });
  }
}
