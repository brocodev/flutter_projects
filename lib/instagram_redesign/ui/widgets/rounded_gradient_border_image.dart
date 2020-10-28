import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/ui/widgets/rounded_border_image.dart';


class RoundedGradientBorderImage extends StatelessWidget {
  const RoundedGradientBorderImage({
    Key key,
    @required this.height,
    @required this.imageUrl,
  }) : super(key: key);

  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: height,
        height: height,
        padding: const EdgeInsets.all(2.4),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purpleAccent,
                Colors.orangeAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(height * .4)),
        child: RoundedBorderImage(
          height: height,
          imageUrl: imageUrl,
        ));
  }
}
