import 'package:flutter/material.dart';

import 'navigation/bottom_nav.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({Key? key}) : super(key: key);

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  // Lista das imagens usadas
  List<String> imageUrls = [
    'lib/assets/hobbit_book.png',
    'lib/assets/pedra_book.png',
    'lib/assets/ring_book.png',
    'lib/assets/enigma_book.png',
    // Adicione mais URLs de imagens conforme necessário
  ];

  // Lista dos ícones usados
  List<IconData> genreIcons = [
    Icons.rocket_launch, // Ícone para o gênero "Ação"
    Icons.extension, // Ícone para o gênero "kids"
    Icons.menu_book, // Ícone para o gênero "Didático"
  ];

  // Lista das descrições dos gêneros
  List<String> genreDescriptions = [
    'Ação', // Descrição para o gênero "Ação"
    'Infantil', // Descrição para o gênero "Kids"
    'Didático', // Descrição para o gênero "Didático"
  ];

  // Lista dos valores dos produtos
  List<double> productValues = [
    50.0, // Valor para o primeiro produto
    65.0, // Valor para o segundo produto
    63.0, // Valor para o terceiro produto
    40.0, // Valor para o quarto produto
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(""),
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
          // Grid com 3 quadrados para definir gênero (contando que só vou ter 3 por enquanto)
          children: [
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
                        genreDescriptions[
                            index], // Usar a descrição correspondente ao gênero
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              //aqui começa o grid de 4 que é dos produtos
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
                      //essa é a parte dos preços e compra do produto
                      SizedBox(height: 5),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/carrinho');
                        },
                        icon: Icon(Icons.shopping_cart),
                        //aqui é o valor de cada produto, que foi dado em uma lista lá em cima
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
