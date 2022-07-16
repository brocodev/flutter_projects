import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const currentUser = IgUser.kevin;
    final instagramBloc = InstagramBlocProvider.of(context)!.instagramBloc;

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      leadingWidth: 80,
      leading: IconButton(
        onPressed: instagramBloc.showSettings,
        icon: const Icon(Feather.settings),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentUser.username!,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down)
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Feather.menu),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
