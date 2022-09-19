import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/models/actors.dart';
import 'package:google_fonts/google_fonts.dart';

class ActorsList extends StatelessWidget {
  const ActorsList({
    super.key,
    this.listActors,
  });

  final List<Actor>? listActors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Actors',
            style: GoogleFonts.barlowCondensed(
              fontSize: size.height * .03,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 190,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: listActors!.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        listActors![i].pathImage!,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 120,
                      child: Text(
                        listActors![i].name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.barlowCondensed(
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(.9),
                          fontSize: size.height * .02,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
