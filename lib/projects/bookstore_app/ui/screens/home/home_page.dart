import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/bloc/categories_bloc_provider.dart';
import 'package:flutter_projects/projects/bookstore_app/models/book.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/screens/book_detail/book_detail_page.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/screens/filters/filter_page.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/widgets/book_rate_stars.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/widgets/book_readers_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  late final ValueNotifier<double> _scrollPercentNotifier;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollPercentNotifier = ValueNotifier(0);
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CategoriesBlocProvider.of(context)!.categoriesBloc.eventsSink.add(null);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    _scrollPercentNotifier.value = (_scrollController.position.pixels /
            _scrollController.position.maxScrollExtent)
        .clamp(0.0, 1.0);
  }

  // Open the detail page of a book in the list.
  void _openPage(Widget page, BuildContext context, {bool opaque = false}) {
     CategoriesBlocProvider.of(context)!.categoriesBloc.eventsSink.add(null);
    final route = PageRouteBuilder<dynamic>(
      opaque: opaque,
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 600),
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
    final categoriesBloc = CategoriesBlocProvider.of(context)!.categoriesBloc;

    return Scaffold(
      //----------------------------
      // Home App Bar
      //----------------------------
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.6,
        title: const _HomeAppBar(),
        actions: [
          const SizedBox(width: 20),
          Center(
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(UserBook.currentUser.photoUrl!),
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
                // Categories Filter Button
                //------------------------------------
                InkWell(
                  onTap: () => _openPage(const FilterPage(), context),
                  child: Hero(
                    tag: 'filters-background',
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ),
                ),
                //----------------------------------
                // Book Categories List View
                //----------------------------------
                Expanded(
                  child: StreamBuilder<List<String>>(
                    stream: categoriesBloc.categoriesStream,
                    builder: (context, snapshot) {
                      return snapshot.connectionState != ConnectionState.waiting
                          ? ListView.builder(
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(left: 10),
                              itemBuilder: (context, index) {
                                final category = snapshot.data![index];
                                return _CategoryChip(category: category);
                              },
                            )
                          : const SizedBox();
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          //------------------------------
          // Books List View
          //------------------------------
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: Book.books.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemBuilder: (context, index) {
                final book = Book.books[index];
                return InkWell(
                  onTap: () => _openPage(
                    BookDetailPage(book: book),
                    context,
                    opaque: true,
                  ),
                  child: _HomeBookCard(book: book),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            //---------------------------
            // List Scroll Indicator
            //---------------------------
            child: Stack(
              children: [
                const Divider(color: Color(0xFFeaeaea)),
                ValueListenableBuilder<double>(
                  valueListenable: _scrollPercentNotifier,
                  builder: (context, double value, child) {
                    return Align(
                      alignment: Alignment(ui.lerpDouble(-1.0, 1.0, value)!, 0),
                      child: child,
                    );
                  },
                  child: const SizedBox(
                    width: 50,
                    child: Divider(
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
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi ${UserBook.currentUser.name}',
        ),
        const SizedBox(height: 8),
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
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Hero(
            tag: book.title!,
            child: AspectRatio(
              aspectRatio: .7,
              child: Container(
                margin: const EdgeInsets.only(right: 40, bottom: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.srcImage!),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(10, 10),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title!,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'By ${book.author}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(height: 1.7),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: BookRateStars(
            rate: book.rate!,
            heroTag: book.title,
          ),
        ),
        ReadersRow(readers: book.readers)
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Hero(
        tag: 'chip-$category',
        child: Material(
          color: Colors.transparent,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
                side: BorderSide(
                  color: Colors.grey[200]!,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
            ),
            child: FittedBox(
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
