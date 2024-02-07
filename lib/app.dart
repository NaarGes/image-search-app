
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search_app/cubit/search/search_cubit.dart';
import 'package:image_search_app/data/remote/repository/search_repository.dart';
import 'package:image_search_app/ui/page/search_page.dart';
import 'package:image_search_app/util/app_router.dart';
import 'package:image_search_app/util/theme.dart';

class App extends StatelessWidget {
  final AppRouter router;
  final SearchRepository searchRepository;
  const App({super.key, required this.router, required this.searchRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.onGenerateRoute,
      themeMode: ThemeMode.light,
      theme: Themes.lightThemeBuilder(context),
      darkTheme: Themes.darkThemeBuilder(context),
      home: BlocProvider<SearchCubit>(
        create: (context) => SearchCubit(searchRepository: searchRepository),
        child: const SearchPage(),
      ),
    );
  }
}
