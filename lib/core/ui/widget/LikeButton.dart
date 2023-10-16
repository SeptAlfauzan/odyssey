import 'package:flutter/material.dart';

class LikedButton extends StatefulWidget {
  LikedButton({Key? key}) : super(key: key);

  @override
  State<LikedButton> createState() => _LikedButtonState();
}

class _LikedButtonState extends State<LikedButton> {
  bool liked = false;
  void toggleLikeItem() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: toggleLikeItem,
        child: Icon(
          liked ? Icons.favorite : Icons.favorite_border,
          size: 36,
          color: liked ? Colors.red : Colors.blueGrey[300],
        ),
      ),
    );
  }
}
