import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vconnect/constants/constants.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {


    // Bottome navigation key
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // Bottom Naigation bar
  var _selectedTab = _SelectedTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // New bottom navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: primarycolor,
        items: <Widget>[
          Icon(Iconsax.calendar, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Iconsax.calendar_add, size: 30),
        ],
        onTap: _handleIndexChanged,
      ),
      body: Scaffold(
        backgroundColor: white,
        body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: IndexedStack(
                                index:
                                    _SelectedTab.values.indexOf(_selectedTab),
                                children: [
                                  Text("Home "),
                                  Text("search "),
                                  Text("profile"),
                                ])
              )))
    );
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
}

enum _SelectedTab { home, search, profile }