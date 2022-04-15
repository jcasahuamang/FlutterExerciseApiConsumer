import 'package:consumo_apirest/app/domain/responses/login_response.dart';

abstract class AuthenticationRepository {
  Future<String?> get accessToken;
  Future<LoginResponse> login(String email, String password);
}
