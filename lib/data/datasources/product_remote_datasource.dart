import 'package:dartz/dartz.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/data/models/list_product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ListProductModel>> getAllProduct() async {
    final response =
        await http.get(Uri.parse('${GlobalVariables.baseUrl}/api/products'));

    if (response.statusCode == 200) {
      return Right(ListProductModel.fromRawJson(response.body));
    } else {
      return const Left('Failed load data');
    }
  }
}
