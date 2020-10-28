import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_activity.dart';
import 'package:flutter_projects/instagram_redesign/ui/widgets/rounded_border_image.dart';
import 'package:flutter_projects/instagram_redesign/ui/widgets/rounded_gradient_border_image.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    Key key,
    @required this.activity,
  }) : super(key: key);

  final IgActivity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedGradientBorderImage(
            height: 80,
            imageUrl: activity.user.photoUrl,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  activity.user.username,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                Text(
                  _getTextDescription(),
                  maxLines: 4,
                  style: GoogleFonts.lato(
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                _getBottomWidgets()
              ],
            ),
          ),
          _getRightWidget()
        ],
      ),
    );
  }

  String _getTextDescription() {
    switch (activity.typeNotification) {
      case IgTypeActivity.Follows:
        return "started following you";
      case IgTypeActivity.Likes:
        return "liked your photo";
      default:
        return activity.description;
    }
  }

  Widget _getBottomWidgets() {
    switch (activity.typeNotification) {
      case IgTypeActivity.Messages:
      case IgTypeActivity.Comments:
      case IgTypeActivity.Mention:
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Icon(Icons.favorite_border, color: Colors.grey[400]),
              const SizedBox(width: 10),
              Icon(FontAwesome.commenting_o, color: Colors.grey[400])
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }

  _getRightWidget() {
    switch (activity.typeNotification) {
      case IgTypeActivity.Comments:
      case IgTypeActivity.Mention:
      case IgTypeActivity.Likes:
        return RoundedBorderImage(
          height: activity.typeNotification == IgTypeActivity.Likes ? 80 : 100,
          borderRadius: 30,
          borderColor: Colors.transparent,
          imageUrl: activity.imageUrl,
        );
      case IgTypeActivity.Follows:
      case IgTypeActivity.Messages:
        return Container(
          margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent[400],
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Colors.lightBlueAccent.withOpacity(.3),
                    blurRadius: 10,
                    offset: Offset(0, 8))
              ]),
          child: FlatButton(
            onPressed: () {},
            padding: const EdgeInsets.all(20),
            textColor: Colors.white,
            child: Text(
              activity.typeNotification == IgTypeActivity.Follows
                  ? "Follow back"
                  : "Open message",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
