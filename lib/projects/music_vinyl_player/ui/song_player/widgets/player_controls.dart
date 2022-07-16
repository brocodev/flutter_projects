import 'package:flutter/material.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({
    super.key,
    required this.onPausePlay,
    required this.isPlaying,
  });

  final VoidCallback onPausePlay;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .7,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 40,
                offset: Offset(0, 30),
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                iconSize: 38,
                color: const Color(0xffd4af70),
                icon: const Icon(Icons.skip_previous),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 38,
                color: const Color(0xffd4af70),
                icon: const Icon(Icons.skip_next),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onPausePlay,
          borderRadius: BorderRadius.circular(45),
          child: CircleAvatar(
            backgroundColor: const Color(0xffd4af70),
            radius: 42,
            foregroundColor: Colors.white,
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 60,
            ),
          ),
        )
      ],
    );
  }
}
