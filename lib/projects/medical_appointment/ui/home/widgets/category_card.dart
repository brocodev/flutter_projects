import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_doctor_category.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final DoctorCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            Color(category.rawColor!),
            Color(category.rawColor!).withAlpha(1000),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter,),),
      child: Stack(
        fit: StackFit.expand,
        children: [
          //----------------------------------
          //-------WHITE CIRCLE WITH ICON
          //---------------------------------
          Positioned(
            left: -30,
            bottom: -20,
            child: Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                color: Colors.white12,
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.iconData,
                color: Colors.white38,
                size: 45,
              ),
            ),
          ),
          //----------------------------------
          //-----CATEGORY INFORMATION
          //----------------------------------
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  category.nameCategory!,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
                const Spacer(),
                Text.rich(
                  TextSpan(
                    text: 'Doctors  ${category.doctors}\n',
                    children: [
                      TextSpan(
                        text: 'Specialist  ${category.specialists}',
                      )
                    ],
                  ),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
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
