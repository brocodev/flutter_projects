import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/ui/profile/widgets/profile_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramProfile extends StatelessWidget {
  const InstagramProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = IgUser.kevin;
    final instagramBloc = InstagramBlocProvider.of(context).instagramBloc;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      //--------------------------------
      //---- APP BAR PROFILE
      //--------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () => instagramBloc.showSettings(),
          icon: Icon(Feather.settings),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentUser.username,
              style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Theme.of(context).appBarTheme.iconTheme.color),
            ),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Feather.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //--------------------------------
            //---- HEADER IMAGE PROFILE
            //--------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IgTitleSubtitleText(
                  title: currentUser.following.toString(),
                  subtitle: "Following",
                  height: 2,
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
                const SizedBox(width: 20),
                Stack(
                  alignment: Alignment(.7, -.8),
                  children: [
                    _ImageProfile(imageProfileUrl: currentUser.photoUrl),
                  ],
                ),
                const SizedBox(width: 20),
                IgTitleSubtitleText(
                  title: (currentUser.followers / 1000)
                          .toString()
                          .substring(0, 4) +
                      "K",
                  subtitle: "Followers",
                  height: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
            const SizedBox(height: 10),
            //------------------------------
            //---- NAME AND TYPE USER
            //------------------------------
            Row(
              children: [
                Expanded(
                    child: Text(
                  currentUser.name,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                const SizedBox(width: 10),
                Text(
                  "|",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.3)),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                  currentUser.typeUser,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),

            //--------------------------
            //----PROFILE DESCRIPTION
            //--------------------------
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text:
                        'I like to travel and program different types of applications with Flutter, doctors me in my GitHub or Facebook like',
                    style: GoogleFonts.lato(color: Colors.grey),
                    children: [
                      TextSpan(
                          text: " @brocodev",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
            ),
            const SizedBox(height: 10),

            //-------------------------------
            //-----PROFILE OPTIONS BUTTONS
            //-------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final selectedIndex = 2;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FlatButton(
                      color: index == selectedIndex
                          ? Colors.lightBlue
                          : Colors.grey[100],
                      textColor: index == selectedIndex
                          ? Colors.white
                          : Colors.grey[800],
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {},
                      child: Text(
                        ["Edit profile", "Statistics", "Contact"][index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              })
                ..insert(0, const SizedBox(width: 10))
                ..add(const SizedBox(width: 10)),
            ),

            const SizedBox(height: 20),
            //--------------------------------
            //-----PROFILE CATEGORIES POSTS
            //--------------------------------
            SizedBox(
              height: 95,
              child: ListView.builder(
                itemCount: currentUser.collections.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final igCollection = currentUser.collections[index];
                  if (index == 0)
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: InstagramAddItem(itemSize: 70, label: 'New'),
                    );

                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedBorderImage(
                          imageUrl: igCollection.iconImage,
                          borderColor: Colors.transparent,
                          height: 70,
                        ),
                        Text(
                          igCollection.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            //----------------------------------
            //-----BOTTOM TAB LAYOUT
            //----------------------------------
            const Divider(height: 2),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: BottomTabViewProfile(user: currentUser),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageProfile extends StatelessWidget {
  const _ImageProfile({
    Key key,
    @required this.imageProfileUrl,
  }) : super(key: key);

  final String imageProfileUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child:
              RoundedGradientBorderImage(height: 80, imageUrl: imageProfileUrl),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purpleAccent,
                Colors.orangeAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.add,
            size: 18,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
