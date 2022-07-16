import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_doctor.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_doctor_category.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_patient.dart';
import 'package:flutter_projects/projects/medical_appointment/ui/home/widgets/home_widgets.dart';
import 'package:flutter_projects/projects/medical_appointment/utils/md_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalHomePage extends StatefulWidget {
  const MedicalHomePage({super.key});

  @override
  MedicalHomePageState createState() => MedicalHomePageState();
}

class MedicalHomePageState extends State<MedicalHomePage> {
  bool expandAppointment = false;
  bool showAppointmentDetails = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const expandDuration = Duration(milliseconds: 400);
    final heightCurtain = (size.width * .75).clamp(310.0, 340.0);
    final nextAppointment = MedicalAppointment.nextAppointment;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //-----------------------------------
          //----BOTTOM BODY ITEMS
          //-----------------------------------
          _BodyHome(
            contentPadding: EdgeInsets.only(top: heightCurtain - 20),
          ),
          //-----------------------------------
          //----TOP BODY WIDGETS
          //-----------------------------------
          AnimatedPositioned(
            duration: expandDuration,
            curve: Curves.fastOutSlowIn,
            top: 0,
            left: 0,
            right: 0,
            height: expandAppointment ? heightCurtain + 280 : heightCurtain,
            child: CustomPaint(
              painter: TonguePainter(curveRadius: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  //---------------------------------------------
                  //------SEARCH BUTTON AND USER IMAGE
                  //---------------------------------------------
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SearchAppBar(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      'Your next appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //----------------------------------
                  //-----NEXT APPOINTMENT CARD
                  //----------------------------------
                  NextAppointmentCard(
                    height: heightCurtain - 175,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    mdAppointment: nextAppointment,
                  ),
                  //--------------------------------
                  //------NEXT APPOINTMENT DETAILS
                  //--------------------------------
                  AnimatedSwitcher(
                    duration: kThemeAnimationDuration,
                    child: showAppointmentDetails
                        ? GestureDetector(
                            onVerticalDragUpdate: (details) {
                              if (details.primaryDelta! < -7) {
                                setState(() {
                                  showAppointmentDetails = false;
                                });
                                Future.delayed(kThemeAnimationDuration, () {
                                  setState(() {
                                    expandAppointment = false;
                                  });
                                });
                              }
                            },
                            child: AppointmentDetails(
                              mdAppointment: nextAppointment,
                            ),
                          )
                        : const SizedBox(),
                  ),
                  const Spacer(),
                  Center(
                    child: IconButton(
                      onPressed: () => _onTapExpandButton(expandDuration),
                      icon: Icon(
                        expandAppointment
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.white70,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onTapExpandButton(Duration animationDuration) {
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
      Future.delayed(animationDuration, () {
        setState(() {
          showAppointmentDetails = expandAppointment;
        });
      });
    }
  }
}

class _BodyHome extends StatelessWidget {
  const _BodyHome({
    this.contentPadding,
  });
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentPatient = MedicalPatient.currentPatient;
    final sectionStyle = GoogleFonts.poppins(
      fontSize: 18,
      color: MdAppColors.kDarkTeal,
      fontWeight: FontWeight.w600,
    );
    return ListView(
      padding: contentPadding,
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Categories',
            style: sectionStyle,
          ),
        ),
        //------------------------------------------
        //------CATEGORIES LIST
        //------------------------------------------
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.width * .27,
          child: ListView.builder(
            itemExtent: MediaQuery.of(context).size.width * .4,
            scrollDirection: Axis.horizontal,
            itemCount: DoctorCategory.categories.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final category = DoctorCategory.categories[index];
              return CategoryCard(category: category);
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Top doctors',
            style: sectionStyle,
          ),
        ),
        //---------------------------------
        //------TOP DOCTORS LIST
        //---------------------------------
        SizedBox(
          height: 180,
          child: ListView.builder(
            itemExtent: 320,
            physics: const BouncingScrollPhysics(),
            itemCount: Doctor.listTopDoctor.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final doctor = Doctor.listTopDoctor[index];
              return TopDoctorCard(doctor: doctor);
            },
          ),
        ),
        //--------------------------------------------
        //------LAST MEDICAL CHECK
        //--------------------------------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text.rich(
            TextSpan(
              text: 'Last medical check',
              children: [
                TextSpan(
                  text: ' (2020 - Ago - 12)',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            style: sectionStyle,
          ),
        ),
        //--------------------------------------------
        //------LAST MEDICAL CHECK GRID
        //--------------------------------------------
        SizedBox(
          height: size.width * 1.1,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 10 / 4.5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            itemCount: currentPatient.medicalChecks!.length,
            itemBuilder: (context, index) {
              final medicalCheck = currentPatient.medicalChecks![index];
              return MedicalCheckCard(medicalCheck: medicalCheck);
            },
          ),
        )
      ],
    );
  }
}
