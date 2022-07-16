import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/projects/instagram_redesign/theme/themes.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/screens/navigation/instagram_navigation_screen.dart';

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InstagramBlocProvider(
      instagramBloc: InstagramBloc(),
      child: const _MateApp(),
    );
  }
}

class _MateApp extends StatelessWidget {
  const _MateApp();

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context)!.instagramBloc;
    return AnimatedBuilder(
      animation: instagramBloc,
      builder: (context, child) {
        return MaterialApp(
          title: 'Instagram',
          debugShowCheckedModeBanner: false,
          themeMode: instagramBloc.themeMode,
          darkTheme: InstagramTheme.kDarkTheme,
          theme: InstagramTheme.kLightTheme,
          home: child,
        );
      },
      child: const InstagramNavigationScreen(),
    );
  }
}
