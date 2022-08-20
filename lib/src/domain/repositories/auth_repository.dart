import 'dart:async';

import 'package:tasktick/src/app/utils/cryptography.dart';
import 'package:tasktick/src/data/services/local/hive/box/auth_box.dart';
import 'package:tasktick/src/data/services/local/hive/box/settings_box.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _controller = StreamController<AuthStatus>();

  AuthRepository() {
    _checkHasLogin();
  }

  Future<void> _checkHasLogin() async {
    var authBox = await AuthBox.authBox;

    if (authBox["logged"] == true) {
      _controller.add(AuthStatus.authenticated);
    } else {
      _controller.add(AuthStatus.unauthenticated);
    }
  }

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(Duration(milliseconds: 1000));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> _toBox({
    required bool logged,
    required String id,
    required String npm,
    required String name,
    required String password,
  }) async {
    await AuthBox.updateAll({
      '_id': id,
      'logged': logged,
      'npm': npm,
      'nama_lengkap': name,
      'password': password,
    });
  }

  Future<void> logIn({
    required String npm,
    required String password,
  }) async {
    await Future.delayed(
      Duration(milliseconds: 300),
      () {
        _controller.add(AuthStatus.authenticated);
      },
    );
    // TODO: Request ke API

    if (true) {
      Map settingBox = await AppSettingsBox.settingsBox;
      String id = settingBox['_id'];
      password = (password != "Guest")
          ? Cryptography.encrypter(password, id.substring(0, 32))
          : password;
      await _toBox(
        logged: true,
        id: id,
        npm: npm,
        password: password,
        name: "Not Set",
      );
    }
  }

  void logOut() {
    _controller.add(AuthStatus.unauthenticated);

    AuthBox.clear();
  }

  void dispose() => _controller.close();
}
