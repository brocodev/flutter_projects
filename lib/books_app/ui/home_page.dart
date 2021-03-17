import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_projects/books_app/models/book.dart';
import 'package:flutter_projects/books_app/ui/book_detail_page.dart';
import 'package:flutter_projects/books_app/ui/filter_page.dart';
import 'package:flutter_projects/books_app/ui/widgets/book_rate_stars.dart';
import 'package:flutter_projects/books_app/ui/widgets/book_readers_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  ValueNotifier<double> _scrollPercentNotifier;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollPercentNotifier = ValueNotifier(0.0);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _scrollPercentNotifier.value = (_scrollController.position.pixels /
            _scrollController.position.maxScrollExtent)
        .clamp(0.0, 1.0);
  }

  void _openPage(Widget page, BuildContext context, {bool opaque = false}) {
    final route = PageRouteBuilder(
      opaque: opaque,
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: page,
        );
      },
    );
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //----------------------------
      // APP BAR
      //----------------------------
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 2,
        title: const _HomeAppBar(),
        actions: [
          const SizedBox(width: 20),
          Center(
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(UserBook.currentUser.photoUrl),
            ),
          ),
          const SizedBox(width: 16)
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                const SizedBox(width: 16),
                //------------------------------------
                // FILTER BUTTON
                //------------------------------------
                InkWell(
                  onTap: () => _openPage(FilterPage(), context),
                  child: Hero(
                    tag: 'filter_background',
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2.0)),
                      child:
                          Icon(Icons.filter_alt_outlined, color: Colors.white),
                    ),
                  ),
                ),
                //----------------------------------
                // LIST CATEGORIES
                //----------------------------------
                Expanded(
                  child: ListView.builder(
                            itemCount: Book.bookCategories.length,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 10),
                            itemBuilder: (context, index) {
                              final category = Book.bookCategories[index];
                              return _ChipCategory(category: category);
                            },
                          )
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          //------------------------------
          // LIST HOME BOOKS
          //------------------------------
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: Book.books.length,
              itemExtent: MediaQuery.of(context).size.width * .65,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemBuilder: (context, index) {
                final book = Book.books[index];
                return InkWell(
                    onTap: () => _openPage(BookDetailPage(book: book), context,
                        opaque: true),
                    child: _HomeBookCard(book: book));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            //---------------------------
            // LIST SCROLL INDICATOR
            //---------------------------
            child: Stack(
              children: [
                const Divider(color: Color(0xFFeaeaea)),
                ValueListenableBuilder(
                  valueListenable: _scrollPercentNotifier,
                  builder: (context, value, child) {
                    return Align(
                      alignment: Alignment(ui.lerpDouble(-1.0, 1.0, value), 0),
                      child: child,
                    );
                  },
                  child: const SizedBox(
                    width: 50,
                    child: const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi ${UserBook.currentUser.name}',
        ),
        const SizedBox(height: 8.0),
        Text(
          'We recommended the following books for you',
          style: Theme.of(context).textTheme.subtitle2,
          maxLines: 2,
        )
      ],
    );
  }
}

class _HomeBookCard extends StatelessWidget {
  const _HomeBookCard({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Hero(
            tag: book.title,
            child: AspectRatio(
              aspectRatio: 10 / 14,
              child: Container(
                margin: const EdgeInsets.only(right: 40, bottom: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(book.srcImage),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(10, 10))
                    ]),
              ),
            ),
          ),
        ),
        Text(
          book.title,
          style: Theme.of(context).textTheme.subtitle1,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'By ${book.author}',
          style: Theme.of(context).textTheme.subtitle2.copyWith(height: 1.7),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: BookRateStars(
            rate: book.rate,
            heroTag: book.title,
          ),
        ),
        ReadersRow(readers: book.readers)
      ],
    );
  }
}

class _ChipCategory extends StatelessWidget {
  const _ChipCategory({
    Key key,
    @required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(color: Colors.grey[200]),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
