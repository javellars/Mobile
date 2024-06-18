import 'package:entrega1_livraria/provider/cad_provider.dart';
import 'package:entrega1_livraria/view/list_cad.dart';
import 'package:flutter/material.dart';
import 'package:entrega1_livraria/view/cadastro_screen.dart';
import 'package:entrega1_livraria/view/carrinho.dart';
import 'package:entrega1_livraria/view/conf_pagamento_screen.dart';
import 'package:entrega1_livraria/view/pagamento_screen.dart';
import 'package:entrega1_livraria/view/produtos_screen.dart';
import 'package:entrega1_livraria/view/inicio_screen.dart';
import 'package:entrega1_livraria/view/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profiler_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProfileBloc();
      },
      child: MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/', // Define a rota inicial
        routes: {
          '/': (context) => const InicioScreen(), // Rota para a InicioScreen
          '/home': (context) => const NavigationApp(),
          '/login': (context) => const LoginScreen(),
          '/cadastro': (context) => const CadastroScreen(),
          '/main': (context) => const NavigationApp(),
          '/produtos': (context) => const ProdutosScreen(),
          '/pagamento': (context) => const PagamentoScreen(),
          '/carrinho': (context) => const CarrinhoScreen(),
          '/confPagamento': (context) => const ConfirmacaoPagamentoScreen(),
          '/ListaCadastro': (context) => const CadListScreen(),
        },
      ),
    );
  }
}

class NavigationApp extends StatefulWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  _NavigationAppState createState() => _NavigationAppState();
}

class _NavigationAppState extends State<NavigationApp> {
  int currentPageIndex = 0;

  static const List<Widget> _telas = <Widget>[
    ProdutosScreen(),
    PagamentoScreen(),
    CadListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc()..add(GetCadListEvent()),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
           
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            backgroundColor: Colors.orangeAccent,
            height: 50,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.book),
                icon: Icon(Icons.book_outlined),
                label: 'Livros',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.payment),
                icon: Icon(Icons.payment_outlined),
                label: 'Pagar',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.list),
                icon: Icon(Icons.list),
                label: 'Cadastros',
              ),
            ],
          ),
        ),
        body: _telas[currentPageIndex],
      ),
    );
  }
}
