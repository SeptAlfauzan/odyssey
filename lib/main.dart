import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:odyssey/core/ui/widget/GalleryItem.dart';
import 'package:odyssey/screen/DashboardScreen.dart';
import 'package:latlong2/latlong.dart';
import 'package:odyssey/screen/DetailScreen.dart';
import 'package:odyssey/screen/GalleryScreen.dart';
import 'package:odyssey/screen/MapScreen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = const [
    DashboardScreen(),
    MapScreen(),
    GalleryScreen()
  ];

  final List<Widget> _menuItem = <Widget>[
    Icon(
      Icons.home_rounded,
      size: 24,
      color: Colors.grey[400],
    ),
    Icon(
      Icons.location_on,
      size: 24,
      color: Colors.grey[400],
    ),
    Icon(
      Icons.favorite,
      size: 24,
      color: Colors.grey[400],
    ),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odyssey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: _menuItem,
          color: Colors.white,
          buttonBackgroundColor: Colors.deepPurple,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
