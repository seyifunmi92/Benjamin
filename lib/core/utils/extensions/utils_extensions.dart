import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

///on layout extension
extension Layout on BuildContext {
  num get figmaHeight => 800;

  num get figmaWidth => 300;

  ///get app size
  Size getAppSize() => MediaQuery.of(this).size;

  //.get app width
  getWidth() => getAppSize().width;

  ///get app height
  getHeight() => getAppSize().height;

  ///get responseive height
  h(num value) => (getAppSize().height) / (figmaHeight / value);

  ///get responsive width
  w(num value) => (getAppSize().width) / (figmaWidth / value);

  ///getfSize
  f(num value) {
    double a = getAppSize().height;
    double b = getAppSize().width;
    return a > b ? a / (figmaHeight / value) : b / (figmaWidth / value);
  }

  /// Color handler
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  Color get scaffold => Theme.of(this).scaffoldBackgroundColor;

  Color get textprimary => Theme.of(this).colorScheme.primary;
}

extension ISizer on int {
  MediaQueryData get mq => MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);

  // ignore: non_constant_identifier_names
  num get figmaHeight => 800;

  num get figmaWidth => 300;

  num get sTATUSBAR => mq.padding.top;

  num get bOTTOMBAR => mq.padding.bottom;

  num get dEVICEHEIGHT => mq.size.height;

  num get dEVICEWIDTH => mq.size.width;

  double get h => dEVICEHEIGHT / (figmaHeight / this);

  double get w => dEVICEWIDTH / (figmaWidth / this);

  double get f => h > w ? h : w;
}

extension DataType on int {
  double get d => toDouble();
}

extension Spacer on double {
  Widget get spaceH => SizedBox(
        height: this,
      );

  Widget get spaceW => SizedBox(
        height: this,
      );
}

extension RemoveSpaces on String {
  String get removeSpaces => replaceAll(" ", "");
}

extension Nav on BuildContext {
  dynamic get close => Navigator.pop(this);
}
