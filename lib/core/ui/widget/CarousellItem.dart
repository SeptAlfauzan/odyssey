import 'package:flutter/material.dart';
import 'package:odyssey/core/ui/style/TextStyle.dart';

class CarousellItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final Function onClick;

  const CarousellItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: 240.0,
              height: 320.0,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.white, Colors.white10])),
                width: 240.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, //
                    children: [
                      Text(
                        name,
                        style: OdysseyTextStyle.subtitle(),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              color: Colors.purple),
                          Text(
                            location,
                            style: OdysseyTextStyle.body(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
