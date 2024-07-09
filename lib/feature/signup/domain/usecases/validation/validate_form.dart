import 'package:flutter/material.dart';

abstract class Validator {
  ///generic validation on all forms
  onValidate(s, val);

//validate specific form and update the isFormValidated param
  validateForm();
}

class ValidatorImpl implements Validator {
  ValidatorImpl._();
  static ValidatorImpl instance = ValidatorImpl._();

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  bool _isformValidated = false;

  bool get isformValidated => _isformValidated;

  @override
  onValidate(s, val) {
    if (s.toString().isEmpty) {
      return "$val can not be empty";
    }
  }

  @override
  validateForm() {
    _isformValidated = _formKey.currentState!.validate();

    return _isformValidated;
  }
}
