import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/components/custom_form_field.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/utils/utils.dart';
import 'package:my_notes_with_firebase_mvvm/view/signup_screen.dart';
import 'package:my_notes_with_firebase_mvvm/res/components/action_button.dart';
import 'package:my_notes_with_firebase_mvvm/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    height: 130,
                  ),
                  Text(
                    KString.login,
                    style: KStyle.heading(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 10,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomFormfield(
                            name: KString.emailFormField,
                            widget: const Icon(Icons.mail),
                            controller: mailController,
                            validator: (mail) {
                              if (!GetUtils.isEmail(mail!)) {
                                return KString.errorMail;
                              }
                              if (mail.toString().isEmpty) {
                                return KString.errorEmptyMail;
                              }
                              return null;
                            },
                          ),
                          const Divider(),
                          CustomFormfield(
                            obscureText: true,
                            name: KString.passwordFormField,
                            widget: const Icon(Icons.password),
                            controller: passwordController,
                            validator: (pass) {
                              if (pass.toString().length < 6) {
                                return KString.errorPassword;
                              }
                              if (pass.toString().isEmpty) {
                                return KString.errorEmptyPassword;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(KString.rememberMe, style: KStyle.title()),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(KString.forgotPass,
                          style: KStyle.title(
                            decoration: TextDecoration.underline,
                            color: KColors.kWarnning,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(KString.cNoAccount),
                      TextButton(
                        onPressed: () {
                          Get.off(
                            ScreenSignUp(),
                          );
                        },
                        child: Text(
                          KString.signup,
                          style: KStyle.title(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ActionButton(
                    color: const Color(0xffFFC238),
                    widget: Text(KString.submit, style: KStyle.title()),
                    radius: 5,
                    onTap: () {
                      signinButtonPressed(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void signinButtonPressed(BuildContext context) {
    final mail = mailController.text.trim();
    final password = passwordController.text.trim();

    if (mail.isEmpty || password.isEmpty) {
      KUtils.snackBarError('''  'fill the field',
          'Every Fields Are Required',''', context);
      return;
    } else {
      Get.back();
      KUtils.snackBarSuccess('''Success', 'Sign in Successfully''', context);
    }
  }

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
