import 'package:flutter/material.dart';

abstract class Validator {
  onValidate(s);

  Future<bool> validateForm();

  // validateStreet2(s);

  // validateCity(s);

  // validateZip(s);

  // validateState(s);
}

class ValidatorImpl implements Validator {
  ValidatorImpl._();
  static ValidatorImpl instance = ValidatorImpl._();

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  bool _isformValidated = false;

  bool get isformValidated => _isformValidated;

  @override
  onValidate(s) {
    if (s.toString().isEmpty) {
      return "Field can not be empty";
    }
  }

  // @override
  // validateStreet2() {}

  // @override
  // validateCity() {}

  // @override
  // validateZip() {}

  // @override
  // validateState() {}

  @override
  Future<bool> validateForm() async {
    _isformValidated = _formKey.currentState!.validate();

    return _isformValidated;
  }
}
