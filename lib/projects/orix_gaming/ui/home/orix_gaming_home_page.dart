import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/orix_gaming/models/video_game.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/home/widgets/game_play_card.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/trending/orix_trending_page.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/widgets/rounded_icon_button.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/widgets/user_avatar.dart';
import 'package:google_fonts/google_fonts.dart';

class OrixGamingHomePage extends StatefulWidget {
  const OrixGamingHomePage({
    super.key,
  });

  @override
  OrixGamingHomePageState createState() => OrixGamingHomePageState();
}

class OrixGamingHomePageState extends State<OrixGamingHomePage> {
  PageController? _pageController;
  int? _gameIndex;
  double? _page;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .7, initialPage: 1);
    _gameIndex = 1;
    _page = 1.0;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    _page = _pageController!.page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //--------------------------
          // CUSTOM APP BAR
          //--------------------------
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconButton(
                    iconData: CupertinoIcons.search,
                    onPressed: () => _openTrendingPage(context),
                    label: 'Search',
                  ),
                  const UserAvatar()
                ],
              ),
            ),
          ),
          //-----------------------------
          // ORIX APP TITLE
          //-----------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Orix',
                        style: GoogleFonts.poppins(
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Gaming',
                        style: GoogleFonts.poppins(
                          fontSize: 42,
                          height: 0.8,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: 6.15,
                  child: Image.asset(
                    'assets/img/gaming/orix_cube.png',
                    height: 120,
                  ),
                )
              ],
            ),
          ),
          //-----------------------------------
          // LIVE GAME PLAYS PAGE VIEW
          //-----------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * .48,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _gameIndex = value;
                });
              },
              itemCount: VideoGame.videoGames.length,
              itemBuilder: (context, index) {
                final videoGame = VideoGame.videoGames[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GamePlayCard(
                    videoGame: videoGame,
                    haveFocus: index == _gameIndex,
                    factorChange: (_page! - index).abs(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _openTrendingPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (context) => const OrixTrendingPage(),
      ),
    );
  }
}
