// ignore: file_names
import 'package:flutter/material.dart';
import 'package:odyssey/core/ui/style/TextStyle.dart';
import 'package:odyssey/core/ui/widget/DetailInfo.dart';
import 'package:odyssey/core/ui/widget/ImageDetail.dart';
import 'package:odyssey/core/ui/widget/SearchBar.dart';

class DetailScreen extends StatelessWidget {
  final String bannerImageUrl;
  DetailScreen({Key? key, required this.bannerImageUrl}) : super(key: key);

  final List<String> imageCarousell = [
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Banner(
              imageUrl: bannerImageUrl,
            ),
            const SizedBox(height: 16.0),
            DetailInfo(),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'A beach is a coastal area where land meets the sea, typically characterized by sandy or pebbly shores. Beaches are natural or man-made and offer a picturesque setting for relaxation and recreation. They often feature gently sloping shorelines, providing opportunities for swimming, sunbathing, beachcombing, and water sports. Beaches are popular destinations for tourists and locals alike, offering stunning ocean views, soothing sounds of waves, and a serene environment to unwind and enjoy nature.',
                style: OdysseyTextStyle.content(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Other images',
                style: OdysseyTextStyle.subtitle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 160.0,
                child: ListView.separated(
                  itemCount: imageCarousell.length,
                  itemBuilder: (context, index) =>
                      ImageCarousellItem(imageUrl: imageCarousell[index]),
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 8.0,
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  final String imageUrl;
  const Banner({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageDetail(imageUrl: imageUrl),
        Column(
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded)),
                    Expanded(child: SearchBarCustom())
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Beach in Tulungagung",
                style: OdysseyTextStyle.header(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ImageCarousellItem extends StatelessWidget {
  final String imageUrl;
  const ImageCarousellItem({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageUrl),
    );
  }
}
