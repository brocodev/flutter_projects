import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchInput extends StatelessWidget {
  const SearchInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * .4,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.horizontal(left: Radius.circular(25)),
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          Text(
            "Search",
            style: GoogleFonts.lato(
              color: PhotoAppColors.kGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
