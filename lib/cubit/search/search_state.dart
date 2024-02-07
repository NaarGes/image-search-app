part of 'search_cubit.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchResult searchResult;

  const SearchLoaded({required this.searchResult});
}

class SearchError extends SearchState {
  final Exception exception;

  const SearchError({required this.exception});
}
