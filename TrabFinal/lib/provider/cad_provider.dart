import 'package:firebase_auth/firebase_auth.dart';

import '../model/cadastro.dart';
import 'package:dio/dio.dart';

class CadProvider {
  static CadProvider helper = CadProvider._createInstance();

//o contrutor privado define o singleton
  CadProvider._createInstance();
  Dio _dio = Dio();

  String prefixUrl = "https://bookshop-cae03-default-rtdb.firebaseio.com/";
  String suffixUrl = ".json";

  String uid = "default";

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
   Future<String?> getNameUserAuthenticated() async {
    User? user = FirebaseAuth.instance.currentUser;

    // Loop enquanto o usuário for nulo
    while (user == null) {
      await Future.delayed(Duration(
          seconds: 1)); // Espera 1 segundo antes de verificar novamente
      user = FirebaseAuth.instance.currentUser;
    }

    // Quando o usuário não for mais nulo, obtemos o nome
    String uid = user.uid;
    String localUrl = prefixUrl + uid + "/" + suffixUrl;
    Response response = await _dio.get(localUrl);
    Cad userProfile = Cad.fromMap(response.data);
    return userProfile.nome;
  }
}
