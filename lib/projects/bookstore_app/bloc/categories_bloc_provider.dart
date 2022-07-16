import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/projects/bookstore_app/bloc/categories_bloc.dart';

class CategoriesBlocProvider extends InheritedWidget {
  const CategoriesBlocProvider({
    super.key,
    required this.categoriesBloc,
    required super.child,
  });

  final CategoriesBloc categoriesBloc;

  static CategoriesBlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CategoriesBlocProvider>();
  }

  @override
  bool updateShouldNotify(CategoriesBlocProvider oldWidget) => true;
}
