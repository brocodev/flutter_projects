import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/pages/home/home_photo_app.dart';
import 'package:flutter_projects/photographers_app/pages/profile/photo_app_profile.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotographersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF4F3F3),
        appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light,
            textTheme: GoogleFonts.philosopherTextTheme()
                .apply(bodyColor: PhotoAppColors.kDarkBlue),
            iconTheme: IconThemeData(color: PhotoAppColors.kDarkBlue)),
        textTheme: GoogleFonts.philosopherTextTheme().apply(
          bodyColor: PhotoAppColors.kDarkBlue,
          displayColor: PhotoAppColors.kDarkBlue,
        ),
        iconTheme: IconThemeData(color: PhotoAppColors.kDarkBlue),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPagePhotoApp(),
    );
  }
}

class MainPagePhotoApp extends StatelessWidget {
  final indexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, value, child) {
          return AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            child: value == 0
                ? HomePhotoApp()
                : value == 3
                    ? PhotoAppProfile()
                    : HomePhotoApp(),
          );
        },
      ),
      bottomNavigationBar: ClipPath(
        clipper: _CurvedClipper(),
        child: Container(
          alignment: Alignment(0, 1),
          height: kToolbarHeight * 1.5,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ValueListenableBuilder(
            valueListenable: indexNotifier,
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: (index == 0 || index == 3) ? 10 : 0),
                    child: IconButton(
                      onPressed: () => indexNotifier.value = index,
                      iconSize: 20,
                      color: index == indexNotifier.value
                          ? PhotoAppColors.kDarkBlue
                          : PhotoAppColors.kGrey,
                      icon: Icon([
                        Icons.widgets,
                        FontAwesomeIcons.solidCommentDots,
                        Icons.favorite,
                        Icons.person,
                      ][index]),
                    ),
                  );
                })
                  ..insert(2, const SizedBox()),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.translate(
        offset: Offset(0, 30),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Icon(Icons.add, size: 32),
        ),
      ),
    );
  }
}

class _CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..quadraticBezierTo(size.width * .5, kToolbarHeight, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
