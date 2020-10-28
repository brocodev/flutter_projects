import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/ui/home/widgets/red_dot.dart';

class RoundedNavigationBar extends StatelessWidget {
  final List<RoundedNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final Color unselectedColor;
  final Color selectedColor;
  final int currentIndex;

  const RoundedNavigationBar({
    Key key,
    @required this.items,
    this.onTap,
    this.unselectedColor = const Color(0xffa9a9a9),
    this.selectedColor = const Color(0xff000000),
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return IconButton(
            onPressed: () {
              if (onTap != null) {
                onTap(index);
              }
            },
            color: index == currentIndex ? selectedColor : unselectedColor,
            icon: Stack(
              alignment: Alignment(1,.5),
              children: [
                Icon(index == currentIndex
                    ? item.selectedIconData ?? item.iconData
                    : item.iconData),
                if (item.hasNotification) RedDot()
              ],
            ),
          );
        }),
      ),
    );
  }
}

class RoundedNavigationBarItem {
  final IconData iconData;
  final bool hasNotification;
  final IconData selectedIconData;

  RoundedNavigationBarItem({
    @required this.iconData,
    @required this.hasNotification,
    this.selectedIconData,
  });
}
