import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:entrega1_livraria/view/login_screen.dart';
import '../bloc/profiler_bloc.dart';
import '../model/cadastro.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

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
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Adicione seu nome",
                                    labelStyle:
                                        TextStyle(color: Colors.blueAccent),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira seu nome";
                                    }
                                    if (value.length < 3) {
                                      return "Nome inválido";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Adicione seu e-mail",
                                    labelStyle:
                                        TextStyle(color: Colors.blueAccent),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira um e-mail";
                                    }
                                    if (value.length < 10 ||
                                        !value.contains("@")) {
                                      return "E-mail inválido";
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
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Senha do usuário",
                                    labelStyle:
                                        TextStyle(color: Colors.blueAccent),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira uma senha";
                                    }
                                    if (value.length < 6) {
                                      return "Senha deve ter no mínimo 6 caracteres";
                                    }
                                    return null;
                                  },
                                ),
                                const Divider(),
                                ElevatedButton(
                                  onPressed: buttonCadastroClicado,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.lightBlue),
                                  ),
                                  child: const Text(
                                    "Cadastrar",
                                    style: TextStyle(color: Colors.white),
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
                          image: const AssetImage(
                              'lib/assets/perfil_icon.png'),
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

  void buttonCadastroClicado() async {
    if (_formKey.currentState!.validate()) {
      try {
        /* UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _senhaController.text); */

        // Cadastro realizado com sucesso
        Cad cadastro = Cad.withData(
          nome: _nomeController.text,
          email: _emailController.text,
          senha: _senhaController.text,
          //cadId: userCredential.user!.uid,
        );

        BlocProvider.of<ProfileBloc>(context).add(SubmitEvent(nome: cadastro));
        debugPrint("Formulário válido!");
        // Exibe o dialog de sucesso
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Sucesso"),
              content: const Text("Cadastro efetuado com sucesso"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      } catch (e) {
        // Captura e exibe o erro
        debugPrint("Erro ao cadastrar usuário: $e");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Erro"),
              content: Text("Erro ao cadastrar usuário: $e"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Fecha o AlertDialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      debugPrint("Formulário inválido!");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nomeController.dispose();
    _senhaController.dispose();
    super.dispose();
  }
}
