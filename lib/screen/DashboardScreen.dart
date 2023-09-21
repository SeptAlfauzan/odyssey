import 'package:flutter/material.dart';
import 'package:odyssey/core/data/local/model/Destination.dart';
import 'package:odyssey/core/ui/style/TextStyle.dart';
import 'package:odyssey/core/ui/widget/CarousellItem.dart';
import 'package:odyssey/core/ui/widget/NearbyCard.dart';
import 'package:odyssey/core/ui/widget/SearchBar.dart';
import 'package:odyssey/screen/DetailScreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Let's explore",
                  style: OdysseyTextStyle.header().apply(color: Colors.black)),
              const SizedBox(height: 16.0),
              SearchBarCustom(),
              const SizedBox(height: 32.0),
              Text(
                "Popular Destination",
                style: OdysseyTextStyle.subtitle(),
              ),
              const SizedBox(height: 16.0),
              DestinationCarousell(data: dummyData),
              const SizedBox(height: 32.0),
              Text("Nearby Me", style: OdysseyTextStyle.subtitle()),
              NearbyCarousell(data: dummyData),
            ],
          ),
        )),
      ),
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
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = data[index]['destination'];

            return CarousellItem(
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(bannerImageUrl: item?.imageUrl ?? "-"),
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
      height: 120.0,
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = data[index]['destination'];

            return NearbyCard(
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(bannerImageUrl: item?.imageUrl ?? "-"),
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

final List<Map<String, Destination>> dummyData = [
  {
    'destination': Destination(
        name: 'Popoh',
        location: 'Tulungagung',
        imageUrl:
            'https://images.unsplash.com/photo-1520942702018-0862200e6873?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJlYWNofGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60')
  },
  {
    'destination': Destination(
        name: 'Bayem',
        location: 'Tulungagung',
        imageUrl:
            'https://images.unsplash.com/photo-1515238152791-8216bfdf89a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fGJlYWNofGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60')
  },
  {
    'destination': Destination(
        name: 'Raja Ampat',
        location: 'Maluku',
        imageUrl:
            'https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFqYSUyMGFtcGF0fGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60')
  },
];
