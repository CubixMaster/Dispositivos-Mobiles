import 'package:flutter/material.dart';
import 'package:post/post_list.dart';

void main(){
  runApp(MaterialApp(
    title: "Posts App",
    home: PostsList(),
    //home: PostsList(),
    debugShowCheckedModeBanner: false,
  ));
}