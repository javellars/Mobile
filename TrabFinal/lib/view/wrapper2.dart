import 'package:entrega1_livraria/view/carrinho.dart';
import 'package:entrega1_livraria/view/pagamento_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrega1_livraria/bloc/auth_bloc.dart';
import 'package:entrega1_livraria/view/inicio_screen.dart';
import 'package:entrega1_livraria/view/produtos_screen.dart';

class Wrapper2 extends StatelessWidget {
  const Wrapper2({super.key});

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

      builder: (BuildContext context, AuthState state) {
        if (state is Authenticated) {
          return ProdutosScreen();
        } else {
          return InicioScreen();
        }
      },
    );
  }
}
