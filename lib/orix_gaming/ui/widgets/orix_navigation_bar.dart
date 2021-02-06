import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrixNavigationBar extends StatelessWidget {
  const OrixNavigationBar({
    Key key,
    @required this.items,
    this.currentIndex = 0,
    this.onTapItem,
  }) : super(key: key);
  final List<OrixNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTapItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final haveFocus = index == currentIndex;
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => onTapItem(index),
            child: _NavItemWidget(haveFocus: haveFocus, item: item),
          );
        }),
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  const _NavItemWidget({
    Key key,
    @required this.haveFocus,
    @required this.item,
  }) : super(key: key);

  final bool haveFocus;
  final OrixNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSwitcher(
          duration: kThemeChangeDuration,
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: haveFocus
              ? Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColorLight,
                        Theme.of(context).primaryColorDark,
                      ])),
                  child: Icon(
                    item.iconData,
                    color: Colors.white,
                  ),
                )
              : Icon(
                  item.unselectedIconData,
                  color: Colors.grey,
                ),
        ),
        const SizedBox(width: 4.0),
        AnimatedDefaultTextStyle(
          duration: kThemeChangeDuration,
          child: Text(
            item.label,
          ),
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: haveFocus ? 14 : 0,
          ),
        ),
      ],
    );
  }
}

class OrixNavigationBarItem {
  final String label;
  final IconData iconData;
  final IconData unselectedIconData;

  OrixNavigationBarItem({
    @required this.label,
    @required this.iconData,
    @required this.unselectedIconData,
  });
}
