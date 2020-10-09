import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/models/post.dart';
import 'package:flutter_projects/photographers_app/models/users.dart';
import 'package:flutter_projects/photographers_app/pages/home/widgets/image_user_container.dart';
import 'package:flutter_projects/photographers_app/pages/home/widgets/post_container.dart';
import 'package:flutter_projects/photographers_app/pages/home/widgets/search_input.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePhotoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.scatter_plot),
        title: Text("Explore",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        actions: [Center(child: SearchInput())],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            flex: 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: Post.listHomePost.length,
              itemBuilder: (context, index) {
                final post = Post.listHomePost[index];
                return PostContainer(
                  post: post,
                  isInverted: index.isEven,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                        text: "P",
                        style: GoogleFonts.philosopher(
                          color: PhotoAppColors.kDarkBlue,
                          fontSize: 24,
                          decoration: TextDecoration.overline,
                          decorationThickness: 2,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: "opular Users",
                            style: TextStyle(decoration: TextDecoration.none),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: User.popularUsers.length,
                    itemBuilder: (context, index) {
                      final user = User.popularUsers[index];
                      return ImageUserContainer(user: user);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
