import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/models/doctor.dart';
import 'package:flutter_projects/medical_appointment/pages/home/widgets/appointment_details_home.dart';
import 'package:flutter_projects/medical_appointment/pages/home/widgets/appointment_traslucid_card.dart';
import 'package:flutter_projects/medical_appointment/pages/home/widgets/custom_app_bar.dart';
import 'package:flutter_projects/medical_appointment/pages/home/widgets/list_categories.dart';
import 'package:flutter_projects/medical_appointment/pages/home/widgets/medical_check_grid.dart';
import 'package:flutter_projects/medical_appointment/pages/home/widgets/top_doctors_list.dart';
import 'package:flutter_projects/medical_appointment/pages/painters/tongue_painter.dart';
import 'package:flutter_projects/medical_appointment/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalHomePage extends StatefulWidget {
  @override
  _MedicalHomePageState createState() => _MedicalHomePageState();
}

class _MedicalHomePageState extends State<MedicalHomePage> {
  bool expandAppointment = false;
  bool showAppointmentDetails = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final expandDuration = const Duration(milliseconds: 400);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _BodyHome(),
          AnimatedPositioned(
            duration: expandDuration,
            curve: Curves.fastOutSlowIn,
            top: 0,
            left: 0,
            right: 0,
            height: expandAppointment ? size.height * .67 : size.height * .37,
            child: CustomPaint(
              painter: TonguePainter(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    SafeArea(
                      child: CustomAppBar(),
                    ),
                    Text(
                      'Your next appointment',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 3),
                    ),
                    AppointmentTranslucentCard(),
                    AnimatedSwitcher(
                      duration: kThemeAnimationDuration,
                      child: showAppointmentDetails
                          ? AppointmentDetailsHome()
                          : const SizedBox(),
                    ),
                    const Spacer(),
                    Center(
                      child: IconButton(
                        onPressed: () {
                          if (expandAppointment) {
                            setState(() {
                              showAppointmentDetails = !showAppointmentDetails;
                            });
                            Future.delayed(kThemeAnimationDuration, () {
                              setState(() {
                                expandAppointment = showAppointmentDetails;
                              });
                            });
                          } else {
                            setState(() {
                              expandAppointment = !expandAppointment;
                            });
                            Future.delayed(expandDuration, () {
                              setState(() {
                                showAppointmentDetails = expandAppointment;
                              });
                            });
                          }
                        },
                        icon: Icon(
                          expandAppointment
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: size.height * .035,
                          color: Colors.white70,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BodyHome extends StatelessWidget {
  const _BodyHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sectionStyle = GoogleFonts.poppins(
      fontSize: 20,
      color: MedicalAppColors.kDarkTeal,
      fontWeight: FontWeight.w600,
    );
    return ListView(
      padding: EdgeInsets.only(top: 350),
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Categories',
            style: sectionStyle,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 115,
          child: ListCategories(),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Text(
            'Top doctors',
            style: sectionStyle,
          ),
        ),
        TopDoctorsList(listDoctors: Doctor.listTopDoctor),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: RichText(
            text: TextSpan(
                text: 'Last medical check',
                style: sectionStyle,
                children: [
                  TextSpan(
                      text: ' (2020 - Ago - 12)',
                      style: TextStyle(
                          fontSize: sectionStyle.fontSize * .75,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w700))
                ]),
          ),
        ),
        MedicalCheckGrid()
      ],
    );
  }
}
