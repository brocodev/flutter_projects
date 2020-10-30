import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/models/md_doctor.dart';
import 'package:flutter_projects/medical_appointment/models/md_doctor_category.dart';
import 'package:flutter_projects/medical_appointment/utils/md_app_colors.dart';
import 'package:flutter_projects/medical_appointment/ui/home/widgets/home_widgets.dart';
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
    final heightCurtain = (size.width * .85).clamp(300.0, 340.0);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //-----------------------------------
          //---BOTTOM BODY ITEMS
          //-----------------------------------
          _BodyHome(
            contentPadding: EdgeInsets.only(top: (heightCurtain) - 20),
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
            height: expandAppointment ? size.width * 1.5 : heightCurtain,
            child: CustomPaint(
              painter: TonguePainter(curveRadius: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  //---------------------------------------------
                  //------SEARCH BUTTON AND USER IMAGE
                  //---------------------------------------------
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const SearchAppBar(),
                  ),

                  const Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                  Container(
                    width: double.infinity,
                    height: heightCurtain - 175,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //--------------------------------
                  //------NEXT APPOINTMENT DETAILS
                  //--------------------------------
                  AnimatedSwitcher(
                    duration: kThemeAnimationDuration,
                    child: showAppointmentDetails
                        ? SizedBox(height: 200, child: Placeholder())
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

  _onTapExpandButton(Duration animationDuration) {
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
    Key key,
    this.contentPadding,
  }) : super(key: key);
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
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
            physics: BouncingScrollPhysics(),
            itemCount: Doctor.listTopDoctor.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final doctor = Doctor.listTopDoctor[index];
              return TopDoctorCard(doctor: doctor);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
        // MedicalCheckGrid()
      ],
    );
  }
}
