import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/models/book.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/screens/book_detail/open_book_page.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/widgets/widgets.dart';

class BookDetailHeader extends StatelessWidget {
  BookDetailHeader({super.key, this.percent, this.book});

  final double? percent;
  final Book? book;

  // [enableOpenBookAnimation]
  // Validation to not apply the custom hero when going to the feed screen
  final ValueNotifier<bool> enableOpenBookAnimation = ValueNotifier(false);

  //----------------------------------------
  // Open book reading
  //----------------------------------------
  Future<void> _openBook(BuildContext context) async {
    enableOpenBookAnimation.value = true;
    await Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: OpenBookPage(book: book),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //-------------------------------
        // Blur background
        //-------------------------------
        Positioned.fill(
          bottom: 50,
          child: _BlurBackground(book: book, percent: percent),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              //--------------------------
              // Custom AppBar
              //--------------------------
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color:
                            ColorTween(begin: Colors.white, end: Colors.black)
                                .transform(percent!),
                        onPressed: () {
                          enableOpenBookAnimation.value = false;
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      ReadersRow(readers: book!.readers)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    //---------------------------
                    // Cover book image
                    //---------------------------
                    InkWell(
                      onTap: () => _openBook(context),
                      child: Hero(
                        tag: book!.title!,
                        child: AspectRatio(
                          aspectRatio: .68,
                          child: CoverPageBook(srcImageBook: book!.srcImage),
                        ),
                      ),
                    ),
                    //--------------------------
                    // Book details
                    //--------------------------
                    const SizedBox(width: 20),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            book!.title!,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: ColorTween(
                                        begin: Colors.white,
                                        end: Colors.black,
                                      ).transform(percent!),
                                      fontSize: ui.lerpDouble(22, 18, percent!),
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'By ${book!.author}',
                            style: TextStyle(
                              color: ColorTween(
                                begin: Colors.white70,
                                end: Colors.grey,
                              ).transform(percent!),
                              fontSize: ui.lerpDouble(16, 14, percent!),
                              height: 1.7,
                            ),
                            maxLines: 1,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 50),
                            child: (percent! <= 0.0)
                                ? _CategoryAndRate(book: book)
                                : SizedBox(height: 65 * (1 - percent!)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50 * percent!)
            ],
          ),
        )
      ],
    );
  }
}

// Blur
class _BlurBackground extends StatelessWidget {
  const _BlurBackground({
    required this.book,
    required this.percent,
  });

  final Book? book;
  final double? percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(book!.srcImage!),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10 * percent!)
        ],
      ),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: ColoredBox(
          color: ColorTween(begin: Colors.black26, end: Colors.white)
              .transform(percent!)!,
        ),
      ),
    );
  }
}

class _CategoryAndRate extends StatelessWidget {
  const _CategoryAndRate({
    required this.book,
  });

  final Book? book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book!.category!,
          style: const TextStyle(
            color: Colors.white70,
            height: 1.7,
          ),
          maxLines: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookRateStars(
            rate: book!.rate!,
            heroTag: book!.title,
          ),
        ),
      ],
    );
  }
}

//----------------------------------------------------------------
// Custom Sliver Persistent Header
//----------------------------------------------------------------

class BookDetailHeaderDelegate extends SliverPersistentHeaderDelegate {
  BookDetailHeaderDelegate({
    this.maximumExtent = kToolbarHeight * 2,
    this.minimumExtent = kToolbarHeight,
    required this.childBuilder,
  });

  final Widget Function(double) childBuilder;
  final double maximumExtent;
  final double minimumExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final percent = shrinkOffset / maxExtent;
    return childBuilder(percent);
  }

  @override
  double get maxExtent => maximumExtent;

  @override
  double get minExtent => minimumExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
