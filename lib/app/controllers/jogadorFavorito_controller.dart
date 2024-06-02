import 'package:flutter/material.dart';
import 'package:projeto02/app/models/buscarJogador_models.dart';

class JogadorfavoritoController extends ChangeNotifier{
  List<BuscarjogadorModels> favoritos =[];

  favoritarJogador(BuscarjogadorModels jogador){
    favoritos.add(jogador);
    notifyListeners();
  
  }

}

