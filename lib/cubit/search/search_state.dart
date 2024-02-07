part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<dynamic> searchResults;

  const SearchLoaded({required this.searchResults});

  @override
  List<Object> get props => [searchResults];
}

class SearchError extends SearchState {
  final Exception exception;

  const SearchError({required this.exception});

  @override
  List<Object> get props => [exception];
}
