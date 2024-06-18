import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrega1_livraria/provider/cad_provider.dart'; // Importe o CadProvider aqui

import '../model/cadastro.dart';
import '../view/list_cad.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(InsertState(cadList: [])) {
    on<SubmitEvent>((event, emit) {
      CadProvider.helper.insertCad(event.nome).then((_) {
        // Emitir um novo estado após a inserção bem-sucedida, se necessário
      }).catchError((error) {
        // Tratar qualquer erro que ocorra durante a inserção
      });
    });
    on<DeleteEvent>((event, emit) {
      CadProvider.helper.deleteCad(event.cadId).then((_) {
        // Emitir um novo estado após a exclusão bem-sucedida, se necessário
      }).catchError((error) {
        // Tratar qualquer erro que ocorra durante a exclusão
      });
    });

    on<GetCadListEvent>((event, emit) async {
      List<Cad> cadList = await CadProvider.helper.getCadList();
      emit(InsertState(cadList: cadList));
    });
  }
}

abstract class ProfileEvent {}

class SubmitEvent extends ProfileEvent {
  Cad nome;
  SubmitEvent({required this.nome});
}

class DeleteEvent extends ProfileEvent {
  String cadId;
  DeleteEvent({required this.cadId});
}

class GetCadListEvent extends ProfileEvent {}

abstract class ProfileState {}

class InsertState extends ProfileState {
  List<Cad> cadList;
  InsertState({required this.cadList});
}
