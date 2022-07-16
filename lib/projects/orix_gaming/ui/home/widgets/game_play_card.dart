import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/orix_gaming/models/video_game.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePlayCard extends StatelessWidget {
  const GamePlayCard({
    super.key,
    required this.videoGame,
    required this.haveFocus,
    required this.factorChange,
  });

  final VideoGame videoGame;
  final bool haveFocus;
  final double factorChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(bottom: 120.0 * factorChange),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            videoGame.srcImage!,
            fit: BoxFit.cover,
          ),
          const _ShaderCard(),
          AnimatedSwitcher(
            duration: kThemeChangeDuration,
            child: haveFocus
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _StatusGame(videoGame: videoGame),
                        const Spacer(),
                        _TitleAndPlayButton(videoGame: videoGame)
                      ],
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}

class _ShaderCard extends StatelessWidget {
  const _ShaderCard();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Colors.transparent,
          Colors.black38,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
    );
  }
}

class _TitleAndPlayButton extends StatelessWidget {
  const _TitleAndPlayButton({
    required this.videoGame,
  });

  final VideoGame videoGame;

  @override
  Widget build(BuildContext context) {
    final firstTitleWord = videoGame.title!.split(' ').first;
    final titleWithoutFirstWord =
        videoGame.title!.replaceRange(0, firstTitleWord.length, '').trim();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstTitleWord,
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,),
              ),
              Text(
                titleWithoutFirstWord,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  height: 1,
                ),
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
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
    );
  }
}

class _StatusGame extends StatelessWidget {
  const _StatusGame({
    required this.videoGame,
  });

  final VideoGame videoGame;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 6,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColorDark,
                ],
              ),
              borderRadius: BorderRadius.circular(10),),
          child: Text(
            'Live',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '${(videoGame.nowPlaying! / 1000).toStringAsFixed(1)}k Playing',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
