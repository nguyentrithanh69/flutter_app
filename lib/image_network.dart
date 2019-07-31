import 'package:flutter/material.dart';
class ImageNetWork extends StatelessWidget {
  final String imageUrl;
  final String imageBackdrop;

  ImageNetWork(this.imageUrl, this.imageBackdrop);

  @override
  Widget build(BuildContext context) {
    return new FadeInImage(image: new NetworkImage(imageUrl),
        placeholder: new AssetImage(imageBackdrop));
  }
}
