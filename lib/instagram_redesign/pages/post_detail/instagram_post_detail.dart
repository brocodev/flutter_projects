import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/instagram_redesign/pages/post_detail/widgets/add_comment_text_field.dart';
import 'package:flutter_projects/instagram_redesign/pages/post_detail/widgets/comment_list_tile.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/ample_post_container.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/clean_post_container.dart';

class InstagramPostDetail extends StatelessWidget {
  final IgPost post;

  const InstagramPostDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final expandComments = ValueNotifier(false);
    final instagramBloc = InstagramBlocProvider.of(context).instagramBloc;

    return Scaffold(
      backgroundColor: instagramBloc.viewState == ViewState.clean
          ? null
          : Theme.of(context).colorScheme.onPrimary,
      //------------------------------
      //--- POST DETAIL APP BAR
      //------------------------------
      appBar: AppBar(
        backgroundColor: instagramBloc.viewState == ViewState.clean
            ? null
            : Theme.of(context).colorScheme.onPrimary,
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
          //----------------------
          //--- INSTAGRAM POST
          //----------------------
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: (screenHeight * .7) - 76,
            child: Hero(
              tag: post.id,
              child: (instagramBloc.viewState == ViewState.ample)
                  ? AmplePostContainer(
                      post: post,
                      borderRadius: BorderRadius.circular(50),
                    )
                  : CleanPostContainer(post: post),
            ),
          ),

          //----------------------
          //--- LIST COMMENTS
          //----------------------
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

          //-------------------------
          //--- EXPAND LIST BUTTON
          //-------------------------
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
          //----ADD COMMENT TEXT FIELD
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
