import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:entrega1_livraria/bloc/auth_bloc.dart';
import 'package:entrega1_livraria/view/wrapper_try.dart';
import 'package:entrega1_livraria/view/screens/wrapper2.dart';
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
  projectId: "bookshop-cae03",
  storageBucket: "bookshop-cae03.appspot.com",
  messagingSenderId: "293707449516",
  appId: "1:293707449516:web:7286fd20a3657bf85c0b09",
  measurementId: "G-GGX4Y33WYT"
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => AuthBloc()),
        ], child: const Wrapper2()));
  }
}