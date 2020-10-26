import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_user_stories.dart';
import 'package:flutter_projects/instagram_redesign/pages/home/widgets/home_widgets.dart';
import 'package:flutter_projects/instagram_redesign/pages/post_detail/instagram_post_detail.dart';
import 'package:flutter_projects/instagram_redesign/pages/story/instagram_stories.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/ample_post_container.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/clean_post_container.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InstagramHome extends StatefulWidget {
  const InstagramHome({
    Key key,
  }) : super(key: key);

  @override
  _InstagramHomeState createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightFactor;
  int selectedIndex = -1;

  @override
  void initState() {
    _controller =
        AnimationController(duration: kThemeAnimationDuration, vsync: this);
    _heightFactor = Tween(begin: 0.88, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context).instagramBloc;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnimatedBuilder(
          animation: instagramBloc,
          builder: (_, __) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                //-------------------------------
                //----INSTAGRAM SLIVER APP BAR
                //-------------------------------
                SliverAppBar(
                  leadingWidth: 80,
                  pinned: true,
                  toolbarHeight: 70,
                  leading: IconButton(
                    icon: Icon(Feather.settings),
                    onPressed: instagramBloc.showSettings,
                  ),
                  title: Text("Instagram"),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            color:
                                Theme.of(context).appBarTheme.iconTheme.color,
                            icon: Icon(Feather.mail),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 20,
                            child: RedDot(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //--------------------------------------------
                //--------STORIES ITEMS HORIZONTAL LIST
                //--------------------------------------------
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: screenHeight * .12,
                    child: ListView.builder(
                      itemExtent: screenHeight * .1,
                      itemCount: IgUserStories.listUserStories.length + 1,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        final itemSize =
                            MediaQuery.of(context).size.height * .09;
                        if ((index == 0)) {
                          return InstagramAddItem(
                            itemSize: itemSize,
                            label: 'My Story',
                          );
                        } else {
                          final stories =
                              IgUserStories.listUserStories[(index - 1)];
                          return InstagramStoriesItem(
                            itemSize: itemSize,
                            stories: stories,
                            onTap: () => _openStories(context, stories),
                          );
                        }
                      },
                    ),
                  ),
                ),

                //----------------------------------
                //---- INSTAGRAM POSTS SLIVER LIST
                //---------------------------------
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: instagramBloc.viewState == ViewState.ample
                      ? screenHeight * .09
                      : 20,
                )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final post = IgPost.listPosts[index];
                      final heightItem =
                          (screenHeight * .6).clamp(450.0, 550.0);
                      switch (instagramBloc.viewState) {
                        case ViewState.clean:
                          //-------------------------------
                          //----CLEAN VIEW
                          //-------------------------------
                          return Hero(
                            tag: post.id,
                            child: CleanPostContainer(
                              post: post,
                              height: heightItem,
                              onTap: () {
                                Navigator.push(context, PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: InstagramPostDetail(post: post),
                                    );
                                  },
                                ));
                              },
                            ),
                          );
                        default:
                          //------------------------------
                          //----AMPLE VIEW
                          //------------------------------
                          return AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) => Align(
                              alignment: Alignment.bottomCenter,
                              heightFactor: selectedIndex < index
                                  ? _heightFactor.value
                                  : .88,
                              child: child,
                            ),
                            child: Hero(
                                tag: post.id,
                                child: AmplePostContainer(
                                  post: post,
                                  onTap: () =>
                                      _openDetails(context, post, index),
                                  height: heightItem,
                                )),
                          );
                      }
                    },
                    childCount: IgPost.listPosts.length,
                  ),
                ),
              ],
            );
          }),
    );
  }

  _openStories(BuildContext context, IgUserStories stories) {
    Navigator.push(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: InstagramStories(
            stories: stories,
          ),
        );
      },
    ));
  }

  _openDetails(BuildContext context, IgPost post, int indexPost) async {
    setState(() {
      selectedIndex = indexPost;
    });
    _controller.forward();
    await Navigator.push(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: InstagramPostDetail(post: post),
        );
      },
    ));
    await Future.delayed(const Duration(milliseconds: 300));
    _controller.reverse();
  }
}
