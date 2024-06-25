/*import 'package:flutter/material.dart';
import 'package:entrega1_livraria/view/inicio_screen.dart';
import 'package:entrega1_livraria/view/produtos_screen.dart';
import 'package:entrega1_livraria/view/pagamento_screen.dart';
import 'package:entrega1_livraria/view/carrinho.dart';
import 'package:entrega1_livraria/view/cadastro_screen.dart';
import 'package:entrega1_livraria/view/login_screen.dart';
import 'package:entrega1_livraria/view/conf_pagamento_screen.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          InicioScreen(
            onNavigateToCadastro: () => navigateTo(4),
            onNavigateToLogin: () => navigateTo(5),
          ),
          ProdutosScreen(
            onNavigateToInicio: () => navigateTo(0),
            onNavigateToCarrinho: () => navigateTo(3),
          ),
          PagamentoScreen(
            onNavigateToConfirma: () => navigateTo(6),
          ),
          CarrinhoScreen(
            onNavigateToProdutos: () => navigateTo(1),
            onNavigateToPagamento: () => navigateTo(2),
          ),
          CadastroScreen(
            onNavigateToLogin: () => navigateTo(5),
          ),
          LoginScreen(
            onNavigateToProdutos: () => navigateTo(1),
          ),
          ConfirmacaoPagamentoScreen(
            onNavigateToProdutos: () => navigateTo(1),
          ),
        ],
      ),
      bottomNavigationBar: _currentIndex != 0 && _currentIndex != 4 && _currentIndex != 5 && _currentIndex != 6
          ? BottomNavigationBar(
              currentIndex: _currentIndex - 1,
              onTap: (index) => navigateTo(index + 1),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.storefront),
                  label: 'Produtos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.payment),
                  label: 'Pagamento',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Carrinho',
                ),
              ],
            )
          : null,

          
    );
  }
}
*/