import 'package:flutter/material.dart';
import 'package:projeto02/app/controllers/jogadorFavorito_controller.dart';
import 'package:provider/provider.dart';

class JogadorFavoritoViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogadores Favoritos"),
      ),
      body: Provider<JogadorfavoritoController>(
        create: (_) => JogadorfavoritoController(),
        child: Consumer<JogadorfavoritoController>(
          builder: (context, jogadorFavorito, _) {
            return jogadorFavorito.favoritos.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "img/jogador.png",
                          width: 250,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("/buscarJogador");
                          },
                          child: Text("Buscar jogador"),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: jogadorFavorito.favoritos.length,
                    itemBuilder: (context, index) {
                      var dados = jogadorFavorito.favoritos[index];
                      return Container(
                        child: SizedBox(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  dados.player_image != null && dados.player_image.isNotEmpty
                                      ? Image.network(
                                          dados.player_image,
                                          width: 200,
                                          height: 200,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Text("Erro ao carregar imagem");
                                          },
                                        )
                                      : Text("Sem imagem"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Text("Nome: ${dados.player_name}"),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(dados.player_age != null ? "Idade: ${dados.player_age}" : "Idade: Não tem dados"),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text(dados.player_number != null ? "Número da camisa: ${dados.player_number}" : "Número da camisa: Não tem dados"),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text(dados.player_type != null ? "Posição: ${dados.player_type}" : "Posição: Não tem dados"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      child: Text("Favoritar"),
                                      onPressed: () {
                                        jogadorFavorito.favoritarJogador(dados);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
