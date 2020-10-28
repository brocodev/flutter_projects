import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_projects/photographers_app/models/models.dart';
import 'package:flutter_projects/photographers_app/ui/profile/widgets/profile_widgets.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';

class PhotoAppProfile extends StatelessWidget {
  final PhotoAppUser user;

  const PhotoAppProfile({Key key, @required this.user}) : super(key: key);

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
          //==== USER HEADER PROFILE ====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleSubtitleText(
                title: user.following.toString(),
                subtitle: "Following",
                height: 2,
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
              Stack(
                alignment: Alignment(.7, -.8),
                children: [
                  ImageProfile(imageUser: imageUser),
                  const _GreenDot(),
                ],
              ),
              TitleSubtitleText(
                title: (user.followers / 1000).toString().substring(0, 4) + "K",
                subtitle: "Followers",
                height: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),

          //==== USER NAME ===

          const SizedBox(height: 20),
          TitleSubtitleText(
            title: user.name,
            subtitle: user.typeUser,
          ),

          //==== USER PHOTOS GRID ====

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
