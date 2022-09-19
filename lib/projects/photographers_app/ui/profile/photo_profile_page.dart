import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/photographers_app/models/users.dart';
import 'package:flutter_projects/projects/photographers_app/theme/photo_app_colors.dart';
import 'package:flutter_projects/projects/photographers_app/ui/widgets/tile_skew_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoProfilePage extends StatelessWidget {
  const PhotoProfilePage({super.key, required this.user});

  final PhotoUser user;

  @override
  Widget build(BuildContext context) {
    final imageUser = user.photoUrl;
    final followers = (user.followers! / 1000).toString().substring(0, 4);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, size: 30),
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
                subtitle: 'Following',
                height: 2,
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
              Stack(
                alignment: const Alignment(.7, -.8),
                children: [
                  _ImageProfile(imageUser: imageUser),
                  const _GreenDot(),
                ],
              ),
              _TitleSubtitleText(
                title: '${followers}K',
                subtitle: 'Followers',
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
                itemCount: user.listPhotosUrl!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final imageUrl = user.listPhotosUrl![index];
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
    required this.imageUser,
  });
  final String? imageUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUser!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.26),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
    );
  }
}

class _TitleSubtitleText extends StatelessWidget {
  const _TitleSubtitleText({
    required this.title,
    required this.subtitle,
    this.height = 1.5,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String? title;
  final String? subtitle;
  final double height;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: PhotoAppColors.kDarkBlue,
            fontSize: 17,
          ),
        ),
        Text(
          subtitle!,
          style: GoogleFonts.lato(
            height: height,
            color: PhotoAppColors.kGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _GreenDot extends StatelessWidget {
  const _GreenDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        color: PhotoAppColors.kGreen,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _CurveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..quadraticBezierTo(size.width * .5, 70, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
