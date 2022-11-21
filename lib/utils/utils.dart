import 'package:flutter/material.dart';

import '../res/colors.dart';
// utils class like  recieving some strig. returning show error message or success messages help of snackbar or toast
//in this class example of code re-usability. any messages to reflect our ui to pass here  help of context.

class KUtils {
//---------------snack success mesage message---------------//
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      snackBarSuccess(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: KColors.kSuccess,
        content: Text(message),
      ),
    );
  }

//---------------snack error message---------------//
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      snackBarError(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: KColors.kError,
        content: Text(message),
      ),
    );
  }

//---------------snack error message---------------//
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      snackBarWarning(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: KColors.kWarnning,
        content: Text(message),
      ),
    );
  }

  //---------------formfied submit focus next---------------//
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
