import 'dart:convert';  // Import necessário para jsonDecode
import 'package:http/http.dart' as http;
import 'package:projeto02/app/models/buscarJogador_models.dart';

class BuscarJogadorRefectory {
  final String keyAp = 'c6ab3eba3949608ed254505b6b2913be1ac958077f4d539fa20c18c5fc14f236';

  Future fazerBusca(String nome) async {
    try{
      final Uri url = Uri.parse("https://apiv3.apifootball.com/?action=get_players&player_name=$nome&APIkey=$keyAp");
    var resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      var dados = jsonDecode(resposta.body) as List;
      return dados.map((el) => BuscarjogadorModels.fromJson(el)).toList();
    } else {
      throw Exception('Falha ao carregar dados');
    }
    }catch(e){
      print("erro!");
    }
    
  }
}
