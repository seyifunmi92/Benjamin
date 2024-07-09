import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/text/itext.dart';
import 'package:benjamin/core/managers/color_manager/colorhelper.dart';
// ignore_for_file: camel_case_types, must_be_immutable

class customButton extends StatelessWidget {
  void Function()? onTap;
  String? title;
  customButton({super.key, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff002433), elevation: 2),
        child: customText(
          value: title ?? "Submit",
          fontColor: ColorHelper.white,
        ));
  }
}
