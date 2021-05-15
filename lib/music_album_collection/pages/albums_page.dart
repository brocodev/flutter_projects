import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_collection/models/album_model.dart';
import 'package:flutter_projects/music_album_collection/pages/widgets/animated_album_card.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({
    Key key,
    this.gridMode = true,
  }) : super(key: key);

  final bool gridMode;

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  bool _hideDisks = true;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _hideDisks = false;
      });
    });
    super.initState();
  }

  //----------------------------------
  // Change View Mode
  //----------------------------------
  void _onChangeViewMode() {
    setState(() {
      _hideDisks = true;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: AlbumsPage(
                  gridMode: !widget.gridMode,
                ),
              );
            },
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
        actions: [
          IconButton(
            icon: Icon(Icons.widgets_outlined),
            onPressed: _onChangeViewMode,
          )
        ],
      ),
      //-------------------------------------
      // Albums List
      //-------------------------------------
      body: widget.gridMode
          ? _AlbumsGridView(hideDisks: _hideDisks)
          : OverflowBox(
              maxHeight: MediaQuery.of(context).size.height * 2,
              alignment: Alignment.topCenter,
              child: _AlbumsListView(hideDisks: _hideDisks),
            ),
    );
  }
}

class _AlbumsListView extends StatelessWidget {
  const _AlbumsListView({
    Key key,
    @required bool hideDisks,
  })  : _hideDisks = hideDisks,
        super(key: key);

  final bool _hideDisks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AlbumModel.listAlbum.length,
      padding: EdgeInsets.only(
          left: 40, top: 20, bottom: MediaQuery.of(context).size.height * 1.2),
      itemBuilder: (context, index) {
        final album = AlbumModel.listAlbum[index];
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 240,
            width: 330,
            margin: const EdgeInsets.only(bottom: 20),
            child: AlbumListViewCard(
              album: album,
              hideDisk: _hideDisks,
              textSize: 18,
            ),
          ),
        );
      },
    );
  }
}

class _AlbumsGridView extends StatelessWidget {
  const _AlbumsGridView({
    Key key,
    @required bool hideDisks,
  })  : _hideDisk = hideDisks,
        super(key: key);

  final bool _hideDisk;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: AlbumModel.listAlbum.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.03,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final album = AlbumModel.listAlbum[index];
        return AlbumGridViewCard(
          hideDisk: _hideDisk,
          album: album,
        );
      },
    );
  }
}
