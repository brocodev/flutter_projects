import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketDateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nowDate = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: 55,
          width: 55,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: kPrimaryColorDark,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: kPrimaryColorDark,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          '${nowDate.day} ${_getMonthByNumber(nowDate.month)}',
          style:
              GoogleFonts.barlowCondensed(color: kPrimaryColorDark, fontSize: 24),
        )
      ],
    );
  }

  _getMonthByNumber(int number) {
    return [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'Jule',
      'August',
      'September',
      'October',
      'November',
      'December'
    ][number - 1];
  }
}

class TileInfo extends StatelessWidget {
  const TileInfo({
    Key key,
    this.title,
    this.subtitle,
    this.crossAxisAlignment,
    this.colorTitle = Colors.white,
    this.colorSubtitle = kPrimaryColorLight,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final Color colorTitle;
  final Color colorSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.barlowCondensed(
            fontWeight: FontWeight.w500,
            color: colorTitle,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.barlowCondensed(
            color: colorSubtitle,
            height: 1.5,
            fontWeight: FontWeight.w500,
            fontSize: 26,
          ),
        ),
      ],
    );
  }
}
