import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto02/app/bloc/Jogador_bloc.dart';
import 'package:projeto02/app/bloc/event/jogadorEvent.dart';
import 'package:projeto02/app/bloc/state/BuscarJogadorState.dart';
import 'package:projeto02/app/views/components/buscar_Jogador_form.dart';
import 'package:projeto02/app/views/components/cardJogador_components.dart';
import 'package:projeto02/app/views/components/navigation_drawer.dart';

class BuscarJogadorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Jogador"),
      ),
      drawer: NavigationDrawer_Compnente(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuscarJogadorForm(),
            SizedBox(height: 20.0),
            Expanded(child: JogadorList()),
          ],
        ),
      ),
    );
  }
}

class JogadorList extends StatefulWidget {
  @override
  State<JogadorList> createState() => _JogadorListState();
}

class _JogadorListState extends State<JogadorList> {
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JogadorBloc, BuscarJogadorState>(
      builder: (context, state) {
        if (state is BuscarInitialSate) {

          return Center(child: Image.asset("img/jogador.png"),);

        } else if (state is BuscarSucessState) {

          return ListView.builder(
            itemCount: state.jodador.length,
            itemBuilder: (context, index) {
              return CardJogador(jogador: state.jodador[index]);
            },

          );
        } else if (state is BuscarErrorState) {
          return Center(child: Text(state.mensagem));
        } else {
          return Container();
        }
      },
    );
  }


}
