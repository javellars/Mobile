import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profiler_bloc.dart';
import '../model/cadastro.dart';

class CadListScreen extends StatelessWidget {
  const CadListScreen({Key? key}) : super(key: key);

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
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            List<Cad> cadList = [];
            if (state is InsertState) {
              cadList = state.cadList;
            }

            return Column(
              children: [
                Expanded(child: getCadListView(cadList)),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ProfileBloc>(context)
                        .add(GetCadListEvent());
                  },
                  child: const Text("Refresh"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Método para construir a lista de cadastros
  ListView getCadListView(List<Cad> cadList) {
    return ListView.builder(
      itemCount: cadList.length,
      itemBuilder: (context, position) => ListTile(
        leading: const Icon(Icons.person),
        trailing: GestureDetector(
          onTap: () {
            // Adicione o evento para deletar o cadastro
            BlocProvider.of<ProfileBloc>(context)
                .add(DeleteEvent(cadId: cadList[position].cadId ?? ''));
          },
          child: const Icon(Icons.delete),
        ),
        title: Text(cadList[position].nome ?? ''),
        subtitle: Text(cadList[position].email ?? ''),
      ),
    );
  }
}
