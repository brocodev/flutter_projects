import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/bloc/categories_bloc.dart';
import 'package:flutter_projects/projects/bookstore_app/bloc/categories_bloc_provider.dart';
import 'package:flutter_projects/projects/bookstore_app/models/book.dart';

final kFavorites = UserBook.currentUser.favoriteCategories;

final kAllCategories = Book.bookCategories.where((element) {
  return !kFavorites!.contains(element);
}).toList();

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  late CategoriesBloc _categoriesBloc;
  bool _enableShowAnimation = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        _enableShowAnimation = true;
      });
    });
  }

  void onTapConfirm() {
    //_enableShowAnimation = false;
    setState(() {});
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _categoriesBloc = CategoriesBlocProvider.of(context)!.categoriesBloc;
    _categoriesBloc.eventsSink.add(null);
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Hero(
            tag: 'filters-background',
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: SizedBox.expand(
                child: ColoredBox(
                  color: Colors.blue[800]!.withOpacity(.7),
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 20,
            right: 20,
            top: 20,
            child: _FadeAndSlideTransition(
              enableAnimation: _enableShowAnimation,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //---------------------------------------
                    // CUSTOM APP BAR
                    //---------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Filter',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        InkWell(
                          onTap: onTapConfirm,
                          child: Text(
                            'Confirm',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //---------------------------------------
                    // FAVORITE CATEGORIES CHIPS
                    //---------------------------------------
                    Text(
                      'FAVORITE CATEGORIES',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 15),
                    StreamBuilder<List<String>>(
                      stream: _categoriesBloc.categoriesStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final list = snapshot.data;
                          return Wrap(
                            spacing: 12,
                            children:
                                List.generate(kFavorites!.length, (index) {
                              final category = kFavorites![index];
                              return _CategoryChip(
                                category: category,
                                isSelected: list!.contains(category),
                              );
                            }),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    //---------------------------------------
                    // ALL CATEGORIES CHIPS
                    //---------------------------------------
                    Text(
                      'ALL CATEGORIES',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 15),
                    StreamBuilder<List<String>>(
                      stream: _categoriesBloc.categoriesStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final list = snapshot.data;
                          return Wrap(
                            spacing: 12,
                            children:
                                List.generate(kAllCategories.length, (index) {
                              final category = kAllCategories[index];
                              return _CategoryChip(
                                category: category,
                                isSelected: list!.contains(category),
                              );
                            }),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FadeAndSlideTransition extends StatelessWidget {
  const _FadeAndSlideTransition({
    this.child,
    this.enableAnimation,
  });

  final Widget? child;
  final bool? enableAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.decelerate,
      switchOutCurve: Curves.decelerate,
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, .1),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: enableAnimation! ? child : const SizedBox(),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.category,
    this.isSelected,
  });

  final String category;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    final isSelectedNotifier = ValueNotifier<bool>(isSelected ?? false);
    final bloc = CategoriesBlocProvider.of(context)!.categoriesBloc;
    return Hero(
      tag: 'chip-$category',
      child: ValueListenableBuilder<bool>(
        valueListenable: isSelectedNotifier,
        builder: (context, bool value, _) {
          return Material(
            color: Colors.transparent,
            child: TextButton(
              onPressed: () {
                isSelectedNotifier.value = !isSelectedNotifier.value;
                if (isSelectedNotifier.value) {
                  bloc.eventsSink.add(AddCategoryEvent(category));
                } else {
                  bloc.eventsSink.add(RemoveCategoryEvent(category));
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: value ? Colors.white : Colors.white12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 12,
                  color: value ? Colors.blue[700] : Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
