import 'package:flutter/material.dart';

class AppointmentDetailsHome extends StatelessWidget {
  const AppointmentDetailsHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hospital address',
          style: TextStyle(
              color: Colors.white.withOpacity(.9),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 3),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.map,
                size: 40,
                color: Colors.white70,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  "123 Main Street, New York, NY 10030 Kensington Hill",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          'Medical indications',
          style: TextStyle(
              color: Colors.white.withOpacity(.9),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 3),
        ),
        SizedBox(
          height: 90,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        [
                          "Don't eat fast food",
                          "Do not drink alcoholic beverages",
                          'Do not smoke or use tobacco',
                          'Do regular physical activity',
                        ][index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset('assets/img/medical/${[
                      'no-food',
                      'no-drinking',
                      'no-smoking',
                      'fitness'
                    ][index]}.png')
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
