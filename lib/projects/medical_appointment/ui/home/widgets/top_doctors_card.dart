import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_doctor.dart';
import 'package:flutter_projects/projects/medical_appointment/utils/md_app_colors.dart';

class TopDoctorCard extends StatelessWidget {
  const TopDoctorCard({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //--------------------------------------------
        //------LIKE, REVIEWS AND MESSAGE BUTTONS
        //-------------------------------------------
        _WhiteBackground(
          doctor: doctor,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 125,
            child: Stack(
              children: <Widget>[
                //----------------------------------
                //-----BLUE BACKGROUND
                //---------------------------------
                Container(
                  width: 280,
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.only(
                    left: 120,
                    bottom: 5,
                    right: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        MdAppColors.kLightBlue,
                        MdAppColors.kBlue,
                      ],
                    ),
                  ),
                  child: _DoctorInformation(doctor: doctor),
                ),
                //-----------------------------
                //------PNG DOCTOR IMAGE
                //-----------------------------
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: doctor.pngPhotoUrl!,
                      width: 115,
                      height: 115,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white60),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DoctorInformation extends StatelessWidget {
  const _DoctorInformation({
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final countTextStyle = TextStyle(
      color: Colors.white.withOpacity(.8),
      fontWeight: FontWeight.w600,
      height: 1,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //--------------------------------------------
        //------NAME DOCTOR AND SPECIALIZATION
        //--------------------------------------------
        Text(
          'Dr. ${doctor.name}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          doctor.doctorCategory!.nameCategory!,
          style: const TextStyle(
            height: 1,
            color: Colors.white70,
          ),
        ),
        const Spacer(),
        //-----------------------------------------------
        //-----INFORMATION
        //-----------------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //-------------------------------
            //-----PATIENTS COUNT
            //-------------------------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Patients',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  doctor.patients.toString(),
                  style: countTextStyle,
                ),
              ],
            ),
            //-------------------------------
            //-----RATE
            //-------------------------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      doctor.rate.toString(),
                      style: countTextStyle,
                    ),
                    const Icon(
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

class _WhiteBackground extends StatelessWidget {
  const _WhiteBackground({
    required this.doctor,
  });
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
            offset: const Offset(-5, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildIconButton(
            iconData: Icons.favorite,
            label: '${doctor.likes} likes',
          ),
          _buildIconButton(
            iconData: Icons.comment,
            label: '${doctor.comments} comments',
          ),
          _buildIconButton(
            iconData: Icons.send,
            label: 'Message',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required String label,
    required IconData iconData,
    VoidCallback? onTap,
  }) {
    return Row(
      children: [
        Icon(
          iconData,
          color: MdAppColors.kDarkTeal,
          size: 16,
        ),
        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: MdAppColors.kDarkTeal,
          ),
        ),
      ],
    );
  }
}
