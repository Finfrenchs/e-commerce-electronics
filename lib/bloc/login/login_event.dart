// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

//then click, that is event. so that bring a data
//data = login request model

class DoLoginEvent extends LoginEvent {
  final LoginRequestModel model;
  DoLoginEvent({
    required this.model,
  });
}
