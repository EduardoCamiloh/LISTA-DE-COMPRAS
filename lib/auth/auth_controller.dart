import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthUpContoller {
  final TextEditingController emailAuthup = TextEditingController();

  final TextEditingController passowordAuthup = TextEditingController();

  final TextEditingController nameAuthup = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  void cadastro(BuildContext context) async {
    auth
        .createUserWithEmailAndPassword(
      email: emailAuthup.text,
      password: passowordAuthup.text,
    )
        .then((firebaseUser) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Cadastro efetuado com sucesso!',
            ),
          ),
        ),
      );
      Future.delayed(
        Duration(
          seconds: 3,
        ),
      );
    }).catchError((erro) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Erro ao efetuar cadastro!',
            ),
          ),
        ),
      );
    });
  }
}
