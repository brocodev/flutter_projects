import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/models/models.dart';
import 'package:flutter_projects/photographers_app/ui/home/widgets/home_widgets.dart';
import 'package:flutter_projects/photographers_app/ui/profile/photo_app_profile.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.scatter_plot),
        title: Text("Explore",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        actions: [const Center(child: const SearchInput())],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.5),
        children: [
          const SizedBox(height: 20),
          //------------------------------------
          //-------HORIZONTAL POST LIST VIEW
          //------------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * .52,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: PhotoAppPost.listHomePost.length,
              itemBuilder: (context, index) {
                final post = PhotoAppPost.listHomePost[index];
                return PostContainer(
                  post: post,
                  isInverted: index.isEven,
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          //-------------------------------
          //-----POPULAR USER LIST
          //------------------------------
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //--------------------------------
                //------POPULAR USER TEXT
                //--------------------------------
                child: RichText(
                  text: TextSpan(
                      text: "P",
                      style: GoogleFonts.philosopher(
                        color: PhotoAppColors.kDarkBlue,
                        fontSize: 20,
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
              //----------------------------
              //-----LIST PHOTO USERS
              //-----------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: PhotoAppUser.popularUsers.length,
                  itemBuilder: (context, index) {
                    final user = PhotoAppUser.popularUsers[index];
                    return ImageUserContainer(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PhotoAppProfile(user: user),
                            ));
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
