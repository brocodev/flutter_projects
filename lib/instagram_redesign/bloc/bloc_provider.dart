import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/instagram_bloc.dart';
export 'package:flutter_projects/instagram_redesign/bloc/instagram_bloc.dart';

class InstagramBlocProvider extends InheritedWidget {
  const InstagramBlocProvider({
    Key key,
    @required this.instagramBloc,
    @required this.child,
  }) : super(key: key, child: child);

  final InstagramBloc instagramBloc;
  @override
  // ignore: overridden_fields
  final Widget child;

  static InstagramBlocProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InstagramBlocProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
