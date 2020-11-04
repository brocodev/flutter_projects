import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_projects/medical_appointment/models/md_patient.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = 45.0;
    return SafeArea(
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: height,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white38,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  suffixIcon: Icon(Icons.search, color: Colors.white70),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  hintStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: height,
            height: height,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      MedicalPatient.currentPatient.photoUrl),
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
