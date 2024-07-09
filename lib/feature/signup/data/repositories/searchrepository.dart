import 'package:benjamin/core/managers/singleton_manager/imanagers.dart';
import 'package:benjamin/core/managers/service_manager/api/apimodel.dart';

abstract class SearchRepository {
  ///get search results
  Future<ApiResponse> getSearchResults();
}

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl._internal();
  static SearchRepositoryImpl instance = SearchRepositoryImpl._internal();

  @override

  ///implement abstract class
  Future<ApiResponse> getSearchResults() async => await Imanagers.api.getSearchParamenters(null, null, null);
}
