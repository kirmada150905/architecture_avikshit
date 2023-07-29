import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../custom_http_client/custom_exception.dart';
import '../custom_http_client/custom_http_client.dart';
import '../custom_http_client/http_method.dart';
import '../in_memory_store.dart';
import '../logger.dart';

abstract class RepoGeneric<T> {
  Ref ref;
  late final CustomHttpClient httpProvider;

  HttpMethod get httpMethod => HttpMethod.get;
  bool get isList => false;
  bool get accessAuthNeeded => false;
  String? get keyForList => null;

  Map<String, String> _queryParams = {};

  String get relativeUrl;

  final data = InMemoryStore<T?>(null);

  @mustCallSuper
  RepoGeneric({
    required this.ref,
  }) {
    httpProvider = ref.read(customHttpClientProvider);
  }

  Future<dynamic> getData() async {
    if (isList) {
      return await getListData();
    } else {
      return await getMapData();
    }
  }

  Future<Map<String, String>> headers() async {
    Map<String, String> allHeaders = {};
    // if (accessAuthNeeded) {
    //   allHeaders.addAll(await accessHeader());
    // }
    allHeaders.addAll(await extraHeaders());
    debugLog(DebugTags.apiCall, allHeaders.toString());
    return allHeaders;
  }

  // Future<Map<String, String>> accessHeader() async {
  //   final value = ref.read(authTokensRepoProvider).dataValue();
  //   if (value == null) {
  //     throw const CustomException.authNeededForAccessError();
  //   }
  //   return {'Authorization': 'Bearer ${value.access}'};
  // }

  Future<Map<String, String>> extraHeaders() async {
    return {};
  }

  // Only used for POST.
  Future<dynamic> postBody() async {
    return null;
  }

  void setAllQueryParams(Map<String, String> params) {
    _queryParams = <String, String>{};
    _queryParams.addAll(params);
  }

  void deleteQueryParams(List<String> params) {
    for (var element in params) {
      _queryParams.remove(element);
    }
  }

  String completeUrl() {
    if (_queryParams.isEmpty) {
      return relativeUrl;
    }
    String base = relativeUrl;
    if (base.endsWith('/')) {
      base = base.substring(0, base.length - 1);
    }
    base += '?';

    _queryParams.forEach((key, value) {
      base += '$key=$value&';
    });
/*
    if (base.endsWith('&')) {
      base = base.substring(0, base.length - 1) + '/';
    }
 */
    return base;
  }

  Future<Map> getMapData() async {
    debugLog("RepoGeneric", completeUrl());
    if (httpMethod == HttpMethod.get) {
      return httpProvider.get(completeUrl(), headers: await headers());
    } else if (httpMethod == HttpMethod.post) {
      return (await httpProvider.post(
        completeUrl(),
        headers: await headers(),
        body: await postBody(),
      ))!;
    } else {
      throw Exception("$httpMethod METHOD not implemented in getMapData");
    }
  }

  //create
  Future<List> getListData() async {
    print(keyForList);
    debugLog("RepoGeneric", completeUrl());
    if (httpMethod != HttpMethod.get) {
      throw Exception("$httpMethod METHOD not implemented in getListData");
    }

    final response = await httpProvider.getList(
      completeUrl(),
      headers: await headers(),
    );
    print('heyyyyyyy$response');
    return response;
  }

  //read
  Stream<T?> dataStream() => data.stream;
  T? dataValue() => data.value;

  //update
  void setValue(T newData) {
    data.value = newData;
    debugLog('debugTag', 'msg');
  }

  void delete() {
    data.value = null;
  }
}
