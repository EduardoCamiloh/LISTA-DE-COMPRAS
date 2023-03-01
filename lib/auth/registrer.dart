import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:teste/componets/custom.dart';

import 'auth_controller.dart';

class AuthUp extends StatefulWidget {
  const AuthUp({
    super.key,
  });

  @override
  State<AuthUp> createState() => _AuthUpState();
}

class _AuthUpState extends State<AuthUp> {
  final textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  final formkey = GlobalKey<FormState>();

  final authUpController = AuthUpContoller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            color: Colors.white,
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Custom(
                    controller: authUpController.emailAuthup,
                    validator: (emailup) {
                      if (emailup == null || emailup.isEmpty) {
                        return 'Digite seu e-mail';
                      }
                      if (!emailup.isEmail) {
                        return 'Digite um e-mail válido';
                      }
                      return null;
                    },
                    icon: Icons.email,
                    label: 'E-mail',
                    helperText: 'Digite seu e-mail',
                  ),
                  Custom(
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Digite uma senha';
                      }
                      if (password.length < 6) {
                        return 'A senha deve conter no minimo 6 digitos';
                      }
                      return null;
                    },
                    controller: authUpController.passowordAuthup,
                    icon: Icons.lock,
                    label: 'Senha:',
                    isSecrety: true,
                    helperText: 'Digite sua senha',
                  ),
                  Custom(
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Digite seu nome';
                      }

                      return null;
                    },
                    controller: authUpController.nameAuthup,
                    icon: Icons.person,
                    label: 'Nome:',
                    helperText: 'Digite seu nome',
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        formkey.currentState!.validate();
                        authUpController.cadastro(context);
                        authUpController.emailAuthup.clear();
                        authUpController.passowordAuthup.clear();
                        authUpController.nameAuthup.clear();
                      },
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
