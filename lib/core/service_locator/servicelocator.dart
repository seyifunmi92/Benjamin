import 'package:get_it/get_it.dart';
import 'package:benjamin/appinstance.dart';
import 'package:benjamin/core/managers/theme_manager/apptheme.dart';
import 'package:benjamin/feature/signup/presentation/pages/benjamin.dart';
// ignore_for_file: prefer_const_constructors


GetIt get getIt => GetIt.instance;

intializeServiceLocator() {
  getIt

    ///app instance
    ..registerSingleton<AppInstance>(AppInstance.instance)

    ///page classes
    ..registerLazySingleton<Benjamin>(() => Benjamin())

    ///app theme handler
    ..registerSingleton<AppTheme>(AppTheme.instance);
}
