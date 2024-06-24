import 'package:entrega1_livraria/view/pagamento_screen.dart';
import 'package:entrega1_livraria/view/produtos_screen.dart';
import 'package:flutter/material.dart';

class CarrinhoScreen extends StatefulWidget {
  
  const CarrinhoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CarrinhoScreen> createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry buttonPadding = const EdgeInsets.symmetric(vertical: 10);
    final Size buttonSize = const Size(145, 50);
    final Color buttonBackgroundColor = Colors.orangeAccent;
    final Color buttonForegroundColor = Colors.blueAccent;
    final Color containerBackgroundColor = Colors.white54;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
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
                  height: MediaQuery.of(context).padding.top + kToolbarHeight,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: containerBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 25.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
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
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 10,
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            size: 280,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(buttonBackgroundColor),
                                foregroundColor: MaterialStateProperty.all<Color>(buttonForegroundColor),
                                minimumSize: MaterialStateProperty.all<Size>(buttonSize),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
                              ),
                              onPressed:(){
                                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProdutosScreen()),
                          );
                              },
                              child: const Text('Continuar Comprando'),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(buttonBackgroundColor),
                                foregroundColor: MaterialStateProperty.all<Color>(buttonForegroundColor),
                                minimumSize: MaterialStateProperty.all<Size>(buttonSize),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
                              ),
                              onPressed:(){
                                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PagamentoScreen()),
                          );
                              },
                              child: const Text('Finalizar Compra'),
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
