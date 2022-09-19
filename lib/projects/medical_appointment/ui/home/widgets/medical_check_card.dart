import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_check.dart';
import 'package:flutter_projects/projects/medical_appointment/utils/md_app_colors.dart';
import 'package:flutter_svg/svg.dart';

class MedicalCheckCard extends StatelessWidget {
  const MedicalCheckCard({
    super.key,
    required this.medicalCheck,
  });

  final MedicalCheck medicalCheck;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.1),
                blurRadius: 10,
                offset: const Offset(-3, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: SvgPicture.asset(medicalCheck.getSvgPath()!),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      medicalCheck.check.toString().split('.')[1],
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      '${medicalCheck.value.toString()} '
                      '${medicalCheck.getMeasure()}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MdAppColors.kLightCyan,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: _getMedicalStateColor(medicalCheck.getMedicalState()),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Text(
              medicalCheck.getMedicalState().toString().split('.')[1],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }

  Color? _getMedicalStateColor(MedicalState medicalState) {
    return {
      MedicalState.normal: Colors.lightGreenAccent[700],
      MedicalState.alert: Colors.amberAccent[700],
      MedicalState.danger: Colors.redAccent[700],
    }[medicalState];
  }
}
