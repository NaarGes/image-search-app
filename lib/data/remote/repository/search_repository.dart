import 'package:dio/dio.dart';
import 'package:image_search_app/data/remote/core/dio_client.dart';
import 'package:image_search_app/data/remote/core/endpoints.dart';

class SearchRepository {
  final DioClient dioClient;
  const SearchRepository(this.dioClient);

  Future<List<dynamic>> searchImages(String tag) async {
    try {
      Response response = await dioClient.dio.get(Endpoints.searchPhoto);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
