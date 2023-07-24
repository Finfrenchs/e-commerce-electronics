part of 'get_products_bloc.dart';

abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GetProductsLoaded extends GetProductsState {
  final ListProductModel data;
  GetProductsLoaded({
    required this.data,
  });
}

class GetProductsFailed extends GetProductsState {}
