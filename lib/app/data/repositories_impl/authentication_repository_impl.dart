import 'package:consumo_apirest/app/data/data_source/remote/authentication_api.dart';
import 'package:consumo_apirest/app/domain/repositories/authentication_repository.dart';
import 'package:consumo_apirest/app/domain/responses/login_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi _api;

  AuthenticationRepositoryImpl(this._api);

  @override
  Future<String?> get accessToken async {
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    return _api.login(email, password);
  }
}
