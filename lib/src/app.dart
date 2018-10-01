import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';


class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return AppState();
  }



}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage(){
    counter++;
    get("http://jsonplaceholder.typicode.com/photos/$counter").then((res){
      ImageModel imageModel = ImageModel.fromJson(json.decode(res.body));
      setState(() {
        images.add(imageModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Let's see Images")),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

}