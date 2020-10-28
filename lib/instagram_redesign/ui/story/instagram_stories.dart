import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_user_stories.dart';
import 'package:flutter_projects/instagram_redesign/ui/story/widgets/stories_widgets.dart';

class InstagramStories extends StatefulWidget {
  final IgUserStories stories;
  const InstagramStories({Key key, this.stories}) : super(key: key);

  @override
  _InstagramStoriesState createState() => _InstagramStoriesState();
}

class _InstagramStoriesState extends State<InstagramStories>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  AnimationController _animationController;
  int _currentStory = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .9999);
    _animationController = AnimationController(vsync: this);
    //-----------------------------
    //---SHOW FIRST USER STORY
    //-----------------------------
    _showStory(widget.stories.listStories[_currentStory]);
    _animationController.addStatusListener(_statusListener);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_statusListener);
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  //-----------------------------
  //-----STATUS LISTENER
  //-----------------------------
  _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _nextStory();
    }
  }

  //----------------------------------
  //-----SHOW NEW STORY
  //----------------------------------
  _showStory(StoryModel story) {
    _animationController.reset();
    _animationController.duration = story.duration;
    _animationController.forward();
  }

  //--------------------------------
  //-----OPEN STORY
  //--------------------------------
  _openUserStories(int index) {
    Navigator.pushReplacement(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: InstagramStories(
            stories: IgUserStories.listUserStories[index],
          ),
        );
      },
    ));
  }

  //---------------------------------
  //----PREVIOUS STORY
  //---------------------------------
  void _previousStory() {
    if (_currentStory > 0) {
      setState(() {
        _currentStory--;
      });
      _pageController.previousPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutQuint);
      _showStory(widget.stories.listStories[_currentStory]);
    } else {
      if (widget.stories.indexStory > 0) {
        _openUserStories(widget.stories.indexStory - 1);
      }
    }
  }

  //---------------------------------
  //----NEXT STORY
  //---------------------------------
  void _nextStory() {
    if (_currentStory < (widget.stories.listStories.length - 1)) {
      setState(() {
        _currentStory++;
      });
      _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutQuint);
      _showStory(widget.stories.listStories[_currentStory]);
    } else {
      if (widget.stories.indexStory <
          (IgUserStories.listUserStories.length - 1)) {
        _openUserStories(widget.stories.indexStory + 1);
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final listStories = widget.stories.listStories;
    final user = widget.stories.instagramUser;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
      body: OverflowBox(
        alignment: Alignment.bottomCenter,
        maxHeight: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            //---------------------------------
            //------USER GESTURES DETECTOR
            //---------------------------------
            GestureDetector(
              onTapDown: (details) {
                if (details.globalPosition.dx < screenWidth / 2) {
                  _previousStory();
                } else {
                  _nextStory();
                }
              },
              //---------------------------------
              //----PAGE VIEW IMAGES STORIES
              //----------------------------------
              child: PageView.builder(
                controller: _pageController,
                itemCount: listStories.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final storyModel = listStories[index];
                  return CachedNetworkImage(
                    imageUrl: storyModel.imageUrl,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  //----------------------------
                  //-----STORIES VIEW INDICATORS
                  //---------------------------
                  Row(
                    children: List.generate(
                      listStories.length,
                      (index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: AnimatedLine(
                              index: index,
                              selectedIndex: _currentStory,
                              animationController: _animationController,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //-----------------------------------------------
                  //----USER PHOTO, NAME AND CLOSE BUTTON
                  //-----------------------------------------------
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      //-------PHOTO
                      RoundedBorderImage(
                        imageUrl: user.photoUrl,
                        height: 40,
                        borderWidth: 0,
                      ),
                      const SizedBox(width: 10),
                      //------NAME
                      Expanded(
                        child: Text(
                          user.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //------CLOSE BUTTON
                      IconBlurButton(
                        onTap: () => Navigator.pop(context),
                        iconData: Icons.close,
                        size: 35,
                      )
                    ],
                  ),
                  const Spacer(),
                  //----------------------------------
                  //-----SEND MESSAGE INPUT
                  //----------------------------------
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0),
                            child: SendMessageTextField(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconBlurButton(
                        size: 60,
                        onTap: () {},
                        iconData: Icons.send,
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
