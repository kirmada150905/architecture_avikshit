import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../../constants/urls.dart';
import '../logger.dart';
import 'custom_exception.dart';

part 'custom_http_client.g.dart';

// class ApiResponse {
//   final List<Map<String, dynamic>> results;

//   ApiResponse({required this.results});

//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     return ApiResponse(
//         results: List<Map<String, dynamic>>.from(json['results']));
//   }
// }

class CustomHttpClient {
  final http.Client _client;
  final Ref ref;

  CustomHttpClient(this.ref) : _client = http.Client();

  void _printRequest(String fullPath, String method,
      Map<String, String> headers, dynamic body) {
    debugLog(DebugTags.httpRequest,
        "\nMethod: [$method],\nURL: [$fullPath],\nHEADERS: [$headers],\nBODY: $body\nEND");
  }

  void _printRepsonse(String fullPath, String method,
      Map<String, String> headers, dynamic body, Response response) {
    debugLog(DebugTags.httpClientResponse,
        "\nMETHOD: [$method],\nURL: [$fullPath],\nHEADERS: [$headers],\nSTATUS: [${response.statusCode}]\nBODY:[${response.body}]\nEND");
  }

  Map<String, String> _commonHeaders() {
    Map<String, String> myMap = {};

    return myMap;
  }

  Future<List> getList(String relativePath,
      {Map<String, String>? headers, String? keyForList}) async {
    //TODO: finalise the exception handling procedure
    final String fullPath = URLs.backBase + relativePath;
    final uri = Uri.parse(fullPath);

    final allHeaders = _commonHeaders()..addAll(headers ?? {});
    print(keyForList);
    _printRequest(fullPath, "GET", allHeaders, null);

    final response = await _client.get(uri, headers: allHeaders);

    _printRepsonse(fullPath, "GET", allHeaders, null, response);

    if (response.statusCode / 100 == 4) {
      userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw CustomException.backStableError(
          jsonDecode(response.body)['message']);
    } else if (response.statusCode / 100 == 5) {
      userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.backUnstableError();
    } else if (response.statusCode / 100 != 2) {
      userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.unknownServerError();
    }
    if (keyForList == null) {
      return jsonDecode(response.body);
    }
    return jsonDecode(response.body)[keyForList];
  }

  // Future getDATA(String relativePath, {Map<String, String>? headers}) async {
  //   //TODO: finalise the exception handling procedure
  //   final String fullPath = URLs.backBase + relativePath;
  //   final uri = Uri.parse(fullPath);

  //   final allHeaders = _commonHeaders()..addAll(headers ?? {});

  //   _printRequest(fullPath, "GET", allHeaders, null);

  //   final response = await _client.get(uri, headers: allHeaders);

  //   _printRepsonse(fullPath, "GET", allHeaders, null, response);

  //   if (response.statusCode / 100 == 4) {
  //     userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
  //     throw CustomException.backStableError(
  //         jsonDecode(response.body)['message']);
  //   } else if (response.statusCode / 100 == 5) {
  //     userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
  //     throw const CustomException.backUnstableError();
  //   } else if (response.statusCode / 100 != 2) {
  //     userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
  //     throw const CustomException.unknownServerError();
  //   }
  //   // if (keyForList == null) {
  //   //   return jsonDecode(response.body);
  //   // }
  //   return (json.decode(response.body));
  // }

  // Future<ApiResponse> getList(String relativePath,
  //     {Map<String, String>? headers}) async {
  //   //TODO: finalise the exception handling procedure
  //   final String fullPath = URLs.backBase + relativePath;
  //   final uri = Uri.parse(fullPath);

  //   final allHeaders = _commonHeaders()..addAll(headers ?? {});

  //   _printRequest(fullPath, "GET", allHeaders, null);

  //   final response = await _client.get(uri, headers: allHeaders);

  //   _printRepsonse(fullPath, "GET", allHeaders, null, response);

