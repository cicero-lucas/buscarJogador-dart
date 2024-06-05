class BuscarjogadorModels {
  final String player_name;
  final String player_type;
  final String player_age;
  final String player_image;
  final String player_country;
  final String player_number;
  final String team_name;
  bool isFavorite;

  BuscarjogadorModels(
      {required this.player_name,
      required this.player_type,
      required this.player_age,
      required this.player_image,
      required this.player_country,
      required this.player_number,
      required this.team_name,
      this.isFavorite=false,
      }
  );

  factory BuscarjogadorModels.fromJson(json) {
    return BuscarjogadorModels(
      player_name: json["player_name"],
      player_type: json["player_type"],
      player_age: json["player_age"],
      player_image: json["player_image"],
      player_country: json["player_country"],
      player_number: json["player_number"],
      team_name: json["team_name"],
    );
  }

  Map toJson() {
    return {
      "player_name": player_name,
      "player_type": player_type,
      "player_age": player_age,
      "player_image": player_image,
      "player_country": player_country,
      "player_number": player_number,
      "team_name": team_name,
    };
  }
}
