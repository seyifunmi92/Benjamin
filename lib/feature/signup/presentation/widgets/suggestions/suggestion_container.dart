import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/padding/pad.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
import 'package:benjamin/feature/signup/presentation/widgets/suggestions/suggestions_array.dart';
// ignore_for_file: must_be_immutable


class SuggestionContainer extends StatelessWidget {
  List<dynamic> e;
  SuggestionContainer(this.e, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.secondaryColor, borderRadius: BorderRadius.circular(20)),
      child: Pad(
        child: Column(
          children: [
            ...e.map((e) => SuggestionsArray(e)),
          ],
        ),
      ),
    );
  }
}
