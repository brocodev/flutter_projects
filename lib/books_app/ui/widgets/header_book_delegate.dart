import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_projects/books_app/models/book.dart';
import 'package:flutter_projects/books_app/ui/open_book_page.dart';
import 'package:flutter_projects/books_app/ui/widgets/book_rate_stars.dart';
import 'package:flutter_projects/books_app/ui/widgets/book_readers_row.dart';

class HeaderBookDelegate extends SliverPersistentHeaderDelegate {
  final Book book;

  HeaderBookDelegate(this.book);

  ValueNotifier activeHeroOpenBookAnimation = ValueNotifier(false);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtent;
    return Stack(
      children: [
        //-------------------------------
        // BLUR BOOK BACKGROUND
        //-------------------------------
        Positioned.fill(
          bottom: 50,
          child: _BlurImageBackground(book: book, percent: percent),
        ),
        //--------------------------
        // CUSTOM APP BAR
        //--------------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color:
                            ColorTween(begin: Colors.white, end: Colors.black)
                                .transform(percent),
                        onPressed: () {
                          activeHeroOpenBookAnimation.value = false;
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      ReadersRow(readers: book.readers)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    //---------------------------
                    // BOOK IMAGE
                    //---------------------------
                    InkWell(
                      onTap: () => _openBook(context),
                      child: ValueListenableBuilder(
                        valueListenable: activeHeroOpenBookAnimation,
                        builder: (context, value, child) {
                          return Hero(
                              tag: book.title,
                              flightShuttleBuilder: value
                                  ? (_, animation, flightDirection, ___, ____) {
                                      return _flightShuttleBuilder(
                                          animation, flightDirection);
                                    }
                                  : null,
                              child: child);
                        },
                        child: AspectRatio(
                          aspectRatio: 10 / 16,
                          child: _CoverPageBook(srcImageBook: book.srcImage),
                        ),
                      ),
                    ),
                    //--------------------------
                    // BOOK INFORMATION
                    //--------------------------
                    const SizedBox(width: 20),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            book.title,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: ColorTween(
                                        begin: Colors.white,
                                        end: Colors.black,
                                      ).transform(percent),
                                      fontSize: ui.lerpDouble(22, 18, percent),
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'By ${book.author}',
                            style: TextStyle(
                                color: ColorTween(
                                  begin: Colors.white70,
                                  end: Colors.grey,
                                ).transform(percent),
                                fontSize: ui.lerpDouble(16, 14, percent),
                                height: 1.7),
                            maxLines: 1,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 50),
                            child: (percent <= 0.0)
                                ? _CategoryAndRate(book: book)
                                : SizedBox(height: 65 * (1 - percent)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50 * percent)
            ],
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 5.5;

  @override
  double get minExtent => kToolbarHeight * 4;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;

  _openBook(BuildContext context) async {
    activeHeroOpenBookAnimation.value = true;
    await Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          reverseTransitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: OpenBookPage(book: book),
            );
          },
        ));
  }

  _flightShuttleBuilder(
      Animation<double> animation, HeroFlightDirection flightDirection) {
    return Stack(
      fit: StackFit.expand,
      children: [
        HeroFlightDirection.push == flightDirection
            ? OpenBookPage(book: book)
            : Container(color: Colors.white),
        AnimatedBuilder(
            animation: animation,
            builder: (_, __) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(1.6 * animation.value),
                alignment: Alignment.centerLeft,
                child: _CoverPageBook(srcImageBook: book.srcImage),
              );
            }),
      ],
    );
  }
}

class _CoverPageBook extends StatelessWidget {
  const _CoverPageBook({
    Key key,
    @required this.srcImageBook,
  }) : super(key: key);

  final String srcImageBook;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(5, 5))
        ],
        image:
            DecorationImage(image: AssetImage(srcImageBook), fit: BoxFit.cover),
      ),
    );
  }
}

class _BlurImageBackground extends StatelessWidget {
  const _BlurImageBackground({
    Key key,
    @required this.book,
    @required this.percent,
  }) : super(key: key);

  final Book book;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(book.srcImage),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10 * percent,
                offset: Offset(0, 0))
          ]),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: ColorTween(begin: Colors.black26, end: Colors.white)
              .transform(percent),
        ),
      ),
    );
  }
}

class _CategoryAndRate extends StatelessWidget {
  const _CategoryAndRate({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.category,
          style: TextStyle(
            color: Colors.white70,
            height: 1.7,
          ),
          maxLines: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookRateStars(
            rate: book.rate,
            heroTag: book.title,
          ),
        ),
      ],
    );
  }
}
