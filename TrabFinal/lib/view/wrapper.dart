import 'package:flutter/material.dart';
import 'package:entrega1_livraria/view/inicio_screen.dart';
import 'package:entrega1_livraria/view/produtos_screen.dart';
import 'package:entrega1_livraria/view/pagamento_screen.dart';
import 'package:entrega1_livraria/view/carrinho.dart';
import 'package:entrega1_livraria/view/cadastro_screen.dart';
import 'package:entrega1_livraria/view/login_screen.dart';

void main() {
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  static const String _title = 'Bottom Navigation Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
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
      appBar: _currentIndex != 0
          ? AppBar(
              title: const Text('Bottom Navigation Demo'),
            )
          : null,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          InicioScreen(
            onNavigateToCadastro: () {
              setState(() {
                _currentIndex = 4; // Navigate to CadastroScreen
              });
            },
            onNavigateToLogin: () {
              setState(() {
                _currentIndex = 5; // Navigate to LoginScreen
              });
            },
          ),
          ProdutosScreen(
            onNavigateToInicio: () => navigateTo(0),
          ),
          PagamentoScreen(),
          CarrinhoScreen(),
          CadastroScreen(
            onNavigateToLogin: () {
              setState(() {
                _currentIndex = 5; // Navigate to LoginScreen
              });
            },
          ),
          LoginScreen(
             onNavigateToProdutos: () {
              setState(() {
                _currentIndex = 1; // Navigate to ProdutosScreen
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: _currentIndex != 0 && _currentIndex != 4 && _currentIndex != 5
          ? BottomNavigationBar(
              currentIndex: _currentIndex - 1,
              onTap: (index) {
                setState(() {
                  _currentIndex = index + 1;
                });
              },
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
