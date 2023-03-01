import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:teste/componets/custom.dart';

import 'auth._controller.dart';

class AuthIn extends StatefulWidget {
  const AuthIn({super.key});

  @override
  State<AuthIn> createState() => _AuthInState();
}

class _AuthInState extends State<AuthIn> {
  final textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  final formkey = GlobalKey<FormState>();

  final authController = AuthController();

  @override
  void initState() {
    super.initState();

    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Get.offNamed('/authin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                        text: 'Lista de compras',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      pause: Duration.zero,
                      animatedTexts: [
                        FadeAnimatedText(
                          'Ultilidades',
                        ),
                        FadeAnimatedText(
                          'Limpeza',
                        ),
                        FadeAnimatedText(
                          'Higiene Pessoal',
                        ),
                        FadeAnimatedText(
                          'Bebidas',
                        ),
                        FadeAnimatedText(
                          'Açougue',
                        ),
                        FadeAnimatedText(
                          'Feira',
                        ),
                        FadeAnimatedText(
                          'Mercearia',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            color: Colors.white,
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Custom(
                    textInputAction: TextInputAction.send,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Digite seu e-mail';
                      }
                      if (!email.isEmail) {
                        return 'Digite um e-mail válido';
                      }
                      return null;
                    },
                    icon: Icons.email,
                    label: 'E-mail',
                    helperText: 'Digite seu e-mail',
                    controller: authController.emailAuthin,
                  ),
                  Custom(
                    textInputAction: TextInputAction.send,
                    validator: (passoword) {
                      if (passoword == null || passoword.isEmpty) {
                        return 'Digite sunga senha';
                      }
                      if (passoword.length < 6) {
                        return 'Digite sua senha com 6 caracteres';
                      }

                      return null;
                    },
                    controller: authController.passowordAuthin,
                    icon: Icons.lock,
                    label: 'Senha:',
                    isSecrety: true,
                    helperText: 'Digite sua senha',
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        formkey.currentState!.validate();
                        authController.logar(context);

                        authController.emailAuthin.clear();
                        authController.passowordAuthin.clear();
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/authup');
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Criar Conta',
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
