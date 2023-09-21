import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  SearchBarCustom({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.grey[50]?.withOpacity(0.6),
      ),
      child: TextField(
        controller: _textEditingController,
        decoration: const InputDecoration(
          border: InputBorder.none, // Remove the default border
          hintText: 'Search Other Place',
        ),
      ),
    );
  }
}
