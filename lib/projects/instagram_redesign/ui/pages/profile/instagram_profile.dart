import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/home/widgets/instagram_add_story.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/profile/widgets/widgets.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramProfile extends StatelessWidget {
  const InstagramProfile({super.key});

  SizedBox get _gap20 => const SizedBox(height: 20);

  SizedBox get _gap10 => const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    const currentUser = IgUser.kevin;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: const ProfileAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const _ProfileImageHeader(currentUser: currentUser),
                _gap10,
                const _UserProfileNameRow(currentUser: currentUser),
                const _UserDescription(),
                _gap10,
                const _ProfileOptionsButtons(),
                _gap20,
                const _OutstandingListView(currentUser: currentUser),
                _gap20,
                const Divider(height: 2),
              ],
            ),
          ),
          const SliverFillRemaining(
            child: BottomTabViewProfile(user: currentUser),
          )
        ],
      ),
    );
  }
}

class _OutstandingListView extends StatelessWidget {
  const _OutstandingListView({
    required this.currentUser,
  });

  final IgUser currentUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        itemCount: currentUser.collections!.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final igCollection = currentUser.collections![index];
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(right: 15),
              child: InstagramAddItem(itemSize: 70, label: 'New'),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedBorderImage(
                  imageUrl: igCollection.iconImage,
                  borderColor: Colors.transparent,
                  height: 70,
                ),
                Text(
                  igCollection.title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileOptionsButtons extends StatelessWidget {
  const _ProfileOptionsButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        const selectedIndex = 2;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: index == selectedIndex
                    ? Colors.lightBlue
                    : Colors.grey[100],
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: Text(
                ['Edit profile', 'Statistics', 'Contact'][index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      index == selectedIndex ? Colors.white : Colors.grey[800],
                ),
              ),
            ),
          ),
        );
      })
        ..insert(0, const SizedBox(width: 10))
        ..add(const SizedBox(width: 10)),
    );
  }
}

class _UserDescription extends StatelessWidget {
  const _UserDescription();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'I like to travel and program different types of '
              'applications with Flutter, doctors me in my GitHub'
              ' or Facebook like',
          style: GoogleFonts.lato(color: Colors.grey),
          children: const [
            TextSpan(
              text: ' @brocodev',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UserProfileNameRow extends StatelessWidget {
  const _UserProfileNameRow({
    required this.currentUser,
  });

  final IgUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            currentUser.name!,
            textAlign: TextAlign.right,
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '|',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.3),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            currentUser.typeUser!,
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageProfile extends StatelessWidget {
  const _ImageProfile({
    required this.imageProfileUrl,
  });

  final String? imageProfileUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: IgUserBorderImage(height: 80, imageUrl: imageProfileUrl),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.purpleAccent,
                Colors.orangeAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.add,
            size: 18,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class _ProfileImageHeader extends StatelessWidget {
  const _ProfileImageHeader({required this.currentUser});

  final IgUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IgTitleSubtitleText(
          title: currentUser.following.toString(),
          subtitle: 'Following',
          height: 2,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        const SizedBox(width: 20),
        Stack(
          alignment: const Alignment(.7, -.8),
          children: [
            _ImageProfile(imageProfileUrl: currentUser.photoUrl),
          ],
        ),
        const SizedBox(width: 20),
        IgTitleSubtitleText(
          title:
              '${(currentUser.followers! / 1000).toString().substring(0, 4)}K',
          subtitle: 'Followers',
          height: 2,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ],
    );
  }
}
