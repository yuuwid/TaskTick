import 'dart:async';
import 'package:tasktick/src/data/entities/user.dart';
import 'package:tasktick/src/data/services/local/hive/box/auth_box.dart';

class UserRepository {
  User? _user;

  Future<Map> _fromBox() async {
    return await AuthBox.authBox;
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(Duration(milliseconds: 300), _getDataUser);
  }

  FutureOr<User?> _getDataUser() async {
    Map data = await _fromBox();
    _user = User(
      id: data['_id'],
      npm: data['npm'],
      name: data['nama_lengkap'],
      password: data['password'],
    );
    return _user;
  }
}
