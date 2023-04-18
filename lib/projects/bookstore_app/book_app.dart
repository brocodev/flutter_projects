import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/bloc/categories_bloc.dart';
import 'package:flutter_projects/projects/bookstore_app/bloc/categories_bloc_provider.dart';
import 'package:flutter_projects/projects/bookstore_app/theme/theme.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/screens/navigation/book_navigation_screen.dart';

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBlocProvider(
      categoriesBloc: CategoriesBloc(),
      child: MaterialApp(
        theme: BookAppTheme.themeData,
        home: const BookNavigationScreen(),
      ),
    );
  }
}
