import 'package:dio/dio.dart';
import '../../shared/api/dio_exception.dart';
import '../../shared/api/product_api.dart';
import '../models/product_model.dart';
import '../models/product_response_model.dart';

class ProductRepository {
  ProductRepository(this.productApi);

  final ProductApi productApi;

  Future<ProductModel> info(String id) async {
    try {
      final Response<dynamic> response = await productApi.info(id);
      final ProductResponse res = ProductResponse.fromJson(response.data as Map<String, dynamic>);
      return res.product!;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<ProductResponse> search(String query) async {
    try {
      final Response<dynamic> response = await productApi.search(query);
      final ProductResponse res = ProductResponse.fromJson(response.data as Map<String, dynamic>);
      return res;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  // Future<ProductResponse> list(String id) async {
  //   try {
  //     final Response<dynamic> response = await productApi.info(id);
  //     final ProductResponse res = ProductResponse.fromJson(response.data as Map<String, dynamic>);
  //     return res.product!;
  //   } on DioError catch (e) {
  //     final String errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw Exception(errorMessage);
  //   }
  // }

}
