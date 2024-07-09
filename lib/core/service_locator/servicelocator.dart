import 'package:get_it/get_it.dart';
import 'package:benjamin/core/app/appinstance.dart';
import 'package:benjamin/core/managers/theme_manager/apptheme.dart';
import 'package:benjamin/feature/signup/presentation/pages/benjamin.dart';
import 'package:benjamin/feature/signup/domain/usecases/logic/autocomplete.dart';
// ignore_for_file: prefer_const_constructors

GetIt get getIt => GetIt.instance;

intializeServiceLocator() {
  getIt

    ///app instance
    ..registerSingleton<AppInstance>(AppInstance.instance)

    ///page classes
    ..registerLazySingleton<Benjamin>(() => Benjamin())

    ///app theme handler
    ..registerSingleton<AppTheme>(AppTheme.instance)

    ///register autocomplete singleton
    ..registerSingleton<AutocompleteHandler>(AutoCompleteHandlerImpl.instance)
    ..registerSingleton<AutoCompleteHandlerImpl>(AutoCompleteHandlerImpl.instance);
}
