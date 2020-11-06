import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/music_app_two/models/album.dart';
import 'package:flutter_projects/music_app_two/models/song.dart';
import 'package:flutter_projects/music_app_two/ui/my_library/widgets/my_library_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({
    Key key,
  }) : super(key: key);

  @override
  _MyLibraryPageState createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
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
    pageAlbumController.addListener(_pageAlbumListener);
    pageDescriptionController.addListener(_pageDescriptionListener);
    super.initState();
  }

  @override
  void dispose() {
    pageAlbumController.removeListener(_pageAlbumListener);
    pageDescriptionController.removeListener(_pageDescriptionListener);
    pageAlbumController.dispose();
    pageDescriptionController.dispose();
    super.dispose();
  }

  //--------------------------------
  //----PAGE DESCRIPTION LISTENER
  //--------------------------------
  void _pageDescriptionListener() {
    setState(() {
      pageDescription = pageDescriptionController.page;
      scrollDirection = pageDescriptionController.position.userScrollDirection;
    });
  }

  //--------------------------------
  //----PAGE ALBUM LISTENER
  //--------------------------------
  void _pageAlbumListener() {
    if (isAlbumScrolling) {
      pageDescriptionController.position
          .jumpTo(pageAlbumController.page * MediaQuery.of(context).size.width);
      setState(() {
        scrollDirection = pageAlbumController.position.userScrollDirection;
        pageAlbum = pageAlbumController.page;
      });
    } else {
      setState(() {
        pageAlbum = pageAlbumController.page;
      });
    }
  }

  //--------------------------------
  //----OPEN PLAYER PAGE
  //--------------------------------
  void _openPlayerPage(BuildContext context) {
    final route =
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
          opacity: animation, child: SongPlayerPage(song: Song.currentSong));
    });
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final heightAlbumList = MediaQuery.of(context).size.width * .5;
    print(heightAlbumList);
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
          //-------------------------------------------------
          //-----BOTTOM WIDGETS
          //-------------------------------------------------
          Positioned(
            top: heightAlbumList,
            right: 0,
            left: 0,
            bottom: 0,
            child: GestureDetector(
              onPanDown: (_) {
                isAlbumScrolling = false;
              },
              child: Column(
                children: <Widget>[
                  //-----------------------------------
                  //-----PAGE VIEW DESCRIPTIONS
                  //-----------------------------------
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
                          final scrollDirectionFactor =
                              scrollDirection == ScrollDirection.forward
                                  ? 1
                                  : -1;
                          //---------------------------------------------------------
                          //------DESCRIPTION CONTAINER WITH TRANSFORMS ANIMATIONS
                          //---------------------------------------------------------
                          return Transform.scale(
                            scale: 1.0 * (1 - percent).clamp(.8, 1.0),
                            child: Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(
                                    (.9 * percent) * scrollDirectionFactor),
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: DescriptionContainer(
                                  album: album,
                                  padding: const EdgeInsets.only(
                                    top: 75,
                                    left: 20,
                                    right: 20,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  //-------------------------------------
                  //------CURRENT SONG FOOTER
                  //-------------------------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                        onTap: () => _openPlayerPage(context),
                        child: SongPlayFooter(song: Song.currentSong)),
                  )
                ],
              ),
            ),
          ),
          //--------------------------------------------------
          //-----TOP WIDGETS
          //--------------------------------------------------
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //-------------------------------------
                //----MY LIBRARY TEXT
                //-------------------------------------
                child: RichText(
                  text: TextSpan(
                      text: 'My',
                      style: GoogleFonts.spectral(
                        color: Colors.grey[800],
                        fontSize: 38,
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
              //------------------------------------------
              //-----ALBUM LIST CONTAINER
              //------------------------------------------
              Container(
                height: heightAlbumList,
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
                  //--------------------------------------
                  //-----PAGE VIEW ALBUMS
                  //--------------------------------------
                  child: GestureDetector(
                    onPanDown: (_) {
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
                            height: heightAlbumList - 38,
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
}
