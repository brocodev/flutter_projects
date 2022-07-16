import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/rounded_border_image.dart';

class IgUserBorderImage extends StatelessWidget {
  const IgUserBorderImage({
    super.key,
    required this.height,
    required this.imageUrl,
  });

  final double? height;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.purpleAccent,
            Colors.orangeAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(height! * .42),
      ),
      child: RoundedBorderImage(
        height: height,
        imageUrl: imageUrl,
        borderWidth: 2,
      ),
    );
  }
}
