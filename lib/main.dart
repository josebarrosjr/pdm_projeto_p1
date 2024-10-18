import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:p1_projeto/view/carrinho.dart';
import 'package:p1_projeto/view/criar_conta.dart';
import 'package:p1_projeto/view/detalhes.dart';
import 'package:p1_projeto/view/login.dart';
import 'package:p1_projeto/view/nova_senha.dart';
import 'package:p1_projeto/view/tela_inicial.dart';


void main() {
  runApp(DevicePreview(builder: (context) => MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'tela_inicial': (context) => TelaInicial(),
        'criar_conta': (context) => criarConta(),
        'nova_senha': (context) => NovaSenha(),
        'detalhes': (context) => Detalhes(),
        'carrinho': (context) => Carrinho(),
      },
    );
  }
}

