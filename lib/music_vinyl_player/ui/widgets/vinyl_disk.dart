import 'package:flutter/material.dart';

class VinylDisk extends StatelessWidget {
  final String albumImagePath;
  final double heightDisk;

  const VinylDisk({
    Key key,
    @required this.albumImagePath,
    @required this.heightDisk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          'assets/img/music/vinyl.png',
          height: heightDisk,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(heightDisk * .3),
          child: Image.asset(albumImagePath, height: heightDisk * .3),
        )
      ],
    );
  }
}
