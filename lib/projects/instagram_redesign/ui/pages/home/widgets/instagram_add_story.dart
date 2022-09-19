import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InstagramAddItem extends StatelessWidget {
  const InstagramAddItem({
    super.key,
    required this.itemSize,
    this.onTap,
    this.label = '',
  });

  final double itemSize;
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: itemSize,
          height: itemSize,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(
              color: Colors.grey[200]!,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(itemSize * .4),
          ),
          child: const Icon(FontAwesome.plus),
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
