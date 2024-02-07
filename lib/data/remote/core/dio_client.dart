import 'package:dio/dio.dart';
import 'package:image_search_app/data/remote/core/pretty_dio_logger.dart';

import 'dio_interceptors.dart';
import 'endpoints.dart';

class DioClient {
  final dio = createDio();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveTimeout: Endpoints.receiveTimeout,
      connectTimeout: Endpoints.connectionTimeout,
      sendTimeout: Endpoints.sendTimeout,
      responseType: ResponseType.json,
    ));

    dio.interceptors.addAll({
      DioInterceptors(dio: dio),
      PrettyDioLogger(),
    });

    return dio;
  }
}
