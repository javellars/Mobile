import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrega1_livraria/provider/cad_provider.dart';

import '../model/cadastro.dart';
import '../view/list_cad.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(InsertState(cadList: [])) {
    CadProvider.helper.stream.listen((event) {
      add(GetCadListEvent());
    });

    on<SubmitEvent>((event, emit) async {
      try {
        if (state is UpdateState) {
          await CadProvider.helper.updateCad((state as UpdateState).cadId, event.nome);
        } else {
          await CadProvider.helper.insertCad(event.nome);
        }
        List<Cad> cadList = await CadProvider.helper.getCadList();
        emit(InsertState(cadList: cadList));
      } catch (error) {
        // Tratar qualquer erro que ocorra durante a inserção ou atualização
        emit(ErrorState(message: error.toString()));
      }
    });

    on<DeleteEvent>((event, emit) async {
      try {
        await CadProvider.helper.deleteCad(event.cadId);
        List<Cad> cadList = await CadProvider.helper.getCadList();
        emit(InsertState(cadList: cadList));
      } catch (error) {
        // Tratar qualquer erro que ocorra durante a exclusão
        emit(ErrorState(message: error.toString()));
      }
    });

    on<GetCadListEvent>((event, emit) async {
      try {
        List<Cad> cadList = await CadProvider.helper.getCadList();
        emit(InsertState(cadList: cadList));
      } catch (error) {
        // Tratar qualquer erro que ocorra durante a obtenção da lista
        emit(ErrorState(message: error.toString()));
      }
    });

    on<UpdateRequest>((event, emit) {
      emit(UpdateState(
        cadId: event.cadId,
        cadList: state.cadList,
      ));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState(
        cadList: state.cadList,
      ));
    });
  }
}

abstract class ProfileEvent {}

class SubmitEvent extends ProfileEvent {
  final Cad nome;
  SubmitEvent({required this.nome});
}

class DeleteEvent extends ProfileEvent {
  final String cadId;
  DeleteEvent({required this.cadId});
}

class GetCadListEvent extends ProfileEvent {}

class UpdateRequest extends ProfileEvent {
  final String cadId;
  UpdateRequest({required this.cadId});
}

class UpdateCancel extends ProfileEvent {}

abstract class ProfileState {
  List<Cad> cadList;
  ProfileState({required this.cadList});
}

class InsertState extends ProfileState {
  InsertState({required super.cadList});
}

class UpdateState extends ProfileState {
  final String cadId;
  UpdateState({
    required this.cadId,
    required super.cadList,
  });
}

class ErrorState extends ProfileState {
  final String message;
  ErrorState({required this.message}) : super(cadList: []);
}
