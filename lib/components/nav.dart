import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vconnect/constants/constants.dart';
import 'package:vconnect/screens/add_post_screen.dart';
import 'package:vconnect/screens/feed_screen.dart';
import 'package:vconnect/screens/notification_screen.dart';
import 'package:vconnect/screens/profilescreen.dart';
import 'package:vconnect/screens/search_screen.dart';

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
              Iconsax.home_trend_up,
              color: _page == 0 ? white : gray,
            ),
            label: '',
            backgroundColor: trans,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.search_normal,
              color: _page == 1 ? white : gray,
            ),
            label: '',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.add_circle,
              color: _page == 2 ? white : gray,
            ),
            label: '',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.document_favorite,
              color: _page == 3 ? white : gray,
            ),
            label: '',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.profile_circle,
              color: _page == 4 ? white : gray,
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

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const NotificationScreen(),
  const ProfileScreen(),
];
