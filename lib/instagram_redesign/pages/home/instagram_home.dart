import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_stories.dart';
import 'package:flutter_projects/instagram_redesign/pages/home/widgets/home_widgets.dart';
import 'package:flutter_projects/instagram_redesign/pages/post_detail/instagram_post_detail.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/ample_post_container.dart';
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
    _heightFactor = Tween(begin: 0.92, end: 1.0).animate(
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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomScrollView(
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
                          color: Theme.of(context).appBarTheme.iconTheme.color,
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
                  height: 100,
                  child: ListView.builder(
                    itemExtent: 85,
                    itemCount: IgStories.listUserStories.length + 1,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final itemSize = 75.0;
                      if ((index == 0)) {
                        return InstagramAddStory(itemSize: itemSize);
                      } else {
                        final stories =
                            IgStories.listUserStories[(index - 1)];
                        return InstagramStoriesItem(
                          itemSize: itemSize,
                          stories: stories,
                          onTap: () {},
                        );
                      }
                    },
                  ),
                ),
              ),

              //----------------------------------
              //---- INSTAGRAM POSTS SLIVER LIST
              //---------------------------------
              SliverToBoxAdapter(child: const SizedBox(height: 70)),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final post = IgPost.listPosts[index];
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor:
                          selectedIndex < index ? _heightFactor.value : .92,
                      child: child,
                    );
                  },
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      return _openDetails(context, post);
                    },
                    child: Hero(
                        tag: post.id,
                        child: AmplePostContainer(post: post, height: 600.0)),
                  ),
                );
              }, childCount: IgPost.listPosts.length)),
            ],
          ),

          //------------------------------
          //----HIDE SETTINGS CARD ZONE
          //------------------------------
          AnimatedBuilder(
            animation: instagramBloc,
            builder: (context, child) {
              return instagramBloc.settingState == SettingsSate.visible
                  ? child
                  : const SizedBox();
            },
            child: Positioned.fill(child: GestureDetector(
              onPanDown: (details) {
                instagramBloc.hideSettings();
              },
            )),
          ),

          //------------------------------
          //----SETTINGS BLUR CARD
          //------------------------------
          AnimatedBuilder(
            animation: instagramBloc,
            builder: (context, child) {
              return AnimatedPositioned(
                  duration: kThemeAnimationDuration,
                  top: instagramBloc.settingState == SettingsSate.visible
                      ? 0
                      : -210,
                  left: 0,
                  right: 0,
                  child: child);
            },
            child: Column(
              children: [
                SettingsBlurCard(
                  height: 210,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _openDetails(BuildContext context, IgPost post) async {
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
