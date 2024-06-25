import 'package:entrega1_livraria/bloc/auth_bloc.dart';
import 'package:entrega1_livraria/view/cadastro_screen.dart';
import 'package:entrega1_livraria/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return authenticatedWidget(context);
        } else {
          return unauthenticatedWidget(context);
        }
      },
    );
  }
}

Widget authenticatedWidget(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(Logout());
            },
            child: const Icon(Icons.logout)),
        appBar: AppBar(
            title: const Text("widget.title"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions)),
                Tab(icon: Icon(Icons.ac_unit))
              ],
            )),
        body: Text("voce esta autenticado!")),
  );
}

Widget unauthenticatedWidget(BuildContext context) {
  return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: const TabBarView(
          children: [CadastroScreen(), LoginScreen()],
        ),
        appBar: AppBar(
          title: const Text("Autenticação Necessária"),
          bottom: const TabBar(
            tabs: [Tab(text: "Novo Cadastro"), Tab(text: "Efetuar Login")],
          ),
        ),
      ));
}