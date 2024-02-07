import 'package:flutter/material.dart';
import 'package:image_search_app/util/typedefs.dart';

class AppSearchBar extends StatelessWidget {
  final SearchBarSubmitCallback onSubmitted;
  final VoidCallback onTap;
  const AppSearchBar({super.key, required this.onSubmitted, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      hintText: 'Search Photos...',
      onSubmitted: onSubmitted,
      onTap: onTap
    );
  }
}
