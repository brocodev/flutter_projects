import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class CreditCardSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final listColors = [
      [Colors.purpleAccent, Colors.pinkAccent],
      [Colors.cyanAccent[400], Colors.blueAccent],
      [Colors.amber, Colors.deepOrange],
    ];
    final indexNotifier = ValueNotifier(0);
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height * .28,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            onPageChanged: (index) => indexNotifier.value = index,
            itemCount: 3,
            itemBuilder: (context, index) {
              return CreditCardWidget(
                colors: listColors[index],
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(listColors.length, (index) {
              return ValueListenableBuilder<int>(
                  valueListenable: indexNotifier,
                  builder: (context, value, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CircleAvatar(
                        backgroundColor:
                            value == index ? kAccentColor : Colors.white70,
                        radius: value == index ? 5 : 2.5,
                      ),
                    );
                  });
            }),
          ),
        )
      ],
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    Key key,
    this.colors,
  }) : super(key: key);
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.redAccent.withOpacity(.8)),
                  Align(
                    widthFactor: .3,
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent.withOpacity(.6),
                    ),
                  ),
                ],
              ),
              Icon(Icons.wifi, color: Colors.white, size: 35)
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Kevin Melendez Hernandez".toUpperCase(),
                  maxLines: 1,
                  style: GoogleFonts.barlowCondensed(
                      color: Colors.white70, fontSize: size.height * .018)),
              Text("05/24".toUpperCase(),
                  maxLines: 1,
                  style: GoogleFonts.barlowCondensed(
                      color: Colors.white70, fontSize: size.height * .018)),
            ],
          ),
          const SizedBox(height: 30),
          Text("9189 .... .... 1299".toUpperCase(),
              maxLines: 1,
              style: GoogleFonts.barlowCondensed(
                fontSize: size.height * .024,
                letterSpacing: 12,
              )),
        ],
      ),
    );
  }
}
