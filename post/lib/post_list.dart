import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:post/comments.dart';
import 'package:post/postss.dart';
import 'package:http/http.dart' as http;

import 'package:post/comments_detail.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  List<Postss> list = List();//creamos una lista de Postss
  List<Comments> listC = List();//creamos lista de listC

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchData2();//obtiene datos de internet
  }

  void fetchData() async {
    final response = await http.get(
        "https://raw.githubusercontent.com/CubixMaster/Dispositivos-Mobiles/master/posts.json");//Hacer una solicitud de red
    list = (json.decode(response.body) as List)//obtiene el contenido del json y lo guarda en una lista
        .map((data) => new Postss.fromJson(data))
        .toList();
    setState(() {});//llamar a esta intruccion cuando el estado interno ah cambiado de una manera que podría afectar la interfaz
  }
  void fetchData2() async {
    final response = await http.get(
        "https://raw.githubusercontent.com/CubixMaster/Dispositivos-Mobiles/master/comments.json");
    listC = (json.decode(response.body) as List)
        .map((data) => new Comments.fromJson(data))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts App"),
        ),
        body: list == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(//lista el cual contiene
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://images6.alphacoders.com/906/thumb-1920-906770.jpg"),//intruccion para definir que llevara al inicio
                    ),
                    contentPadding: EdgeInsets.all(15.0),//definir el ancho interno
                    title: Text(list[index].title),//definir titulo
                    subtitle: Text(list[index].body),//definir subtitulo
                    trailing: Icon(
                      Icons.menu,
                      color: Colors.cyan,//instruccion para definir que llevara al final
                    ),
                    onTap: () {//esto se ejecuta al momento de presionarlo
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommentsDetail(list:list[index], listC:listC)//me manda al widget de comentario y pasa por parametro el post y todos los comentarios
                              )
                              );
                    },
                  );
                }));
  }
}

