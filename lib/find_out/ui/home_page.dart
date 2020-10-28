import 'package:flutter/material.dart';
import 'package:flutter_projects/find_out/models/place.dart';
import 'package:flutter_projects/find_out/ui/widgets/drop_down_widget.dart';
import 'package:flutter_projects/find_out/ui/widgets/common_widgets.dart';
import 'package:flutter_projects/find_out/ui/widgets/page_view_places.dart';

class HomePageFindOut extends StatelessWidget {
  final pageController = PageController(viewportFraction: .999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageViewPlaces(
            places: Place.dumpListData,
            pageController: pageController,
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
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                          )),
                      FindOutHorizontalLogo(),
                      CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropDownWidget(
                        labels: ['Mexico', 'Colombia', 'Brasil', 'Argentina'],
                      ),
                      const SizedBox(width: 50),
                      DropDownWidget(
                        labels: ['Playas', 'Pueblos', 'Ciudades'],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => pageController.previousPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint,
                ),
                iconSize: 50,
                icon: Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                onPressed: () => pageController.nextPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint,
                ),
                iconSize: 50,
                icon: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ],
      ),
    );
  }
}
