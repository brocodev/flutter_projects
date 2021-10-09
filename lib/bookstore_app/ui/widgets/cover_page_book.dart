import 'package:flutter/material.dart';

class CoverPageBook extends StatelessWidget {
  const CoverPageBook({
    Key? key,
    required this.srcImageBook,
  }) : super(key: key);

  final String? srcImageBook;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(5, 5),
          )
        ],
        image:
        DecorationImage(image: AssetImage(srcImageBook!), fit: BoxFit.cover),
      ),
    );
  }
}