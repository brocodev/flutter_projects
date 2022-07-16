import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/models/book.dart';

class ReadersRow extends StatelessWidget {
  const ReadersRow({
    super.key,
    required this.readers,
    this.avatarSize = 30,
  });

  final List<UserBook>? readers;
  final double avatarSize;

  @override
  Widget build(BuildContext context) {
    final hasUserExcess = readers!.length > 4;

    return Row(
      children: List.generate(hasUserExcess ? 4 : readers!.length, (index) {
        final user = readers![index];
        return Align(
          alignment: Alignment.centerLeft,
          widthFactor: .7,
          child: Container(
            height: avatarSize,
            width: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              image: DecorationImage(
                image: NetworkImage(user.photoUrl!),
                fit: BoxFit.cover,
              ),
            ),
            child: index == 3
                ? Container(
                    height: avatarSize,
                    width: avatarSize,
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(avatarSize),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                      child: Text(
                        '${readers!.length - 3}+',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        );
      }),
    );
  }
}
