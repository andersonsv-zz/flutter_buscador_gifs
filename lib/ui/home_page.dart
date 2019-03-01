import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:buscador_gifs/ui/gif_page.dart';

//import 'package:share/share.dart';
//import 'package:transparent_image/transparent_image.dart';

const _giphyApi = "https://api.hgbrasil.com/finance?key=23eea980";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _trendingUrl = _giphyApi +
      "trending?api_key=XIUGZ9v2YCDZL78M3had4GiIen6QNNLs&limit=20&rating=G";
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(_trendingUrl);
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=JRY4bFHu1gfXkaFUy7t3cKE59NHF4ZmJ&q=$_search&limit=19&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise aqui!",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
