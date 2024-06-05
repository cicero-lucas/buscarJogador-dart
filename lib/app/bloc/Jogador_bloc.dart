import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto02/app/bloc/event/jogadorEvent.dart';
import 'package:projeto02/app/bloc/repository/buscaJogador_repository.dart';
import 'package:projeto02/app/bloc/state/BuscarJogadorState.dart';

class JogadorBloc extends Bloc<JogadorEvent, BuscarJogadorState> {
  final _jogadorRepo = BuscarJogadorRepository();

  JogadorBloc() : super(BuscarInitialSate()) {
    on<buscarJogadorEvent>(buscarJogadores);
    on<ToggleFavoriteEvent>(toggleFavorite);
    on<GetFavoritesEvent>(getFavorites);
  }

  Future<void> buscarJogadores(buscarJogadorEvent event, Emitter<BuscarJogadorState> emit) async {
    emit(BuscarInitialSate());
    try {
      final jogadores = await _jogadorRepo.fazerBusca(event.nomeJogador);
      emit(BuscarSucessState(jodador: jogadores));
    } catch (e) {
      emit(BuscarErrorState(mensagem: 'Erro ao carregar jogadores'));
    }
  }

  void toggleFavorite(ToggleFavoriteEvent event, Emitter<BuscarJogadorState> emit) {
    _jogadorRepo.addFaviriteJogador(event.jogador);
    emit(FavoritosState(favoritos: _jogadorRepo.getFavorites()));
  }

  void getFavorites(GetFavoritesEvent event, Emitter<BuscarJogadorState> emit) {
    emit(FavoritosState(favoritos: _jogadorRepo.getFavorites()));
  }
}
