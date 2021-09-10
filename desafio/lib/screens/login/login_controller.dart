import 'package:desafio/core/app_controller.dart';
import 'package:desafio/core/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    auth.authStateChanges().listen((User? user) async {
      if (user == null) {
      } else {
        Get.find<AppController>().setUser(user);
        Get.offAndToNamed(StringRoutes.home);
        await AppController.analytics.logLogin();
      }
    });
    super.onInit();
  }

  Future<void> registerUser() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e, stack) {
      await FirebaseCrashlytics.instance
          .recordError(e, stack, reason: 'Register user failed');
    }
  }

  Future<void> signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Não existe um usuário com esse e-mail', '',
            backgroundColor: Colors.red.withOpacity(0.8));
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Senha incorreta, tente novamente', '',
            backgroundColor: Colors.red.withOpacity(0.8));
      }
      print(e.code);
    } catch (e, stack) {
      await FirebaseCrashlytics.instance
          .recordError(e, stack, reason: 'Login user failed');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
