import 'package:flutter/material.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
// ignore_for_file: prefer_final_fields

abstract class AutocompleteHandler {
//update auto complete list
  updateAutocompleteData(List<dynamic> e, String value);

  Future<void> updateShowAutocompleteContainer(String value);

  Future<String> updateSelectedField(String value);
}

///implement auto complete handler class
class AutoCompleteHandlerImpl implements AutocompleteHandler {
  AutoCompleteHandlerImpl._internal();
  static AutoCompleteHandlerImpl instance = AutoCompleteHandlerImpl._internal();

  List<dynamic> _autocompletedata = [];

  List<dynamic> get autocompletedata => _autocompletedata;

  TextEditingController _street1 = TextEditingController();

  TextEditingController get street1 => _street1;

  bool _showsuggestionsstreet1 = false;

  bool get showSuggestionsStreet1 => _showsuggestionsstreet1;

  TextEditingController _street2 = TextEditingController();

  TextEditingController get street2 => _street2;

  TextEditingController _city = TextEditingController();

  TextEditingController get city => _city;

  TextEditingController _zip = TextEditingController();

  TextEditingController get zip => _zip;

  TextEditingController _state = TextEditingController();

  TextEditingController get state => _state;

  ///update autocompete array
  @override
  updateAutocompleteData(List e, String value) {
    _autocompletedata.clear();
    _autocompletedata.addAll(e);
    _autocompletedata.retainWhere((x) => x.toString().toLowerCase().removeSpaces.startsWith(value.toLowerCase().removeSpaces));
  }

  ///set autocomplete to show after 2 or more values are inputed
  @override
  updateShowAutocompleteContainer(String value) async => await setShowAutocomplete(value.length >= 2 ? true : false);

  setShowAutocomplete(bool value) => _showsuggestionsstreet1 = value;

  setSuggestionsbool() {
    _showsuggestionsstreet1 = false;
  }

  ///update
  @override
  Future<String> updateSelectedField(String value) async {
    _street1.text = value;

    return _street1.text;
  }
}
