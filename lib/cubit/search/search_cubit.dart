import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/data/remote/model/search_result.dart';
import 'package:image_search_app/data/remote/repository/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;

  SearchCubit({required this.searchRepository}) : super(SearchInitial());

  Future<void> search(String tag) async {
    try {
      emit(SearchLoading());
      final searchResult = await searchRepository.searchImages(tag);
      emit(SearchLoaded(searchResult: searchResult));
    } on DioException catch (e) {
      emit(SearchError(exception: e));
    } catch (e) {
      emit(SearchError(exception: Exception(e)));
      debugPrint(e.toString());
    }
  }

  void clear() {
    emit(SearchInitial());
  }
}
