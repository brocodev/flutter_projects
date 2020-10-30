import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/models/medical_check_item.dart';
import 'package:flutter_projects/medical_appointment/utils/md_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalCheckGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 10 / 4,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        itemCount: MedicalCheckItem.listItemCheck.length,
        itemBuilder: (context, index) {
          final medicalCheckItem = MedicalCheckItem.listItemCheck[index];
          return _MedicalCheckItemWidget(medicalCheckItem: medicalCheckItem);
        },
      ),
    );
  }
}

class _MedicalCheckItemWidget extends StatelessWidget {
  const _MedicalCheckItemWidget({
    Key key,
    @required this.medicalCheckItem,
  }) : super(key: key);

  final MedicalCheckItem medicalCheckItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 10,
                offset: Offset(-3, 3)),
          ]),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Positioned(
              top: 0,
              bottom: 0,
              left: 10,
              right: 10,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      medicalCheckItem.pathImage,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    RichText(
                        text: TextSpan(
                            text: medicalCheckItem.title,
                            style: GoogleFonts.poppins(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                          TextSpan(
                              text: "\n${medicalCheckItem.info}",
                              style: TextStyle(
                                color: MdAppColors.kLightBlue,
                              ))
                        ]))
                  ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: _getColorByState(medicalCheckItem.state),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15)
                )),
            child: Text(
              medicalCheckItem.state.toString().split('.')[1],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  _getColorByState(MedicalState state) {
    return {
      MedicalState.Danger: Colors.redAccent,
      MedicalState.Alert: Colors.amberAccent,
      MedicalState.Normal: Colors.lightGreenAccent[700],
    }[state];
  }
}
