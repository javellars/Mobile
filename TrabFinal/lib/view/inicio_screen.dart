import 'package:flutter/material.dart';
import 'cadastro_screen.dart';
import 'login_screen.dart';

class InicioScreen extends StatelessWidget {

  const InicioScreen({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(""),
      ),
      body: Stack(
        children: [
          // Gradiente de fundo
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 160,
                ), // Espaço entre o topo da tela e o conteúdo
                const Text(
                  "Bem-Vindo!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 20), // Espaço entre o texto e a imagem

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "lib/assets/book_ilustration.png",
                          height: 130,
                        ),
                        const SizedBox(
                            height: 5), // Espaço entre a imagem e o texto
                        Text(
                          "Libre Livros",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Espaço entre a imagem e o texto

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                          onPressed:(){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CadastroScreen()),
                          );
                          },
                          backgroundColor: Colors.transparent,
                          // Remover cor de fundo
                          elevation: 0,
                          child: Icon(
                            Icons.note_add,
                            size: 40,
                            color: Colors.orangeAccent,
                          ), // Aumentar o tamanho do ícone
                        ),
                        const SizedBox(
                            height: 15), // Espaço entre o ícone e o texto
                        Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 50), // Espaço entre os ícones
                    Column(
                      children: [
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                          },
                          backgroundColor: Colors.transparent,
                          //tira cor do botão
                          elevation: 0,
                          //tira o sombreamento
                          child: Icon(
                            Icons.login,
                            size: 40,
                            color: Colors.orangeAccent,
                          ), // Aumentar o tamanho do ícone
                        ),
                        const SizedBox(
                            height: 15), // Espaço entre o ícone e o texto
                        Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
