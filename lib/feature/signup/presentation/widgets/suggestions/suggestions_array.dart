import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/text/itext.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
// ignore_for_file: must_be_immutable

class SuggestionsArray extends StatelessWidget {
  String e;
  void Function()? oncompleteFunction;

  SuggestionsArray(this.e, this.oncompleteFunction, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: InkWell(
        onTap: oncompleteFunction,
        child: Column(
          children: [
            customText(
              value: e,
              fontSize: 10.f,
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
