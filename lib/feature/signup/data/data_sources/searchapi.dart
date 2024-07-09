import 'dart:io';
import 'dart:convert';
import 'package:benjamin/core/managers/singleton_manager/imanagers.dart';
import 'package:benjamin/core/managers/service_manager/api/apimodel.dart';
import 'package:benjamin/core/managers/service_manager/api/network_codes.dart';
import 'package:benjamin/feature/signup/data/data_sources/data_repository.dart';
import 'package:benjamin/core/managers/service_manager/api/network_constants.dart';

abstract class ApiService {
  ///get search list from search api
  getSearchParamenters(dynamic headers, String? requrl, bool? withToken);
}

class Api implements ApiService {
  Api._internal();
  static Api instance = Api._internal();

  @override

  ///implement search parameters
  Future<ApiResponse> getSearchParamenters(dynamic headers, String? requrl, bool? withToken) async {
    try {
      Imanagers.autocompleteimpl.autocompletedata.clear();
      Imanagers.autocompleteimpl.autocompletedata.addAll(statesIntheUS);
      if (Imanagers.autocompleteimpl.autocompletedata.isEmpty) {
        return ApiResponse(code: httpStatusCodes.NOT_FOUND, body: exceptionClass.NOT_FOUND);
      } else {
        return ApiResponse(code: httpStatusCodes.OK, body: jsonEncode(Imanagers.autocompleteimpl.autocompletedata));
      }
    } on SocketException catch (e) {
      return ApiResponse(code: httpStatusCodes.INTERNAL_SERVER_ERROR, body: e.message);
    }
  }
}
