import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/padding/pad.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
import 'package:benjamin/core/widgets/reuseables/appbar/iappbar.dart';
import 'package:benjamin/core/managers/singleton_manager/imanagers.dart';
import 'package:benjamin/core/widgets/reuseables/button/elevatedbutton.dart';
import 'package:benjamin/feature/signup/data/data_sources/data_repository.dart';
import 'package:benjamin/core/widgets/reuseables/formfields/customformfield.dart';
import 'package:benjamin/feature/signup/presentation/widgets/suggestions/suggestion_container.dart';
// ignore_for_file: prefer_is_not_empty

// ignore_for_file: prefer_const_constructors

class Benjamin extends StatefulWidget {
  const Benjamin({super.key});

  @override
  State<Benjamin> createState() => _BenjaminState();
}

class _BenjaminState extends State<Benjamin> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.scaffold,
        appBar: IAppBar(),
        body: Pad(
          child: Form(
            key: Imanagers.validatorimpl.formKey,
            child: Column(
              children: [
                20.h.spaceH,
                IFormField(
                  context,
                  title: "Street Address",
                  onT: () {},
                  validator: (s) => Imanagers.validatorimpl.onValidate(Imanagers.autocompleteimpl.street1.text, "Street Address"),
                  onchanged: (s) async {
                    await Imanagers.autocomplete.updateShowAutocompleteContainer(s);
                    Imanagers.autocompleteimpl.showSuggestionsStreet1 ? await Imanagers.autocomplete.updateAutocompleteData(s) : null;
                    setState(() {});
                  },
                  controller: Imanagers.autocompleteimpl.street1,
                ),
                20.h.spaceH,
                Imanagers.autocompleteimpl.showSuggestionsStreet1 ? 0.h.spaceH : 20.h.spaceH,
                Imanagers.autocompleteimpl.showSuggestionsStreet1 && !Imanagers.autocompleteimpl.response.isEmpty
                    ? SuggestionContainer(
                        Imanagers.autocompleteimpl.response,
                        onComplete: () {
                          Imanagers.autocompleteimpl.setShowAutocomplete(false);
                          setState(() {});
                        },
                      )
                    : 0.h.spaceH,
                IFormField(
                  context,
                  title: "Street Address Line 2",
                  onT: () {},
                  validator: (s) => Imanagers.validatorimpl.onValidate(Imanagers.autocompleteimpl.street2.text, "Street Address Line 2"),
                  controller: Imanagers.autocompleteimpl.street2,
                ),
                20.h.spaceH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (context.getWidth() / 2) - 13.w,
                      child: IFormField(
                        context,
                        title: "City",
                        validator: (s) => Imanagers.validatorimpl.onValidate(Imanagers.autocompleteimpl.city.text, "City"),
                        controller: Imanagers.autocompleteimpl.city,
                      ),
                    ),
                    SizedBox(
                      width: (context.getWidth() / 2) - 13.w,
                      child: IFormField(
                        context,
                        title: "Zip",
                        validator: (s) => Imanagers.validatorimpl.onValidate(Imanagers.autocompleteimpl.zip.text, "Zip"),
                        controller: Imanagers.autocompleteimpl.zip,
                      ),
                    ),
                  ],
                ),
                20.h.spaceH,
                IFormField(
                  context,
                  title: "State",
                  validator: (s) => Imanagers.validatorimpl.onValidate(Imanagers.autocompleteimpl.state.text, "State"),
                  controller: Imanagers.autocompleteimpl.state,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: customButton(
          onTap: () => Imanagers.validatorimpl.validateForm(),
        ),
      );
}
