import 'package:flutter/material.dart';


class TypeActivityToggleButton extends StatelessWidget {
  const TypeActivityToggleButton({
    Key key,
    @required this.value,
    @required this.selectValue,
    @required this.labelButton,
    this.notifications,
    this.onPressed,
  }) : super(key: key);

  final int value;
  final int selectValue;
  final String labelButton;
  final int notifications;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final indicatorSize = 35.0;
    final indicatorColor = Colors.redAccent;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FlatButton(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: StadiumBorder(),
          onPressed: () {
            if (onPressed != null) {
              onPressed(value);
            }
          },
          color: value == selectValue
              ? colorScheme.onBackground
              : colorScheme.primaryVariant,
          textColor: value == selectValue
              ? colorScheme.onPrimary
              : colorScheme.onBackground,
          child: Text(
            labelButton,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (notifications > 0)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: indicatorSize,
              width: indicatorSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: indicatorColor.shade400,
                boxShadow: [
                  BoxShadow(color: indicatorColor.shade100, blurRadius: 3)
                ],
                borderRadius: BorderRadius.circular(indicatorSize * .4),
              ),
              child: Text(
                "$notifications",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
      ],
    );
  }
}
