import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';

class CurvedNavigationBar extends StatelessWidget {
  final List<CurvedNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final Color unselectedColor;
  final Color selectedColor;
  final int currentIndex;

  const CurvedNavigationBar({
    Key key,
    @required this.items,
    this.onTap,
    this.unselectedColor = PhotoAppColors.kGrey,
    this.selectedColor = PhotoAppColors.kDarkBlue,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(items.length == 4);
    return ClipPath(
      clipper: _CurvedClipper(),
      child: Container(
        alignment: Alignment(0, 1.6),
        height: kToolbarHeight * 1.5,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30),
        //----------------------------------
        // Generate Navigation Items
        //----------------------------------
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.only(
                  bottom: (index == 0 || index == 3) ? 20.0 : 0),
              child: IconButton(
                onPressed: () {
                  if (onTap != null) {
                    onTap(index);
                  }
                },
                color: index == currentIndex ? selectedColor : unselectedColor,
                icon: Icon(index == currentIndex
                    ? item.selectedIconData ?? item.iconData
                    : item.iconData),
              ),
            );
          })
            ..insert(2, const SizedBox()),
        ),
      ),
    );
  }
}

class CurvedNavigationBarItem {
  final IconData iconData;
  final IconData selectedIconData;

  const CurvedNavigationBarItem({
    @required this.iconData,
    this.selectedIconData,
  });
}

class _CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..quadraticBezierTo(size.width * .5, kToolbarHeight, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
