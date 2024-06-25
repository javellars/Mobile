// import 'package:entrega1_livraria/view/pagamento_screen.dart';
import 'package:flutter/material.dart';

import '../carrinho.dart';
import '../inicio_screen.dart';
import '../produtos_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentScreen = 0;

  /*final List<Widget> _telas = [
    const ProdutosScreen(),
    const CarrinhoScreen(),
    const InicioScreen(),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(""),
      ),
      body: IndexedStack(index: _currentScreen, children: const [
        ProdutosScreen(),
        CarrinhoScreen(),
        InicioScreen(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'Produtos',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Sair',
            backgroundColor: Colors.green,
          ),
        ],
//acionando o gatilho do click
        onTap: (value) {
          setState(() {
            _currentScreen = value;
          });
        },

        currentIndex: _currentScreen,
      ),

      /* body: _telas[_opcaoSelecionada],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _opcaoSelecionada,
        onTap: (index) {
          setState(() {
            _opcaoSelecionada = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'Produtos',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Sair',
            backgroundColor: Colors.green,
          ),
        ],
      ),*/
    );
  }
}
