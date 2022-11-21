import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes_with_firebase_mvvm/res/asset/images.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/utils/routes/routes_name.dart';
import 'package:my_notes_with_firebase_mvvm/view/splash_screen.dart';
import 'package:my_notes_with_firebase_mvvm/res/components/action_button.dart';
import 'package:my_notes_with_firebase_mvvm/view/widgets/scaffold_back_ground.dart';
import 'package:my_notes_with_firebase_mvvm/view_model/authentication_controller.dart';

import '../res/colors.dart';

class ScreenLanding extends StatefulWidget {
  const ScreenLanding({super.key});

  @override
  State<ScreenLanding> createState() => _ScreenLandingState();
}

class _ScreenLandingState extends State<ScreenLanding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.kWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ScaffoldBackGroundStyle(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionButton(
                      color: KColors.kWhite.withOpacity(0.8),
                      buttonWidth: size.width * 0.43,
                      buttonHeight: size.height * 0.05,
                      widget: Text(KString.login, style: KStyle.title()),
                      onTap: () {
                        Navigator.pushNamed(context, KRoutesName.login);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ActionButton(
                      color: KColors.kWhite.withOpacity(0.8),
                      buttonWidth: size.width * 0.43,
                      buttonHeight: size.height * 0.05,
                      widget: Text(KString.signup, style: KStyle.title()),
                      onTap: () {
                        Navigator.pushNamed(context, KRoutesName.signup);
                      },
                    ),
                  ],
                ),
                ActionButton(
                  color: KColors.kWhite.withOpacity(0.8),
                  buttonWidth: size.width,
                  buttonHeight: size.height * 0.07,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                            image: AssetImage(KImages.googleLogo),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(KString.googleAuthButton, style: KStyle.title()),
                    ],
                  ),
                  onTap: () {
                    authController.googleAuthentication(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AuthController authController = Get.put(AuthController());
}
