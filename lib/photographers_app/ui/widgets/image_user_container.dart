import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/models/users.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';

class PhotoUserCard extends StatelessWidget {
  final PhotoUser user;
  final double size;
  final VoidCallback onTap;

  const PhotoUserCard({
    Key key,
    @required this.user,
    this.size = 100.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 20,
                        offset: Offset(-10, 10))
                  ],
                  borderRadius: BorderRadius.circular(size * .35),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(user.photoUrl),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            FittedBox(
              child: Text(
                user.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: PhotoAppColors.kDarkBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
