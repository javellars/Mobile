import 'package:entrega1_livraria/view/cadastro_screen.dart';
import 'package:entrega1_livraria/view/carrinho.dart';
import 'package:entrega1_livraria/view/conf_pagamento_screen.dart';
import 'package:entrega1_livraria/view/pagamento_screen.dart';
import 'package:entrega1_livraria/view/produtos_screen.dart';
import 'package:flutter/material.dart';
import 'package:entrega1_livraria/view/inicio_screen.dart';
import 'package:entrega1_livraria/view/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/', // Define a rota inicial
      routes: {
        '/': (context) => const InicioScreen(), // Rota para a InicioScreen
        '/home': (context) => const InicioScreen(),
        '/login': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/produtos': (context) => const ProdutosScreen(),
        '/pagamento': (context) => const PagamentoScreen(),
        '/carrinho': (context) => const CarrinhoScreen(),
        '/confPagamento': (context) => const ConfirmacaoPagamentoScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App livraria'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("Tentando começar"),
      ),
    );
  }
}

// Função para navegação para a próxima tela
void navigateToHomePage(BuildContext context) {
  Navigator.pushNamed(context, '/home');
}
