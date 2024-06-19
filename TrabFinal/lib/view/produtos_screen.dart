import 'package:flutter/material.dart';
import 'package:entrega1_livraria/view/carrinho.dart'; // Certifique-se de importar corretamente a tela CarrinhoScreen

class ProdutosScreen extends StatefulWidget {
  final VoidCallback onNavigateToInicio;

  const ProdutosScreen({
    Key? key,
    required this.onNavigateToInicio,
  }) : super(key: key);

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  List<String> imageUrls = [
    'lib/assets/hobbit_book.png',
    'lib/assets/pedra_book.png',
    'lib/assets/ring_book.png',
    'lib/assets/enigma_book.png',
  ];

  List<IconData> genreIcons = [
    Icons.rocket_launch,
    Icons.extension,
    Icons.menu_book,
  ];

  List<String> genreDescriptions = [
    'Ação',
    'Infantil',
    'Didático',
  ];

  List<double> productValues = [
    50.0,
    65.0,
    63.0,
    40.0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(""),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Ícone de logout
            onPressed: () {
              widget.onNavigateToInicio(); // Aqui corrigimos para acessar corretamente a função passada como parâmetro
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'O que você procura hoje?',
                        filled: true,
                        fillColor: Colors.white54,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Implemente a lógica de pesquisa aqui
                    },
                  ),
                ],
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Icon(
                          genreIcons[index],
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        genreDescriptions[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/carrinho');
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text('R\$ ${productValues[index]}'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
