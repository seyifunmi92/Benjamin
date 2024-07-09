import 'package:get_it/get_it.dart';
import 'package:benjamin/core/app/appinstance.dart';
import 'package:benjamin/core/managers/theme_manager/apptheme.dart';
import 'package:benjamin/feature/signup/data/data_sources/searchapi.dart';
import 'package:benjamin/feature/signup/presentation/pages/benjamin.dart';
import 'package:benjamin/feature/signup/data/repositories/searchrepository.dart';
import 'package:benjamin/feature/signup/domain/usecases/logic/autocomplete.dart';
import 'package:benjamin/feature/signup/domain/usecases/validation/validate_form.dart';
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
    ..registerSingleton<AutoCompleteHandlerImpl>(AutoCompleteHandlerImpl.instance)

    ///register validator singleton
    ..registerSingleton<Validator>(ValidatorImpl.instance)
    ..registerSingleton<ValidatorImpl>(ValidatorImpl.instance)

    ///register API service
    ..registerSingleton<ApiService>(Api.instance)
    ..registerSingleton<Api>(Api.instance)

    ///register repository
    ..registerSingleton<SearchRepository>(SearchRepositoryImpl.instance)
    ..registerSingleton<SearchRepositoryImpl>(SearchRepositoryImpl.instance);
}
