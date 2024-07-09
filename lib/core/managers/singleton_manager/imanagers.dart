import 'package:benjamin/appinstance.dart';
import 'package:benjamin/core/service_locator/servicelocator.dart';
import 'package:benjamin/core/managers/theme_manager/apptheme.dart';
import 'package:benjamin/feature/signup/presentation/pages/benjamin.dart';

class Imanagers {

  ///define singletons as managers
  static Benjamin benjamin = getIt<Benjamin>();
  static AppInstance app = getIt<AppInstance>();
  static AppTheme theme = getIt<AppTheme>();
}
