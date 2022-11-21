import 'package:flutter/material.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.iconColor,
    required this.titleColor,
  }) : super(key: key);
  final Color iconColor;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.canPop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: iconColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text(
            KString.myNotes,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 13, 93, 159),
            ),
          ),
        ),
      ],
    );
  }
}
