import 'package:projeto02/app/bloc/models/buscarJogador_models.dart';

abstract class BuscarJogadorState{
 
}

class BuscarInitialSate extends BuscarJogadorState{

}

class BuscarSucessState extends BuscarJogadorState{
  final List<BuscarjogadorModels> jodador;
  
  BuscarSucessState({required this.jodador});

}

class BuscarErrorState extends BuscarJogadorState{
  final String mensagem;
  BuscarErrorState({required this.mensagem}); 
}

class FavoritosState extends BuscarJogadorState {
  final List<BuscarjogadorModels> favoritos;

  FavoritosState({required this.favoritos});
}