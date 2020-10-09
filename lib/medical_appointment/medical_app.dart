import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/pages/home/home_page.dart';
import 'package:flutter_projects/medical_appointment/utils/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.kBlue,
          accentColor: Colors.pinkAccent,
          primaryColorLight: AppColors.kLightBlue,
          primaryColorDark: AppColors.kDarkBlue,
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
      body: Stack(
        children: <Widget>[
          [
            MedicalHomePage(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
          ][indexPage],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: kToolbarHeight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (i) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          indexPage = i;
                        });
                      },
                      child: _ItemNavigation(
                        indexPage: indexPage,
                        itemValue: i,
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ItemNavigation extends StatelessWidget {
  const _ItemNavigation({
    Key key,
    @required this.indexPage,
    @required this.itemValue,
  }) : super(key: key);

  final int indexPage;
  final int itemValue;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      height: kToolbarHeight / 1.5,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: itemValue == indexPage ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: Icon(
              [
                Icons.home,
                FontAwesomeIcons.userMd,
                Icons.history,
                Icons.notifications_none,
              ][itemValue],
              color:
                  itemValue == indexPage ? Colors.blue[700] : Colors.grey[400],
            ),
          ),
          const SizedBox(width: 3),
          Center(
            child: AnimatedDefaultTextStyle(
              duration: kThemeAnimationDuration,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[700],
                  fontSize: itemValue == indexPage ? 14.0 : 0.0),
              child: Text(['Home', 'Doctors', 'History', 'Urgency'][itemValue]),
            ),
          ),
        ],
      ),
    );
  }
}
