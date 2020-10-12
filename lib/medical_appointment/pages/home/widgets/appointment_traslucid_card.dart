import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/utils/app_colors.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
      width: double.infinity,
      height: 160,
      clipBehavior: Clip.antiAlias,
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
          Container(
            height: 28,
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
            child: Text(
              "01:30 p.m.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MedicalAppColors.kDarkBlue,
                  fontSize: 12),
            ),
          ),
          Align(
            alignment: Alignment(.9, .7),
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 3),
                  borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://pavlov.psyciencia.com/2012/06/empatia-doctor.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
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
          Icon(FontAwesome.heartbeat, size: 70, color: Colors.white),
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
