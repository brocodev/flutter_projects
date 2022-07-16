import 'dart:async';

class CategoriesBloc {
  CategoriesBloc() {
    _eventsStreamCtrl.stream.listen(mapEventToState);
  }

  final List<String> _listCategories = [
    'Food',
    'Fiction',
    'Drama',
    'Art',
    'Programming',
    'Astrology',
    'Biology',
  ];

  final StreamController<List<String>> _categoriesStreamCtrl =
      StreamController<List<String>>.broadcast();

  final StreamController<CategoriesEvent?> _eventsStreamCtrl =
      StreamController<CategoriesEvent?>.broadcast();

  Stream<List<String>> get categoriesStream => _categoriesStreamCtrl.stream;

  Sink<CategoriesEvent?> get eventsSink => _eventsStreamCtrl.sink;

  Future<void> mapEventToState(CategoriesEvent? event) async {
    if (event is AddCategoryEvent) {
      _listCategories.add(event.category);
    }
    if (event is RemoveCategoryEvent) {
      _listCategories.remove(event.category);
    }
    _categoriesStreamCtrl.add(_listCategories);
  }

  void dispose() {
    _categoriesStreamCtrl.close();
    _eventsStreamCtrl.close();
  }
}

abstract class CategoriesEvent {
  const CategoriesEvent(this.category);

  final String category;
}

class AddCategoryEvent extends CategoriesEvent {
  AddCategoryEvent(super.category);
}

class RemoveCategoryEvent extends CategoriesEvent {
  RemoveCategoryEvent(super.category);
}
