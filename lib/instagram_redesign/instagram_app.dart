import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/bloc/instagram_bloc.dart';
import 'package:flutter_projects/instagram_redesign/ui/activity/activities_page.dart';
import 'package:flutter_projects/instagram_redesign/ui/home/instagram_home.dart';
import 'package:flutter_projects/instagram_redesign/ui/home/widgets/settings_blur_card.dart';
import 'package:flutter_projects/instagram_redesign/ui/profile/instagram_profile.dart';
import 'package:flutter_projects/instagram_redesign/ui/widgets/rounded_navigation_bar.dart';
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

class _InstagramNavigationPage extends StatefulWidget {
  @override
  _InstagramNavigationPageState createState() =>
      _InstagramNavigationPageState();
}

class _InstagramNavigationPageState extends State<_InstagramNavigationPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context).instagramBloc;

    return Scaffold(
      body: OverflowBox(
        alignment: Alignment.topCenter,
        maxHeight: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: kThemeAnimationDuration,
              child: [
                const InstagramHome(),
                const Scaffold(body: Center(child: Text("Explore"))),
                const Scaffold(body: Center(child: Text("Add"))),
                const ActivitiesPage(),
                const InstagramProfile(),
              ][index],
            ),

            //------------------------------
            //----SETTINGS BLUR CARD
            //------------------------------
            AnimatedBuilder(
              animation: instagramBloc,
              builder: (context, settingsCard) {
                return AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    top: instagramBloc.settingState == SettingsSate.visible
                        ? 0
                        : -200,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Stack(
                      children: [
                        //--------------------------
                        //----HIDE SETTINGS ZONE
                        //--------------------------
                        instagramBloc.settingState == SettingsSate.visible
                            ? Positioned.fill(
                                child: GestureDetector(onPanDown: (details) {
                                instagramBloc.hideSettings();
                              }))
                            : const SizedBox(),
                        settingsCard,
                      ],
                    ));
              },
              child: SettingsBlurCard(height: 200),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RoundedNavigationBar(
        selectedColor: Theme.of(context).colorScheme.onBackground,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: [
          RoundedNavigationBarItem(
            selectedIconData: Icons.home_rounded,
            iconData: Icons.home_outlined,
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
            selectedIconData: Icons.favorite,
            hasNotification: true,
          ),
          RoundedNavigationBarItem(
            iconData: Icons.person_outlined,
            selectedIconData: Icons.person,
            hasNotification: false,
          ),
        ],
      ),
    );
  }
}
