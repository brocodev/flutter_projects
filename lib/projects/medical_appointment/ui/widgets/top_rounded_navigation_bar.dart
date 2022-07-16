import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/medical_appointment/utils/md_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TopRoundedNavigationBar extends StatelessWidget {
  const TopRoundedNavigationBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.selectedColor = MdAppColors.kBlue,
    this.unselectedColor = Colors.grey,
  });

  final List<TopRoundedNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final Color selectedColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return _TopRoundedNavigationBarButton(
            item: item,
            selectedColor: item.color ?? selectedColor,
            unselectedColor: unselectedColor,
            isSelected: index == currentIndex,
            onPressed: () {
              onTap?.call(index);
            },
          );
        }),
      ),
    );
  }
}

class TopRoundedNavigationBarItem {
  const TopRoundedNavigationBarItem({
    required this.label,
    required this.selectedIcon,
    this.unselectedIcon,
    this.color,
  });

  final String label;
  final IconData selectedIcon;
  final IconData? unselectedIcon;
  final Color? color;
}

class _TopRoundedNavigationBarButton extends StatelessWidget {
  const _TopRoundedNavigationBarButton({
    this.onPressed,
    this.item,
    this.isSelected,
    this.selectedColor = MdAppColors.kBlue,
    this.unselectedColor = Colors.grey,
  });

  final VoidCallback? onPressed;
  final TopRoundedNavigationBarItem? item;
  final bool? isSelected;
  final Color selectedColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    final color = isSelected! ? selectedColor : unselectedColor;
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected! ? color.withOpacity(.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              item!.selectedIcon,
              color: color,
            ),
            const SizedBox(width: 5),
            AnimatedDefaultTextStyle(
              curve: Curves.fastOutSlowIn,
              duration: kThemeAnimationDuration,
              style: GoogleFonts.poppins(
                fontSize: isSelected! ? 14 : 0,
                color: color,
                fontWeight: FontWeight.w600,
              ),
              child: Text(item!.label),
            )
          ],
        ),
      ),
    );
  }
}
