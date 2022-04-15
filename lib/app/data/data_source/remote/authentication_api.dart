import 'dart:async';
import 'dart:io';

import 'package:consumo_apirest/app/data/helpers/http.dart';
import 'package:consumo_apirest/app/data/helpers/http_method.dart';
import 'package:consumo_apirest/app/domain/responses/login_response.dart';

class AuthenticationApi {
  final Http _http;

  AuthenticationApi(this._http);

  Future<LoginResponse> login(String email, String password) async {
    final result = await _http.request<String>('/api/login',
        queryParameters: {
          //  "delay": "5",
        },
        method: HttpMethod.post,
        body: {
          "email": email,
          "password": password,
        }, parser: (data) {
      return data['token'];
    });

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error data ${result.error?.data}");
    print("result statusCode ${result.statusCode}");

    if (result.error == null) {
      return LoginResponse.ok;
    }
    if (result.statusCode == 400) {
      return LoginResponse.accessDenied;
    }
    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return LoginResponse.networkError;
    }

    return LoginResponse.unknownError;
  }
}
