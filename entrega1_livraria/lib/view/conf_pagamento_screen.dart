import 'package:flutter/material.dart';

class ConfirmacaoPagamentoScreen extends StatefulWidget {
  const ConfirmacaoPagamentoScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmacaoPagamentoScreen> createState() =>
      _ConfirmacaoPagamentoScreenState();
}

class _ConfirmacaoPagamentoScreenState
    extends State<ConfirmacaoPagamentoScreen> {
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
                      vertical: 50.0, // Reduzindo o espaçamento vertical
                    ),
                    // Parte de cima do container central
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 50,
                          ),
                          child: Text(
                            'Compra Aprovada!',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 20,
                          ),
                          child: Icon(
                            Icons.add_task,
                            size: 240,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        // Botão "Prosseguir"
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent,
                              onPrimary: Colors.blueAccent,
                              fixedSize: Size(200, 50),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/produtos');
                            },
                            child: Text('Prosseguir'),
                          ),
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
