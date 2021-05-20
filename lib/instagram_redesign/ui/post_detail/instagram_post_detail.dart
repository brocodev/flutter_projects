import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/ui/post_detail/widgets/detail_widgets.dart';

class InstagramPostDetail extends StatelessWidget {
  const InstagramPostDetail({
    Key key,
    @required this.post,
    @required this.postCard,
  }) : super(key: key);

  final IgPost post;
  final Widget postCard;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final expandComments = ValueNotifier(false);
    final instagramBloc = InstagramBlocProvider.of(context).instagramBloc;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //------------------------------
      // Post Detail App Bar
      //------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).colorScheme.onBackground,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Theme.of(context).colorScheme.onBackground,
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: [
          //-----------------------------------
          // Instagram Post
          //-----------------------------------
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: (screenHeight * .7) - 76,
            child: Hero(
              tag: post.id,
              child: postCard
            ),
          ),

          //-----------------------------------
          // Comments List View
          //-----------------------------------
          ValueListenableBuilder(
            valueListenable: expandComments,
            builder: (context, value, child) {
              return AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  top: (screenHeight * (value ? 0.12 : 0.7)) - 76,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: child);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Theme.of(context).colorScheme.onPrimary,
                  boxShadow: [
                    if (instagramBloc.viewState == ViewState.clean)
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.06),
                          blurRadius: 10,
                          offset: Offset(0, -5))
                  ]),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemCount: post.comments.length,
                itemExtent: 60,
                itemBuilder: (context, index) {
                  final comment = post.comments[index];
                  return CommentListTile(comment: comment);
                },
              ),
            ),
          ),

          //-----------------------------------
          // Expand Comments Button
          //-----------------------------------
          ValueListenableBuilder(
            valueListenable: expandComments,
            builder: (context, value, _) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                top: (screenHeight * (value ? .08 : 0.7)) - 76,
                left: 0,
                right: 0,
                child: IconButton(
                  iconSize: 30,
                  onPressed: () => expandComments.value = !expandComments.value,
                  icon: Icon(value
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up),
                ),
              );
            },
          ),

          //----------------------------------
          // Add comment text field
          //----------------------------------
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                    )
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: AddCommentTextField(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
