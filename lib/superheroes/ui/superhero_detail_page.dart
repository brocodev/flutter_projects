import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/superheroes/models/superhero.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperheroDetailPage extends StatefulWidget {
  final Superhero superhero;

  const SuperheroDetailPage({
    Key key,
    @required this.superhero,
  }) : super(key: key);

  @override
  _SuperheroDetailPageState createState() => _SuperheroDetailPageState();
}

class _SuperheroDetailPageState extends State<SuperheroDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _colorGradientValue;
  Animation<double> _whiteGradientValue;

  bool _changeToBlack;
  bool _enableInfoItems;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorGradientValue = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
          parent: _controller),
    );

    _whiteGradientValue = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          curve: Interval(0.1, 1.0, curve: Curves.fastOutSlowIn),
          parent: _controller),
    );

    _changeToBlack = false;
    _enableInfoItems = false;

    Future.delayed(const Duration(milliseconds: 600), () {
      _controller.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _changeToBlack = true;
        });
      });
    });

    _controller.addStatusListener(_statusListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _controller.dispose();
    super.dispose();
  }

  //----------------------------------------
  // Status Listener
  //----------------------------------------
  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed)
      setState(() {
        _enableInfoItems = true;
      });
  }

  //-----------------------
  // On Back Button Tap
  //-----------------------
  void _backButtonTap() async {
    setState(() {
      _enableInfoItems = false;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _changeToBlack = false;
      });
    });
    await _controller.reverse();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Stack(
        children: [
          //-------------------------
          // Animated Background
          //-------------------------
          Positioned.fill(
              child: Hero(
            tag: widget.superhero.heroName + "background",
            child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(widget.superhero.rawColor),
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          _colorGradientValue.value,
                          _whiteGradientValue.value
                        ],
                      ),
                    ),
                  );
                }),
          )),
          //----------------------
          // Items Body
          //----------------------
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------------
                // Superhero Image
                //---------------------
                SafeArea(
                  child: Hero(
                    tag: widget.superhero.pathImage,
                    child: Image.asset(
                      widget.superhero.pathImage,
                      height: size.height * .55,
                      width: size.width,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //--------------------------
                      // Superhero name
                      //--------------------------
                      Align(
                        heightFactor: .7,
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          child: Hero(
                            tag: widget.superhero.heroName,
                            child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              child: Text(
                                widget.superhero.heroName
                                    .replaceAll(' ', '\n')
                                    .toLowerCase(),
                              ),
                              style: textTheme.headline2.copyWith(
                                  color: _changeToBlack
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //---------------------------------------
                          // Superhero Secret Identity Name
                          //---------------------------------------
                          Hero(
                            tag: widget.superhero.name,
                            child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              child: Text(
                                widget.superhero.name.toLowerCase(),
                              ),
                              style: textTheme.headline5.copyWith(
                                  color: _changeToBlack
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                          //--------------------------
                          // Animated Marvel Logo
                          //--------------------------
                          TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                            tween: Tween(
                              begin: 0.0,
                              end: _enableInfoItems ? 1.0 : 0.0,
                            ),
                            child: Image.asset(
                              'assets/img/superheroes/marvel_logo.jpg',
                              height: 35,
                              width: 100,
                            ),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                          )
                        ],
                      ),
                      const Divider(height: 30),
                      //---------------------------------------
                      // Animated Superhero Description
                      //---------------------------------------
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            widget.superhero.description,
                            style: GoogleFonts.spartan(
                              color: Colors.grey[500],
                              height: 1.5,
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Divider(height: 30),
                      //----------------------------------
                      // Section Movies Title
                      //----------------------------------
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            'movies',
                            style: textTheme.headline5
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //----------------------------
                // Superhero movies list
                //----------------------------
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    itemCount: widget.superhero.movies.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final movie = widget.superhero.movies[index];
                      //---------------------------
                      // Animated Movie Card
                      //---------------------------
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 1000 + (300 * index)),
                        curve: Curves.elasticOut,
                        tween: Tween(
                          begin: 0.0,
                          end: _enableInfoItems ? 0.0 : 1.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(imageUrl: movie.urlImage),
                          ),
                        ),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 50 * value),
                            child: Opacity(
                                opacity: 1 - value.clamp(0.0, 1.0),
                                child: child),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          //-------------------------
          // Back Button
          //-------------------------
          Positioned(
            left: 20,
            top: 0,
            child: SafeArea(
              child: IconButton(
                onPressed: _backButtonTap,
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
