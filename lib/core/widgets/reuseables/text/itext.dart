import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
// ignore_for_file: camel_case_types

// ignore: must_be_immutable
class customText extends StatelessWidget {
  String value;
  TextStyle? textStyle;
  double? fontSize;
  FontWeight? fontWeight;
  String? fontFamily;
  double? letterSpacing;
  bool? softWrap;
  TextOverflow? overflow;
  Color? fontColor;
  TextAlign? align;
  TextDecoration? decoration;
  double? textHeight;

  customText({super.key, required this.value, this.textStyle, this.textHeight, this.fontSize, this.fontWeight, this.fontFamily, this.letterSpacing, this.softWrap, this.overflow, this.fontColor, this.align, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: textStyle ??
          TextStyle(
            height: textHeight,
            decoration: decoration,
            fontSize: fontSize ?? 10.f,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontFamily: fontFamily ?? "josefin",
            letterSpacing: letterSpacing,
            color: fontColor ?? context.primaryColor,
          ),
      softWrap: softWrap,
      overflow: overflow,
      textAlign: align ?? TextAlign.center,
    );
  }
}
