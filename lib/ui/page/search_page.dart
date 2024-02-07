import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search_app/cubit/search/search_cubit.dart';
import 'package:image_search_app/data/remote/model/search_result.dart';
import 'package:image_search_app/ui/component/app_search_bar.dart';
import 'package:image_search_app/ui/component/loading.dart';
import 'package:image_search_app/ui/component/photo_tile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppSearchBar(
                onSubmitted: (String value) {
                  context.read<SearchCubit>().search(value);
                },
                onClear: () {
                  context.read<SearchCubit>().clear();
                },
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return _buildLoading(context);
                    } else if (state is SearchError) {
                      final error = state.exception;
                      return _buildError(error);
                    } else if (state is SearchLoaded) {
                      final SearchResult result = state.searchResult;
                      return _buildResultList(result);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const Loading();
  }

  Widget _buildError(Exception error) {
    return Center(
      child: Text('Error: ${error.toString()}!'),
    );
  }

  Widget _buildResultList(SearchResult result) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: result.photos?.photo?.map((photo) => PhotoTile(photo: photo)).toList() ?? [],
    );
  }
}
