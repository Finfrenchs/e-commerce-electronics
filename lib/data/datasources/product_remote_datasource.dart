import 'package:dartz/dartz.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ListProductResponseModel>> getAllProduct() async {
    final response =
        await http.get(Uri.parse('${GlobalVariables.baseUrl}/api/products'));

    if (response.statusCode == 200) {
      return Right(ListProductResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Failed load data');
    }
  }

  Future<Either<String, ListProductResponseModel>> searchProduct(
      String name) async {
    final response = await http.get(Uri.parse(
        '${GlobalVariables.baseUrl}/api/products?filters[name][\$contains]=$name'));

    if (response.statusCode == 200) {
      return Right(ListProductResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Search Failed');
    }
  }
}
