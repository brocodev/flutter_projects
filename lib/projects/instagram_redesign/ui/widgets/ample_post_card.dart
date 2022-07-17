import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/footer_post.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/page_indicators.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/post_buttons.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/rounded_border_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AmplePostCard extends StatefulWidget {
  const AmplePostCard({
    super.key,
    required this.post,
    this.borderRadius = const BorderRadius.vertical(top: Radius.circular(50)),
    this.height,
    this.onTap,
  });
  final IgPost post;
  final BorderRadiusGeometry borderRadius;
  final double? height;
  final VoidCallback? onTap;

  @override
  AmplePostCardState createState() => AmplePostCardState();
}

class AmplePostCardState extends State<AmplePostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double> _scaleHeart;
  late Animation<double> _outOpacityHeart;
  final _indexNotifier = ValueNotifier(0);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleHeart = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: const Interval(0, 0.75, curve: Curves.fastOutSlowIn),
        parent: _controller!,
      ),
    );
    _outOpacityHeart = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(0.5, 1, curve: Curves.fastOutSlowIn),
        parent: _controller!,
      ),
    );
    _controller!.addStatusListener(_statusListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!
      ..removeStatusListener(_statusListener)
      ..dispose();
    super.dispose();
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) _controller!.reset();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final user = post.userPost!;

    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: widget.height,
        child: GestureDetector(
          onTap: widget.onTap,
          onDoubleTap: () {
            _controller!.forward();
            setState(() {
              post.isLiked = !post.isLiked!;
            });
          },
          child: Stack(
            children: [
              //--------------------------------------
              //------PAGE VIEW IMAGES POST
              //-------------------------------------
              ClipRRect(
                borderRadius: widget.borderRadius as BorderRadius?,
                child: PageView.builder(
                  onPageChanged: (value) => _indexNotifier.value = value,
                  itemCount: post.photos!.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.white),
                          //-----------------------
                          //-------IMAGES
                          //-----------------------
                          child: CachedNetworkImage(
                            imageUrl: post.photos![index],
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(radius: 40),
                          ),
                        ),
                        //-----------------------
                        // SHADER IMAGES
                        //-----------------------
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
                              stops: const [0.0, 0.12, 0.75, .9],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              //------------------------------------
              //---USER PHOTO AND PAGE INDICATORS
              //------------------------------------
              Positioned(
                top: 20,
                left: 25,
                right: 25,
                bottom: 14,
                child: Column(
                  children: [
                    Row(
                      children: [
                        //-------------------------
                        //------USER PHOTO
                        //-------------------------
                        RoundedBorderImage(
                          imageUrl: user.photoUrl,
                          height: 40,
                          borderColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          user.username!,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        //---------------------------
                        //-----PAGE INDICATORS
                        //---------------------------
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ValueListenableBuilder<int>(
                            valueListenable: _indexNotifier,
                            builder: (context, value, child) {
                              return PageIndicators(
                                currentIndex: value,
                                numberIndicators: post.photos!.length,
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
                    PostButtons(
                      post: post,
                      onTapLike: () {
                        setState(() {
                          post.isLiked = !post.isLiked!;
                        });
                      },
                    ),
                    //------------------------------------------
                    //---USERS COMMENTS PHOTOS & DESCRIPTION
                    //------------------------------------------
                    SizedBox(height: MediaQuery.of(context).size.height * .03),
                    FooterPost(
                      post: post,
                      colorMoreText: Colors.black,
                      colorDescription: Colors.white,
                    )
                  ],
                ),
              ),

              //---------------------------------
              //--- ANIMATED HEART
              //---------------------------------
              Align(
                child: AnimatedBuilder(
                  animation: _controller!,
                  builder: (context, _) {
                    return Opacity(
                      opacity: _outOpacityHeart.value,
                      child: SvgPicture.asset(
                        'assets/svg/instagram/heart_colored.svg',
                        height: 150 * _scaleHeart.value,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
