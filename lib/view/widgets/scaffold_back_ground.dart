import 'package:flutter/material.dart';
import 'package:my_notes_with_firebase_mvvm/res/asset/images.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';

class ScaffoldBackGroundStyle extends StatelessWidget {
  const ScaffoldBackGroundStyle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(KImages.backgroundLanding), fit: BoxFit.fill)),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(KImages.light1))),
            ),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(KImages.light2))),
            ),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(KImages.clock))),
            ),
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                child: Text(KString.light,
                    style: KStyle.heading(color: KColors.kWhite)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
