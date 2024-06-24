import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrega1_livraria/bloc/auth_bloc.dart';
import 'package:entrega1_livraria/view/produtos_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(""),
      ),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _loginController;
  late TextEditingController _senhaController;
  bool _isLoginButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _senhaController = TextEditingController();

    // Adicionar um listener para verificar quando os campos de texto são alterados
    _loginController.addListener(_verifyLoginButtonEnabled);
    _senhaController.addListener(_verifyLoginButtonEnabled);
  }

  @override
  void dispose() {
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  // Função para verificar se os campos de texto estão preenchidos
  void _verifyLoginButtonEnabled() {
    setState(() {
      _isLoginButtonEnabled =
          _loginController.text.isNotEmpty && _senhaController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: _loginController,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: const InputDecoration(
                                  labelText: "Login do Usuário",
                                  labelStyle: TextStyle(color: Colors.blueAccent),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, digite seu login';
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
                                  labelStyle: TextStyle(color: Colors.blueAccent),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, digite sua senha';
                                  }
                                  return null;
                                },
                              ),
                              const Divider(),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    _formKey.currentState!.save();
                                    BlocProvider.of<AuthBloc>(context).add(
                                      LoginUser(email: _loginController.text, senha: _senhaController.text),
                                    );
                                  }
                                },
                                child: const Text(
                                  "Entrar",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
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
    );
  }
}
