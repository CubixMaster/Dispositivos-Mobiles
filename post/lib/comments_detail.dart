import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:post/postss.dart';
import 'package:post/comments.dart';

/* ((class CommentsDetail extends StatefulWidget {
  @override
  _CommentsDetail createState() =>  _CommentsDetail();
  
}) */
class CommentsDetail extends StatefulWidget {
  CommentsDetail({this.list, this.listC});//aqui asignamos los elementos que nos acaban de llegar a nuestras variables

  List<Comments> listC = List();
  final Postss list;

  @override
  _CommentsDetailState createState() => _CommentsDetailState();
}

class _CommentsDetailState extends State<CommentsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts App"),
        ),
        body: widget.listC == null//comprobamos que no este vacio la lista
            ? Center(
                child: CircularProgressIndicator(),//en caso de que este vacio mostrara el circulo de carga
              )
            : Column(//sino esta vacia entonces creamos un Column 
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5.00),
                  child : Image.network("https://images6.alphacoders.com/906/thumb-1920-906770.jpg",),//Ponemos primero una imagen hasta emro arriba
                  
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.00),
                    child: Card(
                      margin: EdgeInsets.all(0.00),
                      child: Text(widget.list.title,//despues poenmos el titulo del post
                      style: TextStyle(
                        fontSize: 20,
                        color : Colors.black
                      ),
                      ), 
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(0.00),
                    child: Card(
                      margin: EdgeInsets.all(5.00),
                      child: Text(widget.list.body,//despues ponemos el cuerpo del post 
                      style: TextStyle(
                        fontSize: 15,
                        color : Colors.black54
                      ),
                      ),
                      ),
                      ),
                  Expanded(
                      child: ListView.builder(//y aqui ponemos los comentarios en la lista
                          itemCount: widget.listC.length,
                          itemBuilder: (BuildContext context, int index) {
                            return widget.listC[index].postId == widget.list.id//aqui verificamos de solo escribir los comentarios del post seleccionados
                                ? ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://a.wattpad.com/cover/178110620-352-k654039.jpg"),
                                    ),
                                    /* leading: Icon(
                      Icons.account_circle,
                      color: Colors.black,
                    ), */
                                    contentPadding: EdgeInsets.all(15.0),
                                    title: Text(widget.listC[index].name),
                                    subtitle: Text('Email:' +
                                        widget.listC[index].email +
                                        '\n' +
                                        widget.listC[index].body),
                                    trailing: Icon(
                                      Icons.mail_outline,
                                      color: Colors.cyan,
                                    ),
                                  )
                                : Center();
                          }))
                ],
              ));
  }
}
