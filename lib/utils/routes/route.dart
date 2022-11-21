import 'package:my_notes_with_firebase_mvvm/view/home/home_screen.dart';
import 'package:my_notes_with_firebase_mvvm/view/landing_screen.dart';
import 'package:my_notes_with_firebase_mvvm/view/login_screen.dart';
import 'package:my_notes_with_firebase_mvvm/view/signup_screen.dart';
import 'package:my_notes_with_firebase_mvvm/view/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../res/styles.dart';

import 'routes_name.dart';
//This class is a standerd routing in flutter its work on help of getx packages
//it's a example of push named routing
//easily to handle page routing with help of this private list items
//this private  list name we can get  the help of get variable.

class KRoute {
  //its a generatted routing method we can acces and rout any screen with endpoint name
  //its used to generated paged named parameter
  //its a page routing builder
  //because i want a transition right to left so i choose this method
  //in this below normal generatod method is ther
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      //---splash screen rout
      case KRoutesName.splash:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              const ScreenSplash(),
        );

      //---landing screen rout
      case KRoutesName.landing:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              ScreenLanding(),
        );
      //---login screen rout
      case KRoutesName.login:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              ScreenLogin(),
        );

      //---signup screen rout
      case KRoutesName.signup:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              ScreenSignUp(),
        );

      //---home screen rout
      case KRoutesName.home:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              ScreenHome(),
        );

      //---page not found screen rout
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text(
                  'No route defined',
                  style: KStyle.heading(),
                ),
              ),
            );
          },
        );
    }
  }

// this static method going with right to left annimation in each page rout
//this method calling many
// code re-usability
  static PageRouteBuilder<dynamic> kPageBuilder(
      Widget Function(BuildContext, Animation<double>, Animation<double>)
          pageBuilder) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: pageBuilder,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget? child) {
        const Offset begin = Offset(1.0, 0.0);
        const Offset end = Offset.zero;
        const Cubic curve = Curves.ease;

        final Animatable<Offset> tween =
            Tween<Offset>(begin: begin, end: end).chain(
          CurveTween(
            curve: curve,
          ),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
