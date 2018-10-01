import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index){
          return buildImageItem(images[index]);
        }
    );
  }


  Widget buildImageItem(ImageModel image){
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Text(image.title)
        ],
      ),
    );
  }
}