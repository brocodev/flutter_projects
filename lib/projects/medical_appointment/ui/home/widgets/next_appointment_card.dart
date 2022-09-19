import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_appointment.dart';
import 'package:flutter_projects/projects/medical_appointment/utils/md_app_colors.dart';
import 'package:flutter_projects/projects/medical_appointment/utils/md_utils.dart';

class NextAppointmentCard extends StatelessWidget {
  const NextAppointmentCard({
    super.key,
    required this.height,
    required this.mdAppointment,
    this.margin,
  });

  final double height;
  final EdgeInsetsGeometry? margin;
  final MedicalAppointment mdAppointment;

  @override
  Widget build(BuildContext context) {
    final doctor = mdAppointment.doctor!;
    return Container(
      width: double.infinity,
      height: height,
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              //---------------------------
              //-----ICON CARD
              //---------------------------
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        doctor.doctorCategory!.iconData,
                        size: height * .4,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mdAppointment.title!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //------------------------------
              //-----APPOINTMENT INFORMATION
              //------------------------------
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildTextRich(
                      title: 'Date',
                      subtitle: MdUtils.formatToTextDate(mdAppointment.date!),
                    ),
                    const Spacer(),
                    //-------------------------------
                    //-----NAME AND PHOTO DOCTOR
                    //-------------------------------
                    Row(
                      children: [
                        _buildTextRich(
                          title: 'Dr. ${doctor.name}',
                          subtitle: doctor.doctorCategory!.nameCategory,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white60, width: 3),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                CachedNetworkImageProvider(doctor.photoUrl!),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
          //-----------------------------
          //-----HOUR DATE
          //-----------------------------
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20)),
              ),
              child: Text(
                MdUtils.extractHourDate(mdAppointment.date!),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: MdAppColors.kDarkBlue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Text _buildTextRich({String? title, String? subtitle}) {
    return Text.rich(
      TextSpan(
        text: '$title \n',
        children: [
          TextSpan(
            text: subtitle,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
