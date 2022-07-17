import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_activity.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/pages/activity/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  ActivitiesPageState createState() => ActivitiesPageState();
}

class ActivitiesPageState extends State<ActivitiesPage> {
  int selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activity',
          style: GoogleFonts.lato(fontSize: 24),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-------------------------------
          //-----TOGGLE BUTTONS LIST
          //-------------------------------
          SizedBox(
            height: 70,
            child: DefaultTabController(
              length: IgTypeActivity.values.length + 1,
              child: TabBar(
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                indicatorColor: Colors.transparent,
                onTap: (value) {
                  setState(() => selectedIndex = value);
                  _pageController!.jumpToPage(value);
                },
                // scrollDirection: Axis.horizontal,
                tabs: List.generate(IgTypeActivity.values.length + 1, (index) {
                  return TypeActivityToggleButton(
                    value: index,
                    selectValue: selectedIndex,
                    notifications: index == 0
                        ? 0
                        : _getLengthActivities(
                            IgTypeActivity.values[index - 1],
                          ),
                    labelButton: index == 0
                        ? 'All activity'
                        : IgTypeActivity.values[index - 1]
                            .toString()
                            .split('.')
                            .last,
                  );
                }),
              ),
            ),
          ),

          //-----------------------------
          //----TEXT ACTIVITIES LENGTH
          //-----------------------------
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              'New (${IgActivity.listActivities.length})',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //--------------------------------
          //----LIST ACTIVITIES
          //--------------------------------
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: IgTypeActivity.values.length + 1,
              itemBuilder: (context, index) {
                final listActivities = selectedIndex == 0
                    ? IgActivity.listActivities
                    : _getActivitiesByType(
                        IgTypeActivity.values[selectedIndex - 1],
                      );

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
                  itemCount: listActivities.length,
                  itemBuilder: (context, index) {
                    final activity = listActivities[index];
                    return ActivityContainer(activity: activity);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getLengthActivities(IgTypeActivity typeActivity) {
    return IgActivity.listActivities
        .where((n) => n.typeNotification == typeActivity)
        .length;
  }

  List<IgActivity> _getActivitiesByType(IgTypeActivity typeActivity) {
    return IgActivity.listActivities
        .where((n) => n.typeNotification == typeActivity)
        .toList();
  }
}
