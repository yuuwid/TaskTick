import 'package:encrypt/encrypt.dart';

class Cryptography {
  static Encrypter _activate(String key) {
    final keyUtf8 = Key.fromUtf8(key);

    return Encrypter(AES(keyUtf8));
  }

  static IV _secure() {
    return IV.fromLength(16);
  }

  static String encrypter(String plainText, String key) {
    final iv = _secure();
    Encrypter activate = _activate(key);

    final encrypted = activate.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decrypter(String encoded, String key) {
    final iv = _secure();
    Encrypter activate = _activate(key);

    Encrypted encrypted = Encrypted.fromBase64(encoded);

    final decrypted = activate.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}
