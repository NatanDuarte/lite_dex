import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:lite_dex/model/pokemon.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('REQUEST');
    debugPrint('URL: ${data.url}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('\nRESPONSE');
    debugPrint('STATUS CODE: ${data.statusCode}');
    debugPrint('HEADERS: ${data.headers}');
    debugPrint('BODY: ${data.body}');
    return data;
  }
}

Future<Pokemon?> fetch(String item) async {
  Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );

  final Response response =
      await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$item/'));

  if (response.statusCode != 200) return null;
  return Pokemon.fromJson(jsonDecode(response.body));
}
