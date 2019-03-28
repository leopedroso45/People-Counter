import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String boasVindas = "Pode entrar!";

  void _atualizarPessoas(int num) {
    setState(() {
      _pessoas += num;

      if(_pessoas < 0){
        boasVindas = "What?!";
      } else if (_pessoas <= 10){
        boasVindas = "Pode entrar!";
      } else  {
        boasVindas = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoas",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _atualizarPessoas(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _atualizarPessoas(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              boasVindas,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        )
      ],
    );
  }
}
