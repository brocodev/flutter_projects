import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/activity/activities_page.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/home/instagram_home.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/home/widgets/settings_blur_card.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/profile/instagram_profile.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/rounded_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InstagramNavigationScreen extends StatefulWidget {
  const InstagramNavigationScreen({super.key});

  @override
  InstagramNavigationScreenState createState() =>
      InstagramNavigationScreenState();
}

class InstagramNavigationScreenState extends State<InstagramNavigationScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context)!.instagramBloc;
    final topInset = MediaQuery.of(context).padding.top;
    final settingsHeight = MediaQuery.of(context).size.height * .25 + topInset;

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
                const Scaffold(body: Center(child: Text('Explore'))),
                const Scaffold(body: Center(child: Text('Add'))),
                const ActivitiesPage(),
                const InstagramProfile(),
              ][index],
            ),

            //------------------------------
            // SETTINGS BLUR CARD
            //------------------------------
            AnimatedBuilder(
              animation: instagramBloc,
              builder: (context, settingsCard) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  top: instagramBloc.settingState == SettingsState.visible
                      ? 0
                      : -settingsHeight,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    children: [
                      //--------------------------
                      // HIDE SETTINGS ZONE
                      //--------------------------
                      if (instagramBloc.settingState == SettingsState.visible)
                        Positioned.fill(
                          child: GestureDetector(
                            onPanDown: (details) {
                              instagramBloc.hideSettings();
                            },
                          ),
                        )
                      else
                        const SizedBox(),
                      settingsCard!,
                    ],
                  ),
                );
              },
              child: SettingsBlurCard(height: settingsHeight),
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
        items: const [
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
