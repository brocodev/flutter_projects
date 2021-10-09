import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/bookstore_app/bloc/categories_bloc.dart';

class CategoriesBlocProvider extends InheritedWidget {
  const CategoriesBlocProvider({
    Key? key,
    required this.categoriesBloc,
    required Widget child,
  }) : super(key: key, child: child);

  final CategoriesBloc categoriesBloc;

  static CategoriesBlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CategoriesBlocProvider>();
  }

  @override
  bool updateShouldNotify(CategoriesBlocProvider oldWidget) => true;
}
