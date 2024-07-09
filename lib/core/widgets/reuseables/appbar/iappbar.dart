import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/text/itext.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
import 'package:benjamin/core/managers/color_manager/colorhelper.dart';
// ignore_for_file: must_be_immutable

class IAppBar extends StatelessWidget implements PreferredSizeWidget {
  double? height;
  double? width;
  String? title;
  Widget? titleWidget;
  bool? isCenterTitle;
  void Function()? onTapBack;
  bool? showLeading;
  IconData? leadingIcon;
  bool? showTrailing;
  IconData? showTrailingIcon;
  List? actions;
  Color? color;
  bool showBack;
  IAppBar({
    super.key,
    this.height,
    this.width,
    this.title,
    this.titleWidget,
    this.isCenterTitle,
    this.onTapBack,
    this.showLeading,
    this.leadingIcon,
    this.showTrailing,
    this.showTrailingIcon,
    this.actions,
    this.color,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.8,
      centerTitle: isCenterTitle ?? true,
      toolbarHeight: height ?? 120.h,
      title: customText(
        value: title ?? "Benjamin",
        fontSize: 20.f,
        fontColor: ColorHelper.white,
      ),
      automaticallyImplyLeading: showBack,
      leading: showTrailing == true && !showBack ? Icon(showTrailingIcon) : null,
    );
  }

  @override
  Size get preferredSize => Size(100, height ?? 50.h);
}
