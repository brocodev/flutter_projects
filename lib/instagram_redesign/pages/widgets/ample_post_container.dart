import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/like_button.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/page_indicators.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/rounded_border_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class AmplePostContainer extends StatefulWidget {
  const AmplePostContainer({
    Key key,
    @required this.post,
    this.borderRadius = const BorderRadius.vertical(top: Radius.circular(50)),
    this.height,
  }) : super(key: key);
  final IgPost post;
  final BorderRadiusGeometry borderRadius;
  final height;

  @override
  _AmplePostContainerState createState() => _AmplePostContainerState();
}

class _AmplePostContainerState extends State<AmplePostContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _scaleHeart;
  Animation _outOpacityHeart;
  final indexNotifier = ValueNotifier(0);

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _scaleHeart = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0.0, 0.75, curve: Curves.fastOutSlowIn),
        parent: _controller));
    _outOpacityHeart = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: _controller));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) _controller.reset();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final user = post.userPost;

    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: widget.height,
        child: GestureDetector(
          onDoubleTap: () {
            _controller.forward();
            setState(() {
              post.isLiked = !post.isLiked;
            });
          },
          child: Stack(
            children: [
              //--------------------------------------
              //------PAGE VIEW IMAGES POST
              //-------------------------------------
              ClipRRect(
                borderRadius: widget.borderRadius,
                child: PageView.builder(
                  onPageChanged: (value) => indexNotifier.value = value,
                  itemCount: post.photos.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: post.photos[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.white,
                            child: CupertinoActivityIndicator(
                              radius: 40,
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black45,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black.withOpacity(.7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 0.12, 0.75, .9]),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Positioned(
                top: 20,
                left: 25,
                right: 25,
                bottom: 14,
                child: Column(
                  children: [
                    //-------------------------------------
                    //---USER PHOTO AND PAGE INDICATORS
                    //------------------------------------
                    Row(
                      children: [
                        RoundedBorderImage(
                          imageUrl: user.photoUrl,
                          height: 45,
                          borderColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          user.username,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ValueListenableBuilder(
                            valueListenable: indexNotifier,
                            builder: (context, value, child) {
                              return PageIndicators(
                                currentIndex: value,
                                numberIndicators: post.photos.length,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    //---------------------------
                    //---LIKES AND COMMENTS
                    //---------------------------
                    Row(
                      children: [
                        LikeButton(
                          likes: post.likes,
                          isLiked: post.isLiked,
                          onTap: () {
                            setState(() {
                              post.isLiked = !post.isLiked;
                            });
                          },
                        ),
                        const SizedBox(width: 20),
                        Icon(FontAwesome5Solid.comment_dots,
                            color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          post.comments.length.toString(),
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Icon(FontAwesome.send, color: Colors.white),
                        const Spacer(),
                        Icon(FontAwesome.bookmark_o, color: Colors.white),
                      ],
                    ),
                    //------------------------------------------
                    //---USERS COMMENTS PHOTOS & DESCRIPTION
                    //------------------------------------------
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(3, (index) {
                        return Align(
                          widthFactor: .8,
                          child: RoundedBorderImage(
                            imageUrl: post.comments[index].user.photoUrl,
                            height: 30,
                            borderWidth: 1.5,
                          ),
                        );
                      })
                        ..add(const SizedBox(width: 20))
                        ..add(Flexible(
                            child: Text(
                          post.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )))
                        ..add(SizedBox(
                          height: 30,
                          child: FlatButton(
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: StadiumBorder(),
                            onPressed: () {},
                            child: Text(
                              "More",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                    )
                  ],
                ),
              ),

              //---------------------------------
              //--- ANIMATED HEART
              //---------------------------------
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return Opacity(
                        opacity: _outOpacityHeart.value,
                        child: SvgPicture.asset(
                          'assets/svg/instagram/heart_colored.svg',
                          height: 150 * _scaleHeart.value,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
