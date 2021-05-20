import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_projects/photographers_app/models/users.dart';
import 'package:flutter_projects/photographers_app/ui/clippers/tile_skew_clipper.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoProfilePage extends StatelessWidget {
  final PhotoUser user;

  const PhotoProfilePage({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUser = user.photoUrl;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz, size: 30),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          //----------------------------------
          // User Header Profile
          //----------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TitleSubtitleText(
                title: user.following.toString(),
                subtitle: "Following",
                height: 2,
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
              Stack(
                alignment: Alignment(.7, -.8),
                children: [
                  _ImageProfile(imageUser: imageUser),
                  const _GreenDot(),
                ],
              ),
              _TitleSubtitleText(
                title: (user.followers / 1000).toString().substring(0, 4) + "K",
                subtitle: "Followers",
                height: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          //------------------------------
          // User name
          //------------------------------
          const SizedBox(height: 20),
          _TitleSubtitleText(
            title: user.name,
            subtitle: user.typeUser,
          ),
          //------------------------------
          // User photo post
          //------------------------------
          Expanded(
            child: ClipPath(
              clipper: _CurveTopClipper(),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: user.listPhotosUrl.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final imageUrl = user.listPhotosUrl[index];
                  return Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return OverflowBox(
                          maxHeight: constraints.maxHeight + 25,
                          child: ClipPath(
                            clipper: TileSkewClipper(inverted: index.isEven),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ImageProfile extends StatelessWidget {
  const _ImageProfile({
    Key key,
    @required this.imageUser,
  }) : super(key: key);
  final String imageUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUser),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.26),
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}

class _TitleSubtitleText extends StatelessWidget {
  final String title;
  final String subtitle;
  final double height;
  final CrossAxisAlignment crossAxisAlignment;

  const _TitleSubtitleText({
    Key key,
    @required this.title,
    @required this.subtitle,
    this.height = 1.5,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: PhotoAppColors.kDarkBlue,
              fontSize: 17,
            )),
        Text(
          subtitle,
          style: GoogleFonts.lato(
              height: height,
              color: PhotoAppColors.kGrey,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _GreenDot extends StatelessWidget {
  const _GreenDot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
          color: PhotoAppColors.kGreen,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class _CurveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.quadraticBezierTo(size.width * .5, 70, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
