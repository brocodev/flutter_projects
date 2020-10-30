import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/ui/home/home_page.dart';
import 'package:flutter_projects/medical_appointment/utils/md_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: MdAppColors.kBlue,
          accentColor: Colors.pinkAccent,
          primaryColorLight: MdAppColors.kLightBlue,
          primaryColorDark: MdAppColors.kDarkBlue,
          textTheme: GoogleFonts.poppinsTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: [
          MedicalHomePage(),
          Scaffold(body: Text("Doctors")),
          Scaffold(body: Text("History")),
          Scaffold(body: Text("Urgency")),
        ][indexPage],
      ),
    );
  }
}
