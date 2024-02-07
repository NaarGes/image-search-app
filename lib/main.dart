import 'package:flutter/material.dart';
import 'package:image_search_app/app.dart';
import 'package:image_search_app/data/remote/core/dio_client.dart';
import 'package:image_search_app/data/remote/repository/search_repository.dart';
import 'package:image_search_app/util/app_router.dart';

void main() {
  _init();
  runApp(App(
    router: AppRouter(),
    searchRepository: SearchRepository(DioClient()),
  ));
}

void _init() {
  WidgetsFlutterBinding.ensureInitialized();
}
