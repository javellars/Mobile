import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:entrega1_livraria/bloc/auth_bloc.dart';
import 'package:entrega1_livraria/view/wrapper.dart';
import 'package:entrega1_livraria/view/wrapper2.dart';
import 'package:entrega1_livraria/view/inicio_screen.dart';
import 'package:entrega1_livraria/bloc/profiler_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCqySIwOtGFNKPJtcWaj__irz6SrD4TxlM",
        authDomain: "bookshop-cae03.firebaseapp.com",
        databaseURL: "https://bookshop-cae03-default-rtdb.firebaseio.com",
        storageBucket: "bookshop-cae03.appspot.com",
        appId: "1:293707449516:web:7286fd20a3657bf85c0b09",
        messagingSenderId: "293707449516",
        projectId: "bookshop-cae03",
      ),
    );
  } catch (e) {
    print('Erro ao inicializar o Firebase: $e');
    // Aqui você pode lidar com o erro, por exemplo, mostrar uma mensagem ao usuário
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProfileBloc();
      },
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc()),
          ],
          child:MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home:  Wrapper2(),
        ), // Utiliza o Wrapper como tela inicial
      ),
    );
  }
}
