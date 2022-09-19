import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NowPlayingAppBar extends StatelessWidget {
  const NowPlayingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(60),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            const BackButton(),
            const Spacer(),
            Text(
              'NOW PLAYING',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                letterSpacing: 3,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
