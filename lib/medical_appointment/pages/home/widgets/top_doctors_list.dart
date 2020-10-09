import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/models/doctor.dart';
import 'package:flutter_projects/medical_appointment/utils/app_colors.dart';

class TopDoctorsList extends StatelessWidget {
  final List<Doctor> listDoctors;

  const TopDoctorsList({Key key, @required this.listDoctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemExtent: 320,
        physics: BouncingScrollPhysics(),
        itemCount: listDoctors.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          final doctor = listDoctors[index];
          return Stack(
            children: <Widget>[
              _BackContainer(doctor: doctor,),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 125,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 280,
                        margin: const EdgeInsets.only(top:40),
                        padding: const EdgeInsets.only(
                            left: 120, right: 10, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              MedicalAppColors.kLightBlue,
                              MedicalAppColors.kBlue,
                            ])),
                        child: _DoctorInformation(doctor: doctor),
                      ),
                      Positioned(
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10)),
                            child: Image.network(
                              doctor.topDoctorImageUrl,
                              width: 110,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DoctorInformation extends StatelessWidget {
  const _DoctorInformation({
    Key key,
    @required this.doctor,
  }) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Dr. ${doctor.name}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          doctor.category,
          style: TextStyle(
            height: 1.0,
            color: Colors.white70,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Patients",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  doctor.patients.toString(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Rate",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      doctor.rate.toString(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    )
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class _BackContainer extends StatelessWidget {
  const _BackContainer({
    Key key,
    @required this.doctor,
  }) : super(key: key);
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.fromLTRB(10, 70, 10, 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 20,
              offset: Offset(-5, 5))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.favorite,
            color: MedicalAppColors.kDarkTeal,
            size: 16,
          ),
          Text(
            " ${doctor.likes} likes",
            style: TextStyle(
              fontSize: 12.5,
              color: MedicalAppColors.kDarkTeal,
             ),
          ),
          const Spacer(),
          Icon(
            Icons.comment,
            color: MedicalAppColors.kDarkTeal,
            size: 16,
          ),
          Text(
            " ${doctor.comments} reviews",
            style: TextStyle(
              fontSize: 12.5,
              color: MedicalAppColors.kDarkTeal,
             ),
          ),
          const Spacer(),
          Icon(
            Icons.send,
            color: MedicalAppColors.kDarkTeal,
            size: 16,
          ),
          Text(
            " Message",
            style: TextStyle(
              fontSize: 12.5,
              color: MedicalAppColors.kDarkTeal,
             ),
          ),
        ],
      ),
    );
  }
}
