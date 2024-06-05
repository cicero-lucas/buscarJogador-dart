import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto02/app/bloc/Jogador_bloc.dart';
import 'package:projeto02/app/bloc/event/jogadorEvent.dart';
import 'package:projeto02/app/bloc/models/buscarJogador_models.dart';

class CardJogador extends StatelessWidget {
  final BuscarjogadorModels jogador;
  final JogadorBloc bloc = JogadorBloc();

  CardJogador({required this.jogador});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 250,
      child: Card(
        child: Column(
          children: [
            Container(
              child: jogador.player_image!=""? Image.network(jogador.player_image) : Text("Sem imagem"),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text(jogador.player_name!=""? jogador.player_name: "Nome não definido"),
            ),
            SizedBox(height: 20,),
            Container( child: Text(jogador.team_name!=""?jogador.team_name:"Time não definido")),
            SizedBox(height: 20,),
            Container(
              child: IconButton(
                icon: Icon( jogador.isFavorite ? Icons.star : Icons.star_border,color: jogador.isFavorite ? Color.fromARGB(255, 255, 183, 0) : null,) ,
                onPressed: () {
                   BlocProvider.of<JogadorBloc>(context).add(ToggleFavoriteEvent(jogador: jogador));
                },
              ),
            )
          ],
          ),
        ),
      );
  }
}
