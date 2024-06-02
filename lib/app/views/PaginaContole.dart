import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaginaContole extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body:  Stack(
          children: [
           
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/img/jogador.png",fit: BoxFit.cover,),
              
            ),

            Container(color:Colors.black.withOpacity(0.2)),

           ComponetesControle(),
           
          ],
        )
        );
        
  }
  
}


class ComponetesControle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ComponetesControleState();
  }

}

class ComponetesControleState extends State<ComponetesControle>{
  @override
  Widget build(BuildContext context) {
     return Container(
          width: double.infinity,
          height: double.infinity,
          child:Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Container(
                child: Text("Busca Jogador",style: TextStyle(color: const Color.fromARGB(255, 0, 140, 255),fontSize: 40, fontWeight: FontWeight.bold), ),
              ),

              Padding(padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                  ),
                    onPressed: (){
                      Navigator.of(context).pushNamed("/login");
                    }, 

                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                      ),
                      )
                  ),

                  SizedBox(
                    height: 10,
                    width: 80,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushNamed("/cadastro");
                    },
                     child:Text(
                      "Cadastra-se",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                     )
                     )
                ],
              ),
              ),


            ],
          ),
     );
  }

}