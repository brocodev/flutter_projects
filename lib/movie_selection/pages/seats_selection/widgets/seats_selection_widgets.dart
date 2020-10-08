import 'package:flutter/material.dart';
import 'package:flutter_projects/animations/tween_animations.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeSeatInfo extends StatelessWidget {
  final int quantity;
  final Color color;
  final String label;

  const TypeSeatInfo({Key key, this.quantity, this.color, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kPrimaryColorDark,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 50, offset: Offset(0, 10)),
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(3)),
            child: Text(
              '$quantity',
              style: GoogleFonts.barlowCondensed(
                fontWeight: FontWeight.w500,
                height: .9,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.barlowCondensed(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    this.onPressedBack,
    this.title,
    this.subtitle,
  }) : super(key: key);
  final VoidCallback onPressedBack;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TranslateAnimation(
              offsetDirection: Axis.horizontal,
              offset: 100,
              duration: kDuration400ms,
              child: BackButton(
                color: Colors.white,
                onPressed: onPressedBack,
              )),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TranslateAnimation(
                  duration: kDuration400ms,
                  child: Text(
                    title.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.barlowCondensed(
                        fontSize: size.height * .018,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                  ),
                ),
                TranslateAnimation(
                  duration: const Duration(milliseconds: 450),
                  child: Text(
                    subtitle.toUpperCase(),
                    style: GoogleFonts.barlowCondensed(
                        fontSize: size.height * .018, color: kPrimaryColorLight),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowSeats extends StatelessWidget {
  final int numSeats;
  final List<int> seatsOccupied;
  final ValueNotifier<int> seatsSelectedNotifier;

  const RowSeats({
    Key key,
    this.numSeats,
    this.seatsOccupied,
    this.seatsSelectedNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeItem = 22.0;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(numSeats, (i) {
          if (seatsOccupied.contains(i + 1)) {
            return Container(
                height: sizeItem,
                width: sizeItem,
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: BoxDecoration(
                  color: kPrimaryColorLight,
                  borderRadius: BorderRadius.circular(3),
                ));
          }

          final isActiveNotifier = ValueNotifier(false);
          return ValueListenableBuilder<bool>(
              valueListenable: isActiveNotifier,
              builder: (context, value, _) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    isActiveNotifier.value = !isActiveNotifier.value;
                    if (value) {
                      seatsSelectedNotifier.value--;
                    } else {
                      seatsSelectedNotifier.value++;
                    }
                  },
                  child: Container(
                    height: sizeItem,
                    width: sizeItem,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    decoration: BoxDecoration(
                      color: value ? kAccentColor : kPrimaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
