import 'package:benjamin/core/app/appinstance.dart';
import 'package:benjamin/core/service_locator/servicelocator.dart';
import 'package:benjamin/core/managers/theme_manager/apptheme.dart';
import 'package:benjamin/feature/signup/data/data_sources/searchapi.dart';
import 'package:benjamin/feature/signup/presentation/pages/benjamin.dart';
import 'package:benjamin/feature/signup/data/repositories/searchrepository.dart';
import 'package:benjamin/feature/signup/domain/usecases/logic/autocomplete.dart';
import 'package:benjamin/feature/signup/domain/usecases/validation/validate_form.dart';

class Imanagers {
  ///define singletons as managers
  static Benjamin benjamin = getIt<Benjamin>();
  static AppInstance app = getIt<AppInstance>();
  static AppTheme theme = getIt<AppTheme>();
  static AutocompleteHandler autocomplete = getIt<AutocompleteHandler>();
  static AutoCompleteHandlerImpl autocompleteimpl = getIt<AutoCompleteHandlerImpl>();
  static Validator validate = getIt<Validator>();
  static ValidatorImpl validatorimpl = getIt<ValidatorImpl>();
  static Api api = getIt<Api>();
  static ApiService apiservice = getIt<ApiService>();
  static SearchRepository search = getIt<SearchRepository>();
  static SearchRepositoryImpl searchimpl = getIt<SearchRepositoryImpl>();
}
