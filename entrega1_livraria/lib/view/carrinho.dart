import 'package:flutter/material.dart';

class CarrinhoScreen extends StatefulWidget {
  const CarrinhoScreen({Key? key}) : super(key: key);

  @override
  State<CarrinhoScreen> createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top +
                      kToolbarHeight, // Espaço para a AppBar
                ),
                // Container central
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 25.0, // Reduzindo o espaçamento vertical
                    ),
                    // Parte de cima do container central
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 10,
                          ),
                          child: Text(
                            'Item adicionado ao carrinho!',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 10,
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            size: 280,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        //daqui ele faz a linha dos botões
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orangeAccent,
                                onPrimary: Colors.blueAccent,
                                fixedSize: Size(145, 50),
                                padding: EdgeInsets.symmetric(vertical: 10),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/produtos');
                              },
                              child: Text('Continuar Comprando'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orangeAccent,
                                onPrimary: Colors.blueAccent,
                                fixedSize: Size(145, 50),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/pagamento');
                              },
                              child: Text('Finalizar Compra'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
