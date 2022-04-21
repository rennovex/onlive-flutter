import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:onlive/Features/Auth/domain/entitites/auth.dart';

class SecureStorage extends FlutterSecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage({required this.storage});

  Future<void> save(String auth) async =>
      await storage.write(key: 'auth', value: auth);

  Future<Map<String, String>> readAllValues() async => await storage.readAll();

  Future<String> readUid() async {
    final result = await storage.readAll();
    Auth auth = authFromJson(result['auth']!);
    return auth.id;
  }

  Future<String> readToken() async {
    final result = await storage.readAll();
    Auth auth = authFromJson(result['auth']!);
    return auth.xAuthToken;
  }
}
