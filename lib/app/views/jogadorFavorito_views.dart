import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto02/app/bloc/Jogador_bloc.dart';
import 'package:projeto02/app/bloc/models/buscarJogador_models.dart';
import 'package:projeto02/app/bloc/state/BuscarJogadorState.dart';
import 'package:projeto02/app/views/components/cardJogador_components.dart';

import 'package:projeto02/app/views/components/navigation_drawer.dart';

class JogadorFavoritoViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogadores Favoritos"),
      ),
      drawer: NavigationDrawer_Compnente(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BlocBuilder<JogadorBloc, BuscarJogadorState>(
          builder: (context, state) {
            if (state is FavoritosState) {
              return JogadorList(jogadores: state.favoritos);
            } else {
              return Center(
                child: Text("Nenhum jogador favorito adicionado"),
              );
            }
          },
        ),
      ),
    );
  }
}

class JogadorList extends StatelessWidget {
  final List<BuscarjogadorModels> jogadores;

  JogadorList({required this.jogadores});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jogadores.length,
      itemBuilder: (context, index) {
        return CardJogador(jogador: jogadores[index]);
      },
    );
  }
}
