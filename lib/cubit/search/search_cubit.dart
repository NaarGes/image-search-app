import 'package:bloc/bloc.dart';
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
      searchRepository.searchImages(tag).then((searchResults) {
        emit(SearchLoaded(searchResults: searchResults));
      });
      // TODO handle DioExceptions
    } on Exception catch (e) {
      emit(SearchError(exception: e));
    } catch (e) {
      // TODO emit new state
      debugPrint(e.toString());
    }
  }
}
