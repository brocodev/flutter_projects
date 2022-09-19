import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_user.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BottomTabViewProfile extends StatefulWidget {
  const BottomTabViewProfile({
    super.key,
    required this.user,
  });

  final IgUser user;

  @override
  BottomTabViewProfileState createState() => BottomTabViewProfileState();
}

class BottomTabViewProfileState extends State<BottomTabViewProfile>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = widget.user;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: TabBar(
        labelColor: colorScheme.onBackground,
        unselectedLabelColor: colorScheme.onBackground.withOpacity(.3),
        controller: _tabController,
        indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
        tabs: const [
          Tab(icon: Icon(Icons.widgets)),
          Tab(icon: Icon(Icons.ondemand_video)),
          Tab(icon: Icon(Feather.tv)),
          Tab(icon: Icon(Icons.contacts)),
          Tab(icon: Icon(Feather.link)),
          Tab(icon: Icon(Icons.bookmark_border)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          //----------------------------
          //----PHOTOS TAB VIEW
          //----------------------------
          StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            physics: const BouncingScrollPhysics(),
            itemCount: user.listPhotosUrl!.length,
            padding: const EdgeInsets.only(bottom: 76),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            itemBuilder: (BuildContext context, int index) {
              return CachedNetworkImage(
                imageUrl: user.listPhotosUrl![index],
                fit: BoxFit.cover,
              );
            },
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(index == 0 ? 2 : 1, index == 0 ? 2 : 1),
          ),

          const Center(child: Text('Videos')), //---VIDEOS
          const Center(child: Text('Streams')), //---STREAMS
          const Center(child: Text('Friends')), //---CONTACTS

          //-------------------------------------
          //------EXTERNAL PLATFORMS GRID VIEW
          //-------------------------------------
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 10 / 2.8,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(15, 15, 10, 76),
            itemCount: user.externalPlatforms.length,
            itemBuilder: (context, index) {
              final externalPlatform = user.externalPlatforms[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(externalPlatform.imagePath!),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    color: externalPlatform.haveDarkImage!
                        ? Colors.white
                        : Colors.black,
                    icon: const Icon(Icons.launch),
                  ),
                ),
              );
            },
          ), //---LINKS
          const Center(child: Text('Saved')), //---SAVED
        ],
      ),
    );
  }
}
