import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/models/categories.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 175,
      scrollDirection: Axis.horizontal,
      itemCount: Category.listCategories.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      itemBuilder: (context, index) {
        final category = Category.listCategories[index];
        return Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [
                category.color,
                category.color.withOpacity(.7)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Stack(
            children: <Widget>[
              Positioned(
                  bottom: -30,
                  left: -20,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white12,
                  )),
              Positioned(
                left: 10,
                top: 15,
                bottom: 15,
                right: 10,
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          category.iconCategory,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            category.categoryName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Doctors  ${category.doctors}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Specialist  ${category.specialists}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
