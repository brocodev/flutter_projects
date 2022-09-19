import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsBlurCard extends StatelessWidget {
  const SettingsBlurCard({
    super.key,
    this.height = 0,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context)!.instagramBloc;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.blueGrey[300]!.withOpacity(.7),
          child: SafeArea(
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: instagramBloc,
                  builder: (context, child) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Visualization',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: List.generate(3, (index) {
                                  return _ViewModeItem(
                                    modeNumber: index + 1,
                                    nameMode: [
                                      'Ample',
                                      'Clean',
                                      'Old',
                                    ][index],
                                    viewState: [
                                      ViewState.ample,
                                      ViewState.clean,
                                      ViewState.old,
                                    ][index],
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: Column(
                              children: [
                                _SettingsSwitcher(
                                  label: 'Horizontal',
                                  value: false,
                                  onChanged: (val) {},
                                ),
                                _SettingsSwitcher(
                                  label: 'Swift chat',
                                  value: false,
                                  onChanged: (val) {},
                                ),
                                _SettingsSwitcher(
                                  label: 'Dark Theme',
                                  value:
                                      instagramBloc.themeMode == ThemeMode.dark,
                                  onChanged: (val) {
                                    if (val) {
                                      instagramBloc
                                          .setThemeMode(ThemeMode.dark);
                                    } else {
                                      instagramBloc
                                          .setThemeMode(ThemeMode.light);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: instagramBloc.hideSettings,
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Ionicons.ios_arrow_up,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ViewModeItem extends StatelessWidget {
  const _ViewModeItem({
    required this.viewState,
    required this.modeNumber,
    required this.nameMode,
  });

  final ViewState viewState;
  final int modeNumber;
  final String nameMode;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final instagramBloc = InstagramBlocProvider.of(context)!.instagramBloc;
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              instagramBloc.changeView(viewState);
            },
            child: AnimatedContainer(
              duration: kThemeAnimationDuration,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .1,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                  style: instagramBloc.viewState == viewState
                      ? BorderStyle.solid
                      : BorderStyle.none,
                ),
                color: instagramBloc.viewState == viewState
                    ? colorScheme.onBackground.withOpacity(.2)
                    : colorScheme.onPrimary.withOpacity(.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                '$modeNumber',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            nameMode,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _SettingsSwitcher extends StatelessWidget {
  const _SettingsSwitcher({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: FittedBox(
              child: Text(
                label,
                maxLines: 1,
                textAlign: TextAlign.right,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              onChanged(!value);
            },
            child: AnimatedContainer(
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              width: 50,
              padding: const EdgeInsets.all(3),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              decoration: BoxDecoration(
                color: value ? Colors.white38 : Colors.black12,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
