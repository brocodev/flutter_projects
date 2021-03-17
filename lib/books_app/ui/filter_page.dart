import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/books_app/models/book.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = UserBook.currentUser.favoriteCategories;
    final allCategories = Book.bookCategories.where((element) {
      return !favorites.contains(element);
    }).toList();
    final hideWidgets = ValueNotifier(true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 600), () {
        hideWidgets.value = false;
      });
    });

    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        child: Hero(
          tag: 'filter_background',
          //------------------------------------
          // BLUE BLUR BACKGROUND
          //------------------------------------
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: Colors.blue[800].withOpacity(.8),
              padding: const EdgeInsets.all(16.0),
              child: ValueListenableBuilder(
                valueListenable: hideWidgets,
                builder: (context, value, child) {
                  //----------------------------------------
                  // BODY WIDGETS SHOW ANIMATION
                  //----------------------------------------
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.decelerate,
                    switchOutCurve: Curves.decelerate,
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween(
                          begin: Offset(0, .1),
                          end: Offset(0, 0),
                        ).animate(animation),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: value ? const SizedBox() : child,
                  );
                },
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
                            onTap: () {
                              hideWidgets.value = true;
                              Future.delayed(
                                const Duration(milliseconds: 400),
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            },
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
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(favorites.length, (index) {
                          final category = favorites[index];
                          return _FilterCategoryChip(
                            category: category,
                            isSelected: false,
                          );
                        }),
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
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(allCategories.length, (index) {
                          final category = allCategories[index];
                          return _FilterCategoryChip(
                            category: category,
                            isSelected: false,
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterCategoryChip extends StatelessWidget {
  const _FilterCategoryChip({
    Key key,
    @required this.category,
    @required this.isSelected,
  }) : super(key: key);

  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isSelectedNotifier = ValueNotifier(false);
    return InkWell(
      onTap: () {
        isSelectedNotifier.value = !isSelectedNotifier.value;
      },
      child: ValueListenableBuilder(
          valueListenable: isSelectedNotifier,
          builder: (context, value, _) {
            return AnimatedContainer(
              duration: kThemeChangeDuration,
              height: 40,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: value ? Colors.white : Colors.white12),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 12,
                  color: value ? Colors.blue[700] : Colors.white,
                ),
              ),
            );
          }),
    );
  }
}
