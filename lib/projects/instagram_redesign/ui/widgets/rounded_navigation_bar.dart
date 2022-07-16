import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/red_dot.dart';

class RoundedNavigationBar extends StatelessWidget {
  const RoundedNavigationBar({
    super.key,
    required this.items,
    this.onTap,
    this.unselectedColor = const Color(0xffa9a9a9),
    this.selectedColor = const Color(0xff000000),
    this.currentIndex = 0,
  });

  final List<RoundedNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final Color unselectedColor;
  final Color selectedColor;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.bottom,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return IconButton(
            onPressed: () => onTap?.call(index),
            color: index == currentIndex ? selectedColor : unselectedColor,
            icon: Stack(
              alignment: const Alignment(1, .5),
              children: [
                Icon(
                  index == currentIndex
                      ? item.selectedIconData ?? item.iconData
                      : item.iconData,
                ),
                if (item.hasNotification) const RedDot()
              ],
            ),
          );
        }),
      ),
    );
  }
}

class RoundedNavigationBarItem {
  const RoundedNavigationBarItem({
    required this.iconData,
    required this.hasNotification,
    this.selectedIconData,
  });

  final IconData iconData;
  final bool hasNotification;
  final IconData? selectedIconData;
}
