import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/padding/pad.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
import 'package:benjamin/core/managers/singleton_manager/imanagers.dart';
import 'package:benjamin/feature/signup/presentation/widgets/suggestions/suggestions_array.dart';
// ignore_for_file: must_be_immutable

class SuggestionContainer extends StatelessWidget {
  List<dynamic> e;
  dynamic onComplete;
  SuggestionContainer(this.e, {super.key, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      decoration: BoxDecoration(color: context.secondaryColor, borderRadius: BorderRadius.circular(20)),
      child: Pad(
        child: Column(
          children: [
            10.h.spaceH,
            ...e.map((e) => SuggestionsArray(e, () {
                  Imanagers.autocompleteimpl.updateSelectedField(e).then((e) {
                    onComplete();
                  });
                })),
          ],
        ),
      ),
    );
  }
}
