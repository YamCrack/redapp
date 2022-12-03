import 'package:dio/dio.dart';
import 'api_utils.dart';
import 'constants/endpoints.dart';
import 'dio_client.dart';

class ProductApi {
  ProductApi({required this.dioClient});

  final DioClient dioClient;

  Future<Response<dynamic>> info(String id) async {
    try {
      final Map<String, dynamic> data = {
        'id': id,
      };

      final Response<dynamic> response = await dioClient.post(Endpoints.prodInfo, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> search(String query, {int offset = 0, int limit = 20}) async {
    try {
      final Map<String, dynamic> data = {
        'criteria': getLikeProductCriteria(query),
        'limit': limit,
        'offset': offset,
      };

      final Response<dynamic> response = await dioClient.post(Endpoints.prodList, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
