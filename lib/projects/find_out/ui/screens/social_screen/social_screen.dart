import 'package:flutter/material.dart';
import 'package:flutter_projects/core/shared/ui/animations/tween_animations.dart';
import 'package:flutter_projects/projects/find_out/models/comments.dart';
import 'package:flutter_projects/projects/find_out/models/place.dart';
import 'package:flutter_projects/projects/find_out/ui/screens/social_screen/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key, required this.place});

  final Place place;

  TextStyle get _sectionStyle {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
      height: 2,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  Widget build(BuildContext context) {
    final indexImageBackground = ValueNotifier(0);
    final size = MediaQuery.of(context).size;
    final heightBackPageView = size.height * .35;
    final infoVisibleNotifier = ValueNotifier(false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 800), () {
        infoVisibleNotifier.value = true;
      });
    });
    final listComments = Comment.defaultListComment;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: SocialScreenHeader(
              heightBackPageView: heightBackPageView,
              place: place,
              indexImageBackground: indexImageBackground,
              infoVisibleNotifier: infoVisibleNotifier,
            ),
          ),
          SliverToBoxAdapter(
            child: TranslateAnimation(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Fotos de turistas', style: _sectionStyle),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TranslateAnimation(
              child: SizedBox(
                height: size.height * .12,
                child: TouristPhotosView(size: size),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TranslateAnimation(
              duration: const Duration(milliseconds: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text('Comentarios', style: _sectionStyle),
              ),
            ),
          ),
        ],
        body: TranslateAnimation(
          duration: const Duration(milliseconds: 1000),
          child: _CommentsStaggeredView(listComments: listComments),
        ),
      ),
      extendBody: true,
      floatingActionButton: const _PlusFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class TouristPhotosView extends StatelessWidget {
  const TouristPhotosView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: size.width * .25,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final i = index % 3;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/img/findout/friends${i + 1}.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class _CommentsStaggeredView extends StatelessWidget {
  const _CommentsStaggeredView({
    required this.listComments,
  });

  final List<Comment> listComments;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
      itemCount: listComments.length,
      itemBuilder: (_, index) => CommentCard(comment: listComments[index]),
      staggeredTileBuilder: (index) => StaggeredTile.count(
        2,
        listComments[index].photoCommentUrl == null ? 2.3 : 2.8,
      ),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );
  }
}

class _PlusFAB extends StatelessWidget {
  const _PlusFAB();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      width: kToolbarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kToolbarHeight),
        gradient: LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.pinkAccent[100]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withOpacity(.6),
            blurRadius: 10,
          )
        ],
      ),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
