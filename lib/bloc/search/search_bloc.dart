// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_electronics/data/datasources/product_remote_datasource.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRemoteDatasource dataSource;
  SearchBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Search>((event, emit) async {
      emit(
        const _Loading(),
      );
      final result = await dataSource.searchProduct(event.name);
      result.fold(
        (l) => emit(
          const _Failed(),
        ),
        (r) => emit(
          _Loaded(r),
        ),
      );
    });
  }
}
