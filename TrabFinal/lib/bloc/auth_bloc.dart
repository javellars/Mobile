import 'package:entrega1_livraria/model/cadastro.dart';
import 'package:entrega1_livraria/provider/cad_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/firebase_auth.dart';
//import '../model/user_model.dart';
//import '../provider/firebase_firestore.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      add(AuthServerEvent(event));
    });

    on<AuthServerEvent>((event, emit) {
      if (event.userProfile == null) {
        emit(Unauthenticated());
      } else {
        CadProvider.helper.uid = event.userProfile!;
        emit(Authenticated(userProfile: event.userProfile!));
      }
    });
//try e catch não captura erro d forma assíncrona
    on<RegisterUser>((event, emit) async {
      try {
        Cad user = event.user;
        await _authenticationService.createUserWithEmailAndPassword(
            user.email!, user.senha!);
            await CadProvider.helper.insertCad(user);
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });

    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(
            event.email, event.senha);
      } catch (e) {
        emit(AuthError(
            message:
                "Impossível Logar com ${event.email}: ${e.toString()}"));
      }
    });

    on<LoginAnonymousUser>((event, emit) async {
      try {
        await _authenticationService.signInAnonimo();
      } catch (e) {
        emit(AuthError(
            message: "Impossível Acessar Anonimamente: ${e.toString()}"));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(AuthError(message: "Impossível Efeturar Logout: ${e.toString()}"));
      }
    });
  }
}

/*
   Eventos
*/
abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  Cad user;

  RegisterUser({required this.user});
}

class LoginUser extends AuthEvent {
  String email;
  String senha;

  LoginUser({required this.email, required this.senha});
}

class LoginAnonymousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
//assim é basicamente uma chave prmaria do usuario
  final String? userProfile;
  AuthServerEvent(this.userProfile);
}

/*
Estados
*/

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String userProfile;
  Authenticated({required this.userProfile});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
