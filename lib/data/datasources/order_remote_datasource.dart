import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/data/datasources/auth_local_datasource.dart';
import 'package:e_commerce_electronics/data/models/list_order_response_model.dart';
import 'package:e_commerce_electronics/data/models/order_request_model.dart';
import 'package:e_commerce_electronics/data/models/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel model) async {
    final tokenJwt = await AuthLocalDatasource().getToken();
    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenJwt'
      },
      body: model.toRawJson(),
    );

    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }

  Future<Either<String, ListOrderResponseModel>> listOrder() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse(
          '${GlobalVariables.baseUrl}/api/orders?filters[userId][\$eq]=${authData.user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.jwt}'
      },
    );

    if (response.statusCode == 200) {
      return Right(ListOrderResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('server error');
    }
  }
}
