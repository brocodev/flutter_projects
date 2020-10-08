import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/music_app_two/models/album.dart';
import 'package:flutter_projects/music_app_two/models/song.dart';
import 'package:flutter_projects/music_app_two/pages/player_song_page.dart';
import 'package:flutter_projects/music_app_two/pages/widgets/album_disk_container.dart';
import 'package:flutter_projects/music_app_two/pages/widgets/description_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/song_play_footer.dart';

class SelectAlbumPage extends StatefulWidget {
  const SelectAlbumPage({
    Key key,
  }) : super(key: key);

  @override
  _SelectAlbumPageState createState() => _SelectAlbumPageState();
}

class _SelectAlbumPageState extends State<SelectAlbumPage> {
  PageController pageAlbumController;
  PageController pageDescriptionController;
  double pageDescription;
  double pageAlbum;
  ScrollDirection scrollDirection;
  bool isAlbumScrolling = false;

  @override
  void initState() {
    pageDescription = 1.0;
    pageAlbum = 1.0;
    pageAlbumController = PageController(
      viewportFraction: .6,
      initialPage: 1,
    );
    pageDescriptionController = PageController(
      initialPage: 1,
    );

    pageAlbumController.addListener(() {
      if (isAlbumScrolling) {
        pageDescriptionController.position.jumpTo(
            pageAlbumController.page * MediaQuery.of(context).size.width);
        setState(() {
          scrollDirection = pageAlbumController.position.userScrollDirection;
        });
      }
    });

    pageDescriptionController.addListener(() {
      setState(() {
        pageDescription = pageDescriptionController.page;
        scrollDirection =
            pageDescriptionController.position.userScrollDirection;
      });
    });

    pageAlbumController.addListener(() {
      setState(() {
        pageAlbum = pageAlbumController.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageAlbumController.removeListener(() {});
    pageDescriptionController.removeListener(() {});
    pageAlbumController.dispose();
    pageDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.double_music_note),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 260,
            right: 0,
            left: 0,
            bottom: 0,
            child: GestureDetector(
              onPanDown: (details) {
                isAlbumScrolling = false;
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: PageView.builder(
                        onPageChanged: (value) {
                          if (!isAlbumScrolling)
                            pageAlbumController.animateToPage(value,
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeInOutQuint);
                        },
                        itemCount: Album.listAlbum.length,
                        controller: pageDescriptionController,
                        itemBuilder: (context, index) {
                          final album = Album.listAlbum[index];
                          final percent = (pageDescription - index).abs();
                          final factor =
                              scrollDirection == ScrollDirection.forward
                                  ? 1
                                  : -1;
                          return Transform.scale(
                            scale: 1.0 * (1 - percent).clamp(.8, 1.0),
                            child: Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY((.9 * percent) * factor),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 40,
                                    left: 40,
                                    bottom: 20,
                                  ),
                                  child: DescriptionContainer(album: album)),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                        onTap: () => _openPlayerPage(context),
                        child: SongPlayFooter(song: Song.currentSong)),
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                      text: 'My',
                      style: GoogleFonts.spectral(
                        color: Colors.grey[800],
                        fontSize: 42,
                      ),
                      children: [
                        TextSpan(
                            text: ' Library',
                            style: GoogleFonts.spectral(
                              fontWeight: FontWeight.w800,
                            ))
                      ]),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .26,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 20,
                      offset: Offset(0, 25))
                ]),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.grey[100], Colors.white],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  )),
                  child: GestureDetector(
                    onPanDown: (details) {
                      isAlbumScrolling = true;
                    },
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: Album.listAlbum.length,
                      controller: pageAlbumController,
                      itemBuilder: (context, index) {
                        final album = Album.listAlbum[index];
                        final percentDescription =
                            (pageDescription - index).abs();
                        final percentAlbum = (pageAlbum - index).abs();
                        return Transform.scale(
                          scale:
                              1.0 * (1.0 - (percentAlbum / 3)).clamp(.8, 1.0),
                          child: AlbumDiskContainer(
                            album: album,
                            factorChange: percentDescription,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _openPlayerPage(BuildContext context) {
    final route =
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
          opacity: animation, child: PlayerSongPage(song: Song.currentSong));
    });
    Navigator.push(context, route);
  }
}
