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
    var _width = MediaQuery.of(context).size.width * 0.8;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: _width,
        padding: EdgeInsets.all(12),
        color: Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: info,
        ),
      ),
    );
  }
}
