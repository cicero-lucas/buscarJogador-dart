
import 'package:flutter/material.dart';
import 'package:projeto02/app/views/HomePage.dart';
import 'package:projeto02/app/views/PaginaCadastro.dart';
import 'package:projeto02/app/views/PaginaContole.dart';
import 'package:projeto02/app/views/PaginaLogin.dart';
import 'package:projeto02/app/views/buscarJogador_wiew.dart';
import 'package:projeto02/app/views/jogadorFavorito_views.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light
      ),
      initialRoute: "/",
      routes:{
        "/":(context)=>PaginaContole(),
        "/home":(context)=>HomePage(),
        "/cadastro":(context)=>PaginaCadastro(),
        "/login":(context)=>PaginaLogin(),
        "/buscarJogador":(context)=>BuscarjogadorWiew(),
        "/favorito":(context)=>JogadorFavoritoViews()
      },
  
    );
  }

}