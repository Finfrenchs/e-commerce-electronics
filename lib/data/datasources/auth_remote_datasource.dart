import 'package:dartz/dartz.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/data/models/auth_response_model.dart';
import 'package:e_commerce_electronics/data/models/login_request_model.dart';
import 'package:e_commerce_electronics/data/models/register_request_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel model) async {
    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/auth/local'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromRawJson(response.body));
    } else {
      return const Left('server error');
    }
  }

  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/auth/local/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromRawJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
