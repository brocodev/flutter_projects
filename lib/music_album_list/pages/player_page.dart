import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_list/models/album_model.dart';

class PlayerPage extends StatefulWidget {
  final AlbumModel album;

  const PlayerPage({Key key, @required this.album}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _resizeContainer;
  Animation<double> _cardAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _resizeContainer = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.3, curve: Curves.fastOutSlowIn),
    ));

    _cardAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    ));

    Future.delayed(Duration(milliseconds: 600), () {
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: Stack(
        children: <Widget>[
          _CustomAppBar(),
          Column(
            children: <Widget>[
              const Spacer(),
              SizedBox(
                height: size.height * .06,
              ),
              AnimatedBuilder(
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 60 * (1 - _cardAnimation.value)),
                    child: child,
                  );
                },
                animation: _animationController,
                child: _ShowVideoButton(),
              )
            ],
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                color: Colors.white,
                height: size.height * _resizeContainer.value,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: <Widget>[
            BackButton(color: Colors.white),
            Text(
              "Back",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowVideoButton extends StatelessWidget {
  const _ShowVideoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))
          ]),
      child: Icon(
        Icons.tv,
        size: 30,
      ),
    );
  }
}
