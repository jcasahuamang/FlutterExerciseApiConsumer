import 'package:consumo_apirest/app/data/repositories_impl/authentication_repository_impl.dart';
import 'app/domain/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';

import 'package:consumo_apirest/app/data/data_source/remote/authentication_api.dart';

import 'app/data/helpers/http.dart';

void main() {
  runApp(TmpPage());
}

class TmpPage extends StatefulWidget {
  TmpPage({Key? key}) : super(key: key);

  @override
  _TmpPageState createState() => _TmpPageState();
}

class _TmpPageState extends State<TmpPage> {
  @override
  void initState() {
    super.initState();
    final http = Http(baseUrl: 'https://reqres.in');

    final AuthenticationRepository auth =
        AuthenticationRepositoryImpl(AuthenticationApi(http));

    auth
        .login(
          'eve.holt@reqres.in',
          'cityslicka',
        )
        .then(
          (value) => print(value),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
