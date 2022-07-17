import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/projects/music_vinyl_player/models/album.dart';
import 'package:flutter_projects/projects/music_vinyl_player/models/song.dart';
import 'package:flutter_projects/projects/music_vinyl_player/ui/my_library/widgets/my_library_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({
    super.key,
  });

  @override
  MyLibraryPageState createState() => MyLibraryPageState();
}

class MyLibraryPageState extends State<MyLibraryPage> {
  PageController? _pageAlbumController;
  PageController? _pageDescriptionController;
  double? _pageDescription;
  double? _pageAlbum;
  int? _pageAlbumIndex;
  ScrollDirection? _scrollDirection;
  bool _isAlbumScrolling = false;

  @override
  void initState() {
    _pageDescription = 1.0;
    _pageAlbum = 1.0;
    _pageAlbumIndex = 1;
    _pageAlbumController = PageController(
      viewportFraction: .58,
      initialPage: 1,
    );
    _pageDescriptionController = PageController(
      initialPage: 1,
    );
    _pageAlbumController!.addListener(_pageAlbumListener);
    _pageDescriptionController!.addListener(_pageDescriptionListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageAlbumController!.removeListener(_pageAlbumListener);
    _pageDescriptionController!.removeListener(_pageDescriptionListener);
    _pageAlbumController!.dispose();
    _pageDescriptionController!.dispose();
    super.dispose();
  }

  //--------------------------------
  // Page description listener
  //--------------------------------
  void _pageDescriptionListener() {
    setState(() {
      _pageDescription = _pageDescriptionController!.page;
      _scrollDirection =
          _pageDescriptionController!.position.userScrollDirection;
    });
  }

  //--------------------------------
  // Page album listener
  //--------------------------------
  void _pageAlbumListener() {
    if (_isAlbumScrolling) {
      _pageDescriptionController!.position.jumpTo(
        _pageAlbumController!.page! * MediaQuery.of(context).size.width,
      );
      setState(() {
        _scrollDirection = _pageAlbumController!.position.userScrollDirection;
        _pageAlbum = _pageAlbumController!.page;
      });
    } else {
      setState(() {
        _pageAlbum = _pageAlbumController!.page;
      });
    }
  }

  //--------------------------------
  // Open player page
  //--------------------------------
  void _openPlayerPage(BuildContext context) {
    final route = PageRouteBuilder<dynamic>(
      pageBuilder: (__, animation, ___) {
        return FadeTransition(
          opacity: animation,
          child: SongPlayerPage(song: Song.currentSong),
        );
      },
    );
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final heightAlbumList = MediaQuery.of(context).size.width * .5;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.double_music_note),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          //--------------------------------
          // Bottom Widgets
          //--------------------------------
          Positioned(
            top: heightAlbumList,
            right: 0,
            left: 0,
            bottom: 0,
            child: GestureDetector(
              onPanDown: (_) {
                _isAlbumScrolling = false;
              },
              child: Column(
                children: <Widget>[
                  //-----------------------------------
                  // Page View Description
                  //-----------------------------------
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (value) {
                        if (!_isAlbumScrolling) {
                          _pageAlbumController!.animateToPage(
                            value,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.fastOutSlowIn,
                          );
                        }
                      },
                      physics: const BouncingScrollPhysics(),
                      itemCount: Album.listAlbum.length,
                      controller: _pageDescriptionController,
                      itemBuilder: (context, index) {
                        final album = Album.listAlbum[index];
                        final percentDescription =
                            (_pageDescription! - index).abs();
                        final scrollDirectionFactor =
                            _scrollDirection == ScrollDirection.forward
                                ? 1
                                : -1;
                        //---------------------------------------
                        // Description card
                        //---------------------------------------
                        return Transform.scale(
                          scale: 1.0 * (1 - percentDescription).clamp(.8, 1.0),
                          child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(
                                (.9 * percentDescription) *
                                    scrollDirectionFactor,
                              ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: DescriptionCard(
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
                      },
                    ),
                  ),
                  //-------------------------------------
                  // Song Player Footer
                  //-------------------------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: InkWell(
                      onTap: () => _openPlayerPage(context),
                      child: SongPlayFooter(song: Song.currentSong),
                    ),
                  )
                ],
              ),
            ),
          ),
          //-----------------------------------------
          // Top Widgets
          //-----------------------------------------
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //-------------------------------------
                // My Library Text
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //------------------------------------------
              // Albums List Container
              //------------------------------------------
              Container(
                height: heightAlbumList,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 20,
                      offset: const Offset(0, 25),
                    )
                  ],
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey[100]!, Colors.white],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  //--------------------------------------
                  // Page View Album Covers
                  //--------------------------------------
                  child: GestureDetector(
                    onPanDown: (_) {
                      _isAlbumScrolling = true;
                    },
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: Album.listAlbum.length,
                      onPageChanged: (value) {
                        setState(() {
                          _pageAlbumIndex = value;
                        });
                      },
                      controller: _pageAlbumController,
                      itemBuilder: (context, index) {
                        final album = Album.listAlbum[index];
                        final percentDescription =
                            (_pageDescription! - index).abs();
                        final percentAlbum = (_pageAlbum! - index).abs();

                        return Transform.scale(
                          scale:
                              1.0 * (1.0 - (percentAlbum / 3)).clamp(.8, 1.0),
                          child: VinylAlbumCover(
                            album: album,
                            height: heightAlbumList - 38,
                            factorChange: percentDescription,
                            currentIndex: _pageAlbumIndex,
                            index: index,
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
