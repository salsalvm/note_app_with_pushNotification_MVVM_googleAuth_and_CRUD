import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/components/custom_form_field.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/utils/utils.dart';
import 'package:my_notes_with_firebase_mvvm/view/login_screen.dart';
import 'package:my_notes_with_firebase_mvvm/res/components/action_button.dart';
import 'package:my_notes_with_firebase_mvvm/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          const SizedBox(
            height: 5,
          ),
          const MainAppBar(
              iconColor: KColors.kBlack, titleColor: KColors.kBlack),
          SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(KString.signup, style: KStyle.heading()),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFormfield(
                        name: KString.userFormField,
                        widget: const Icon(Icons.person),
                        controller: nameController,
                        validator: (name) {
                          if (!GetUtils.isUsername(name!)) {
                            return KString.errorName;
                          }
                          if (name.toString().isEmpty) {
                            return KString.errorEmptyName;
                          }
                          return null;
                        },
                      ),
                      const Divider(),
                      CustomFormfield(
                          name: KString.emailFormField,
                          widget: const Icon(Icons.mail),
                          controller: mailController,
                          validator: (mail) {
                            if (!GetUtils.isEmail(mail!)) {
                              return KString.errorEmptyMail;
                            }
                            if (mail.toString().isEmpty) {
                              return KString.errorMail;
                            }
                            return null;
                          }),
                      const Divider(),
                      CustomFormfield(
                        obscureText: true,
                        name: KString.passwordFormField,
                        widget: const Icon(Icons.password),
                        controller: passwordController,
                        validator: (pass) {
                          if (pass.toString().length < 6) {
                            return KString.errorEmptyPassword;
                          }
                          if (pass.toString().isEmpty) {
                            return KString.errorPassword;
                          }
                          return null;
                        },
                      ),
                      const Divider(),
                      CustomFormfield(
                        name: KString.mobileFormField,
                        widget: const Icon(Icons.phone),
                        controller: mobileController,
                        validator: (phone) {
                          if (!GetUtils.isPhoneNumber(phone!)) {
                            return KString.errorEmptyMail;
                          }
                          if (phone.toString().isEmpty) {
                            return KString.errorMail;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(KString.rememberMe, style: KStyle.title())
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(KString.cAlreadyAccount),
                    TextButton(
                      onPressed: () {
                        Get.off(
                          ScreenLogin(),
                        );
                      },
                      child: Text(KString.login, style: KStyle.title()),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ActionButton(
                  widget: Text(KString.registerButton, style: KStyle.title()),
                  color: KColors.kWarnning,
                  onTap: () {
                    signUpButtonPressed(context);
                  },
                  radius: 5,
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  void signUpButtonPressed(BuildContext context) {
    final mail = mailController.text.trim();
    final password = passwordController.text.trim();
    final mobile = mobileController.text.trim();
    final name = nameController.text.trim();
    final place = placeController.text.trim();
    if (mail.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        mobile.isEmpty ||
        place.isEmpty) {
      KUtils.snackBarError('''  'fill the field',
          'Every Fields Are Required',''', context);
      return;
    } else {}
  }

  TextEditingController mailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
}
