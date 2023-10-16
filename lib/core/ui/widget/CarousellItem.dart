import 'package:flutter/material.dart';
import 'package:odyssey/core/ui/style/TextStyle.dart';
import 'package:odyssey/core/ui/widget/LikeButton.dart';

class CarousellItem extends StatefulWidget {
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
  State<CarousellItem> createState() => _CarousellItemState();
}

class _CarousellItemState extends State<CarousellItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Image.network(
              widget.imageUrl,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min, //
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              widget.name,
                              softWrap: true, // Enable text wrapping
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis overflow
                              maxLines: 1,
                              style: OdysseyTextStyle.subtitle(),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,
                                  color: Colors.purple),
                              Container(
                                width: 120,
                                child: Text(
                                  widget.location,
                                  softWrap: true, // Enable text wrapping
                                  overflow: TextOverflow
                                      .ellipsis, // Use ellipsis overflow
                                  maxLines: 1,
                                  style: OdysseyTextStyle.body(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      LikedButton(),
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
