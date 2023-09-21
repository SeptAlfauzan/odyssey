import 'package:flutter/material.dart';

class IconWText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWText({Key? key, required this.icon, required this.text})
      : super(key: key);

  final test = Icons.abc_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Icon(
          icon,
          color: Colors.purple,
        ),
        const SizedBox(height: 4.0),
        Text(
          text,
          style: const TextStyle(
            color: Colors.purple,
          ),
        ),
      ]),
    );
  }
}
