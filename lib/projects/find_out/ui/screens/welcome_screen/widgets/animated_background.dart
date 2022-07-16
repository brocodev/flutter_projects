import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  AnimatedBackgroundState createState() => AnimatedBackgroundState();
}

class AnimatedBackgroundState extends State<AnimatedBackground> {
  late final PageController pageController;
  late Timer timerSlide;

  @override
  void initState() {
    pageController = PageController();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      timerSlide =
          Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
        pageController.nextPage(
          duration: const Duration(milliseconds: 1400),
          curve: Curves.fastOutSlowIn,
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timerSlide.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authorsList = [
      'Federico Gutierrez',
      'Rolands Varsbengs',
      'Timo Stern'
    ];
    final topPosition = MediaQuery.of(context).size.height * .37;
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      allowImplicitScrolling: true,
      controller: pageController,
      itemBuilder: (context, index) {
        final i = index % 3;
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/img/findout/background${i + 1}.jpg',
              fit: BoxFit.cover,
            ),
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black26,
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: topPosition,
              child: Text(
                'Photography by ${authorsList[i]}\non Unsplash',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
