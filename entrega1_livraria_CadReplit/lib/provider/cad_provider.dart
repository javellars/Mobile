import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';

import '../model/cadastro.dart';
import 'package:dio/dio.dart';

class CadProvider {
  static CadProvider helper = CadProvider._createInstance();

//o contrutor privado define o singleton
  CadProvider._createInstance();
  Dio _dio = Dio();

  String prefixUrl =
      "https://2eb41c9d-5db1-4f21-a743-cfd06c6264a0-00-2clstisa074ee.worf.replit.dev/cadastros/";
  String suffixUrl = "";

  Future<Cad> getCad(cadId) async {
    Response response = await _dio.get(prefixUrl + cadId + "/" + suffixUrl);
    return Cad.fromMap(response.data);
  }

  Future<int> insertCad(Cad cad) async {
    await _dio.post(
      prefixUrl + suffixUrl,
      data: cad.toMap(),
    );
    return 42;
  }

  Future<int> deleteCad(cadId) async {
    await _dio.delete(prefixUrl + cadId + "/" + suffixUrl);
    return 42;
  }

  Future<int> updateCad(cadId, Cad cad) async {
    await _dio.put(prefixUrl + cadId + "/" + suffixUrl, data: cad.toMap());
    return 42;
  }

  Future<List<Cad>> getCadList() async {
    Response response = await _dio
        .get(prefixUrl + suffixUrl); //responde vai devolver todos os dados

    List<Cad> CadCollection = [];

    response.data.forEach((key, value) {
      //colocando key passa a iterar sobre um dicionario
      Cad cad = Cad.fromMap(value);
      cad.cadId = key;
      //noteCollection.insertNoteOfId(value["id"].toString(), note);

      CadCollection.add(cad);
    });
    return CadCollection;
  }
/*Coloca o Steam aqui*/

  StreamController _controller = StreamController();

  Stream get stream {
    Socket socket = io(
        "https://2eb41c9d-5db1-4f21-a743-cfd06c6264a0-00-2clstisa074ee.worf.replit.dev",
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            .build());

//o on fala que no caso de server information, ele envia isso aqui como dados(o que tá ai embaixo)
    socket.on('server_information', (data) {
      /*
       O servidor nos informa o dado que foi modificado.
      */
      //coleta esses dados aqui
      String cadId = data["cadId"].toString();
      String nome = data["nome"];
      String email = data["email"];

      // Vamos assumir que "title=null" significa uma remoção.
      if (nome == "") {
        //notify(noteId, null);
      } else {
        Cad cad = Cad();
        cad.cadId = cadId;
        cad.nome = nome;
        cad.email = email;
        _controller.sink.add([cadId, cad]);
        // notify(noteId, note);
      }
    });
    return _controller.stream;
  }
}
