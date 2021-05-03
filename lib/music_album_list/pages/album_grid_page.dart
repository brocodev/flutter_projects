import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_list/models/album_model.dart';
import 'package:flutter_projects/music_album_list/pages/album_list_page.dart';
import 'package:flutter_projects/music_album_list/pages/player_page.dart';
import 'package:flutter_projects/music_album_list/pages/widgets/small_album_card.dart';

class AlbumGridPage extends StatefulWidget {
  @override
  _AlbumGridPageState createState() => _AlbumGridPageState();
}

class _AlbumGridPageState extends State<AlbumGridPage>
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
    final widthImage = size.width * .32;
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
                        return AlbumListPage();
                      },
                    ));
              });
            },
            color: Colors.black,
            icon: Icon(Icons.widgets),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: listAlbum.length,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 10 / 12,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
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
            child: SmallAlbumCard(
              album: album,
              widthImage: widthImage,
              animationController: _animationController,
              rotateDisk: _rotateDisk,
            ),
          );
        },
      ),
    );
  }
}
