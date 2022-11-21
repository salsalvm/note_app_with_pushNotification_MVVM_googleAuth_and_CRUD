import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import '../styles.dart';
//this class contain form field  refactor in each custom form field is an instance of this class
//its form with help of constructor
// incuding validator , field styles

class CustomFormfield extends StatelessWidget {
  const CustomFormfield(
      {super.key,
      required this.name,
      required this.controller,
      required this.validator,
      this.size = 20,
      this.inputTextColor,
      this.fontSize,
      this.obscureText = false,
      this.focusNode,
      this.suffix,
      this.widget,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      this.textInputAction = TextInputAction.next,
      this.onChanged});
  final String name;
  final double size;
  final double? fontSize;
  final Color? inputTextColor;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final Widget? widget;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: KStyle.content(
        letterSpace: .4,
        size: 13,
      ),
      obscureText: obscureText,
      inputFormatters: inputFormatters,

      keyboardType: keyboardType,
//inputs
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: widget,
        suffixIcon: suffix,
        hintText: name,
        hintStyle: KStyle.content(color: KColors.kGrey, size: 13),
        contentPadding: EdgeInsets.only(left: 20, top: 10),
        // labelText: name,

        fillColor: KColors.kGrey.withOpacity(.08),
        focusColor: KColors.kMuted.withOpacity(0.3),
        filled: true,
//border elements like error border, focus border  and enable border
//it include radius and border color
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColors.kMuted.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColors.kMuted.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColors.kMuted.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),

//error  view
        errorMaxLines: 1,
        errorStyle: KStyle.content(
            color: KColors.kError.withOpacity(.9),
            size: 10,
            lineHeight: 0.1,
            letterSpace: .4),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColors.kError.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColors.kError.withOpacity(0.5),
          ),
          gapPadding: 2,
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      //it is a focus node like submit a field after going to next feild
      //help of this parameter
      focusNode: focusNode,
      onChanged: onChanged, textInputAction: textInputAction,
    );
  }
}
