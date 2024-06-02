import 'package:flutter/material.dart';
import 'package:projeto02/app/controllers/buscarJogador_controller.dart';
import 'package:projeto02/app/controllers/jogadorFavorito_controller.dart';

class BuscarjogadorWiew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuscarjogadorWiew_State();
  }
}

class BuscarjogadorWiew_State extends State<BuscarjogadorWiew> {
  late BuscarjogadorController controler;
  late JogadorfavoritoController jogadorFavorito;

  final TextEditingController nomejogador = TextEditingController();


  @override
  void initState() {
    super.initState();
    controler = BuscarjogadorController(texto: nomejogador);
    jogadorFavorito=JogadorfavoritoController();
  }



 Widget _sucesso() {
  return Container(
    child: ListView.builder(
      itemCount: controler.lista.length,
      itemBuilder: (context, index) {
        var dados = controler.lista[index];
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
                          width: 200,
                          height: 200,
                            dados.player_image,
                            errorBuilder: (context, error, stackTrace) {
                              return Text("Erro ao carregar imagem");
                            },
                          )
                        : Text("Sem imagem"),
                    SizedBox(height: 15), // Espaçamento entre a imagem e os textos
                    Container(
                      child: Text("Nome: ${dados.player_name}"),
                    ),
                    SizedBox(height: 5), // Pequeno espaçamento entre os textos
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
                    SizedBox(height: 20,),
                    Container(
                      child: ElevatedButton(child: Text("favorita"), onPressed: (){
                            jogadorFavorito.favoritarJogador(dados);
                    },),),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}


  _erro() {
    return Center(child: ElevatedButton(onPressed:(){
      controler.buscarJogador();
    }, child: Text("Recarregar")),);
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Center(child: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(top: 15, bottom: 5),
      child:ListView(
        children: [
         Image.asset("/img/jogador2.png"),
         Center(child: Container(child: Text("Buscar Jogador", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 20),),))
      ],),
      ));
  }

  mostraResustado(buscaStatus status) {
    switch (status) {
      case buscaStatus.sucesso:
        return _sucesso();
      case buscaStatus.erro:
        return _erro();
      case buscaStatus.start:
        return _start();
      case buscaStatus.loading:
        return _loading();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              subtitle: Text("Pagina inicial"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/home");
              },
            ),
            ListTile(
              title: Text("Favoritos"),
              leading: Icon(Icons.star_sharp),
              subtitle: Text("Jogadores favoritos"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/favorito");
              },
            ),
            ListTile(
              title: Text("Sair"),
              leading: Icon(Icons.exit_to_app),
              subtitle: Text("Sair do app"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/login");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Buscar Jogador"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: nomejogador,
                  autocorrect: true,
                  decoration: InputDecoration(
                      labelText: "Buscar Jogador",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
              ),
              SizedBox(
                height: 38,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      controler.buscarJogador();
                    },
                    child: Text("Buscar Jogador")),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: AnimatedBuilder(
                  animation: controler.state,
                  builder: (context, child) {
                    return mostraResustado(controler.state.value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
