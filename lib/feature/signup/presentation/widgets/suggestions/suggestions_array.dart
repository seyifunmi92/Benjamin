import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/text/itext.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
// ignore_for_file: must_be_immutable


class SuggestionsArray extends StatelessWidget {
  String e;
  SuggestionsArray(this.e, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customText(
          value: e,
          fontSize: 10.f,
        ),
        SizedBox(
          height: 5.h,
        ),
        Divider(
          height: 0,
          color: context.textprimary.withOpacity(.1),
        )
      ],
    );
  }
}
