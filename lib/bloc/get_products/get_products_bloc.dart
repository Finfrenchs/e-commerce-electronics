import 'package:e_commerce_electronics/data/datasources/product_remote_datasource.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRemoteDatasource datasource;
  GetProductsBloc(
    this.datasource,
  ) : super(GetProductsInitial()) {
    on<DoGetProductsEvent>((event, emit) async {
      emit(GetProductsLoading());
      final result = await datasource.getAllProduct();
      result.fold(
        (l) => emit(GetProductsFailed()),
        (r) => emit(GetProductsLoaded(data: r)),
      );
    });
  }
}
