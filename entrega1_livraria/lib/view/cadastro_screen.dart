import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
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
              Colors.blue,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.height / 2.3,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 25.0,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //Primeiro label para nome
                              TextFormField(
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  labelText: "Adicione seu nome",
                                  labelStyle:
                                      TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                              Divider(),
                              //Segundo label para login que vai ser o email
                              TextFormField(
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  labelText: "Adicione seu e-mail",
                                  labelStyle:
                                      TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                              //Terceiro label para definição da senha
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  labelText: "Senha do usuário",
                                  labelStyle:
                                      TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                              Divider(),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            'Cadastro efetuado com sucesso'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.pushNamed(
                                                  context, '/login');
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Cadastrar",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.lightBlue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 7,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(80),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 25.0,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Image(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.height / 5,
                          image: AssetImage('lib/assets/perfil_icon.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
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
