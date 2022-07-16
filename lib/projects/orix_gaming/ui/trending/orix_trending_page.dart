import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/orix_gaming/models/video_game.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/widgets/rounded_icon_button.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/widgets/user_avatar.dart';
import 'package:google_fonts/google_fonts.dart';

class OrixTrendingPage extends StatelessWidget {
  const OrixTrendingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------------------------
          // CUSTOM APP BAR
          //--------------------------
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconButton(
                    iconData: Icons.arrow_back,
                    onPressed: () => Navigator.pop(context),
                    label: 'Back',
                  ),
                  const UserAvatar()
                ],
              ),
            ),
          ),
          //-----------------------------
          // TRENDING GAMES TITLE
          //-----------------------------
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(
              'Trending 🔥',
              style: GoogleFonts.poppins(
                fontSize: 42,
              ),
            ),
          ),
          //-----------------------------------------
          // TRENDING GAMES LIST
          //-----------------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: VideoGame.videoGames.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final game = VideoGame.videoGames[index];
                final materialColor =
                    Colors.primaries[index % Colors.primaries.length];
                return _OrixTrendingGameCard(
                    game: game, materialColor: materialColor,);
              },
            ),
          ),
          const Expanded(
            child: _MainTrendingGame(
              game: VideoGame.mainGame,
            ),
          )
        ],
      ),
    );
  }
}

class _MainTrendingGame extends StatelessWidget {
  const _MainTrendingGame({
    required this.game,
  });

  final VideoGame game;

  @override
  Widget build(BuildContext context) {
    final firstTitleWord = game.title!.split(' ').first;
    final titleWithoutFirstWord =
        game.title!.replaceRange(0, firstTitleWord.length, '').trim();
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          //-----------------------------------
          // MAIN GAME IMAGE
          //-----------------------------------
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                game.srcImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              //-------------------------------
              // GAME AVATAR
              //-------------------------------
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(game.srcImage!),
              ),
              const SizedBox(width: 6),
              //------------------------------
              // GAME TITLE & GENRE
              //------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Text.rich(
                    TextSpan(text: firstTitleWord, children: [
                      TextSpan(
                        text: ' $titleWithoutFirstWord',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                      )
                    ],),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,),
                  ),
                  // GENRE
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(.8),
                        borderRadius: BorderRadius.circular(6),),
                    child: Text(
                      game.genre!,
                      style: GoogleFonts.poppins(
                        color: Colors.orange[900],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              //----------------------------
              // PLAY BUTTON
              //----------------------------
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).primaryColorDark,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OrixTrendingGameCard extends StatelessWidget {
  const _OrixTrendingGameCard({
    required this.game,
    required this.materialColor,
  });

  final VideoGame game;
  final MaterialColor materialColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 15)
          ],),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                game.srcImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: materialColor.shade100,
                  ),
                  child: Text(
                    game.genre!,
                    style: GoogleFonts.poppins(
                        color: materialColor.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      game.title!,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
