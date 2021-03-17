import 'package:flutter/material.dart';
import 'package:flutter_projects/books_app/models/book.dart';

class OpenBookPage extends StatefulWidget {
  final Book book;

  const OpenBookPage({
    Key key,
    @required this.book,
  }) : super(key: key);

  @override
  _OpenBookPageState createState() => _OpenBookPageState();
}

class _OpenBookPageState extends State<OpenBookPage> {
  bool animate;

  @override
  void initState() {
    animate = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(kThemeChangeDuration);
      setState(() => animate = !animate);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: widget.book.title,
        child: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: animate
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CHAPTER 1',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              color: Colors.grey,
                              icon: Icon(Icons.close),
                              onPressed: () async {
                                // setState(() => animate = !animate);
                                // await Future.delayed(kThemeChangeDuration);
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        Text(
                          widget.book.title,
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
                                  widget.book.description,
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
