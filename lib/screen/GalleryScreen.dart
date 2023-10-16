import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:odyssey/core/data/local/dummyData.dart';
import 'package:odyssey/core/data/local/model/Destination.dart';
import 'package:odyssey/core/ui/widget/CarousellItem.dart';
import 'package:odyssey/core/ui/widget/GalleryItem.dart';
import 'package:odyssey/core/ui/widget/SearchBar.dart';
import 'package:odyssey/screen/DetailScreen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Map<String, Destination>> filteredData = dummyData;

  void onFilterData(String keyword) {
    setState(() {
      if (keyword == '') {
        filteredData = dummyData;
      } else {
        filteredData = filteredData
            .where((e) =>
                e['destination']?.name.toLowerCase().contains(keyword) ?? true)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: SafeArea(
          child: Stack(children: [
            Container(
              padding: EdgeInsets.only(top: 64.0),
              child: MasonryGridView.count(
                crossAxisCount: _width <= 480 ? 2 : 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  var data = filteredData[index]['destination'];
                  return GalleryItem(
                    imageUrl: data?.imageUrl ?? "",
                    name: data?.name ?? "",
                    location: data?.location ?? "",
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            destination: data!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded)),
                Expanded(child: Builder(builder: (context) {
                  return SearchBarCustom(
                    onChange: (text) {
                      onFilterData(text);
                    },
                  );
                })),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
