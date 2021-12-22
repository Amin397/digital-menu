import 'dart:convert';

import 'package:untitled13/MainModels/api_result.dart';
import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<ApiResult> makePostRequest(
      {String? controller, String? method, Object? body}) async {
    print('controller: $controller');
    print('method: $method');
    print('body: $body');
    http.Response response = await http.post(
      makePath(
        controller: controller,
        method: method,
      ),
      headers: {'token': 'test'},
      body: body,
    );
    print('method: ${makePath(
      controller: controller,
      method: method,
    )}');

    ApiResult result = ApiResult.fromJson(
      jsonDecode(
        response.body,
      ),
    );

    print('result: ${result.data}');
    return result;
  }

  static Future<ApiResult> makeGetRequest(
      {String? controller, String? method}) async {
    http.Response response = await http.get(
      makePath(
        controller: controller,
        method: method,
      ),
      headers: {'token': 'test'},
    );

    // ApiResult result = ApiResult.fromJson(
    //   jsonDecode(
    //     response.body,
    //   ),
    // );

    return ApiResult.fromJson(
      jsonDecode(
        response.body,
      ),
    );
  }

  static Uri makePath({String? controller, String? method}) {
    return Uri.parse(
        'https://rest.negaapps.ir/admin/$controller/API/_$method?token=test');
  }
}
