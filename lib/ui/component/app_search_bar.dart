import 'package:flutter/material.dart';
import 'package:image_search_app/util/typedefs.dart';

class AppSearchBar extends StatefulWidget {
  final SearchBarSubmitCallback onSubmitted;
  final VoidCallback onClear;

  const AppSearchBar({super.key, required this.onSubmitted, required this.onClear});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late SearchController controller;

  @override
  void initState() {
    super.initState();
    controller = SearchController();
    controller.addListener(() {
      if (controller.text.isEmpty) widget.onClear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      leading: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      trailing: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            widget.onClear();
            controller.clear();
          },
        ),
      ],
      hintText: 'Search Photos...',
      onSubmitted: widget.onSubmitted,
    );
  }
}