  //   if (response.statusCode / 100 == 4) {
  //     userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
  //     throw CustomException.backStableError(
  //         jsonDecode(response.body)['message']);
  //   } else if (response.statusCode / 100 == 5) {
  //     userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
  //     throw const CustomException.backUnstableError();
  //   } else if (response.statusCode / 100 != 2) {
  //     userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
  //     throw const CustomException.unknownServerError();
  //   }
  //   // if (keyForList == null) {
  //   //   return jsonDecode(response.body);
  //   // }
  //   return ApiResponse.fromJson(json.decode(response.body));
  // }

  Future<Map<String, dynamic>> get(String relativePath,
      {Map<String, String>? headers}) async {
    try {
      final String fullPath = URLs.backBase + relativePath;
      final uri = Uri.parse(fullPath);

      final allHeaders = _commonHeaders()..addAll(headers ?? {});

      _printRequest(fullPath, "GET", allHeaders, null);

      final response = await _client.get(uri, headers: allHeaders);

      _printRepsonse(fullPath, "GET", allHeaders, null, response);

      if (response.statusCode / 100 == 4) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw CustomException.backStableError(
            jsonDecode(response.body)['message']);
      } else if (response.statusCode / 100 == 5) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.backUnstableError();
      } else if (response.statusCode / 100 != 2) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.unknownServerError();
      }

      return jsonDecode(response.body);
    } catch (e) {
      userLog(e.toString(), debugTag: DebugTags.httpClientException);
      return {'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>?> post(String relativePath,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final String fullPath = URLs.backBase + relativePath;
      final uri = Uri.parse(fullPath);

      final allHeaders = _commonHeaders()..addAll(headers ?? {});

      _printRequest(fullPath, "POST", allHeaders, body);

      final response = await _client.post(uri, headers: allHeaders, body: body);

      _printRepsonse(fullPath, "POST", allHeaders, body, response);

      if (response.statusCode / 100 == 4) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw CustomException.backStableError(
            jsonDecode(response.body)['message']);
      } else if (response.statusCode / 100 == 5) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.backUnstableError();
      } else if (response.statusCode / 100 != 2) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.unknownServerError();
      }

      return jsonDecode(response.body);
    } catch (e) {
      userLog(e.toString(), debugTag: DebugTags.httpClientException);
      return null;
    }
  }

  Future<Map<String, dynamic>?> delete(String relativePath,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final String fullPath = URLs.backBase + relativePath;
      final uri = Uri.parse(fullPath);

      final allHeaders = _commonHeaders()..addAll(headers ?? {});

      _printRequest(fullPath, "POST", allHeaders, body);

      final response =
          await _client.delete(uri, headers: allHeaders, body: body);

      _printRepsonse(fullPath, "POST", allHeaders, body, response);

      if (response.statusCode / 100 == 4) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw CustomException.backStableError(
            jsonDecode(response.body)['message']);
      } else if (response.statusCode / 100 == 5) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.backUnstableError();
      } else if (response.statusCode / 100 != 2) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.unknownServerError();
      }

      return jsonDecode(response.body);
    } catch (e) {
      userLog(e.toString(), debugTag: DebugTags.httpClientException);
      return null;
    }
  }

  Future<Map<String, dynamic>> getMap() async {
    try {
      var response = await _client.get(
          Uri.parse('https://su-bitspilani.org/su/miscellaneous/get_markers'));

      if (response.statusCode / 100 == 4) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw CustomException.backStableError(
            jsonDecode(response.body)['message']);
      } else if (response.statusCode / 100 == 5) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.backUnstableError();
      } else if (response.statusCode / 100 != 2) {
        userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
        throw const CustomException.unknownServerError();
      }

      return jsonDecode(response.body);
    } catch (e) {
      userLog(e.toString(), debugTag: DebugTags.httpClientException);
      return {'message': e.toString()};
    }
  }
}

@riverpod
CustomHttpClient customHttpClient(CustomHttpClientRef ref) {
  return CustomHttpClient(ref);
}
