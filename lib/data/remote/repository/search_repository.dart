import 'package:dio/dio.dart';
import 'package:image_search_app/data/remote/core/dio_client.dart';
import 'package:image_search_app/data/remote/core/endpoints.dart';
import 'package:image_search_app/data/remote/model/search_result.dart';
import 'package:image_search_app/util/app_constants.dart';

class SearchRepository {
  final DioClient dioClient;
  const SearchRepository(this.dioClient);

  Future<SearchResult> searchImages(String text) async {
    try {
      Response response = await dioClient.dio.get('', queryParameters: {
        'api_key': AppConstants.apiKey,
        'method': Endpoints.searchPhoto,
        'text': text,
        'per_page': AppConstants.resultCount,
        'format': 'json',
        'nojsoncallback': 1,
      });
      if (response.data['stat'] != 'ok') {
        throw Exception(response.data['message'] ?? 'Something Broke!');
      }
      return SearchResult.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
