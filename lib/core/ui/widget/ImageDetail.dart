import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String imageUrl;
  const ImageDetail({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        child: Image.network(
      imageUrl,
      height: 320.0,
      width: width,
      fit: BoxFit.cover,
    ));
  }
}
