import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/photographers_app/models/post.dart';
import 'package:flutter_projects/projects/photographers_app/models/users.dart';
import 'package:flutter_projects/projects/photographers_app/theme/photo_app_colors.dart';
import 'package:flutter_projects/projects/photographers_app/ui/home/widgets/image_user_container.dart';
import 'package:flutter_projects/projects/photographers_app/ui/profile/photo_profile_page.dart';
import 'package:flutter_projects/projects/photographers_app/ui/widgets/photo_post_card.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoHomePage extends StatelessWidget {
  const PhotoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.scatter_plot),
        title: const Text(
          'Explore',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: const [
          Center(
            child: _SearchInput(),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.5),
        children: [
          const SizedBox(height: 20),
          //------------------------------------
          // Post Horizontal List View
          //------------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * .52,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: PhotoPost.listHomePost.length,
              itemBuilder: (context, index) {
                final post = PhotoPost.listHomePost[index];
                return PhotoPostCard(
                  post: post,
                  isInverted: index.isEven,
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //--------------------------------
                // Popular users Text
                //--------------------------------
                child: RichText(
                  text: TextSpan(
                    text: 'P',
                    style: GoogleFonts.philosopher(
                      color: PhotoAppColors.kDarkBlue,
                      fontSize: 20,
                      decoration: TextDecoration.overline,
                      decorationThickness: 2,
                      fontWeight: FontWeight.w600,
                    ),
                    children: const [
                      TextSpan(
                        text: 'opular Users',
                        style: TextStyle(decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
              ),
              //-------------------------------
              // Popular users List View
              //-------------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: PhotoUser.popularUsers.length,
                  itemBuilder: (context, index) {
                    final user = PhotoUser.popularUsers[index];
                    return PhotoUserCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (_) => PhotoProfilePage(user: user),
                          ),
                        );
                      },
                      user: user,
                      size: MediaQuery.of(context).size.height * .12,
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * .4,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          Text(
            'Search',
            style: GoogleFonts.lato(
              color: PhotoAppColors.kGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
