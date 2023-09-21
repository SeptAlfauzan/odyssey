import 'package:flutter/material.dart';
import 'package:odyssey/core/ui/widget/IconWText.dart';

class DetailInfo extends StatelessWidget {
  DetailInfo({Key? key}) : super(key: key);

  final info = [
    const IconWText(icon: Icons.date_range, text: 'Open Everyday'),
    const IconWText(icon: Icons.av_timer, text: '09.00-20.00'),
    const IconWText(icon: Icons.money, text: 'Rp25.000,-'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: info,
      ),
    );
  }
}
