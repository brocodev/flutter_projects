import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/find_out/models/place.dart';
import 'package:flutter_projects/projects/find_out/ui/screens/home/widgets/drop_down_widget.dart';
import 'package:flutter_projects/projects/find_out/ui/screens/home/widgets/page_view_places.dart';
import 'package:flutter_projects/projects/find_out/ui/widgets/common_widgets.dart';

class FindOutHomeScreen extends StatefulWidget {
  const FindOutHomeScreen({super.key});

  @override
  State<FindOutHomeScreen> createState() => _FindOutHomeScreenState();
}

class _FindOutHomeScreenState extends State<FindOutHomeScreen> {
  late final ValueNotifier<double> _pageValueNotifier;
  late final PageController _pageController;

  void _pageListener() => _pageValueNotifier.value = _pageController.page!;

  @override
  void initState() {
    _pageController = PageController();
    _pageValueNotifier = ValueNotifier<double>(0);
    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageViewPlaces(
            places: Place.dumpListData,
            pageController: _pageController,
            pageValueNotifier: _pageValueNotifier,
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      FindOutHorizontalLogo(),
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      DropDownWidget(
                        labels: ['Mexico', 'Colombia', 'Brasil', 'Argentina'],
                      ),
                      SizedBox(width: 50),
                      DropDownWidget(
                        labels: ['Playas', 'Pueblos', 'Ciudades'],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => _pageController.previousPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint,
                ),
                iconSize: 50,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                onPressed: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint,
                ),
                iconSize: 50,
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ],
      ),
    );
  }
}
