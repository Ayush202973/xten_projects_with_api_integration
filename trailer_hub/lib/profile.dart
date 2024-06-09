// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_avengers.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_kalki.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_thor.dart';
import 'package:xten_project/Favourites%20and%20Watchlist/watch_list_yodha.dart';
import 'package:xten_project/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int myIndex = 0;
  List<Widget> navigate = [const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil with the design size and allow font scaling.
    ScreenUtil.init(context,
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF8F00FF), // Color for the top part
              child: SafeArea(
                bottom: false, // Only apply SafeArea padding at the top
                child: Container(
                  height: 0.38.sh,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8F00FF),
                        Color.fromARGB(255, 219, 198, 209),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0.028.sh,
                        left: 10.w,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePageScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 30.w,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.08.sh,
                        left: 0.35.sw,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/ayush.jpg'),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        top: 0.15.sh,
                        left: 0.64.sw,
                        child: const Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.pencil,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0.24.sh,
                        left: 0.29.sw,
                        child: Text(
                          'Ayush Poudel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 1.sw,
              color: const Color.fromARGB(255, 219, 198, 209),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'WatchList (Saved Trailers)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     const Text('see all'),
                        //     IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(
                        //         Icons.keyboard_double_arrow_right,
                        //         size: 24.w,
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Column(
                    children: [
                      RowDesign(context, 'assets/images/thor.png',
                          'assets/images/SciFi/kalki.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatchListThor(),
                          ),
                        );
                      }, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatchListKalki(),
                          ),
                        );
                      }),
                      SizedBox(height: 13.h),
                      RowDesign(context, 'assets/images/Action/yodha.jpg',
                          'assets/images/avengers.png', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatchListYoddhaWars(),
                          ),
                        );
                      }, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatchListAvengers(),
                          ),
                        );
                      }),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget RowDesign(BuildContext context, String imagePath1, String imagePath2,
    VoidCallback onTap1, VoidCallback onTap2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      InkWell(
        onTap: onTap1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          height: 0.23.sh, // Responsive height
          width: 0.44.sw, // Responsive width
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Image.asset(
              imagePath1,
              fit: BoxFit.cover, // Ensures image covers the container
            ),
          ),
        ),
      ),
      InkWell(
        onTap: onTap2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          height: 0.23.sh, // Responsive height
          width: 0.44.sw, // Responsive width
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Image.asset(
              imagePath2,
              fit: BoxFit.cover, // Ensures image covers the container
            ),
          ),
        ),
      ),
    ],
  );
}
