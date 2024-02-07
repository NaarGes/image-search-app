import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/data/remote/repository/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;

  SearchCubit({required this.searchRepository}) : super(SearchInitial());

  Future<void> search(String tag) async {
    try {
      emit(SearchLoading());
      final searchResults = await searchRepository.searchImages(tag);
      emit(SearchLoaded(searchResults: searchResults));
    } on DioException catch (e) {
      emit(SearchError(exception: e));
    } catch (e) {
      emit(SearchError(exception: Exception(e)));
      debugPrint(e.toString());
    }
  }
}
