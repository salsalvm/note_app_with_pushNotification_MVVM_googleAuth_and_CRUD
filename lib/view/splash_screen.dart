import 'package:my_notes_with_firebase_mvvm/res/asset/images.dart';
import 'package:my_notes_with_firebase_mvvm/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Size size;
String logged = 'login success';
Object? userToken;

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    checkUserLogin(context);
    return Center(
      child: Container(
        height: 450,
        width: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
            image: AssetImage(KImages.splash),
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLogin(context) async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    userToken = sharePref.get(logged);
    if (userToken == false || userToken == null) {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, KRoutesName.landing);
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, KRoutesName.home);
    }
  }
}
