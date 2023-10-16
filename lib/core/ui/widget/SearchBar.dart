import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  final Function(String) onChange;
  SearchBarCustom({Key? key, required this.onChange}) : super(key: key);

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEditingController.addListener(() {
      // Get the current text value when it changes
      String text = _textEditingController.text;
      // Call the onChange callback with the updated text
      widget.onChange(text);
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border:
            Border.all(color: Color.fromARGB(255, 206, 222, 236), width: 1.0),
        color: Color.fromARGB(255, 226, 239, 252),
      ),
      child: TextField(
        controller: _textEditingController,
        style: TextStyle(
          // Add a TextStyle to set the text color
          color:
              Colors.black, // Set the text color to black or your desired color
        ),
        decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 156, 178, 197),
            ),
            border: InputBorder.none, // Remove the default border
            hintText: 'Search Other Place',
            hintStyle: TextStyle(color: Color.fromARGB(255, 156, 178, 197))),
      ),
    );
  }
}
