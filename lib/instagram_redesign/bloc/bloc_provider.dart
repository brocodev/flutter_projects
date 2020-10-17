import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/instagram_bloc.dart';
export  'package:flutter_projects/instagram_redesign/bloc/instagram_bloc.dart';

class InstagramBlocProvider extends InheritedWidget {
  final InstagramBloc instagramBloc;
  final Widget child;

  InstagramBlocProvider({
    @required this.instagramBloc,
    @required this.child,
  }) : super(child: child);

  static InstagramBlocProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InstagramBlocProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
