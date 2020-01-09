import 'package:flutter/material.dart';
import 'package:megasena/Models/MegaSena.dart';
import 'package:megasena/Views/HomeController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  HomeController hm;
  @override 
  Widget build(BuildContext context) {

     hm = new HomeController();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Text("Gerador de Números!",
          style: TextStyle(fontSize: 25),),
          Divider(),
          StreamBuilder<MegaSena>(
            initialData: MegaSena.empty(),
            stream: hm.outMegaSena,
            builder: (context, snapshot) {
              MegaSena ns = snapshot.data;
              return Container( 
                padding: EdgeInsets.only(top: 15, right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: <Widget>[
                   _numeroMegaSena(context, ns.numeroUm),
                   _numeroMegaSena(context, ns.numeroDois),
                   _numeroMegaSena(context, ns.numeroTres),
                   _numeroMegaSena(context, ns.numeroQuatro),
                   _numeroMegaSena(context, ns.numeroCinco),
                   _numeroMegaSena(context, ns.numeroSeis),
                 ],
                ),
              );
            }

          ),
           Divider(),

          SizedBox(
           height: 40,
           width: 40,
          ),
          RaisedButton(
           child: Text("Gerar Números!"),
            onPressed: () {
            hm.gerarNumerosAleatorios();
           print("Toda função alterar números");
          })

        ],
      ),
      ),
    );
  }

 Widget _numeroMegaSena(BuildContext context, int numero) {
   return Container(
     width: 26,
     height: 30,
     decoration: BoxDecoration(
       shape: BoxShape.circle,
       gradient: RadialGradient(colors: [Colors.white, Colors.green]),

     ),
     child: Center(child: Text(numero.toString())),

   );

 }

}