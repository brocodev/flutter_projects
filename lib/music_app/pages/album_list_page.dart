import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app/models/album_model.dart';
import 'package:flutter_projects/music_app/pages/album_grid_page.dart';
import 'package:flutter_projects/music_app/pages/player_page.dart';
import 'package:flutter_projects/music_app/pages/widgets/large_album_card.dart';

class AlbumListPage extends StatefulWidget {
  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _rotateDisk;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _rotateDisk = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listAlbum = AlbumModel.listAlbum;
    final size = MediaQuery.of(context).size;
    _animationController.forward();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Albums",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              _animationController.reverse();
              await Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 1),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return AlbumGridPage();
                      },
                    ));
              });
            },
            color: Colors.black,
            icon: Icon(Icons.widgets),
          )
        ],
      ),
      body: OverflowBox(
        maxHeight: size.height * 2.5,
        child: ListView.builder(
          itemExtent: 300,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: (size.height * .8)),
          itemCount: listAlbum.length,
          itemBuilder: (context, index) {
            final album = listAlbum[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: PlayerPage(album: album),
                    );
                  },
                ));
              },
              child: LargeAlbumCard(
                album: album,
                rotateDisk: _rotateDisk,
                animationController: _animationController,
              ),
            );
          },
        ),
      ),
    );
  }
}
