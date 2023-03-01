import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/data/widgets/lista_items.dart';

class AuthController {
  final TextEditingController emailAuthin = TextEditingController();

  final TextEditingController passowordAuthin = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  void logar(BuildContext context) async {
    auth
        .signInWithEmailAndPassword(
      email: emailAuthin.text,
      password: passowordAuthin.text,
    )
        .then((firebaseUser) {
      Future.delayed(
        Duration(
          seconds: 2,
        ),
      );

      Get.to(MyWidget());
    }).catchError((erro) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'e-mail ou senha inválidos',
            ),
          ),
        ),
      );
    });
  }
}
