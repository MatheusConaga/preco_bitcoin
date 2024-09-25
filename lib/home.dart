import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valorBitcoin = "0";
  void _Atualizar() async{
    String url = "https://blockchain.info/ticker";
    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);
    // print("resultado: "+retorno.toString());
    String real = retorno["BRL"]["buy"].toString();

    setState(() {
      _valorBitcoin = real;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "R\$ " + _valorBitcoin,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
                onPressed: _Atualizar,
                child: Text(
                    "Atualizar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

