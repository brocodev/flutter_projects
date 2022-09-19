import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/home/widgets/widgets.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/screens/post_detail/instagram_post_detail.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/screens/story/instagram_stories.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InstagramHome extends StatefulWidget {
  const InstagramHome({
    super.key,
  });

  @override
  InstagramHomeState createState() => InstagramHomeState();
}

class InstagramHomeState extends State<InstagramHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  int selectedIndexPost = -1;

  @override
  void initState() {
    _controller =
        AnimationController(duration: kThemeAnimationDuration, vsync: this);
    _heightFactor = Tween<double>(begin: 0.88, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openStories(BuildContext context, IgUserStories stories) {
    Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: InstagramStories(
              stories: stories,
            ),
          );
        },
      ),
    );
  }

  Future<void> _openDetailsFromAmpleView(
    BuildContext context,
    IgPost post,
    int indexPost,
  ) async {
    setState(() {
      selectedIndexPost = indexPost;
    });
    _controller.forward();
    await Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: InstagramPostDetail(post: post),
          );
        },
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context)!.instagramBloc;
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
              // Instagram Sliver App Bar
              //-------------------------------
              SliverAppBar(
                leadingWidth: 80,
                pinned: true,
                toolbarHeight: 70,
                leading: IconButton(
                  icon: const Icon(Feather.settings),
                  onPressed: instagramBloc.showSettings,
                ),
                title: const Text('Instagram'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          color: Theme.of(context).appBarTheme.iconTheme!.color,
                          icon: const Icon(Feather.mail),
                        ),
                        const Positioned(
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
              // Friend Stories Horizontal List View
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
                      final itemSize = MediaQuery.of(context).size.height * .09;
                      if (index == 0) {
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
              // Friend Posts List View
              //---------------------------------
              SliverToBoxAdapter(
                child: SizedBox(
                  height: instagramBloc.viewState == ViewState.ample
                      ? screenHeight * .09
                      : 20,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final post = IgPost.listPosts[index];
                    final num heightItem =
                        (screenHeight * .6).clamp(450.0, 550.0);
                    switch (instagramBloc.viewState) {
                      case ViewState.clean:
                        //-------------------------------
                        // Clean Post Card
                        //-------------------------------
                        return Hero(
                          tag: post.id!,
                          child: CleanPostCard(
                            post: post,
                            height: heightItem as double?,
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder<dynamic>(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: InstagramPostDetail(post: post),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      case ViewState.ample:
                      case ViewState.old:
                        //------------------------------
                        // Ample Post Card
                        //------------------------------
                        return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) => Align(
                            alignment: Alignment.bottomCenter,
                            heightFactor: selectedIndexPost < index
                                ? _heightFactor.value
                                : .88,
                            child: child,
                          ),
                          child: Hero(
                            tag: post.id!,
                            child: AmplePostCard(
                              post: post,
                              onTap: () => _openDetailsFromAmpleView(
                                context,
                                post,
                                index,
                              ),
                              height: heightItem as double?,
                            ),
                          ),
                        );
                    }
                  },
                  childCount: IgPost.listPosts.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
