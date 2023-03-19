import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vconnect/constants/constants.dart';
import 'package:vconnect/screens/profilescreen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  } // for tabs animation

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: primarycolor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: _page == 0 ? white : primarycolor,
            ),
            label: '',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: _page == 1 ? white : primarycolor,
            ),
            label: '',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_rounded,
              color: _page == 2 ? white : primarycolor,
            ),
            label: '',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
              color: _page == 3 ? white : primarycolor,
            ),
            label: '',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 4 ? white : primarycolor,
            ),
            label: '',
            backgroundColor: white,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}