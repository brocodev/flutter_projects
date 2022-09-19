import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/footer_post.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/page_indicators.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/post_buttons.dart';

class CleanPostCard extends StatefulWidget {
  const CleanPostCard({
    super.key,
    this.post,
    this.height,
    this.onTap,
  });

  final IgPost? post;
  final double? height;
  final VoidCallback? onTap;

  @override
  CleanPostCardState createState() => CleanPostCardState();
}

class CleanPostCardState extends State<CleanPostCard>
    with SingleTickerProviderStateMixin {
  int indexPageView = 0;
  late AnimationController _controller;
  late Animation<double> _scaleHeart;
  late Animation<double> _outScaleHeart;

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) _controller.reset();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleHeart = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn),
        parent: _controller,
      ),
    );
    _outScaleHeart = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(0.6, 1, curve: Curves.easeInOutQuint),
        parent: _controller,
      ),
    );
    _controller.addStatusListener(_statusListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller
      ..removeStatusListener(_statusListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post!;
    final user = post.userPost!;
    return Material(
      color: Colors.transparent,
      child: Container(
        height: widget.height,
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            //-------------------------
            //-----HEADER POST
            //-------------------------
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(user.photoUrl!),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: user.name,
                      children: [
                        TextSpan(
                          text: '\n${user.username}',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.3),
                          ),
                        )
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                //-------------------------------
                //------MORE OPTION BUTTON
                //-------------------------------
                IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 10),
            //------------------------------
            //-----IMAGES PAGE VIEW POST
            //------------------------------
            Expanded(
              child: GestureDetector(
                onTap: widget.onTap,
                onDoubleTap: () {
                  setState(() {
                    post.isLiked = true;
                  });
                  _controller.forward();
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        //-------------------------
                        //-----PAGE VIEW
                        //-------------------------
                        PageView.builder(
                          onPageChanged: (value) => setState(() {
                            indexPageView = value;
                          }),
                          itemCount: post.photos!.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: post.photos![index],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        //-----------------------
                        //----INDICATORS
                        //-----------------------
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: PageIndicators(
                            currentIndex: indexPageView,
                            numberIndicators: post.photos!.length,
                          ),
                        ),
                        //-------------------------
                        //---ANIMATED HEART
                        //-------------------------
                        Center(
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, _) {
                              return Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 90 *
                                    _scaleHeart.value *
                                    _outScaleHeart.value,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //---------------------------------
            //------LIKE AND COMMENT BUTTONS
            //---------------------------------
            const SizedBox(height: 10),
            PostButtons(
              post: post,
              likeBackgroundColor: Theme.of(context).colorScheme.onPrimary,
              onTapLike: () => setState(() {
                post.isLiked = !post.isLiked!;
              }),
              colorItems:
                  Theme.of(context).colorScheme.onBackground.withOpacity(.8),
            ),
            const SizedBox(height: 10),
            //---------------------------------
            //------FOOTER WIDGETS
            //--------------------------------
            FooterPost(
              post: post,
              colorMoreButton:
                  Theme.of(context).colorScheme.onBackground.withOpacity(.1),
            )
          ],
        ),
      ),
    );
  }
}
