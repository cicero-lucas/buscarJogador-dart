import 'package:projeto02/app/bloc/models/buscarJogador_models.dart';

abstract class JogadorEvent{

}

class buscarJogadorEvent extends JogadorEvent{
  final String nomeJogador;
  buscarJogadorEvent({required this.nomeJogador});
}

class ToggleFavoriteEvent extends JogadorEvent{
  final BuscarjogadorModels jogador;
  ToggleFavoriteEvent({required this.jogador});
}

class GetFavoritesEvent extends JogadorEvent {}