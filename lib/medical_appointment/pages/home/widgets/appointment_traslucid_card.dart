import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentTranslucentCard extends StatelessWidget {
  const AppointmentTranslucentCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final style = GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                _IconCard(),
                const SizedBox(width: 10),
                _InfoCard(style: style),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    Key key,
    @required this.style,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: 'Date', style: style, children: [
        TextSpan(
            text: "\n2020 November 12th",
            style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
            children: [
              TextSpan(
                  text: '\nDr. Richard Smith',
                  style: style.copyWith(height: 3),
                  children: [
                    TextSpan(
                        text: "\nCardiologist",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal, height: 0.8))
                  ])
            ])
      ]),
    );
  }
}

class _IconCard extends StatelessWidget {
  const _IconCard({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.heartbeat, size: 70, color: Colors.white),
          Text(
            "Heart care",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 2,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
