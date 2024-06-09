// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xten_project/Categories/categories.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/favourites.dart';
import 'package:xten_project/home_page.dart';
import 'package:xten_project/profile.dart';
import 'package:xten_project/setting.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF8F00FF)),
                accountName: Text(
                  'Ayush Poudel',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                accountEmail: Text(
                  'ap202973@gmail.com',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ayush.jpg',
                  ),
                ),
              ),
              Positioned(
                right: 16.w,
                top: 25.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        const url =
                            'https://www.facebook.com/ayush.poudel.35325';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 32.sp, // Increased size
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () async {
                        const url =
                            'https://www.instagram.com/ayush.poudel.2122/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 32.sp, // Increased size
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                leading: Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: const Icon(Icons.person)),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                leading: Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: const FaIcon(
                    FontAwesomeIcons.home,
                  ),
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePageScreen()));
                },
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                leading: Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: const Icon(Icons.window_sharp)),
                title: const Text('Categories'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CategoryScreen()));
                },
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                leading: Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: const Icon(Icons.settings)),
                title: const Text('Setting'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Settings()));
                },
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                leading: Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: const Icon(Icons.star)),
                title: const Text('Favourites'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavouriteList()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
