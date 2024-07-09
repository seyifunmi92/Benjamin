import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
import 'package:benjamin/core/managers/singleton_manager/imanagers.dart';
import 'package:benjamin/core/managers/service_manager/api/network_codes.dart';
import 'package:benjamin/feature/signup/data/repositories/searchrepository.dart';

// ignore_for_file: prefer_final_fields

abstract class AutocompleteHandler {
//update auto complete list
  updateAutocompleteData(String value);

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

  dynamic _response;

  dynamic get response => _response;

  ///update autocompete array
  @override

  ///call api to get search results
  updateAutocompleteData(String value) async {
    var x = await Imanagers.search.getSearchResults();
    x.code == httpStatusCodes.OK ? onSuccessCall(jsonDecode(x.body!), value) : onExceptionCall(x.body!);
  }


///on success response from API
  onSuccessCall(dynamic response, String value) {
    _response = response;
    _response as List<dynamic>;
    _response.retainWhere((x) => x.toString().toLowerCase().removeSpaces.startsWith(value.toLowerCase().removeSpaces));
  }


///handle error
  onExceptionCall(String error) {}

  @override

    ///set autocomplete to show after 2 or more values are inputed
  updateShowAutocompleteContainer(String value) async => await setShowAutocomplete(value.length >= 2 ? true : false);


  setShowAutocomplete(bool value) => _showsuggestionsstreet1 = value;

  @override
    ///update text field after selection
  Future<String> updateSelectedField(String value) async {
    _street1.text = value;
    return _street1.text;
  }
}
