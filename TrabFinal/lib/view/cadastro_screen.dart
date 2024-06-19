import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrega1_livraria/view/wrapper.dart';
import '../bloc/profiler_bloc.dart';
import '../model/cadastro.dart';

class CadastroScreen extends StatefulWidget {
  final VoidCallback onNavigateToLogin;

  const CadastroScreen({
    Key? key,
    required this.onNavigateToLogin,
  }) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _nomeController;
  late TextEditingController _senhaController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nomeController = TextEditingController();
    _senhaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(""),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 25.0,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  controller: _nomeController,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  decoration: const InputDecoration(
                                    labelText: "Adicione seu nome",
                                    labelStyle:
                                        TextStyle(color: Colors.blueAccent),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "insira seu nome";
                                    }
                                    if (value.length < 3) {
                                      return "o nome é inválido";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  decoration: const InputDecoration(
                                    labelText: "Adicione seu e-mail",
                                    labelStyle:
                                        TextStyle(color: Colors.blueAccent),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "insira um email";
                                    }
                                    if (value.length < 10 ||
                                        !value.contains("@")) {
                                      return "o email é inválido";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(),
                                TextFormField(
                                  controller: _senhaController,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  decoration: const InputDecoration(
                                    labelText: "Senha do usuário",
                                    labelStyle:
                                        TextStyle(color: Colors.blueAccent),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "insira uma senha";
                                    }
                                    if (value.length < 6) {
                                      return "Insira uma senha com mais caracteres";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(),
                                ElevatedButton(
                                  onPressed: buttonCadastroClicado,
                                  child: const Text(
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
                          boxShadow: const [
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
                          image: const AssetImage('lib/assets/perfil_icon.png'),
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

  void buttonCadastroClicado() {
    if (_formKey.currentState!.validate()) {
      Cad nome = Cad.withData(
        nome: _nomeController.text,
        email: _emailController.text,
        senha: _senhaController.text,
      );
      BlocProvider.of<ProfileBloc>(context).add(SubmitEvent(nome: nome));
      print("Formulário válido!");
      // Exibe o dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Sucesso"),
            content: const Text("Cadastro efetuado com sucesso"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();  // Fecha o diálogo
                  widget.onNavigateToLogin();  // Navega para a tela de login
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      // Pega os dados
      print(
          "${_emailController.text}, ${_nomeController.text}, ${_senhaController.text}");
    } else {
      print("Formulário inválido!");
    }
  }
}
