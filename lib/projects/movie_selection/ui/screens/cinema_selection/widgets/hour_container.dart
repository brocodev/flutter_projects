import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HourContainer extends StatelessWidget {
  const HourContainer({
    super.key,
    this.hour,
    this.id,
    this.selectedHourNotifier,
    this.onTap,
  });
  final String? hour;
  final ValueNotifier<int?>? selectedHourNotifier;
  final int? id;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder<int?>(
      valueListenable: selectedHourNotifier!,
      builder: (context, value, child) {
        final isSelected = value == id;
        return InkWell(
          onTap: () {
            selectedHourNotifier!.value = id;
            onTap!();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              gradient: isSelected ? kGradientRedOrange : null,
              boxShadow: const [
                BoxShadow(blurRadius: 20, color: Colors.black38)
              ],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  hour!,
                  style: GoogleFonts.barlowCondensed(
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * .024,
                    color: isSelected ? Colors.white : kPrimaryColorLight,
                  ),
                ),
                Text(
                  '60 MXN',
                  style: GoogleFonts.barlowCondensed(
                    fontWeight: FontWeight.w400,
                    fontSize: size.height * .016,
                    color: isSelected ? Colors.white : kPrimaryColorLight,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
