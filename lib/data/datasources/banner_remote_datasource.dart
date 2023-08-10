import 'package:dartz/dartz.dart';
import 'package:e_commerce_electronics/common/global_variables.dart';
import 'package:e_commerce_electronics/data/models/banner_response_model.dart';
import 'package:http/http.dart' as http;

class BannerRemoteDatasource {
  Future<Either<String, BannerResponseModel>> getAllProduct() async {
    final response = await http
        .get(Uri.parse('${GlobalVariables.baseUrl}/api/banners?populate=*'));

    if (response.statusCode == 200) {
      return Right(BannerResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Failed load data');
    }
  }
}
