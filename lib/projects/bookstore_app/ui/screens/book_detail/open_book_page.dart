import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/models/book.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/widgets/cover_page_book.dart';

class OpenBookPage extends StatefulWidget {
  const OpenBookPage({
    super.key,
    required this.book,
  });

  final Book? book;

  @override
  OpenBookPageState createState() => OpenBookPageState();
}

class OpenBookPageState extends State<OpenBookPage> {
  late bool animate;

  @override
  void initState() {
    animate = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      return Future.delayed(
        kThemeChangeDuration,
        () => setState(() => animate = !animate),
      );
    });
    super.initState();
  }

  //---------------------------------------------------
  // Customized Flight Hero
  // Modify the hero animation during the transition.
  //---------------------------------------------------
  Widget _customFlightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection direction,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (HeroFlightDirection.push == direction)
          OpenBookPage(book: widget.book)
        else
          const ColoredBox(color: Colors.white),
        AnimatedBuilder(
          animation: animation,
          builder: (_, __) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(1.6 * animation.value),
              alignment: Alignment.centerLeft,
              child: CoverPageBook(srcImageBook: widget.book!.srcImage),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: widget.book!.title!,
        flightShuttleBuilder: _customFlightShuttleBuilder,
        child: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: animate
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'CHAPTER 1',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              color: Colors.grey,
                              icon: const Icon(Icons.close),
                              onPressed: () async {
                                // setState(() => animate = !animate);
                                // await Future.delayed(kThemeChangeDuration);
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        Text(
                          widget.book!.title!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey[800],
                            height: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  widget.book!.description!,
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
