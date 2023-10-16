// ignore: file_names
import 'package:flutter/material.dart';
import 'package:odyssey/core/data/local/model/Destination.dart';
import 'package:odyssey/core/ui/style/TextStyle.dart';
import 'package:odyssey/core/ui/widget/DetailInfo.dart';
import 'package:odyssey/core/ui/widget/ImageDetail.dart';
import 'package:odyssey/core/ui/widget/LikeButton.dart';
import 'package:odyssey/core/ui/widget/SearchBar.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;
  DetailScreen({Key? key, required this.destination}) : super(key: key);

  final List<String> imageCarousell = [
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Banner(
                  name: destination.name,
                  imageUrl: destination.imageUrl,
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'What you will see',
                        style: OdysseyTextStyle.subtitle(),
                      ),
                      Spacer(),
                      LikedButton()
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "'Lorem ipsum' is a placeholder text commonly used in the printing and typesetting industry. It's used as filler text when the actual content is not available or when the focus is on the visual design and layout rather than the content itself. The text consists of Latin words and has no specific meaning, making it ideal for demonstrating fonts, layouts, and other design elements.",
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'People who also like it',
            style: OdysseyTextStyle.subtitle(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: UsersAvatars(),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Book Ticket'))
          ],
        )
      ]),
    );
  }
}

class Banner extends StatelessWidget {
  final String imageUrl;
  final String name;
  const Banner({Key? key, required this.imageUrl, required this.name})
      : super(key: key);
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
                    Expanded(
                        child: SearchBarCustom(
                      onChange: (text) {},
                    ))
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                name,
                style: OdysseyTextStyle.header(),
              ),
            ),
          ],
        ),
        Positioned(bottom: 12, left: 50, right: 50, child: DetailInfo())
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

class UsersAvatars extends StatelessWidget {
  UsersAvatars({Key? key}) : super(key: key);

  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1611484907270-d1e8d10e0f95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHNob3J0JTIwaGFpciUyMHdvbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1468488718849-422a2a5efc03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHNob3J0JTIwaGFpciUyMHdvbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1565537222174-2a43ca1c3462?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fHNob3J0JTIwaGFpciUyMHdvbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1575439462433-8e1969065df7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHNob3J0JTIwaGFpciUyMHdvbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1619255974339-895c880c0423?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fHNob3J0JTIwaGFpciUyMHdvbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          for (var i = 0; i < imageUrls.length; i++) ...[
            Align(
              widthFactor: 0.8,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrls[i]),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
