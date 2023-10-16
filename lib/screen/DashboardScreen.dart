import 'package:flutter/material.dart';
import 'package:odyssey/core/data/local/dummyData.dart';
import 'package:odyssey/core/data/local/model/Destination.dart';
import 'package:odyssey/core/ui/style/TextStyle.dart';
import 'package:odyssey/core/ui/widget/CarousellItem.dart';
import 'package:odyssey/core/ui/widget/NearbyCard.dart';
import 'package:odyssey/core/ui/widget/SearchBar.dart';
import 'package:odyssey/screen/DetailScreen.dart';
import 'package:odyssey/screen/GalleryScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> categories = [
    'beach',
    'mountain',
    'forest',
    'urban',
    'other'
  ];

  int _selectedCategory = 0;
  void _setSelected(int index) {
    setState(() {
      _selectedCategory = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Let's explore",
                    style:
                        OdysseyTextStyle.header().apply(color: Colors.black)),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHNob3J0JTIwaGFpciUyMHdvbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60'),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            SearchBarCustom(
              onChange: (text) {},
            ),
            const SizedBox(height: 32.0),
            Row(
              children: [
                Text(
                  "Popular Destination",
                  style: OdysseyTextStyle.subtitle(),
                ),
                _width <= 600 ? Spacer() : SizedBox(width: 32),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleryScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Other',
                      style: TextStyle(color: Colors.deepPurple),
                    ))
              ],
            ),
            const SizedBox(height: 16.0),
            CategoriesPill(
              categories: categories,
              updateCategoryIndex: _setSelected,
            ),
            const SizedBox(height: 16.0),
            DestinationCarousell(
                data: dummyData
                    .where((element) =>
                        element['destination']?.category ==
                        categories[_selectedCategory])
                    .toList()),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  "Nearby",
                  style: OdysseyTextStyle.subtitle(),
                ),
                _width <= 600 ? Spacer() : SizedBox(width: 32),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleryScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Other',
                      style: TextStyle(color: Colors.deepPurple),
                    ))
              ],
            ),
            const SizedBox(height: 16.0),
            NearbyCarousell(data: dummyData),
          ],
        ),
      )),
    );
  }
}

class CategoriesPill extends StatefulWidget {
  final List<String> categories;
  final Function(int) updateCategoryIndex;

  const CategoriesPill(
      {Key? key, required this.categories, required this.updateCategoryIndex})
      : super(key: key);

  @override
  State<CategoriesPill> createState() => _CategoriesPillState();
}

class _CategoriesPillState extends State<CategoriesPill> {
  int _selected = 0;
  void _setSelected(int index) {
    setState(() {
      _selected = index;
      widget.updateCategoryIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => _setSelected(index),
                child: Container(
                  height: 32.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: _selected == index
                          ? Colors.deepPurple
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          color: Colors.purple[100] ?? Colors.white, width: 2)),
                  child: Text(
                    widget.categories[index],
                    style: TextStyle(
                        color: _selected == index ? Colors.white : Colors.grey),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemCount: widget.categories.length),
    );
  }
}

class DestinationCarousell extends StatelessWidget {
  final List<Map<String, Destination>> data;
  const DestinationCarousell({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.0,
      child: data.isEmpty
          ? Column(
              children: [
                Image.asset(
                  'assets/img/no_found.png',
                  width: 244,
                  height: 244,
                ),
                Text(
                  'No destination found',
                  style:
                      OdysseyTextStyle.subtitle().apply(color: Colors.blueGrey),
                )
              ],
            )
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = data[index]['destination'];

                return CarousellItem(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(destination: item!),
                        ),
                      );
                    },
                    name: item?.name ?? "-",
                    location: item?.location ?? "-",
                    imageUrl: item?.imageUrl ?? "-");
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 16.0,
                  ),
              itemCount: data.length),
    );
  }
}

class NearbyCarousell extends StatelessWidget {
  final List<Map<String, Destination>> data;
  const NearbyCarousell({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128.0,
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = data[index]['destination'];

            return NearbyCard(
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(destination: item!),
                    ),
                  );
                },
                name: item?.name ?? "-",
                location: item?.location ?? "-",
                imageUrl: item?.imageUrl ?? "-");
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 8.0,
              ),
          itemCount: data.length),
    );
  }
}
