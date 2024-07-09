import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';

// ignore: must_be_immutable
class IFormField extends StatelessWidget {
  IFormField(this.context, {this.controller, this.secondPrefix, this.focus, this.onEditComplete, this.onT, this.inFieldColor, this.enableSuggestion = true, this.isReadonly = false, this.showprefix = false, this.showSuffix = false, this.autovalidateMode, this.onchanged, this.onSubmit, this.validator, this.key, this.title, this.isnext = true, this.isInt = false, this.isObscure = false, this.autocorrect = false, this.textType, this.obscureFunction, this.pIcon, this.sIcon, this.maxlength, this.maxlines, this.iconColor, this.inputFormatter, this.suffix});
  BuildContext context;
  TextEditingController? controller;
  FocusNode? focus;
  void Function()? onEditComplete;
  void Function()? onT;
  Color? inFieldColor;
  bool enableSuggestion;
  bool isReadonly;
  bool showprefix;
  bool showSuffix;
  AutovalidateMode? autovalidateMode;
  void Function(String)? onchanged;
  void Function(String)? onSubmit;
  String? Function(String?)? validator;
  Key? key;
  String? title;
  bool isnext;
  bool isInt;
  bool isObscure;
  bool autocorrect;
  Widget? suffix;
  Widget? secondPrefix;
  TextInputType? textType;
  void Function()? obscureFunction;
  IconData? pIcon;
  IconData? sIcon;
  int? maxlength;
  int? maxlines;
  Color? iconColor;
  List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      enableSuggestions: enableSuggestion,
      style: TextStyle(
        fontFamily: "Josefin",
        fontSize: 10.f,
        color: inFieldColor,
      ),
      onEditingComplete: onEditComplete,
      onChanged: onchanged,
      key: key,
      onTap: onT,
      readOnly: isReadonly == true ? true : false,
      focusNode: focus,
      onFieldSubmitted: onSubmit,
      controller: controller,
      validator: validator,
      maxLength: maxlength,
      maxLines: maxlines,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: context.primaryColor.withOpacity(.6), fontFamily: "josefin"),
        suffixStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 15.f,
          color: context.primaryColor,
        ),
        suffix: suffix,
        prefixIcon: showprefix == true
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Icon(
                  pIcon,
                  color: context.primaryColor,
                ),
              )
            : secondPrefix,
        labelText: title,
        labelStyle: TextStyle(
          fontFamily: "josefin",
          color: context.primaryColor,
          fontSize: 10.f,
        ),
        floatingLabelStyle: TextStyle(
          color: context.primaryColor,
          fontFamily: "josefin",
          fontSize: 10.f,
        ),
        suffixIcon: showSuffix == true
            ? Padding(
                padding: const EdgeInsets.only(right: 0),
                child: InkWell(
                  onTap: obscureFunction,
                  child: Icon(
                    sIcon,
                    size: 19,
                    color: iconColor ?? null,
                  ),
                ),
              )
            : null,
        counterText: "",
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: context.primaryColor.withOpacity(.1))),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red.withOpacity(.5), style: BorderStyle.solid)),
        contentPadding: const EdgeInsets.fromLTRB(8, 18, 8, 18),
        isCollapsed: true,
      ),
      textInputAction: isnext ? TextInputAction.next : TextInputAction.done,
      keyboardType: isInt ? TextInputType.number : TextInputType.emailAddress,
      obscureText: isObscure ? true : false,
    );
  }
}
