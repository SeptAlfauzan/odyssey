// ignore: file_names
import 'package:flutter/material.dart';
import 'package:odyssey/core/ui/style/TextStyle.dart';

class NearbyCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final Function onClick;

  const NearbyCard({
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
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.blue[50]?.withOpacity(0.4),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "1.2Km",
                style: OdysseyTextStyle.subtitle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
