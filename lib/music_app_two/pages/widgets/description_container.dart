import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app_two/models/album.dart';
import 'package:flutter_projects/music_app_two/pages/widgets/row_stars.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionContainer extends StatelessWidget {
  final Album album;

  const DescriptionContainer({
    Key key,
    @required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          top: size.height * .075, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 20,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Album",
                style: GoogleFonts.spectral(
                    color: Color(0xffd4af90),
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              const Spacer(),
              RowStars(
                color: Color(0xffd4af90),
                size: 16,
                stars: 4.6,
              ),
              const SizedBox(width: 5.0),
              Text(
                "${album.rate}",
                style: GoogleFonts.spectral(
                    fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Text(
            album.title,
            style: GoogleFonts.spectral(
              fontWeight: FontWeight.w800,
              color: Colors.grey[800],
              fontSize: 36,
            ),
          ),
          RichText(
            text: TextSpan(
                text: 'By ',
                style: GoogleFonts.poppins(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: album.author,
                    style: GoogleFonts.poppins(color: Colors.grey[800]),
                  ),
                ]),
          ),
          RichText(
            text: TextSpan(
                text: '${album.year}',
                children: [
                  _buildDotSpan(),
                  TextSpan(text: '${album.songsCount} songs'),
                  _buildDotSpan(),
                  TextSpan(
                      text:
                          '${album.duration.inHours} hr ${(album.duration - Duration(hours: 1)).inMinutes} min'),
                ],
                style: GoogleFonts.poppins(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              album.description,
              overflow: TextOverflow.fade,
              style: GoogleFonts.poppins(
                  height: 1.7, color: Colors.grey, fontSize: 16),
            ),
          ),
          Row(
              children: List.generate(album.genres.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                label: Text(album.genres[index]),
                labelStyle: GoogleFonts.poppins(
                    color: Colors.grey[700], fontWeight: FontWeight.w500),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.grey[200],
              ),
            );
          }))
        ],
      ),
    );
  }

  WidgetSpan _buildDotSpan() {
    return WidgetSpan(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _Dot(
          sizeDot: 4,
          color: Colors.grey[400],
        ),
      ),
      alignment: PlaceholderAlignment.middle,
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    this.sizeDot,
    this.color,
  }) : super(key: key);
  final double sizeDot;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeDot,
      height: sizeDot,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizeDot),
        color: color,
      ),
    );
  }
}
