import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InstagramAddStory extends StatelessWidget {
  const InstagramAddStory({
    Key key,
    @required this.itemSize,
    this.onTap,
  }) : super(key: key);

  final double itemSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: itemSize,
            height: itemSize,
            child: Icon(FontAwesome.plus),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              border: Border.all(
                color: Colors.grey[200],
                width: 3,
              ),
              borderRadius: BorderRadius.circular(itemSize * .4),
            )),
        Text(
          "My Story",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}