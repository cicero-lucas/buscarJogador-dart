import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto02/app/bloc/Jogador_bloc.dart';
import 'package:projeto02/app/bloc/event/jogadorEvent.dart';

class BuscarJogadorForm extends StatefulWidget {
  @override
  _BuscarJogadorFormState createState() => _BuscarJogadorFormState();
}

class _BuscarJogadorFormState extends State<BuscarJogadorForm> {
  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nomeController,
          decoration: InputDecoration(
            labelText: "Buscar Jogador",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<JogadorBloc>(context).add(
              buscarJogadorEvent(nomeJogador: _nomeController.text),
            );
          },
          child: Text("Buscar Jogador"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }
}
