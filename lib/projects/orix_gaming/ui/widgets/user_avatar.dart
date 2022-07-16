import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent[100],
                borderRadius: BorderRadius.circular(10),),
          ),
          Image.asset('assets/img/gaming/boy.png')
        ],
      ),
    );
  }
}
