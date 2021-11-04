import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:flutter_projects/projects/movie_selection/models/billboard.dart';
import 'package:flutter_projects/projects/movie_selection/ui/home/widgets/billboard_list.dart';
import 'package:flutter_projects/projects/movie_selection/ui/home/widgets/header_option.dart';

class MovieHome extends StatelessWidget {
  MovieHome({Key? key}) : super(key: key);

  final resizeNotifier = ValueNotifier<double>(0);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightAppBar = size.height * .15;
    final resizeValue = heightAppBar * .4;
    final billboardList = Billboard.billboardList;

    resizeNotifier.value = heightAppBar;
    _scrollController.addListener(() {
      if (_scrollController.offset < resizeValue) {
        resizeNotifier.value = heightAppBar - _scrollController.offset;
      }
    });
    return Scaffold(
        backgroundColor: kPrimaryColorDark,
        body: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: billboardList.length,
              padding: EdgeInsets.only(top: heightAppBar + 10),
              itemBuilder: (context, index) {
                return BillboardList(billboard: billboardList[index]);
              },
            ),
            ValueListenableBuilder<double>(
              valueListenable: resizeNotifier,
              builder: (context, value, child) {
                return SizedBox(
                  height: value,
                  width: double.infinity,
                  child: child,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColorHeavy,
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColorDark.withOpacity(.4),
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Row(children: const [
                  HeaderOption(
                    title: "Cinema",
                    isSelected: false,
                  ),
                  HeaderOption(
                    title: "Movie",
                    isSelected: true,
                  ),
                  HeaderOption(
                    title: "Time",
                    isSelected: false,
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
