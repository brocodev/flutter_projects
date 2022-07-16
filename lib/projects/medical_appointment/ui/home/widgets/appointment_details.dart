import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_appointment.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({
    super.key,
    required this.mdAppointment,
  });
  final MedicalAppointment mdAppointment;

  @override
  Widget build(BuildContext context) {
    const  whiteSectionStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const  Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'Hospital Address',
            style: whiteSectionStyle,
          ),
        ),
        //--------------------------------------
        //------HOSPITAL ADDRESS CONTAINER
        //--------------------------------------
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 90,
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(10),),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.map,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  mdAppointment.doctor!.mdAddress!.getLongAddress(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'Medical indications',
            style: whiteSectionStyle,
          ),
        ),
        //--------------------------------------------------
        //-----MEDICAL INDICATIONS LIST
        //--------------------------------------------------
        SizedBox(
          height: 90,
          child: ListView.builder(
            itemCount: mdAppointment.medicalIndications!.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final mdIndication = mdAppointment.medicalIndications![index];
              return Container(
                width: 180,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: SvgPicture.asset(
                      mdIndication.svgIconPath!,
                      color: Colors.white,
                    ),),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 2,
                      child: Text(
                        mdIndication.description!,
                        maxLines: 3,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
