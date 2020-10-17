import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/bloc/instagram_bloc.dart';
import 'package:flutter_projects/instagram_redesign/pages/home/instagram_home.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/rounded_navigation_bar.dart';
import 'package:flutter_projects/instagram_redesign/theme/themes.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InstagramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InstagramBlocProvider(
      instagramBloc: InstagramBloc(),
      child: _MateApp(),
    );
  }
}

class _MateApp extends StatelessWidget {
  const _MateApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context).instagramBloc;
    return AnimatedBuilder(
      animation: instagramBloc,
      builder: (context, child) {
        return MaterialApp(
            title: 'Instagram',
            debugShowCheckedModeBanner: false,
            themeMode: instagramBloc.themeMode,
            darkTheme: InstagramTheme.kDarkTheme,
            theme: InstagramTheme.kLightTheme,
            home: child);
      },
      child: _InstagramNavigationPage(),
    );
  }
}

class _InstagramNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final indexNotifier = ValueNotifier(0);
    return ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, index, child) {
          return Scaffold(
            body: AnimatedSwitcher(
              duration: kThemeAnimationDuration,
              child: [
                LayoutBuilder(builder: (context, constraints) {
                  return OverflowBox(
                      alignment: Alignment.topCenter,
                      maxHeight: constraints.maxHeight + 50,
                      child: InstagramHome());
                }),
                Scaffold(body: Center(child: Text("Explore"))),
                Scaffold(body: Center(child: Text("Add"))),
                Scaffold(body: Center(child: Text("Favorites"))),
                Scaffold(body: Center(child: Text("Profile"))),
              ][index],
            ),
            bottomNavigationBar: RoundedNavigationBar(
              selectColor: Theme.of(context).colorScheme.onBackground,
              onTap: (value) => indexNotifier.value = value,
              currentIndex: index,
              items: [
                RoundedNavigationBarItem(
                  iconData: Icons.home_rounded,
                  hasNotification: false,
                ),
                RoundedNavigationBarItem(
                  iconData: Feather.search,
                  hasNotification: false,
                ),
                RoundedNavigationBarItem(
                  iconData: Icons.add_box_outlined,
                  hasNotification: false,
                ),
                RoundedNavigationBarItem(
                  iconData: Icons.favorite_border,
                  hasNotification: true,
                ),
                RoundedNavigationBarItem(
                  iconData: Feather.user,
                  hasNotification: false,
                ),
              ],
            ),
          );
        });
  }
}
