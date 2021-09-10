import 'package:desafio/core/app_controller.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  AppController _appController;
  setUp(() {
    Get.put<AppController>(AppController());
    _appController = Get.find();
  });
  group('Login', () {
    MockFirebaseAuth _auth = MockFirebaseAuth();
    test('try firebase login', () async {
      await _auth.signInWithEmailAndPassword(email: 'any', password: 'any');
    });
  });
}
