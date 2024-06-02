import 'package:flutter/material.dart';
import 'package:projeto02/app/models/buscarJogador_models.dart';
import 'package:projeto02/app/refectory/buscaJogador_refectory.dart';

class BuscarjogadorController {
  List<BuscarjogadorModels> lista = [];
  final TextEditingController texto;
  late BuscarJogadorRefectory buscar;
  final state = ValueNotifier<buscaStatus>(buscaStatus.start);

  BuscarjogadorController({required this.texto}) {
    buscar = BuscarJogadorRefectory();
  }

  Future<void> buscarJogador() async {
    String nome = texto.text;
    if (nome.isNotEmpty) {
      state.value = buscaStatus.loading;
      try {
        lista = await buscar.fazerBusca(nome);
        state.value = lista.isNotEmpty ? buscaStatus.sucesso : buscaStatus.start;
      } catch (e) {
        state.value = buscaStatus.erro;
      }
    } else {
      print("Digite um nome");
    }
  }
}

enum buscaStatus {
  loading,
  sucesso,
  start,
  erro,
}
